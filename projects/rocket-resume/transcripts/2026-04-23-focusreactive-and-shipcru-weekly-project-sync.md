# FocusReactive & ShipCru: Weekly Project Sync

Date: April 23, 2026   (GMT+2)
External: mailto:steve@shipcru.com, mailto:drew@shipcru.com
Participants: mailto:eugene@gitnation.org, mailto:pavel.khurs@focusreactive.com, mailto:anastasiya@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Robert to check with Julia and design team about whether legal page designs are planned
- [ ]  Robert to review analytics/tracking documentation and provide feedback
- [ ]  Robert to share approach for documenting technical decisions early next week
- [ ]  Robert to review and respond to auth implementation thread in Slack
- [ ]  Robert to review Vercel access request and provide clarification
- [ ]  Eugene to ping Robert in Slack threads for auth and analytics discussions
- [ ]  Pavel to test authentication implementation options
- [ ]  Eugene to complete sitemap work and SEO meta field validation
- [ ]  Eugene to validate cache and revalidation functionality
- [ ]  Team to wait for Habitat to complete About page design and migration to Untitled UI

### Phase Zero Scope Overview

The team reviewed the first release scope, which includes minimal pages and must-have functionality 

**Pages included:**

- About Us page (new page, new URL, designed by Habitat using Untitled UI)
- Legal pages (existing URLs, plain text with tabs - Terms of Service, etc.)
- Support pages (existing URLs, simple text pages)
- No landing page or homepage in this release
- Key constraint: anything requiring tracking is not in the first release

**Design approach:**

- Everything will be built using Untitled UI
- About page requires design from Habitat
- Legal and support pages may not need Figma designs - development team can build using appropriate Tailwind components
- Status page documentation exists but doesn't include legal pages yet

### UI Shell Components

**Header:**

- Mimicking current production style
- Will remove search icon (difference from current production)
- Mobile responsiveness needs testing

**Footer:**

- Will implement Habitat's final version directly
- Waiting for Habitat to complete token updates
- Simpler approach than header since footer is below default and won't disrupt users

### Authentication Implementation

Two options being considered for login functionality: 

1. Reuse existing endpoint from old repository - requires Vercel dev token to validate and test   
2. Redirect to old website for login - simpler approach, wouldn't need modal  

Login modal UI is already built and styled  

Team needs Robert's input on preferred approach  

### Infrastructure and Technical Work

**Completed or in progress:**

- Cloudflare workers setup
- CI/CD setup and preview deployment (PR created)
- NeonDB migration (unblocked, needs data migration)
- Cache and revalidation (mostly complete, needs validation testing)
- SEO meta fields testing planned for existing pages

**Sitemap:**

- Need to add About Us page to existing sitemap
- Considering adding to old repository vs combining sitemaps

**Testing environment:**

- Need Vercel access to test on dev domain
- Want to test auth with dev token, not production

### Analytics and Tracking Setup

Eugene documented current tracking implementation and proposed Phase Zero approach 

**Current state:**

- Old repository has GTM, Mixpanel, heatmaps, session replay, Sentry, Google Ads

**Phase Zero proposal:**

- Migrate everything from old repo as-is
- Could be simplified further depending on tracking needs for minimal page set
- Open question: does the small release need full tracking suite or just GTM?

Team needs Robert's review and Steve's input on what's needed  

### Documentation and Decision-Making Process

Discussion about centralizing technical decisions and context:  

**Current approach:**

- Slack for quick questions and immediate answers
- Knowledge base doc for detailed overview without "trash"
- Longer discussions that span weeks could use comments or other tracking

**Robert's perspective:**

- Wants centralized place for feature-specific issues, approaches, and trade-off reasoning
- Prefers artifacts in code base under docs directory
- Will present approach early next week incorporating AI-first considerations

Eugene will use comments in knowledge base doc to avoid making it too long  

### Timeline and Estimates

**Rough time estimates provided:**

- Analytics/tracking implementation: 2-3 days
- Infrastructure work: mostly done, 1-2 days for final testing
- SEO and sitemap: 1 day
- Header (with auth testing): 1-2 days
- Footer: 1-2 days
- About Us page: 2-3 days

**Overall estimate: approximately 2 weeks**  

