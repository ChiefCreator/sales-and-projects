# Resume Builder

Status: Review
Summary: Reverse-engineer the builder in the legacy monorepo. Document data flow, API contracts, component structure. Input to the Homepage Builder Widget and the Phase 2 full builder.

# TOC

# 1. Context

What the builder is today, what it sits on, and where it hurts. Section 2 turns this into a phased proposal.

## What the builder is

Three connected parts:

- **Form** — multi-step wizard (contact → experience → education → skills → additional → template → download). Field state held by a form library; the resume is one large nested object addressed by string paths (`contact.address.city`).
- **Live preview** — a React component rendered alongside the form, reading from form state.
- **PDF export** — a Cloudflare Worker that drives a headless browser, navigates it to an internal page containing the resume, and captures a PDF.

The preview and the PDF are drawn by the **same React component** — the difference is the environment it runs in (browser, next to the form, with placeholder data injected for empty fields vs. headless Chrome with server-embedded fonts and DB-sourced data). Same renderer, two environments, room for divergence.

## Foundation

The builder lives in the legacy `glass` monorepo: `packages/shared/components/ResumeBuilder` for the bulk of the logic, wired into `packages/web`. Three foundation libraries plus one quirk:

| Subsystem | Library / version | Status |
| --- | --- | --- |
| Form state | `redux-form` 8.3.10 | Last release Mar 28, 2023. Repo not archived; the README discourages new usage. Sits on Redux + `redux-thunk`  • `redux-persist` — entangled with the broader store, not a localized component. |
| Rich text | `draft-js` 0.11.7 | Repo archived Feb 6, 2023, read-only. Used for work-experience and education descriptions. Serialization to HTML via `draft-js-export-html` — same library family. |
| Drag-and-drop | `react-beautiful-dnd` 13.1.1 | npm-deprecated Oct 14, 2024. Repo archived Apr 30, 2025. Used for section reordering. |
| Form-state successor | `react-hook-form` 7.43 | Installed in `packages/web/package.json` but never imported anywhere in the codebase. Dead dependency, not a partial migration. |

**Code mix.** Inside `packages/shared/components/ResumeBuilder`: 94 JS/JSX files vs 12 TS/TSX (~89% JS). The package itself (`packages/shared`) has `tsconfig.strict: false`. The Next.js shell (`packages/rock`) is strict, but the bulk of the builder code is not under the strict compiler.

## PDF service: Jaguar

Jaguar is a Cloudflare Worker in `apps/jaguar`, not an in-house Node service. It uses `@cloudflare/puppeteer` and Durable Objects (`BrowserSessionDO`, `RegionAllocatorDO`) to manage a pool of headless-browser sessions across CF regions.

- **Total request timeout:** 60 s.
- **Browser keep-alive:** 60 s. The Worker keeps the browser warm for that window between requests.
- **Stale-session threshold:** 30 minutes of idleness before a session is recycled.
- **Concurrency:** up to 16 tabs per browser; max 6 browser instances per region in production.

The authoritative architecture doc lives at `apps/jaguar/IMAGE-PIPELINE.md`. The Durable Objects design means Jaguar is a distributed session pool, not a single-session-per-request service.

## Template model

The visual appearance of a resume is controlled by a template object. The schema (`packages/shared/modules/resumes/schema/ResumeV2.graphql`) has roughly **130 leaf parameters**.

About **55%** of them live in a single repeating block: `highlightData` carries 12 text-element roles (`sectionTitle`, `header`, `firstName`, `lastName`, `embroidery`, etc.), each with the same six properties (weight, casing, color, font size, background color, plus a 7-field `border` sub-object). The remainder is ~43 top-level template fields plus four 4-field separator sub-objects.

There are fields that are declared but unused, and several semantic duplicates — for example, multiple ways to set alignment at different levels of hierarchy. The data model has accumulated sediment from successive design iterations.

A separate structural artifact is how section order is managed. The order itself is determined by position in the list of sections; which column a section belongs to is set in the template configuration. Each section also carries an "index" field that the renderer no longer reads but which is still stored — drifts apart from the actual position over time. Doesn't break rendering, but reveals legacy sediment.

## Where it hurts

None of these are emergencies; each makes future work slower or more expensive.

- **No autosave.** Data between steps lives in browser memory until the user presses Next. Lost on tab close / reload / device switch. Local storage holds service-level info only (which steps are complete, recent resumes), not form contents. The "Save to Inbox" button is not autosave — it emails a return link, and only after the resume has been saved to the server.
- **Preview / PDF can diverge.** Same renderer, different environments — different font loading, different scaling, placeholder data injected only on the preview side, headless-Chrome workarounds applied only on the PDF side. Architectural risk of mismatch; how often it surfaces in production needs log data to answer.
- **Foundation libraries are end-of-life.** Two of the three are in archive mode; the third is npm-deprecated. They will not break on their own, but every React or browser release costs more to absorb. Hiring engineers comfortable with this stack will get harder over time.
- **Mobile is responsive, not differentiated.** Columns collapse, the preview hides under a chevron. No mobile-specific wizard, no swipe navigation, no mobile-only components in the builder. Whether dedicated investment is warranted depends on mobile traffic share.
- **Mostly JavaScript, mostly non-strict.** ~89% JS in the builder directory, `strict: false` in `packages/shared`. Narrows the class of errors the compiler catches before runtime.

