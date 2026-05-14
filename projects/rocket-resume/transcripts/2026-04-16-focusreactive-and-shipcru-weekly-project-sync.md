# FocusReactive & ShipCru: Weekly Project Sync

Date: April 16, 2026   (GMT+2)
External: mailto:drew@shipcru.com, mailto:steve@shipcru.com
Participants: mailto:eugene@gitnation.org, mailto:pavel.khurs@focusreactive.com, mailto:anastasiya@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Eugene and Robert to test Untitled UI primitives over next 24-48 hours to verify flexibility and ease of use
- [ ]  Anastasiya to communicate Untitled UI discussion to Yulia and design team, have them evaluate Figma kit extensibility
- [ ]  Robert to verify with Steve about purchasing Figma Pro for Untitled UI
- [ ]  Robert to confirm first release page list with Steve (support, legal, landing, about us)
- [ ]  Team to set up preview deployments and pin to Slack channel for visibility
- [ ]  Eugene to update Phase 1 scope documentation with first release definition
- [ ]  Robert to check with Steve and Tariq about analytics/tracking requirements for first release
- [ ]  Robert to investigate database migration and unpublished data discrepancy
- [ ]  Robert to handle Neon database migration to Steve's space
- [ ]  Anastasiya to set up Notion-based backlog management system for cross-team visibility
- [ ]  Eugene to provide video or detailed explanation of design token workflow and mapping process

### Design System Decision: Untitled UI vs ShadCN

**Context of disconnect:** Steve's intention was to use Untitled UI with Habitat design tokens, not to discard Untitled UI entirely  . The development team had been planning to use ShadCN primitives with custom Habitat designs  .

**Untitled UI benefits discussed:**