Timeline depends on being unblocked and getting decisions/approvals 

### Current Blockers

**Primary blockers identified:**  

1. **Analytics and tracking decisions** - waiting for approval of approach  
2. **Auth tokens and Vercel access** - needed to test authentication 
3. **About Us page design** - waiting for Habitat to finish migration to Untitled UI (expected by end of week) 

Database migration is progressing in background 

### Design Coordination

Robert prefers to minimize participation in design calls due to timezone challenges  

Maintaining close communication with Tariq (design lead) 

Can monitor through documentation

Notes

Transcript

Wow, yeah, unfortunately. I was going to miss last night's one or the night for me, but then I had to jump on, but then it was cancelled. Like, right before we started so I was up already. That's okay. Yeah. Yes. Are you planning on running those calls more or like one time? No, less. I only want to jump on the design call if I need to.

But I've seen close touch with Tariq.

Yes, yeah.

Okay, good.

Yeah, and now we have docs I can obviously keep an eye on as well. So yeah. It's just like, that's just it. I don't lead the design, so that's Tareq's. domain. And that being that it's a really, you know, not a great time for me, kind of quite disruptive to my day. So, yeah. Yeah, yeah, I'll try and stay off that call.

All right, so let's jump to our most interesting things. I think we can start with reviewing what Eugene prepared as our first release scope, just to confirm we're on the same page and see what was done, what was not. Eugene, can you share your screen? Yeah, sure. Okay, thank you. Thank you.

One second, I need to open this one. Okay, so we've updated this document with the knowledge base for the project. I've added what we've done during the MVP phase. That's mostly done by Denise before you joined, but there is like a search and Cloudflare worker setup. But what is the most important for today's discussion is phase zero. It's a very initial release with minimal scope. As we told before, it should have just a few pages and the must-have functionality.

So from Page's perspective, I think here we need to think with you to ensure we are on the same page. So here are the pages we take for the first release that is about us that's going to be done by Habitat right after they migrate to Untitled UI. They need to tweak, probably tweak some sections if it will be necessary. But overall, this page is completed. We just need to wait until the migration to Untitled.

Just very quickly to clarify, this page doesn't exist right now on the current website. So that's the only one we are building.

on this different habitats design compared to the rest of the pages in this table which we just migrate with easier and simple unditled blocks. Yeah.

So... Yeah.

Sorry, yeah, just to clarify,Yeah, clarify, I would be expecting The about page.

unless there's a reason not to, that it will be built on the same It would be built using blocks as well. Just trying to clarify, right? Because I think this has been the misunderstanding all along was the ability to customise build stuff. So are you saying that because you know something specifically Anastasia or... No, no, no. I mean, from the structure perspective, they will rebuild it with the untitled tokens that we agreed.

But from the look and feel of this page, it will be different from the legal ones and support ones. Yeah, yeah. Yeah, and what is important, as we didn't have the about page before, it's going to be a new URL. It's something new in sitemap and in general. And other three pages is something that already exists. We know their URLs. We're not going to change them. And what is, like how we see this? Maybe wrong, but we don't expect Habitat to redesign them.

We just need to find appropriate Tailwind components and sections to build them on our side. Because there is mostly like... text pages, you know, like some tabs and plain text. Um... Does it correlate with what you think? Or we should also ask Habitat to make up them in Figma? I just... Not sure about this one.

Well, so you're saying, for example, the legal page. Yeah, that is how it looks like. It's like, for example, terms of service, there is rich text, just plain text, and above you have tabs. They're changing the URL, but there is nothing more than links, text, and headings.

have them in Figma, right? Just to cover, you know, all the pages we will have in the future and like have everything in one place. But nothing stopped us to implement them right away because we don't expect here anything. like complex or something that requires design touch. And that's about it. Yeah. Because I'm looking at the... I'm only sort of getting my head around this.

In terms of the new docs that you guys have spun up, Because I see that page is status. Canvas? Anastasia, I think you've probably put that up. the design and development. We've listed all the pages and the design status and the Figma file and the development status.

Oh, that's from Julia.

Ah, this is Julia. Okay. Yeah, I hadn't been, I wasn't aware that was up, but So I'm looking at that and that there is implying to me, I don't see any legal on it. Do you guys see that? Do we need to share the screen just to confirm?