# 2. Approach

Three phases. **Phase 1 is committed** — lift-and-shift, no behavior change. **Phase 2 is the recommended next round** once Phase 1 is stable. **Phase 3 captures longer-horizon directions** where the architectural bet is whether to change the renderer paradigm; not a commitment.

## Phase 1 — Lift-and-shift (committed)

Port the existing builder to the new app with no behavior changes. Keep `redux-form`, `draft-js`, `react-beautiful-dnd` as-is. Keep PDF generation through Jaguar. Keep the template schema, the data shapes, and the user-visible flow exactly as they are today.

**What this requires:**

- Move `ResumeBuilder` into the new `shipcru-tenants` app (or behind a route boundary served by the new stack).
- Bridge form state and Redux through whatever shim is needed during transition. The Redux store is entangled with the form library — disentangling is Phase 2 work, not Phase 1.
- Continue routing PDF / image requests to Jaguar; no change to the export path.
- Auth identity bridged through BetterAuth (the wider Auth track owns this; the Builder consumes the bridge).

**What this delivers.** The builder works on the new domain, no behavior regression, no data-shape changes. Unblocks the rest of the migration so the new stack can carry production traffic without coexistence hacks.

**What it explicitly does not do.** No library swaps. No autosave. No mobile rework. No template-model cleanup. The point is to land — not to improve.

## Phase 2 — Quality-of-life improvements (recommended)

A focused round once Phase 1 is live and stable. Each item is independent and can be sequenced.

- **Autosave.** Debounced writes to the server between steps. Eliminates the data-loss class of issues. Dependent on the new builder's API supporting delta upserts (already in scope).
- **Rich-text replacement.** Migrate from `draft-js` to a maintained editor (Lexical or TipTap). Includes a serialization migration for stored rich-text content (currently in `draft-js-export-html` form). Some visual drift in existing descriptions is plausible — see open questions.
- **Drag-and-drop replacement.** Swap `react-beautiful-dnd` for `dnd-kit` (the maintainer-recommended successor). Localized change; touches the section-reorder code only.
- **TypeScript pass.** Convert the builder JS to TS, enable `strict` in the package containing the bulk of the code. Tightens the compiler at the surface that has been most non-strict.
- **Mobile UX pass.** Wizard mode on narrow viewports, swipe between steps, mobile-specific adaptations of complex inputs (date pickers, drag-and-drop). Scope depends on mobile traffic share.
- **`redux-form` → `react-hook-form` (optional, larger).** More invasive than a library swap — the existing form is welded into the Redux store via `redux-form`, and replacement touches Redux, persistence, and the form-shape contract that downstream consumers (suggestions, content blocks, search) read. Worth doing only if Phase 3 is on the near horizon, or if Phase 1's `redux-form` shim turns out to be more painful than expected.

## Phase 3 — Direction-setting

Longer-horizon surfaces. Each is its own track in the roadmap; what unifies them is that they pull at the renderer architecture and at the data model around it. Captured here so Phase 1 / Phase 2 architectural choices don't accidentally close them off.

- **Resume upload (LLM parsing).** Upload file → parse → write to the resume schema → store in R2. Pulls on the resume schema's tolerance for LLM-shaped input, and on R2 / processing infrastructure.
- **Resume sharing.** Shareable links (Google-Docs-style). Peer / professional / AI review. Pulls on a permissions model the builder doesn't currently have.
- **Resume enhancements (AI).** Grammar, improvement suggestions, dynamic content, translation. Pulls on usage-based billing / AI credits and on editor architecture (the editor needs to support inline-suggestion overlays).
- **Renderer paradigm shift.** Category leaders increasingly generate the PDF directly in the browser as the preview — one renderer for both, instant export, Jaguar drops out of the critical path. Trade-off: heavier client bundle on first entry into the builder. Worth taking only if export speed or pixel parity are positioned as competitive advantages.

# 3. Open questions

Answers narrow Phase 2 scope and clarify whether Phase 3's renderer shift is on the table.

**On users:**

- Mobile traffic share, and current mobile conversion? Drives the mobile UX investment in Phase 2.
- Are right-to-left scripts or complex shaping languages (Arabic, Hebrew, Hindi) in scope? Constrains the renderer choice in Phase 3 and the AI / translation track.

**On the existing product:**

- How visible is data loss between steps in support tickets / drop-off metrics? Drives autosave priority.
- How many resumes have been created in the current builder, and must they open in the new version visually identical?
- Is parallel operation of the old and new builders expected during transition?

**On templates:**

- Who owns template design — designer in Figma, or content manager via an admin UI? Affects whether new templates need a code release.
- For Phase 1: full current template set, or a reduced popular subset?

**On rich text:**

- Is some visual drift in existing rich-text content acceptable when swapping `draft-js`?

**On Phase 1 scope:**

- Are autosave, AI assistant, collaboration, or offline mode required from day one of the new builder, or can they sequence into Phase 2?

**On ATS compatibility:**

- Must the exported PDF parse correctly in employer ATS systems? This constrains the choice of renderer in Phase 3.