- Well-maintained library using React Aria (better than ShadCN's base in some ways)
- Tight Figma integration with FigmaKit allows showing dynamic components, animations, and hovers directly in Figma
- Design tokens can be applied across both Figma and code
- Pro version provides component picker in Figma for easier design work
- Removes maintenance overhead compared to ShadCN

**Team's approach:** Both Untitled UI and ShadCN use atomic primitives that allow custom layouts - not restricted to pre-built component library   . The key is using the primitives (buttons, form controls, etc.) while building custom sections and pages .

**Concerns to address:** Design team needs to evaluate how extensible Untitled UI Figma files are and whether they can implement custom designs without conflicts  .

### First Release Scope Refinement

**Pages approved for first release:**

- Support page (FAQ accordions)
- Legal pages (text-based)
- Landing page (home)
- About Us page (design to be completed by end of week)

**Builder integration decision:** Remove all builder-embedded sections from landing pages  . The new approved design from Habitat doesn't include builder sections anyway - only CTAs that route to the builder . Sections with resume previews that are part of the builder will be removed  .

**Infrastructure components:**

- New Cloudflare-based infrastructure with OpenRouter (non-typical deployment requiring significant infrastructure work)
- New database with migrated taxonomy data
- CMS setup for landing page components and sections
- Header synchronized with current production to maintain user experience continuity

**Items excluded from first release:**

- Search functionality (pending testing after migration)
- Authentication integration - decided to exclude to simplify release . Beta Auth migration with Ivan/Gabriel still in progress, and Ivan is away for two weeks
- Comprehensive analytics/tracking (pending clarification on requirements)

**Philosophy:** Ship as simply as possible to get infrastructure working and establish workflow, then iterate quickly  .

### Development Update

**Current progress:**

- Rebuilt industry page components using Untitled UI sections
- Implemented header matching current production website to avoid UX disruption
- Router experiencing Cloudflare billing/access issues (being investigated)

**Technical setup:**

- Cloudflare deployment with OpenRouter (more complex than typical Vercel deployment but Steve's preferred approach)
- Database migration from taxonomy API completed for public data
- Draft/unpublished content migration pending clarification

### SEO Implementation

**Standard SEO setup in CMS:**

- Page-level SEO tab with meta fields (title, image, description)
- Robots.txt configuration for indexing rules
- Structured data automatically built from content (e.g., FAQ sections)
- Sitemap generation
- Canonical URL handling (simple for landing pages, more complex logic exists for job titles)

**Approach for first release:** Match current production website one-to-one to avoid breaking existing SEO, with no additional features that could negatively impact rankings . Tracking may be needed to verify SEO is functioning properly post-launch .

### Workflow & Process Improvements

**Agenda management:** Anastasiya maintains living document, adding items as they arise in Slack or design calls, then organizing/prioritizing day before meeting . Robert will provide advance notice of items to cover . All team members have edit access to collaborate on agenda  .

**Preview deployments:** Need to establish clear dev deployment strategy with pinned Slack channel showing current environments and what's deployed where  .

**Backlog management:** Plan to create Notion-based system as single source of truth above Trello (for dev) and Figma (for design) levels  . Will provide high-level visibility for stakeholders and PMs on project status, features, and timelines  .

**Knowledge base:** Will use AI to update based on Slack channels and meeting notes (depends on backlog structure being finalized first) .

### Design Token Workflow Discussion

**Current challenge:** Need to map Habitat design tokens to Tailwind configuration  . If Habitat and Untitled UI have different token naming, requires manual mapping which could be inefficient  .

**Ideal workflow:** Single source of truth in Figma that can be downloaded and imported directly into Tailwind config with seamless one-to-one mapping  . When tokens change in Figma, can sync again automatically .

**Next step:** Eugene to provide visual explanation or video showing current token workflow from Figma to code, and potential solutions   .

### Team Structure & Capacity

**Current allocation:**

- Pavel: Full-time developer
- Eugene: Currently one day/week, can increase to 2-3 days as needed for complex work and coordination
- Denis: Off for one month, returning beginning of May

**Future scaling:** Open to adding 2-3 more developers when backlog is clear and there's enough detail to accelerate work  . Will revisit after first release when velocity is established .

**Team naming:** Collaboration is under ShipCrew (the entity building the platform)  . Rocket Resume will be the first tenant on the multi-tenant platform  .

### Database & Access Items

**Database migration status:** Migrated public data from taxonomy API . Full database dump shared by Steve contains draft content and relations that haven't been migrated yet - pending clarity on what needs to be migrated and proper structure  .

**Data discrepancy:** Original count of entities was much higher than current numbers - Steve thinks it may be due to unpublished data . Plan is to reduce and merge similar job titles, with SEO implications for canonical URLs  .

**Neon database:** Currently on FocusReactive's Vercel space, needs to be migrated to Steve's account (or separate Neon account) before release .

Notes

Transcript

I didn't have time to... Everyone is awake. Okay. Good morning. Good, good. Is it okay? Not too small? Bye.

Oh. Hello, hello, hello.

How are you? Did you get enough sleep?

Not really, no. I'm trying to remember, we were on a call last night, right? Or was I? Yeah, yeah, yeah. Yeah, it's a call, yeah. Nah, it's quite disjointed, unfortunately, but that's okay.

Here's what it is. We'll find a nice flow.

That meeting I won't attend very often anyway. Yeah, and this time is great. Hopefully it's okay for you guys. Yeah, sure.

Just something I started doing because it's, you know, it's for me to capture everything and get up to speed is meetings, you know.

Not necessarily a video, but transcripts. Do you guys do that? Yeah, we're cool.

Yeah, cool.

I personally really like granola AI. It's better at capturing and summarizing. We also have notion AI and I know He uses like fireflies and other things. So it's really my favorite reference. Well, Since you're hosting the call, using that but any chance I can get those as well kind of like everything's kind of becoming artifacts for me

Probably I'll reconnect with my bio internet. Something wrong. All right.

Thanks for the week.

youupfront and sort of tell you the truth. make sure we kind of stick on to task and maybe the priorities. So do you mind if I just start and then-Absolutely.

Tell me if you want to share the screen. I'll stop sharing mine.

No, no, that's fine. So what I've, So what I was doing is I had some agenda items I wanted to cover off as well. So I wrote my notes and then I then cross referenced against yours. And so there is, there's,Most of it lines maybe one additional one that I'd like to put on the board, but essentially what I, I realized is that What I will do is, ahead of meetings, I'll send you, Anastasia, what I'd like to cover and we make sure that we're all on the same page so that the agenda that you post captures everything ahead of time. And so what I tried to do today as well was try to just address some of your agenda items before the call.

And so I can't remember when you placed this agenda. Is it how much in advance?

Yeah, something like previous day. I mean, usually I keep it as a living document. So whenever there is a question that was like arose at some point in Slack or during design calls, I just edit here so nothing is forgotten. And just one day prior to the call, I like arrange things, group things, prioritize and all of that. So it's more like a living document, I'd say.

No worries. Well, I'll try and give you what I'd like to cover with as much advance notice as well, just in case you guys want to prepare and vice versa, if you can give me as much notice.

Absolutely.

Then what I try and do is come to the meeting prepared.

Do you have edit access here? Because it will be easier if you can just add things yourself. Yeah. If I share it. Yeah, everyone here should be able to edit. Let's see.

Yeah, there you go. I have access. Amazing.

So just feel free to add your topics. We can use comments, like you have a specific line and you can add comment to it and ask something. So there will be a dedicated thread. So, yeah. No need to put everything on me. You can use it.

Sweet. All right. The next thing. All right. So I'll just run through the points and see which ones don't align with yours. And we can just add it to the list. So there's an open outstanding just to sort of follow up on this sort of the dev design sync. Do you have anything around that?

I was sending, what did you say once again?

Just some open items around the design dev sync. we've been talking about, just some of the, like you were gonna create, I think, Backlog structure proposal.

Yeah, I listed it as the last item on my outstanding questions list. If we have time on this call, we can discuss some ideas.

Yeah, cool. Agreed. Let's see. Okay, so you guys have a development update. which we'll definitely go through. Yep. So the big one is design system alignment, which I don't know, or maybe you have it on there, but we definitely need to cover that off. Which you have on there, right? I think.

Design system alignment.

Sorry. So that would be the untitled UI discussion.

Oh, yeah. Yeah. Yeah. That's here. Untitled UI versus custom design.

Yeah. Yeah. Cool. And then... The first release, so the post on the first release, we can chat about that. It's good timing, actually. And... Look, there are some of the other action items on there. I think for me, the main things that I would say are our priorities is certainly talking about Untitled UI, the first release, And Um. I suppose the development update might be covered off if we talk about first release.

So would they be the two... big ones for you as well?

Absolutely. That was my idea.

Yeah. Yeah. Cool. Cool. Cool. Well, I think. I think the design system or the entireI've called it design system because Um I think it's a bigger piece of the puzzle than just Untitled UI. If we discuss that, then that'll help us discuss the first release. Absolutely. Because I know you've called out something specifically with regards to landing pages. So... I'm just gonna, look at my notes and probably just read a few things off.

Sorry, just because I've got a lot of information flying around in my head and I just want to make sure I cover everything off. So, excuse me for looking away. So let's see. I suppose I think there's a misunderstanding with regards to terminology, at least I'm hoping that's what it is. So, So the way I think of a design system and our design system is essentially like layers, right? So we have the tokens, the CSS custom tokens, properties, which is, you know, hold all the tokens, then we'd have Hail Wind, which we used to manage those tokens, right?

And those entail when integration into our UI components. MS COPE: Yes. MR CROWLEY: So far, so good. Cool. The the question is around I think that the question right now is around UI components. Right? Um, So, And the flexibility in those. So I suppose the first point I would make is that The reason we would want to use, say, untitled UI or even a shared CN, is because of all the heavy lifting they do for us when it comes to compliant, modern web. development.

So ARIA, accessibility, browser issues, So, semantic HTML everything that all feeds into especially with this product you know, with a heavy emphasis on SEO and all that sort of stuff and rankings and stuff. We don't want to manage that, and even if it wasn't, Okay, we're on SEO. I don't know, Eugene, I've never wanted to manage that stuff.

Yeah, absolutely. That's right. Thinking we think the same way. So we never try to rebuild stuff like, you know, when you need to implement select box in the form, there is no customization options inside the platform. So you need to like rebuild all this, you know, inside the platform. The new code base. So we're just using the Shadzian. That's our default Shadzian, Radix UI and base UI. That's something we use for any interactive elements or whatever where we need accessibility out of the box.

So Untitled UI is just a bit different.

It's very biased. It's something like, you know, it's not just a component, low-level components like smaller pieces that we can reuse. It's like have a lot of more things like ready-to-use sections with layout, etc. But it looks like a template-based site. That's the reason why we don't want to use it. We pick it for the first iterations and release to make it fast. But for the final designs, it's just not extensible enough for the design team. That's why they decided with Steve to have it from the scratch. That's how they usually work.

They do all the same stuff like color, palette, typography, smaller components like buttons, form controls, etc. And then that's going to be reusable across all the sections. So it's kind of the same that Untitled UI provides to us, but it's going to have a completely different look. It's a unique design rather than like Untitled UI that is not a UI component library. That's a design system. It's already built a full, complete design system.

And to extend that design system, it's going to be very tricky to make it look unique and at the same time to not break anything that was created inside the Untitled UI. So that's the reason why we took Untitled as the foundation just to implement landing pages during MVP because everything was started from the MVP. There was planned three weeks of MVP. We implemented some pages like job titles, etc.

on Untitled UI and then we will think what to do, like release with Untitled customizations without unique feel or unique user experience, or we will wait until the designs. So the last answer we got is the entire UI is fine for the first release, and then we wait until the Habitat will implement all the stuff inside their Figma. So it's kind of going to be the same. They're going to be accessible, controls, etc.

We will use Because ShadCN is headless, not ShadCN, Radix UI. It's headless, which means it doesn't have any styles inside. And it's just about accessibility, about logic that we don't need to rebuild. We just need to apply styles from the design. That's exactly how we build websites. And it's accessible by default. So we only spend time to add stylization on top of the library. But it's not untitled UI.

more low-level libraries.

Okay, so I can tell you after speaking to Steve, his intention was to use Untitled UI. The nuance in the language was that use the untitled UI Um, Undesigned, without a design from Habitat, to get things running. Then when we get the design tokens, add it to Untitled UI. So that's the disconnect, right? That was the thinking. It wasn't like throw Untitled UI away because he bought the code package, right?

To use Untitled UI. So that was the disconnect, I think, in the communication. So I verified that with him. Now, Now, you know, with both of you shared CMB4, So at least we're thinking, when I say we both, Steve and I have, and you have, and so we think on the same terms about not rebuilding stuff from scratch. So that's good. It's just a matter now of deciding, well, are we using Shad or are we going to use Untitled?

Right? So... Um, My understanding, I haven't used Untitled. My understanding and Steve's understanding is that Yeah, Untitled gives you a component library, but you don't have to use the component library. You still have the atomic primitives that you can use any way you choose.

Yeah, that's true. There is a smaller component like button and all that stuff. To be honest, we just never used it in that way. We just never used those components. We haven't verified them in production application. So it should be already with all the best practices and accessibility, all this right logic, but we are just not sure if it's there or not. We just need to verify it. this as well it's well known library but that's something we need to reveal as well Yeah.

I think it's intriguing because of not only the fact that, yeah, it is very well known and it uses React R and there's arguments that that's better than what ShadCN uses and, yeah, it's maintained, right? You know, with Shad, you have to maintain it yourself, you know, in terms of... updating and stuff like that. So there's that overhead. But what You know, in reading, I haven't had it in practice either, but in reading about Untitled, there's that whole integration with Figma and FigmaKit, which is quite compelling as well.

Because Not only is it tightly integrated, which I think makes the handover easier, but it also allows you to show dynamic components, animations, hovers. So you would remove that whole need to write notes and you'd actually be able to show the dynamic drafts. or whatever. in Figma kid. tied to Untitled. Yeah, so there's that connection as well, you know, so...

Look, it seems to me that that It just seems to me that without Untitled UI, it's going to be very difficult for design team to implement those. Because in case we'd like to extend Untitled UI, they already have this Figma kit and the Figma designs. But in ShotCN, we don't have anything like this. We have just component libraries for developers. And they don't have anything to start from. They need to rebuild.

the things from the ground up. It's not very different from rebuilding it like in the usual build. Do not take anything, just build from scratch and we will just find necessary components, interactive elements, connect with this design. And that's why I just give a good foundation for the design team if we plan to extend this without just rebuilding the design system completely. That's how I think it looks like so.

Yeah, as you're speaking, I'm recalling what I read. So the Figma kit is not only closely tied to make it much easier to hand over the specifics around Figma,Yeah. you know, CSS and so on and so forth. But you actually you can apply the tokens across both as well. So I guess what I'm saying is the tokens are actually used in Figma while you're designing, but also obviously used by the design team. So there's that coupling, but There was other one, one other key feature I remember.

is if you If you use FigmaKit, so in total UI has big math Sorry, Untold UI has a React. and a Figma package and another package. So if you've got pro for both the, we've already got pro for React. If you've got pro for Figma, what happens is essentially as I understand it is all of those components kind of can be just in Figma picked. And, you know, like, oh, I need a button. Let me look at all the buttons. All right, this is the button.

You know what I mean? Yeah. So, So what I'm saying is it seems to me being the that Steve has had the impression and wanted to try this out andYeah. I thought you guys had some experience, but maybe not as deep as we're talking about now in terms of, hey, we're quite happy to use atomic components and build whatever layout you want. We don't have to use the library. Um, And so with that in mind and the possible benefits of linking with FigmaKit, there may be this initial setup, but it may be better for us now.

to go down that route. I mean, I can go back to Steve and say, hey, the guys are not sure about it. They're familiar with Shad CN. And the same conversation is going to be had with he and I. It's about, well, what are the trade-offs between using both? I guess it's also... Just because we haven't used it, you know what I mean?

Yeah, yeah. I'm just like, it's also a question to the design team because we already thought it's going to be a fresh build. So they told before that it's fine for them to take the untitled UI and make design, but as they made some concepts and some work already done, it just needs to know how this to the untitled primitives because I think they implemented those. I don't know how far they get already, but I don't know how they map existing work with untitled primitives and stuff.

and how much Untitled allows them to reimplement. So in terms of colors, border reduces, padding, spacing, all that stuff, and how biased Untitled UI is. Because it's always a question about, to make the unique design, you need quite a room to implement the custom stuff. If we take smaller components, that's fine. But in this case, I just don't see, like very huge benefits of Untitled because all the same tokens and you know these token systems that we think we style anyway exist in every project that we build so yeah I'm just not sure what exactly benefits we'll get because the design system Habitat will build will anyway closer to what we have in Untitled UI so Well, all right.

So I think, I mean, if we look at the, I'm pretty sure, well, I don't even have to look at it. If Without even looking at it, I'd be pretty much certain that we can recreate the landing design in Untitled. There won't be an issue. Yeah, I think--I mean, I don't see an issue. Um, Well, sorry, go ahead.

Yeah, I'm just thinking other than the tokens and already the library of smaller components. So the idea is that they tweak the primitives right all these tokens and take these smaller components and then build the pages from them so we're like taking this uh on like tokens uh this primitives uh components part but doesn't take the um other like sections and complete pages from untitled vr is it is it right or like similar to this yes i would say i would say so yeah the so you know putting my my My feet in Steve's shoes, right?

The other nuance about Untitled would have been not only could we move quickly before we got a fully fledged design token system, we could also Grab a a section or a layout and move quickly that way. That would have been probably his thinking, right? But what I wanted to then... clarify with you guys so that you didn't feel that you were so restricted is that We don't have to use those component library, that component library, right? In my mind, the component library is the prebuilt layouts and the dashboards and stuff.

And the other is what I would call the primitives, which are the individual pieces that you can put on the page wherever you want. And that gives the custom. I think that would satisfy habitat, giving them that freedom. So yeah, so that's how I see it play out. It would be the same thing for, using Shad-CN, right? Is, well.

Yeah, it's really close. As you mentioned, the Aschatzian just provides us very low level. It's something that we just pull from their library and just have in code. It always gives us more control, but it's rarely necessary. I mean, if Aschatzian already provides us with good primitives and we don't need to tweak them a lot, we just need to sync tokens and use MSs, so we don't need these capabilities.

Yeah, actually, it sounds for me like a good idea. I just, yeah, my concern is about just design team and how they use this stuff. That's only in terms of development. I don't see any blockers from our side. Yeah.

Yeah, I think, so what I'm going to do is maybe we'll both do the same thing over the next... 24, 48 hours is maybe just actually play and use it. Use it and make sure that it's pretty easy or at least do a bit more digging and make sure where we understand correctly that essentially it's the same thing as Shad-CN from a primitive standpoint, very similar, right? And that would allow us to build whatever we want in terms of layouts.

And then it would just be a matter of, um,Yeah, I don't know if Yulia or Habitat, I mean, you guys might know, I think you're implying they've never used Take the kids. And Untitled UI? Do you know that for certain?

They haven't used Untitled UI specifically as far as I remember, but they used another design UI kit and design system that they extended. That's for sure. So they know how to take something that already exists and extend it. It's just a matter of checking how the design, how the Figma files from Untitled UI looks like, how they can tweak them.

what primitives they have to like change everything and so i believe they can like tell us uh if this like very extensible system and they don't see any they don't forecast any problems with that in the future or like vice versa so yeah so i think there's there's a two things going on you and i will just verify you know our our understanding of the untitled ui um and then um habitat can just Dig in and have a look and see what the benefits are of the Figma kit and the integration.

Yeah. It may be really good and it may be worth the extra couple of days just to get it up and running because this is going to be a long project, right? It's not a tiny piece of work. And yeah, so I think it's worthwhile having a look.

Sounds like a plan.

Yeah, okay. So how do you want to– are you going to communicate that, Anastasia, to Yulia, or do you want to jump on a call with me and her at some point?

How do you want to– We will pass it directly. Yeah, I think it's clear. We will discuss it internally and let you know. Yeah.

Yeah. Let's be clear, though, right? It's not– we don't want to– cause a massive like, hey, you know, stop work for weeks. You know, it shouldn't be anything like that. It should just be about Well, hey, this was the vision. It seems like it's a really good approach. It's a really good library. And when I say library, let's talk about the primitive as well. Let's not get hung up on it being just a library per se that you don't have any flexibility.

And if we can really, really benefit from that tight relationship relationship with Figma and Steve's willing to buy the pro on that as well, right? And make it work for us. Okay. Yeah. All right. So, um, Yeah, we can chat, Eugene, over the next, you know, 48, 24 to 48 hours. And let's just, you know, ping each other and say, hey, you know, it looks pretty good. It doesn't look good. Sure. Yeah. Yeah.

uh, Cool. All right. So, that covers it all.

That naturally leads us to our development update, if we can say a couple of words on that. So, Eugene, Pavel, who can say?

Yeah, just one question. Pavel, does it still doesn't work like roads, you think?

No, no. Hmm.

Yeah, it seems that we have troubles with the Cloudflare. It's something with billing. How did you get that it's a problem with the billing? Is it shows like these...

This information When you press workers and Platforms. You can see This page shows cost.

Sorry guys, I was looking away. There's an issue that. With cost, is that what you're saying?

Yeah, I'm just... So it's... So yeah, we just have a router, right? But it previously worked. So do you mean, Pavel, that router doesn't work now because it was previously deployed and...

Yeah, router doesn't work now, but we can... Check on tenants. Maybe. Yeah.

Yeah, if it doesn't block tenants, that's fine.

Let me see, please.

So, Eugene, is it a quick fix or what do you mean?

I see that actually it works. I mean, I just don't quite understand what the issue is. So if it doesn't block our demo, that's fine. So then, like after this call, I just don't quite understand. So we need to first refine this. But it seems that like current tenants app is working and I see it redirects finally, right? I see our landing page. And if I go to the job title, It works. Okay. So let me share the screen.

So what we covered is, first of all, here is the untitled UI components. It is an industry page. We already rebuilt some components. It's mostly from the previous demos that Denis showed. And we rebuilt the header the same way it is on the current production website to make it as close as possible. And the idea was like, If we'd like to release with just a few landing pages that we select with you, we can release and it doesn't break a lot of the whole user experience. At least header will be the same because if header changes, it gives a feel that you are on another website and it can be suspicious. So the idea was that we use untitled UI sections below the fold, like hero section as well.

still remain the same. So, for example, We implemented header, we implemented this right menu, buttons, etc. And what pages do we have? Or if the router doesn't work, can you, Pavel, help me?

maybe from footwear you can...

Yes.

but Better to change the link.

Yeah, what is link will be? /support Okay, so here is again our new landing, right? Yeah. Yeah, but what we're still hosting from the production domain?

Router doesn't work and--Ah, okay.

Yeah, I got you. Yeah, I was too...

Yeah, it's something we need to dig into. Like yesterday it worked, but something happened. We just don't have any access to see more detailed information. If you can do just to check the billing or something like this inside the Cloudflare, Yeah. RST, it's kind of deployed, but Okay, it's actually here.

So basically the idea was that we show you some pages that are the old ones and the kind of rebuilt new ones and so this would be a basement for release decision if it's looking okay or if we should wait and then only release with custom designs and all of that. And while Eugene is investigating, A quick thing that kind of... blocked us or just became an issue is that current landing pages have those wizard sections that use part of the resume builder.

which are not really rebuildable, whereas untitled UI like this quick, We build enough pages. But at the same time, we actually already have the landing pages designed and approved. and those landings don't have builder parts at all. So after yesterday's design call, we've got this new idea. Do we even need to build those wizard sections? Or should we just start switching to the new landing page, which is approved by Tariq?

Yeah, so let me see. I did a bit of thinking around that as well. So Look, I did a bit of thinking about what you meant by the builder stuff. And so I took a look at the landing page and I, I could only find one section where the builder was integrated into the page and it wasn't a rerouting and that was the section down further where I think it was education or your name, keep going.

So that's this one. That's all we have.

No, no, no. Further down. Because that reroutes, this one here, this one here.

Was the preview, yes.

Is the only one that, so I just wanted to clarify, are we on the same page? That's the only one that would... Um, Yeah. Into the bucket builder.

Yeah, that's actually the first step of the builder, but our concerns also was about the previews. This one is actually something that we need to... Can you scroll a bit up? Yeah, even the template is now rendered as HTML. So we need to take this part from the builder as well. It's not like an image or something. We need to either take the whole builder and then build all that stuff with functionality they already have.

Or we just need to take some parts that help us to implement this. sections. And what is the best way? What is expected? Because we have now two jobs. We need to build a landing page that depends on the review builder. And there is more than one section. There is like three or four sections that depends on the builder.

Can we just be clear on what those sections are? So it was the one that I found, right? And you're saying the CV one is also one, the one above that? Okay. Like, Yeah, the resume one, are you saying here is also, if you click "Next" or use this template, doesn't it reroute you to another page? use this template?

Yeah, but this template is something that we need to take from the builder because it's rendered, it's not just an embed or something, it's fully rendered HTML template. I mean, we need to, if we'd like to rebuild this section, we need to take this part from the builder.

Yeah, so my thought is this, is that we'd omit the sections that have the builder. I'd have to verify with Steve, but I mean, the builder's a big piece, right? We won't launch anything if we wait for the builder. I mean, we won't launch anything soon if we wait to build the builder, I think. So we would remove anything that was builder-related. And I think that's what you're saying, Anastasia, is the actual design that was approved doesn't have any builder-related stuff anyway. Yep.

So that's going to be fine then. So that would be my suggestion to Steve. And I'll verify it with him as well. But I would say we just strip everything out related to the... the builder keeping in mind we still have CTAs on there that will reroute to the builder, right? Yeah. Yeah, exactly.

There's lots to see.

Even like, I think, that section that it says, select your experience and it's got those buttons. Even when you click one of those buttons, I'm pretty sure it reroutes. So I think most of the CTAs will stay on there. So I think it's, I think is acceptable to just remove the sections that have the builder pretty much embedded.

So yeah, but that's about when it kind of have a form, right? You mentioned in this. So it's actually, what about like, what are our plan going to be about those that reroute, but still have some kind of resume preview? It's just a question because we need to know if we should take this and implement to make like, because without it, like this section a bit, or it's going to be very a bit more like this one. It's reroute, yes, but it also has this preview that is part of the builder. And should we take these parts only to implement this section?

Because without this, embed is going to look pretty weak. So we need to plan on this too.

Is this in the design, Anastasia, this section here?

No, it's not. The landing page, the new one from the design team is much more... most simpler. Let's just walk through it. We have a hero with a CTA. We have navigation, some metrics, testimonials, a running logo line. That's the most complex section with features and scroll. CTA again, some steps, how the flow works, some templates, again, testimonials, FAQ, CTA, and that's it. There's nothing from the builder except for the CTAs leading to it.

Yeah, yeah. So does that answer your question, Eugene, for the time being? Yeah, absolutely. Yeah, now it's clear. Yeah. Yeah, cool. Then I'll just make sure Steve has seen this. Tariq signed off. Well, actually he signed off and Yulia has just posted the summary from the meeting. So he typically will come back and say, yeah, all good. And we'll use that as the official sign off, right? And then what we should do is we should start implementing our flow.

Right? Yeah. So just to give you a bit of context and why this was good timing is that a day or two days ago, Steve and I had a chat and We were like, all right, let's... Let's... Pick a page. Let's use it to stand up the CMS. in production and test our flow end to end. And so this is perfect timing, right? You guys are saying, hey, we've got stuff ready for release. So the question now is just, Me confirming with Steve of the pages that you've said are ready, if they're all good to go.

Right. You gave me a list of pages that are ready. Yep. Support. Yeah. So I'll just, I'll just use those pages that you've given me. Yeah. The other thing I wanted to throw at you guys was that Before we saw you come back with saying you had pages ready to go, we thought we'd want to test it with the About Us page. Now, my question then is,Habitat is, Tariq has told me Habitat will have the About Us page done by the end of the week from a design standpoint.

Um, We've obviously got a little bit more time anyway up our sleeves. Can we add that to... So my proposal is this. Let's... let's say confirm with Steve about us landing and support, right? We'll then say, then we'll get together and say, all right, these are the three. Yeah. What else do we need to define? as a first release, right? So, so, um, For example, looking at my notes, right? I've got, let's see.

Okay.

And so like support about and landing do you mean a job title landing or?

No, the landing pages like similar to home. Ah okay yeah. Because job titles and industries have a bit different sections and my assumption is that design team will be doing something else with them.

Yeah, so let's see. So, MR CROWLEY: I'm sorry, I think you've been identified support, legal, Mm-hmm. Landing. And now I'm throwing about us in the mix, right? Is that the four pages?

Yeah, yeah.

Yeah. Okay.

So, support and contact us are this accordions FAQ pages and we have a legal which is more like a text page. Oh, sorry, sorry, sorry, sorry.

Okay, this is...

And yeah, the two new ones...

Sorry, go ahead.

You can go ahead.

It just brought me to something else I wanted to cover on the agenda and it's come up a couple of times is that I think a good way for us to to track what's going to be part of the release is to not only I just accidentally called my brother in Vietnam and that was Vietnamese speaking to me. Anyway. was preview deploys. So I think a good thing, a good way for us to get final sign off and visibility on the reality of what's in the first release is to actually see preview deploys as well. You know what I mean?

Yeah. So if we can So I'm thinking we probably need to get a bit more formalized, maybe in Slack, pin something to a channel, make it clear as to where our dev deployments are, define which is which. And maybe, you know, well, not maybe, definitely down the line, we'll have a chat about sort of releases and visibility around sort of when stuff goes up and what's current and that sort of stuff. But at the very least, I think we needPreview deploys.

that we can point people to. Hopefully that sort of fits in with the conversation around, you know, landing on those things that we think are going to be part of the first release. So, MR CROWLEY: I think if you could, from this call, define those pages that are done, andPlease Anastasia. at the about page. please. And then they're the ones that I'll verify with Steve that were OK to include in the first release.

My question around first release is broader than just the pages though. It's more about--So what else? What else? That was the first release cover, right? Yeah. Where's CMS? Where's the content? I can't think of all the things off the top of my head, but you get what I'm saying, Eugene. What else is critical to launching the app? Yeah. You know what I mean?

The very important and huge piece, I'd say it is even more important than landing pages and infrastructures that we build. It's not typical for us as well. And Steve knows that. Usually we try to simplify things and deploy Next.js in Vercel, It's just our toolbox solution. You won't face any trouble in there. But Steve pushed the idea to deploy everything on Cloudflare with OpenRouter. So that is quite a solid solution, but it's something that requires much more infrastructure work.

We built this infra, and that's going to be a huge build because of the new infrastructure on OpenRouter. So that I'd like to mark. We have a new database with huge data in there already. We migrated everything from taxonomy API that they already have publicly, like all job titles, industries, content pieces, resumes. But this is not going to be in the first release, right? Because landing pages is mostly just a piece of the CMS.

It's just like components, the structure for the components for the sections, the schemas for the sections, UI. So it's just only piece of the CMS that we're going to release. Other than that, it's going to be new on database under the hood. AndYeah, that's it I think. Yeah, another big piece is the search. This Steve asked us about like, should we include this into the first letters or not? It's something that I test now after the migration because search allows us to like search across job titles that have like 50 plus K entities.

So it should be fast, it should be reliable. And that's something I'm going to test. And then we decide, should we include this or not in the first release?

My gut feel to all of that is no, let's go as simple as possible.

Okay. Yep. Yep.

Get our infrastructure correct. Yeah. Determine what it is that our infrastructure needs to do. Identify what the infrastructure is. And then the pages are kind of secondary, I think. You know what I mean? That comes after. They're probably the most simple pieces, right? Yeah. To start with. So I know your knowledge-based stock is great, by the way. There's so much in there and I'm going through it.

I know you have a scope section. Phase one has a scope a bit broader than this. So I think you'll probably go back and update that and that will be the source of truth. Yeah. Yeah. So why don't we do that? Would that be your recommendation that in that phase one scope, you would update it? to what we just talked about, identifying the key pieces that form that first release.

Yeah, yeah.

Yeah, or however you wanna do it, but you know the objective is to understand what is a first release? What does that mean? So that we can sit together and say, yeah, we can do this and we can do this by this date have a target, you know what I mean? So going back, I think it's really important that we ship something. Yeah. Coming in production, we get our flow going and then we tweak it and then we'll keep moving quick after that.

Yeah, absolutely. And your request about the CI or the preview deployment, that's exactly what we'd like to show you during this call. Unfortunately, there is some troubles because it's a morning. But yeah, we'll figure that out soon. Yesterday, we sent, and they worked, but we need to investigate why today. I ran some embeddings on Cloudflare. Maybe it's somehow affected anything. I don't think we need to reveal this. But yeah, overall, the plan is like the header sync implemented. Then we need to estimate these sections we have from the Habitat build.

So the estimate landing pages that we need to build. And actually, it's going to be probably the last piece. We just need to implement the landing pages. The CMS show you this preview deployment so that we can click things, test around them. And yeah, that's going to be, as I'll describe, I'll update the documentation file with all these pieces for the first release to just describe all the stuff, infrastructure and things that we're going to release.

And we will have a clear testing environment that's going to be just then assigns the domain to our Cloudflare and this will do the routing. Yeah.

Yeah, so, so it, Yeah, this will come out in the wash, right? In terms of our workflow, you know, everything from our branching strategy to our deployed preview strategy, you know, is the weather staging and a prod, do we have a dev, what terminal, all that sort of stuff. And I imagine too, right, where we're also talking about, so payload CMS, I'm not familiar with. I know I've used CMSs before, but part of this first release will be an aspect of the CMS, which I'm guessing is where you're going to, part of that release will be us demoing to stakeholders.

This is how you update the content on the pages that were released and that sort of stuff. And that'll probably include the SEO stuff. Anastasia as well, right?

For you, Tim. Yeah, just to the previous topic, I've also wanted to say out loud our thoughts about the authentication, Eugene. Yeah. Again, to make it simpler for the first release.

Yeah, the OWLs, as you remember from the last call with the Shibukuro team, they kind of migrate the database and authentication method. So they migrate to the beta OWLs and we were a bit blocked by them. So we added the integration with beta OWLs, but until they deploy anything, we cannot just test this out. That's also important because we have the button in the headers in the login form and you can log in from this model.

So this part we already take and implemented the UI, how it looks like to mimic the production environment. And the last piece we need to solve is cookie sharing, let's say. So how to make it available because we have a routing and two different, like one Vercel deployed application, another one on Cloudflare. We need to solve how this manage the O's all together. That's also the piece we are waiting for.

Yeah, so I had to think about it and basically Look, I don't have any insight into ORF, right? I need to get up to speed there. So I need to do some research into that. I would...

So I think--I thought you were going to--defer the integration but it sounds like you want to include the integration is that what you're saying yes uh yeah because the plan was um that we like we wait until the beta house integrated because the guy said like we will release this week or next week uh and there's going to be a new authentication method there is no um um no reasoning for us to implement in the old approach with the old database.

So we're waiting for them until they release and then we can be able to test our integration because integration is in place. We already connected it to payload CMS. We just need to test things out and fix the cookies. And it's all doable on our side. We just need to wait until they're done and then to our part.

But what happens? If we said no auth is off the table for first release, is that a possibility?

Yeah, that's possible. We just need to decide on how this should look like from user perspective. We have this button in the header that opens the login and when you authenticate it, you see this icon or something. We can remove it, replace or redirect, but it kind of can ruin the user experience.

It's only my concern, like how we can solve this without Yeah, I think we have, but I think we still have a similar issue regardless of whether we integrate better or not. Like when you, for example, if we're on... the Cloudflare, the new site, and you click a CTA, which will redirect you to the builder on the old site or the current site, right? Um, I don't know when it kicks in, but basically it kind of tracks that you've started a resume and then you ended up getting that notification above the build resume button.

Is that, is that you familiar with that?

Yeah, there is a lot of dynamic texts. I mean, the header text also can change because there is some logic of what text we show to the user. So yeah, that's...

MR CROWLEY: So I think, like you said, it all has to be managed with cookies, right, and it's just--getting that right. My gut feel is to not put all of the part of the first release because our goal is to ship. Right. I can tell you that the migration, the DB migration is still ongoing. It's close, but we're doing some debugging. But the other key thing to know, if you're not aware, Yvonne is away for two weeks. Oh, okay. Right.

So, so we shouldn't expect it anytime soon. So, That's not.

put it in They said it could be done by last Friday.

Who's they?

Gabrielle and Yvonne.

All right, let me get an update just in case. I misspoke and it's you know, easily, turned on.

But I agree with you that if we can to not include this, we should do this. It's something I agree with because we want to simplify this release as much as possible, right? So we just want to release landing pages. The search is something that we... And yeah, we need to just think how we can exclude all. It's just probably we just need to come up with a solution. We can check on our side. Probably we can just use the current auth method, just pinning the current endpoints And just we will need to solve the cookie issue.

And that's it. So probably it's the easiest path, at least.

I would say this. Let's make the decision now to exclude auth. Unless there's a reason why we need it to make our first release easier, let's exclude it. Yeah. Okay. Right. Unless you find it hard and it actually makes sense to try and get it in, let's exclude it. It can be the next release a week later, maybe. I don't know. We'll get a schedule, right? But We won't be able to have any additional releases until we get the first one done, you know, and have our platform up and running and our systems working, you know.

Um Well, so... Yes, so that would be my suggestion. Same thing with search. and search Sorry, go ahead.

Yeah. Yeah, sorry. Probably the same thing with analytics and tracking. There is no need for a comprehensive one at the beginning. That was our proposal as well.

Yeah, I think that's something I checked with Steve and maybe you could help me understand when you say analytics and tracking, is that what just tracking visits? What does that actually mean?

The plan was, like Steve asked us to first reverse engineer what they already have, like the analytics, because they mentioned that they optimized this very well and they had the prior issues with analytics that affected performance. And that was the critical one. So our goal was to check what analytics they have now. They mentioned they have a mixed panel, The solutions like to improve the overall like analytics layer, etc.

But the first step was yeah, like Mixpanel, allow the Google Ads work. But I don't know what they actually tracking now, because we haven't done this part yet. Um.

Yeah, I think we need to dig into that a little bit because I think Um, SEO is really big, right? So we want to make sure that probably from a tracking standpoint that we can make sure that we haven't on something that is negatively affecting SEO I would think is kind of One of the big things, I could be wrong, so I need to dig into it more and understand from Steve, I think, and Tariq. But I can read this.

Is this your definition of what analytics and tracking is? Is it more of... The tracking events, yeah, okay. So that would be something I should read and have a chat to Steve and Tariq about, would that be the,The plan, yeah.

Sure.

So let's just, let's put that one as me check it out and come back to you. Yep. Yeah.

um All right. So then probably the last thing that we want to at least in part cover. Eugene, if you can explain our SEO setup, what we do, what we're experts in. Yeah. The details.

Let me... I'll quickly show you. So how usually we build the SEO? We build it inside the CMS. As you mentioned, this is just a part of SEO, but that's a very important piece. That's usually an SEO tab on the page level. So it's going to be very relevant for the landing pages that we're going to release. That's key meta fields. So that is usually like title, image, description it can be here we already added the robust txt to define the indexing rules. We can add more here. So the CMS should be treated as a builder everywhere. So we can add more fields for Twitter cards, for whatever else.

On the first release, what we'd like to achieve is to mimic the current production website, exactly to not break these things, just to ensure that it's like one-to-one. and release without any additional stuff on top of it that can really affect the SEO. So this is the first part. It's just SEO metatexts. You can edit them already from the CMS. This is structured data. Usually we include, for example, for FAQ, we include structured data that automatically builds it from the content you put inside the CMS.

So it's like you're adding the FAQ section, answers, questions and we build the structured data that can improve the search results page with the you know this more extensible cards and the sitemap robots.txt but sitemap is something we also need to double check because yeah we now have like two domains we need to include urls from both from the old website from the new website but that part is actually not not complicated really so And this is the canonical, selecting the canonical URL?

Yeah, the canonical is for landing pages. It's like just point to this page, like automatically. The more canonical logic that Dennis implemented for the job titles, there is like complex rules on that. So I don't want to reveal this during this call and something that we'd like to discuss further because it's probably not the right way to do this.

opinion on this, but it's just for further discussion. So for this landing pages, it should be simple. It's just like the basic meta text plus sitemap plus robots and structured data. That's our vision on this.

Yeah, like you said, I think one for one, to match what's happening on the existing site. And then I think tracking kind of feels that it's needed so that we can make sure that it actually does work one-to-one because we'd want to know pretty quick if it wasn't functioning properly because it's a massive part of the business, right? And you don't want to... run afoul of Google and whoever else. Again, it's not my forte, but, and I'll defer that to Steve and Tariq, but it's kind of my gut feel that, pretty important.

Yeah, cool. So thanks for that. So that makes sense. Yeah, it's similar to the CMSs I've used in the past where they allow you that customization or creating slugs automatically based on the title and all that sort of stuff. Yeah, so that's cool. I think we'll do this on another call is kind of the, you know, The future? where we're going with indexing sites and agents and stuff. And there's sort of that whole new aspect, that new world.

I know you guys are across it, but it'd be good to chat about that sometime sooner rather than later as well. So Yeah, I've got a few more things unless someone else has something else on the top of their mind. I had some other takeaways from your agenda that I thought we could knock off real quick, and that was about... Boaz and Vassell, if you guys can just tell me what you need me to do specifically.

I understand the cause thing, right? I'll have to just, you know, you'll have to give me the domains. But if you can just be explicit as to what you want me to do, Because I'm not quite sure what you mean. need access to the cell, what you're looking for there and stuff. So if you can define that for me, I can go about getting you what you need or doing it myself.

Yeah, okay. Um... It's difficult to remind for me. Can we just drop this on Slack later because this now is, Something that I don't remember, actually. I know that we spoke about the accesses, but then we decided to go with like... just assigning the domain on Cloudflare, I mean for the release. For the other stuff, I'm not sure.

Yeah, that's cool. You can come back to me. Yeah, not a big deal. Yeah.

So, we have everything we need from accesses, anything like that, so we're not blocked by anything?

No, I think we have everything that we need. We have a Cloudflare access for everyone and we don't really need Verso, I think. Okay, Verso probably was when we spoke about migrations. Actually, the database migration is something like to discuss yeah like because the from steve we got this information uh the database have a lot of draft content it's not publicly accessible for taxonomy api uh i migrated the data from taxonomy api and steve shared with me the um dumps with a full full uh amount of data but there is no relations and stuff so i haven't migrated this yet until i get clear like understanding of how this should work and that's probably We asked on pre-recalls about the access to Vercel to get the credentials to query the database directly and fetch all the data, not from the public API, but directly from the database.

But it can be just a dump or just someone who tells us what we really need to migrate, what is draft content, if we need to migrate job titles without relations, is it right or not? I'd say something like this, yeah.

All right, yeah. And my comment on this was just to say, hey, Like Steve alluded to, he thinks the numbers are low. And I think even in your knowledge base, your original count was much higher. And so there's a mismatch. And so he thought, well, maybe it's the unpublished data. And so he and I had an initial call today. And that's one of the things I'm going to do is... Dig into that, understand that so that I can help you answer that question.

So, yeah, just give me a little bit of time. It's not... It's not blocking anything, right? Yeah, absolutely. Yeah, cool. So yeah, I'm on that, getting my head around it because I know there's different databases and there's... Um... It's tricky. with Like, I think the plan is right is there are a lot of job titles and the plan is to, you reduce the number and merge them, you know, number of titles that are similarly into one.

And then, yeah, there's the whole, um, issue with SEO as well, I think in managing that stuff as well. And the canonical URL that comes into play and stuff. So yeah, there's a bit to go in there. Leave it with me and I'll come back to you.

Okay, yeah. And another one thing about Neon, it is now on our Vercel space. That's absolutely fine. It's how we usually do if we do not block ourselves. But we also need to migrate it to the Steve space on Vercel or it can be just like Neon account. That's also something that we need to handle ideally before the release, because we don't want to do this after, right? So all these dumps, etc.

Yeah, so if you want to put that down as a to-do for me as well, I can just get the ball rolling there. MR CROWLEY: As to--I mean, yeah, we're planning to. you know, move away from Vercel. So I guess I'll just be your tone and account. I imagine I'll clarify that. Yeah. Um. How do we look? Do you think we've covered most things or I think what we haven't covered, we can probably acknowledge there for another time. They're not the priorities.

It's kind of, I know we've gone over. I can stand the call, but it's... Kind of feels like we're close to wrapping up, right?

Yeah, I mean, the only big topic was the backlog management system. If you want, we can have a call like tomorrow, same time as today for you, just you and me, I can present you my ideas and we can like select a direction and go from there. But basically in just two words, I see two main options for that, a simpler one and a bit more complex. Both of them have same structure. We have one source of truth, like this full backlog of all of the things, ideas, releases planned, and it can be just a simple canvas in Slack or a more complex page in Notion.

And we have our ticket management system in Trello, which is more detailed. And we just update the main thing, the source of truth from all three sides, your team, our team, design team. And this is where we have the status of the project going on.

What's your gut feel? What do you think?

Depending on how much work we have, actually. We can use Notion. We internally like it very much. We can have a common Notion team for all of the three teams. Sorry, an open page full of the three teams and just keep it updated with timelines. I mean, we already have something like that. We're just design team have their own page and timeline. We have something similar with a timeline and we have some priorities in Slack.

We just need to put everything in one place and teach every site to update this one place. That's basically it. The ID.

All right, sorry, just stepping back a sec. I have you... two things, backlog structure proposal and knowledge base workflow proposal.

Yeah, the second one depends on the first one. That's why I didn't touch it. So depending on where we keep our source of truth, we can use like AI updates based on Slack channel and meeting notes and all of that. That's like the second step.

Okay, so when you talk about backlog structure, is that... basically like I think of it in terms of Trello, it's like, hey, this is ready for dev, Yeah.

have features like a more complex search or rebuilding the builder would be also an entirely new project on itself. Trello doesn't support those levels and design team doesn't work in Trello. They work in Figma. So we need something above our level in Trello and their level in Figma and to have something like one common place. Okay.

So you suggest Notion and that'll allow you to break it up into the levels? I'll go with your gut on that and... and trust you on that. I don't have a Um, a, what's the word, a preference or conviction either way for you guys to lead that and then we'll tweak it as we need to.

All right. So yeah, I can set something up. So you just want to have a high level visibility of where we are, where we're going, what's the status and have it in one place and update it. That's the idea.

Yeah, like the high level visibility would be for stakeholders that, you know, and PMs. Yeah. There's no need for anyone else to look at that, right? The more broken down version and sort of, you know, the pieces that are being worked on and their statuses, that's a different thing. It's really just sort of, hey, if Steve wants to know where we're at, you know, he can look at this one place. And if I want to know where we're at, you know, if Tariq wants to know, then I hope it's useful for you as well.

That's kind of the purpose, right, is to have the quick look and see where we're at, and then we can drill down into the actual, you know, what I would say the backlog and the in process and whatever. Okay.

So let me set something up, share with you and we will then refine it along the way.

Yeah, I think the same approach again, right, is what we're talking about with the first release. Let's ship. Let's just ship and tweak it as we go.

Yeah. Good. One quick question I don't have on this list, but I have in mind. What's the proper way to call your team? Is it Ship Crew? Is it Rocket Resume? What's the naming? I'm confused.

Um... Yeah, so the guys will migrate over to ship crew because Rocket Resume will become the first tenant, right?

Mm-hmm.

Yeah, so how do you want to refer to us? I don't know. I hadn't thought about it. I mean...

In the docs, I decided to select ShipCrew because it's something like a new coin. So it feels like Steve would like to name it like this. Our collaboration, all the teams all together. So ShipCrew, it's something more high level. As you said, Rocket Resume is going to be just a one tenant. But the future is having partners and building the complete large system with much many pieces just at the Rocket Resume website.

So I'd say ShipCrew is something Yeah, definitely formal and it can be informal as well. If you wanted something a little less formal, I didn't know how to answer that, but ship crew definitely. Ivan and, uh, Ivan and Gabriel will move over. Um, And yeah, so ShipCrew is the entity. Yep.

Gotcha. Thanks. That clears things up.

Sorry for this, but I'll try to be very short. I'm asking about from our stakeholders, should we add more team members? Because it was a request from Steve to add three, four, I don't know how many developers. We tried to stop it at this point because we have too much on clarity. We don't really see the future in details, enough details to add more But this, Elsa, we are open to this. Now, I don't think it should be before the first release, but it's just for your context that we are open to this. We have more devs.

And Denis is just off for a month, but he will come back and there are going to be two or three developers. And in the future, when we have everything clear, when we see a backlog with enough details, we can accelerate the work on our side by adding more devs. if this will be the goal to release and ship things faster. So that's just...

No, we're on the same page. No need to add any more yet. We need to ship a product first and then we'll only have an understanding because then our velocity will change, right, once we ship something and then we can start sort of thinking a bit more of the stuff that's on the backlog and stuff like that. So, yeah, I think somewhere in your doc you've got stopping at three to four at some point anyway, somewhere written.

No, but I think where we're at now, there's no need to add anyone until we see the need. And that aligns with you, right? So that's cool. I was going to ask where Dennis was because I haven't met Dennis. Is it Dennis, right? Yeah, yeah.

Yeah, Dennis who started the project, actually. Yeah, he built all the infra and like in search, actually, and prepared the database script to like the foundation for migration as well. So he made actually the most of the work for now. We're just like joined later.

Yeah, that's cool. So he'll be back on deck at the end of this month. Is that right?

Beginning of May, that was the plan.

Yeah, and allocation, I don't know if you're aware enough, but our location is like powerless developer who works full time, so the whole week. I'm here on one day, but that's not something mandatory, actually. I can spend here more time. It mostly depends on what clients want, really, because usually we build projects that are seamless, or more complex. And so there is just no need for tech lead for the whole week to be like a developer and work with him on a full-time basis.

But for this project, it feels for me that I can spend more than one day, like two, three days, and it's going to be fine because there's a lot of complex things that we want to handle and refine with you, etc. So that's my thinking.

Yeah. investigates spikes at this point where checklist input is required. Yeah.

Okay, so that's good to know. I didn't have any visibility on that. So I think that's important for me to know. Because also that's going to factor in when we sit down and say, all right, when are we going to ship the first release once we define what it is? And part of that conversation will be, hey, guys, I want to ship it in two days. And you're going to say, well, actually, no, only Pavel is working and I'm not back on until next week and Dennis is out.

So we need to at some point soon understand the situation. the Yeah. And that helps us also talk about, you know, or plan for ramping up as well. So, yeah. Okay.

Yep. So, on this final note, I just wanted to once again confirm, we can go and start building the landing page according to the new design. That's approved.

Sorry, I'm just going to charge my computer. I want to I would like Tariq to give the Hey, I've read this summary and yes, all good. That's my expectation. I don't know if that's been the current flow. I just, because I've only seen one summary and he did comment on that summary. So I'm assuming he's going to write back and say, yeah, it all looks good or hey, tweak this. But I guess either way, we need some sort of, I think, I guess, yeah, what you're asking is that the formal approval or not?

Um... JOHN MUELLER: Ah. Let me double check because I haven't read the summary. So does it, I think, well, sorry, I scanned the summary and I think even in the summary it says, hey, we haven't finished the mobile yet. We'll get it to you in a day or so. Is that right? Yeah.

Oh, let me see. Approved. Mobile responsive is done. Tablet responsive is in progress. So that's not blocking us. We could start working, but we can wait a formal approval. That's fine too.

My, My main thing would be to Yeah. Let's say it's done, but I would want to get back to our verifying untitled UI and again using that. That's the big pressing thing. Okay. I think you've already designed the page you showed me just now. is Untitled UA, right?

Part of-The demo you did.

Yeah.

Part of it. And also it's, It's the old design, not the new one. The new page that Habitat team created, it has different structure, different content. while having a similar idea, it's actually very different from the current one.

So what if we did this? Take it as being approved. If anything gets tweaked, it won't be much. We'll formalise the process more as we go forward, right? Tariq did say it's approved, so that's cool. MR CROWLEY: Start building it, but use Untitled. Make sure you can do it. Right? I mean...

Okay, so Eugene confirms we can do it with Untitled. If all good, we'll let you know and we'll start building the page.

Well, yeah, let's clarify. The expectation is you can do it with it, you Untitled. Yeah. Unless you prove otherwise, we expect that we can, right?

Yeah, but it requires updating all tokens in Untitled UI. So I need to take what Habitat built and think this with what we have in Untitled. And this is kind of mapping and not everything can be mapped because these two different design systems. And that can be like not a bottleneck. I can try to do this, but yeah, do we expect later when we like tell, okay, the untitled is definitely the thing we'd like to use, that Habitat will take these untitled UI design system and tokens, everything that built and replace them with theirs, like change the values, et cetera, Because now it's two different design systems and they cannot map one-to-one.

And there can be for sure missing pieces that we just don't know how to map this color or this typography token, etc.

I guess I probably don't understand the issue fully. So in my mind, right, I'm guessing because you're using Tailwind 4. you've probably got, The tokens in just the global CSS. I think that's the approach now. Is that right? Yeah. Yeah. And so Okay, so the tokens, there is a set of, and we're using Tailwinds. Yeah, so ideally...

Oh, sorry, sorry. Yeah, just one more thing that, like what we usually try to achieve, why I think there should be one source of truth from the design system. When I say design system, I mean this very small, even not buttons or like these primitive components, the tokens itself, like colors, typography, numbers, and hex colors, all that stuff. And we can easily sync this. So if we have them in Figma file, we can just download them and put inside the Tailwind config. Once something will be changed, we will just sync this again and it's going to be one-to-one mapping.

If we have like Habitat design system and Tailwind design system, I need to take the Tailwind as a foundation because it's something that Tailwind use inside the components and sections and I need to check what habitats have and try to think like these two inside the one.

Okay, so you're telling me that Habitat has a design system, meaning I don't know exactly what that means, but it doesn't, it doesn't, Um, map with Tailwind?

Yeah, it's most likely different because it's just another token, another name for these tokens. And it's like when you have, for example, color red, something like this, and you use this in button, in link, etc. And we can, from Figma, when we create components, we take these components using this token. So if it's like name is different or one color is half in untitled UI system like Token Red and it doesn't exist in the Habitat design system, I need to understand what color should I pick for this place.

I mean, But don't you, doesn't that mean that you, in the beginning, you have to translate Habitat design tokens into Tailwind in the first place?

Yes, absolutely. We can go without this, without a design system at all. But we anyway have to create Tailwind config because Tailwind just has a default. If we won't use them, we will need to rebuild these pages again. We implement them without the design system, then we have it, and then we rebuild them again. So the design system is always the first step. All these small primitive tokens, because everything else, starting from smaller to larger components, They're all based on these tokens inside the Figma.

Yeah, but just to understand, right, you take those tokens from Habitat and you, like it says, button color, primary red, right? Yeah. say that's Habitat, right? Yeah. You then go into the code base into Tailwind and you look for maybe it's button, primary, red or BG. It's a bit different, the token, right? The naming, right? Yeah. You map it initially and do all the heavy lifting up front is what you're telling me.

Yeah, yeah. We need to do this as a first step, yeah. Yep.

It's not, it just,Yeah, it's not like--It doesn't seem efficient to me. It doesn't seem like the right approach from the start. It doesn't seem the right way to go, right? It should be, we work with Tailwind, and our components whether it be ShadCN or Untitled UI, Um. use tailwind classes And so I would expect and I'm just thinking out loud, right, is that you would get from habitat. the design tokens in using the naming that Taowin would use. Yeah.

Is that not fair? I tell you, you know...

Yeah. Um... So yes, yes, we expect this like habit, yeah, from For example, if we take the simple components button, what we expect is that we have all colors separately. as well as typography separately. It's inside the tokens. Detailment have configuration and with that, we have these tokens and then we create button components based on these tokens. Once token changed, the button will be updated as many other components. Because this is like a source of truth, a Vim configuration.

And the only issue is that we need to map these two systems, these two components token lists, let's say. It's just like you have one list of variables and you have another list of variables and you have a tallying config. And as this component is based on Untitled's UI, we need to map those.

Yeah, but I'm thinking forget Untitled, right? If you're using ShadCN, it's still the same process. Right? Yeah. 'Cause we're using it as a tailwind theming, let's call it theming, right? Where you have blind tokens and So whether you build a custom component, use SharedCN or Untitled UI, they're all still tied to that. theme, right? Yeah. Yeah. I mean, I think there's some disconnect in me understanding the process.

I mean, there's a couple of ways to do it, right? Is for you to show me what you get, in Figma from Habitat and then show me how you create the the tokens and the theme in the code base. And that may help me understand. Yeah, sure.

I can clearly explain. Let me just put this visually probably. I can do this in Slack or just like, I don't know. I'll give you all the information just to clearly explain. I know that it sounds like not clear right now, but yeah, sure. Let me just do this in more understandable format.

Yeah, maybe like a little video.

Yeah, something like this can work.

Yeah, yeah. Or we can jump on a call tomorrow. I'm happy to as well. I know you're not always around, but. Whatever makes sense, whatever gets us there quickly. Because my goal is to make this as efficient as possible. So it sounds to me like there's double handling of tokens from Habitat to you. Whereas I would like to think that there's a source of truth that Habitat creates. Yeah. And it just gets imported in and it seamlessly works.

Exactly. That's a goal. That's a goal. Let me just, yeah, I'm double check and give you the output in this lab.

Yeah, cool, cool. Yes, well, but the question will be, I think your output's gonna prove that we don't have the seamless integration, right? And that's the whole discussion we're having is why we want to move toUntitled UI with Figma kit so we have the seamless. That's kind of what I'm thinking we're having this conversation for in the first place, right? Yeah, yeah, exactly.

You can prove to me that it doesn't seamlessly work now, but that's not our objective though, right? Our objective is to create that seamless connection.

Yeah, I'll check this too. Don't worry. I'll just try to not only show you where we have trouble, but also a solution as well. That's part of our work, so that's fine. Don't worry about it.

Yeah, sweet, sweet.

Sorry, I'm not trying to be difficult. I just want us to make the right choices and make it...

I mean, design's hard, right? And the last thing you need to do is find that you have some sort of broken mapping and then as it gets really big, you're finding that they're not mapping and you're having issues.

Yeah, we want something very seamless, as simple as possible. The goal is really the habit of designs with Untitled or not, it doesn't matter actually. We just need to have a source of truth, for tokens somewhere in Figma and then express them in Tailwind. That's a goal. Yeah, I understand this. Yeah.

I just had a map against Tailwind because that's what we use. Yeah. Yeah. Yeah.

Yeah, cool.

So let's stop here. I'll summarize everything for everyone's visibility. We will have our action items list and we'll progress.

We fixed the routing just now. But yeah, okay, let's leave it for following the meetings.

Yeah, sounds good.

Thank you very much, Drew, for your time. Thanks, guys.

Appreciate it. Good one. Bye.