No.

Oh, it's not in here. But we have contact tasks with Epic here, but we don't have anything similar to that. You're right.

So what I was gonna say is that I can't speak for what Tariq has communicated or Habitat believes they're doing. But Maybe looking at this doc reaffirms what I'm thinking and what you're thinking, Eugene, is that yeah, we don't need designs for these pages. Let's just move quick, right? If we need to design for them later, Great, but these are simple pages. I think a development team can just Can design these, you know, ourselves and ship them.

Yeah. But I will qualify that in saying that there may be some sort of mandate where Habitat is supposed to provide them. I'm just not aware of it. The answer might just miss them. on the scope. Well, maybe if you don't mind, would you just be able to do a check-in with Julia and Asesia? Yeah, yeah, absolutely.

And if they're not planning to do it, then that's fine. You know, let's just... Us own those, as in the development team will own them. Yep. Yep. Yeah, and that's actually...

All about that. Is it something missing in this list? I mean, so it's some like legal text like pages plus about us. No landing page, no homepage, right? And nothing other than those. The key is anything that requires tracking is not in the first release. Okay. Yeah.

Okay, so here is this call. Just to touch upon your question. Your question was like, how do we, How are we building those? Are we going to use Untitled or are we going to just create our own layouts using Tailwind? That was your question, right? No, I think we've built everything with Untitled UI. It doesn't make any sense to build on other framework, other utilities, CSS. So as we already know that we're going to build everything on Untitled UI, we just pick Untitled.

And once the design team, update like tokens and stuff that's only configuration update so we built already those pages i believe like pavel built built three of them already we just swapped the tokens and that we are done we will need to only wait for about us because it might require some tweaks in on the section level i don't know but it here it's better to wait until they finish the migration but about those three it's just like as as we not expect any design from their side You build them and then update tokens.

That's it. Yeah, cool. We're on the same page. Good.

Cool. The next one is UI shell that includes header and footer. The header is what we discussed previously. We just tried to mimic the style we had previously. So just to confirm again, we're going to remove search icon, right? So that's going to be a difference between the current production and our header. Yeah, it's something for us just to not forget to check mobile responsive as well.

And also, that is an open thing. I believe like Pavel already covered that, but we need to test. We just reuse the same endpoint as current production have, and we just need to know what is the better way to handle this. Now we have this, let me show, this model, and we actually already built this.

the styles for this model, the fields, etc. It's just using the endpoint that already exists in the old repository. And Pavel suggested several ways to proceed. Either we need to Vercel to make the testing or talking just to test how it works, like how the cookies shares between the domains. We don't expect it's not working, but it's just a matter of testing. Or another option he suggested in Slack is just to redirect to the old website.

In this case, we even don't need this model. But that's something he put in Slack. So we just need to do confirmation or like your thoughts on this. Can you just pull up that thread and make sure I see which one you're referring to? Yeah, sure. I'll ping you there.

Yeah, probably there's too many things there, so it's going to be missed, right? I'll ping you inside the thread. I might have it, I'm tracking, I pretty much track everything, but you know, it's on a backlog somewhere, right? I'm kind of trying to deal with it.

the immediate fires and then get back to the other things. This brings up my next question then. because you're showing me your Knowledge-based talk.

with some decisions and we're talking about some options with regards to ORF and So basically, What I would like to do, and you mentioned a thread, so that's cool, but I was going to say, all right, well, cool. So is the idea to...

Um, clearly point me to this doc so I can see what we're working through. But an extension of that is that it would be good to understand in a centralized place, meaning where we talk about a specific feature, what the issues or concerns are, what the approaches are and the reasons why we've chosen one over the other. That way, just, you know, I think it's... It's a good practice in general, right? But...

The way I see it is that for me, these are all artifacts that actuallyIn a lot of my code bases, they actually sit in the code base under artifacts. So that... we always know, you know, the things we considered, what the issues, what the trade-offs were, and the reason why we select the approach. And that's kind of where I'm going. Whether that goes into the code base or not, I'm just having some central place for each specific thing we talk about.

so that we can go there, answer the questions, go back and forth, land on something, and we can see in one place how we got to where we are now. Yeah, that makes sense. Yeah, that's good. Just comments here, not to overload the page with conversation, it can sit separately in comments.

Yeah, is that the approach you want to take?

Let me think. Yeah, I actually can embed more information right here. Yeah, just as Anastasia tells, it can make it pretty long and difficult to see the overview. That's why we need to make the separation overview, and then you can go to the more granular piece with the description and stuff. We need to think how it's better to organize. For example, yeah, comments. can be a solution, right? So I can just add the comments to the piece of text so you can open and see what is additional information or context we have regarding this one.

But yeah, let us just think a bit. What is the best way to do this? We're going to have lots and lots and lots of things, right? Yeah, yeah.

What I'll do, because we're close to the weekend, it won't hold us up now, right? But I think early next week, I'll present to you my thoughts on how we should manage this sort of stuff.

With our AI hats on, AI is a first-class citizen and And then hopefully we land on something that we agree that this would be a really good approach so that we always have context ready and available for an agent. And so, you know, my first thought is I like to keep stuff in the code base that's code related. But it may not go there, but...

How about we have a think about it and circle back next week and land on something that we'll use going forward? Yeah, sounds good. A quick note to that, just to clarify our thought, how usually it was happening for us. We use Slack for questions and things that can be answered right away or almost right away. So then all of this trash bin with all of the conversations, it's there. It's there for history. You can use search. You can use AI to go through it.

And here is like detailed. detailed but like summarized higher look overview and no trash in here.

So that was it. But when we have like ongoing question or ongoing topic that stretches through weeks, then it's complicated to look through Slack when you have to keep a question in mind through weeks. Then in this case, it makes sense to use like comments or anything in here to have this longer history, like we're one topic and multiple answers week after week, something like that. Just the idea, not the proposal.

We can adjust to any system, any approach you want, just our previous process to understand how we were thinking.

Yeah, it's pretty much the same, I would say. I would say, like, so, you know, thinking a bit further, like, something like, you know, this kind of could sit in a doc directory, right, inside the app, right, explaining how auth, the auth, how does auth work, you know what I mean?

And it could be a work in progress, for example, but it becomes like, this is how it works. It's not all the conversations to get there. It's kind of the curated version of... of all those conversations.

So I often will actually, you know, grab stuff from Slack and I'll have my doc and I'll work through the agent to curate it all into something that's concise, CLIA, and put it into the dock. That's kind of my flow at the moment, but yeah, I think we're kind of on the same page.

It's just a matter of working out ultimately where, you know, Yeah, anyway. So, yeah, let's circle back on that next week.

Yep, sounds like a plan. So as now it's just a Slack conversation, I've been there. So generally, there is two options. is we just need to verify everything so we need either our secret from old Vercel repository to validate the house working on our side or we can simplify approach in general and And the standard of any login, any pinning old endpoints, we can redirect. So there's generally two ways we can handle this.

Um...

Okay, and so is there an open question still to be resolved or you just want us to chip in with our two cents worth on what we think would be the approach?

Yeah, we actually expect more like talking because we already implemented the house with easy migration and it's mimic the current approach. But we just need a token to validate this or Another option is just in case if you like thinking to simplify even more, but we don't know how good this approach is. So that's something you can put your opinion. Is this worse or not?

All right. So the thread that you're going to, or if you have already, gives me everything that you need me to. Yeah, exactly.

That was for the header. For the footer, we think it's just worth implementing the Habitat version. And we don't see any reasonable blockers. It looks simple. And again, we just need to wait until they tweak tokens and just implement the footer. Because for header, the reason was to ensure the users won't be disrupted or scared about switching. another domain or something. But footer is below default so we don't have such a risk and don't need to like re-implement things again and again so we just can take the final version. That's our thoughts on this. And yeah and this looks pretty simple it's not like you know the multi-level links or something like this.

Yeah, okay. I mean, yeah, on the surface that seems logical. Okay.

The issue with sitemap that what I'm working on right now, so I just need to figure out how, first of all, we're going to include about us in sitemap. That's my thought. But I'm not sure like if probably if the plan more like infrastructure test and release some pages. It's anyway sounds for me like we should include the about us in sitemap, right? Just would like to double check with you. So the thing I'm trying to solve, like we have the old sitemap with a full amount of pages and we need to include one URL to there.

And it's kind of, you know, it might be easier for me to just go to the old repository and include this URL, like, Zerr instead of trying to combine this, you know, because it's, it's, it's easy thing, but it's complex to solve. So I'm, I'm just trying to find a solution like easy solution without trying to, you know, over engineer this and stuff and some checks on the meta titles, descriptions and stuff.

We have just a few pages, but again, I'd like to test, I'd like to check the, that the, all this SEO meta fields match the old and new version. So we, have any issue of friction, just like a simple infrastructure test for the, especially for the existing pages, for the legal pages. That is important piece.

Regarding infrastructure, Cloudflare workers is there. Our initial plan was to test them on rocketresume.dev. And on our very first call, we discussed why we need Vercel access. I said, I don't remember. But now I finally got it. It's because we need to test on the dev domain. It's under the Vercel house. Now we have a router. production, it's like proxy to production domain. That's also fine, I think.

As we're not gonna change anything on the old website, that probably don't need for us to have this access to the .dev domain. Or Pavel, could you remind me, probably there are some sort of things we need to check the auth or whatever else?

We need a domain for checking house and for back forwarding from dev domain to our Cloudflare workers.

Okay, so we need to assign the domain to Rozo, right? So to test is closer to production version.

Ideally, we'd like to have access to Vercel. Because to test the Outh, we don't want to test this on production environment. The token we're asking for Zolstrat is a DEV token. So to not corrupt anything production-like.

Um...

So here we just need to resell access ideally.

All right, I would just say, just bouncing it. So is the intention to, I was going to say, put it in the thread for me.

Just help me understand, because you guys were going back and forth and riffing off each other as to why you needed it. I don't have the full context, so I'd like to understand exactly what you're doing and why you need it, and that way I can Just come back and say, yeah, cool. or give an opinion or something, you know what I mean?

Yeah, sure, sure. I'll bring you in Slack, just explaining all this stuff.

The second point is NeonDB migration. As you unblocked us, so I just need to pour the data. Nothing complicated here. ZCI setup and preview deployment. That's also almost done. I created APR. I just need to point everything out from our FR Neon, our FR spaces, because as we're going to you Thank you. prepare everything to release. It's worth doing now.

And the last point is cache and revalidation. Denis made most of the work.

But is this open next? It's not easy to make this caching work right. I already solved this. I just need to validate. The DPR is open. I just need to test what happened in when we change something in CMS, is this really a daily page? If I create a new page, if I delete page, so all these manual checks to ensure the brought responses to all these changes in CMS. This is for infrastructure. I don't see anything else we need other than that.

And the tracking?

So I've already like made some research, what we have already in the old repository, everything that Steve told about, like how he see the analytics and tracking should work. I put this all inside the document. and shared this in Slack. So you probably saw this one. Here is the current state of what we found, the new model, etc. But what is important, the phase zero is here and the idea is to just take what we have in the old repo and migrate without changing anything.

As simple as that. It can be simplified even more depending on how much tracking we need for those pages. If you told us that for those we need only GTM and we don't need Mixpanel, for example, we can simplify it even more. We haven't checked this with Steve, so we're not sure what is reasonable to have on, for example, about page. So that's why it's kind of open question. Should we migrate everything as is or we can go with a simpler approach?

Um...

Okay. Sorry. Is that me or you? Could you move your little window, Anastasia, whoever's sharing, so I can... 'Cause I could, yeah, that one there, 'cause I couldn't see. The doc underneath. There we go. All right. Okay.

So this is something I'm going to look at and reference in order to come back to you.

Yeah, I'm just trying to propose something because that's something that helps us to go further after the first release. After the implementation of Phase Now, as it's described here, it's the same how it works right now. And so in the following phases, we can improve this. But if we'd like to move even faster, and that's an open question, to skip some of those stuff that they already have and just implement GTM, for example. But we just don't know what they have in Mixpanel already. I mean, how they use them.

All these heatmaps, they have session replace heatmaps, they have Sentry, Google Ads. So there's quite many stuff and I have concerns, do we need this for this very small release? That's something I'd like to think with you.

Um Yeah, cool.

All right.

What's probably good context for you as well is I'm probably at where you were, I don't know, weeks ago or whatever in terms of understanding a lot of this stuff, right? As I So that's why I'm always pushing back and saying show me you know clearly tell me what it is that you're doing help me understand it's getting up to speed at the same time right um Because we can always go to Steve with this stuff, but if the knowledge isn't transferred from Steve to you or I, especially to me, in a way that Um, can be absorbed and at least referenced back to, then that's not my objective.

My objective is to get stuff from Steve and make sure we only have to ask it once. And we can always go back to it and understand you know, answers to questions or just... understanding features. So yeah, bear with me while I sort of push back and say, hey, give me more information, give me more docs. That's where I'm coming from. So... Okay. So at this point in time, this seems like a great doc for me to be the central place for me to come and go through all of this.

Um, Okay, we're causing it, calling it phase zero though, is that right? This is the phase one, but it's phase zero. All right, so that's cool. So we're calling it phase zero. So this is where I'm gonna say, all right, let me make sure that that I understand what you're proposing for phase zero. Let me actually then you know, have a bit of a think and make sure that there's nothing else that I can think of.

And then let's answer all open questions.

So this is going to be the dog and we'll use threads like we talked about for the time being you just ping me with a thread and we'll just keep a thread running on each specific thing we need to clarify. So yeah, this is great. I thank you for doing this.

I won't stop you unless you have finished, but Yeah, you'll... Yeah, that's actually what I was...

Yeah, that was the very last point from the phase zero. So I actually don't have anything to add here. I just pinged you in this another thread where I shared the Analytics... theme just so we could have conversation in Slack, as you mentioned now. So... That's done.

Do you have, and this is the classic, you know, I shouldn't ask you this because I know what it's like when they get asked this, any inclination, any idea, any sort of, How long to ship?

This one can be done in two or three days. With validation, with testing, etc., it's mostly just to take and mimic the behavior, but we just need to a bit refresh the code because in old codebase it's not very clean and we don't want to port such a... things in such quality. You just need to a bit refresh and put it in the new repo. So I'd say like two, three days for tracking. InstraStructure is actually...

done and made of testing, I said we need to one two days more to ensure that caching and revelation deploys works ECO and sitemap that actually I've done today. So it's going to be like around one day.

And from the UI perspective, what is...

What we need, header is done, we just need auth to test and footer, I'd say one to two days as well. And about us pages, actually, the difficult for me, I'd say it's going to be around two days. And that's it.

Three. Yeah, three. I guess, yeah, it's very rough. I'm just trying to say it's going to take us around two weeks. I'm not trying to estimate anything right now. I just want to have fun. Yeah, I get it. Yeah, yeah. Yeah, and my rough estimation, I'd say we can done everything in two weeks.

If we are unblocked in the decisions, get proposals approved, yeah.

It's a matter of a few weeks.

A few or two? Let's aim for two. In my world, a few is four. You know what I mean? So what does a few mean for you guys? Does it mean something different, is it?

Two, three.

Yeah, yeah. Two, three.

All right. Yeah, cool. All right. So we'll... Well, I think two weeks, but I get it, obviously, because I'm... Yeah. I do dev as well, so I get what happens. But it's good to have a grounding because I need to get some clarity. We may be...

that may be what we're working towards and we may strip stuff. You know what I mean? So, um, yep. Yep. Um, Cool. All right. So I've got a great doc to go now sink my teeth into, understand it, answer any questions, ask any questions. And I need to do that ASAP. So that's cool. Yep. Um So, all right, so if I asked is what's the... What's blocking you right now? What's my priority?

I'd say And analytics, that's two things we're waiting and like decision approval tokens and we stopped on them right now. Another one is just about page as it's something that takes like days of work and we need to wait until the Friday, let's say, when Habitat finishes the migration. It's nothing that we can resolve actually, so I don't think we can tell them go quicker. The database migration is already in the background.

My task regarding the CEO and InfraSitOps. So, I'd say only analytics and...

And us, that is the most two important blockers for us. Do you agree with me? I've just probably missed something important. Just ping me if you see anything else.

No, that seems right. Yeah, okay. Okay.

All right, awesome. That's in your knowledge base doc, right? The doc that I already have access to? Yeah. Yeah, that's the previous question.