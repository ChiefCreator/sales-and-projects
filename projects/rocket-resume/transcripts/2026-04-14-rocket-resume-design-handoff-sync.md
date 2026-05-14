# Rocket Resume: design handoff sync

Date: April 14, 2026   (GMT+2)
External: mailto:drew@shipcru.com, mailto:nastya@habitat.cc, mailto:yuliia@habitat.cc
Participants: mailto:eugene@gitnation.org, mailto:anastasiya@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Julia and Anastasia to develop a shared status tracking solution for all pages showing design status, dev status, and approval status (visible in Slack or similar)
- [ ]  Julia to share project initiation document with Drew
- [ ]  Drew to compile and share all dev requirements and restrictions for the design team in one consolidated place
- [ ]  Anastasia to cancel existing Thursday 12:30am meeting series and create new recurring meeting for Thursdays at 5pm Drew's time / 9am team time, 45-60 minutes
- [ ]  Design team to continue marking pages as "ready for dev" in Figma and pinging Anastasia with comments

### Team Introductions and Context

- Team members are distributed across Europe: Ukraine (Kiev time zone), Belarus, and Poland
- Anastasia (designer) introduced to Drew for the first time - works on both website and product alongside Vlad
- Drew is still onboarding and catching up with processes

### Design Handoff Process Overview

- Design team prepares responsive versions for all pages: desktop, tablet, and mobile
- Responsive designs are only created once a page is close to finalization - Rocket Resume currently only has responsive for landing page
- Design team leaves detailed notes in Figma for dev team regarding animations, interactions, and anything not clear from static designs
- Design system is continuously enhanced with icons, color palette, typography, navigation components - everything developers need
- All developers have dev seats in Figma and use dev mode to extract styling, measurements, border radius, etc.

### Development Workflow

- Once a page gets "ready for dev" status in Figma, Focus Reactive team conducts internal planning meeting
- Dev team reviews designs section by section, asks clarifying questions in Figma, and tags relevant team members
- Team works in Trello with granular tickets for sections (1-2 day tasks) rather than full pages (week+ tasks)
- When development is complete, page goes through quality assurance testing with Habitat team before final review
- Final approvals happen on weekly demo calls where team shows CMS functionality and implementation details

### Current Process Gaps and Improvements Needed

- **Visibility issue**: Drew, Tariq, and Steve need clearer view of what's in progress, what's ready for dev, what's ready for approval, and overall scope completion
- **Tracking**: Currently status lives in Figma (design side) and Trello (dev side), but no unified view for stakeholders
- **Approval workflow**: Currently happens verbally on calls - need more formal tracking with history
- **Design requirements**: Need consolidated list of dev requirements/restrictions (like consistent margins, reusable blocks) for design team to reference early in process

### Project Documentation

- Julia maintains project initiation document with timeline, team details, and weekly priorities - will share with Drew
- Design team provides detailed follow-ups after weekly design meetings in Slack, listing all comments and feedback for tracking
- Anastasia maintains meeting canvas with agenda, follow-ups, action items, and priorities - creates historical record

### Meeting Cadence and Approvals

- Weekly design meetings with Habitat team - follow-ups posted in Slack with detailed comments
- Weekly dev demo calls where work gets approved and CMS training happens
- Tariq is main decision maker for design approvals, Drew for dev decisions
- Steve defers to Tariq and Drew when they're aligned on his vision - they consult him on key architectural/design decisions as needed
- Drew may not attend all Habitat design calls (scheduled at 1am Drew's time) - will follow summaries and join when specifically needed

### AI-Native Workflow Discussion

- Drew exploring transformation to AI-native organization using artifacts and markdown checked into GitHub rather than traditional ticketing systems
- Focus Reactive pursuing similar approach agency-wide with knowledge base using Obsidian, storing all projects, case studies, Slack histories, and technical proposals in GitHub
- Both teams interested in collaborating on best practices for AI-native project management

### New Meeting Schedule

- Habitat design call stays at current time (works for Tariq and design team)
- Dev team weekly sync moving to Thursdays at 5pm Drew's time / 9am team time (1.5 hours earlier than current slot)
- First meeting at new time will be Thursday April 16th
- Tomorrow's originally scheduled 12:30am meeting will be cancelled

### Process Philosophy

- Goal is to free up both teams to move faster without waiting on information while not requiring Drew/Steve/Tariq to sign off on everything
- Right process + right decision makers = teams can move independently with appropriate oversight
- Important to give advance notice on questions requiring research or stakeholder input

Notes

Transcript

And where are you guys? Where is everyone? I know we'll have to have this conversation when we talk about time zones for the call, but... Remind me where everyone is again? Europe. Say it more about. What was it? Like what countries are you in right now? Nassimi.

The Prokhorovatnoye one. We are in Ukraine, so it's like Kiev time zone.

Yeah, okay.

I'm in Belarus. Yes. And you two are in Poland? Right. It's close to each other. All right.

And then the other Anastasia I haven't met before.

Yeah, please meet Anastasia, our designer. So last meet, she wasn't able to join us, but we had Vlad on board, so you've already met him. And today it's Anastasia. Both of them are working on website and product as well.

Cool. Hey, nice to meet you Anastasia.

Yeah, nice to see you. Yeah, so I guess we can start. We have this meeting. Yeah, created for like 30 minutes. So let's jump straight to it. Just a really brief context. Why are we all here today? Is that... Last call when we were discussing the design feedback a couple of questions popped regarding the design handoff and since Drew is Still onboarding as far as I understand and catching up with all the processes.

We decided to have this meeting to find a line on What are we preparing as designers and handing off to Fox reactive team and Thank you. you know, vice versa. So I would suggest me briefly describing how we worked and collaborated earlier and what is our usual flow. Probably Anastasia and Eugene can add something to that, any comments you'd like to add. And then, Drew, you said you have a lot of questions.

Maybe a couple of them would be answered as we speak. So, yeah. So actually we were discussing different breaking points and design system all this kind of questions so I would probably share with you one page we designed in collaboration with this Fox reactive team for another project just to briefly show you how how it looks like, how the design page looks like when we mark it as ready for dev. So probably.

It would be probably the best way to show. So, So, yeah. just ignore the names, ignore everything but the structure and I would probably start that For each page we're designing that is coming close to be finalized from the design perspective, we do prepare the responses. This is our 100% practice. We do prepare responses for tablet as well as for mobile versions. As long as you don't need a tablet one. We know that you would need all of them. So we would do desktop version, tablet version, and mobile version. The reason why you didn't see any of...

any of responsives for Rocket Resume website yet is that a lot of design processes are still in progress. And for instance, the only response that we have now is for a landing page because Steven wanted to see how the landing page would look like in mobile version. So as soon as we come to last round of feedback, let's say, make the responsives so you have it. Yeah, and if you have any questions as I speak, please go ahead and ask. That's what is related to the breakpoints and the responsive part.

Also, we do always leave some notes for the dev team as we We go block by block to different pages, specifically if it has any sort of animations or some movement needed to be added from the dev side, anything that is not 100% clear from the static form of design we have, we're leaving these nodes and then Guys are checking the developed page, our notes, and we are exchanging any sort of comments or feedback or something that is not clear in general.

So we can clarify that before we do the handoff. Okay. Yeah, and also regarding different buttons, different components, everything related to that, we also have our design system. We are enhancing it as we go and as we build the website moving forward. We are adding everything related to icons, color palette, typography, so different navigation things, different components. So everything developer team needs to just take and work on the designs.

or building it in a separate file. Anastasia, please go ahead. Yeah, I just wanted to comment on what happens on our side. If you can go back to the homepage. So once we get an approval for a specific page, we usually have some sort of mini planning meeting on our side where we go section by section. We look into details into the designs. We sometimes ask questions right here in Figma if something is unclear.

logic. So you, Drew, would also be tagged there. So for example, if one section has just content filling and the other one has a relation to existing page, so we might think that in advance and ask you questions, how you want to work with your content, what information should be global and shared and everything like that. So we go through the whole page, we give estimates, we plan how we will develop this page, and we stay in close touch with the design team.

any questions appear on the way and we usually share this estimate and plan with you try to fit into that and yeah just meet weekly to show you the progress after that Okay.

I have a question now.

Do you guys use dev mode? So I can see you've got this styling and everything down there, right? Yeah, that's what you do.

Every developer, tech lead included, have a dev seat which we use and which is built in the, sorry, which is included in the invoices. Yep.

Yeah, and just so we're confirming, so we're on the same page. specifically when I say dev mode in Figma, right? That allows you to click on components, get, everything from to border radius to everything, right?

Yeah, absolutely. Sometimes we ask the design team for exports, like separate files in better quality or without rounding and other effects, but yeah, we manage that internally. Usually everything works. Cool, cool. Um Yeah, that's more or less...

I'll let you guys continue. When you're done, if you're done, let me know because I'll...

Please go ahead with the questions. As I've said, the process is pretty much simple and I would say well played many times. So please go ahead.

Yeah, so that's cool. That's what I was hoping that you guys was... That Figma was really... big part of your workflow and you did utilize the dev tools and that you did provide you know, various breakpoint designs and stuff like that. So I think for me, it's going to be more about making sure that our, our, process collaboration and sort of how we all I think together is tight rather than worrying about Um, Figma, I don't have to worry about Figma, right?

I mean, and how we're going to, you know, transfer or be consistent with our design, right? There's going to be no issues there. It's really about sort of Um all the links between communicating between both teams and, and, um, communicating with me and Steve and Tariq and So let's see, I kind of jotted down a bunch of questions myself and I think I'll just refer to those. I might be able to share them.

Let's see.

Where are we? Stacia, did you have a question? Yeah, maybe while we were on the topic, I wanted to add one kind of process that we didn't mention yet. Once the development of a page on our site is complete, we now have a process in agreement with Habitat team to send the page first to them. So they do like quality assurance testing on their site to your team group and let you play with it. So we have this additional step of quality which should even improve the process.

Yeah, cool. So that's touching upon some of the things that I've... I thought about prior to the call. So let me, I think what I'll do is I'll just run through them verbally and then maybe it may make sense for me to dump this into like a, a Google doc or something and just so you guys can see it and make sure that we've covered everything off. But let me just start by reading through them. So I basically took the approach as I put my developer hat on and said, you know, what do I need as a developer?

And then the same for a designer. And then I did the same for stakeholders just to come up with trying to cover off the main things. Look, as we go, we'll iron out the finer details and that's not a problem, right? I think part of this whole process and now with me coming on board is to make sure that it becomes much more seamless and we move a lot quicker and we don't become bottlenecks for you. And on the flip side, we want to make sure that you guys understand clearly what it is that we are looking for so that there's no rework and all that sort of stuff right so So yeah, let's see from a developer's standpoint.

So yeah, okay, so one of the things that surfaced and is the ability to and the place where we're going to say, hey, dev team, this is is ready for dev. Right, so and I imagine there could be a full life cycle right where we have, you know, InDesign, in In dev review, which is optional where you require, designers require a dev feedback on feasibility around some sort of dynamic component, like you have the notes in Figma, you know, you might say, I want this to parallax and I want this to do X, Y and Z. And, you know, before it goes to...

I guess. I approve for Dev. Probably want to ask those questions beforehand. But I don't know, just sort of throwing that out there, that may be a different flow. But essentially, right, there's going to be like a... InDesign. ready for dev, in dev, Ready for review. That's kind of how I'm thinking, right? And so where does that live? Is that live in Trello? I know the dev team uses a Trello for managing stuff.

I don't know what Habitat does. Yeah. Is that a board that'sBye. teams look at but when I said both teams you know is it just product owners that look at it and manage that and then it goes to another board for actual implementation I don't know this is sort of questions I'm throwing out hopefully you understand where I'm going with that In terms of all the design tokens and the loading states and all this sort of responsive stuff, We've covered that off in Figma.

Halpy, now, Yeah, I mean, placeholder copy as opposed to actual copy. I'm not sure how we handle that. Let's see what else. Um... Yeah, so that's kind of, I guess the main thing to surface from the developers need that aside from all the Figma, which has been covered off pretty much everything is just that all. workflow. Do you have any thoughts on that now or is that something we...

Yeah, I mean, Julia, if I can explain both sides. So how it works now, and we are totally open to improvements if you wish. Usually Figma remains as the main source of truth for status because it just has all of the pages on this higher level. So design team has their own statuses like in design for approval, in client review, et cetera, can be named anything. But usually we get to the pages once they get status ready.

And this is when things get to our side. As you mentioned, we have a Trello board, but it's more granular. We work with sections rather than pages. So it's tiny tickets that take day two or so, while pages usually take week plus. And what we can add at what we currently don't have is not always. No, sorry. No, we do have. We do have sometimes. We can add statuses of pages once they're developed. So we go back to Figma and ask design team to mark the page as developed, completed, anything like that. Just one thing that since Figma is owned by the design team, any changes, even like changing a single word, a single status should be done on their side.

But usually that works in comments. I just say like, please mark this page as built and that's it. involved can see the status. It's usually very visual.

Okay, so yeah. So in terms of How does the dev team know that a design isn't readyFedev.

Well, I monitor the Slack channel always. I'm on all of the meetings so I know when the page is approved and also see the statuses. I also usually ask the design team to ping me in Figma with a comment that "see, this page is approved".

I think then I think we might want to tweak that right for visibility for me but Tariq and even Steve when he jumps on, right? It'll be too hard for us to keep track of, you know, in stack and fragments and stuff. I think it would be important to have... It's probably, I mean, I don't know if you do from a design standpoint. I know you have statuses, but is there somewhere that... I or Tariq or Steve can seeOh.

what needs to be done basically what's on deck you know what's to do what's in design and what's ready for dev or ready for approval? How does the design get sign off? I mean, Tariq's gonna sign off, right? Before something goes to dev? So where does all that happen?

So Tarek, just 50 cents from my side. Tarek is our main decision maker. When we speak about design pages and approvals, of course, he discusses it tightly with Steve and et cetera. But yeah, we're expecting approvals from him. And once we have the approval, I would let know Anastasia and also I will mark it in our chat. keep the track of things, you know, that this page has been approved and it's ready for that.

Ready to be developed. So far approvals happen verbally on the calls always. Yeah. It's never off the call. And so far we don't have any approval. Yeah.

Well, I think we need to track it just for visibility. So if we can give some thought to how we might want to do that, that could be in Slack, it could be a Canvas, it could be a list or whatever, maybe. Just throwing it out there. because we do need a place where we can see everything in a history as well.

So do I understand you correctly? You want a list of pages and every page should have a status. That's the level of details you want to have.

Well, basically you have, there's a scope, right? How do we, how do we measure, you know, where we're at, you know, in terms of fulfilling the scope, you know, the mandate that you guys are working on, right? Like, Um, We need to be able to grok that and see that really easily, right? We don't want to look through big scope documents and try and map off against staff. I think we just really need to have a really clear picture of like, where are we at with terms of meeting our objectives?

Break it down however you want, you know, but at least understand where we're at. You know what I mean? Yep.

Yep. Makes sense. Okay. Yeah. Yeah, I guess we can figure out it with Anastasia. Maybe just a single, you know, can be attached to our Slack channel would work. So everyone has an access to that. It's possible to mark all the statuses and also give the links to the pages. From my side, I just wanted to show you one thing real quick, because as far as I see right now, probably you haven't, you haven't received this document.

Yeah, so... Basically, when we kicked off the project, Our usual practice is to create project initiation document, some sort of one source of truth that you Something similar that Dev Team has shared with you, we do have the same thing that is related to design side. And in this particular document, we do share the timeline. Again, it has the timeline of how we move with the pages. from the design perspective, not with Dev. So it might be not that detailed overview as you're requiring, but just so you have that in mind and in hand as well.

I'm gonna share it real quick.

Yeah, so this actually contains all the necessary details regarding like how we work, who are the people in our team, and here comes the time So those are like our main priorities week by week in terms of deadlines. What are we doing? Where are we focusing? We tend to, you know, tweak it a little bit if the priorities are changing. um But more or less, the... Our every week's practice is to align on priorities and share shuffle the timeline if anything changes, but I don't understand your request on kind of see the process on both sides, design and developing teams. We will do that.

Yeah, let me know what you guys come up with. We can... chat about it and tweak it to get it where we want it to be. But I think you understand where I'm coming from. And if you have something else that covers that off, great. But I think we need something like that. Because it's kind of like we're going to have the same thing for development, right? We're going to have... I'm guessing, I haven't seen the Trello board yet, right? But we're going to have...

you know, pieces that we're working on and we're going to know what's need to be worked on, what's being worked on, what's, you know, what's completed, that sort of thing, right? So probably a similar thing for design is kind of what I'm thinking. Yeah. Um, Cool. All right. So if I put my designer's hat on and think about sort of what design needed so i have let's see um So the feasibility feedback on complex components.

Now you showed me that you add notes to designs in Figma and you get the feedback that way. So that's cool. Um... Let's see. So there's the whole Yeah, design review loop, right? What does that look like? So development team finishes a feature. It goes up on, say, staging. There's a preview deploy. What does the approval process look from there? Do you, Habitat, want to look at it before Tariq does? What do you have in mind there?

Yep, basically.

Yeah, cool. All right. So there is a mechanism for you development community commanding back to design, say, hey, guys, we need to check that out and give us feedback or give us the okay. And once design gives the okay, then there needs to be that mechanism that goes to Tariq, right? So... perhaps You know, that's where that thing we just talked about, some sort of place that says, hey, this is ready for review, and it goes there.

I'll let you guys come back to me on how that all comes together, but that would be part of the, I think, something that needs to be outlined, right, is that you guys have your process, but how does Tariq or how does Steve... sign off and know what needs to be reviewed and sign off. I know we can post messages in Slack and everything, but I don't think that's the right place. It gets fragmented and it's not a source of truth. You know what I mean?

Yeah, that makes sense. So usually how it happens for us, as we mentioned, designs get approved on the calls as well as our work gets approved on the calls, on the demo calls that we have weekly. This is where we show you the details of working with the CMS, some specifics of implementation, teach you how to do things. things there in the CMS. And this is where it's an easier and faster place to ask questions and get answers. And then you can take away testing those pages as an action item.

And if anything, come back to us with change requests or some comments or some bugs if you find those. So again, this is something that happens on the calls. But if we need something awkward, all totally can do that in this scope backlog that we will create.

Yeah, so yeah, so you've mentioned it a couple of times and it's a good point is that... There's the ongoing weekly calls, right? Yep. And... After each call, from what I've seen, you guys provide a summary of the call and that's usually done in Slack or is it different for both teams? I know... I don't know if that's the plan. Both teams would summarize the call and the to-do items and what's been agreed to In Slack, is that right?

And that at the moment gets updated weekly?

What you saw in Slack so far, they are follow-ups specifically from a weekly design meeting as requested by Tariq. He wanted to have a single meeting follow-up with very detailed overview of what we've discussed and what comments were added to, first of all, have track of things. been able to review the comments being made after a day or two and if there is anything to change before we did it from our design perspective so he can point out that.

So this is how it works for us.

I think that's a good approach, but Anastasia, I don't know. Do you follow the same approach? Have we had a meeting?

Yeah, almost the same. So the only difference that Julia uses the channel and I use a separate canvas, so everything is one place. So it's usually combined agenda with the follow-up. I just update it through the call as we go. I list action items there and you always have a canvas See what's what was done was not I always check the status of it mark the Done items and you have a like short list of all of the calls that happened I don't write much there.

So if we need Like all of the decisions that were made and that it can be separately there I usually have like themes topics questions we discussed Action items and priorities that we are working on next I mean, I can adjust to any format you wish. That's just what worked for us so far.

Yeah, yeah, cool. I do see that. Yeah. So, yes, I remember now you have the canvas and you have the... in line. I start, yeah, okay. Well, the practice of doing that after meeting is great. We should keep doing that. My only thing is that I'm thinking So, yes, so we could get approvals, right, on things on the call and this could be, hey, this is the approval. The only thing that... doesn't happen is that these are not artefacts that are long-lived, right? They kind of get...

Wow. Anastasia, yours get written over so we don't have a history.

No, if you scroll down, you have... the every week's event. I mean, we just had only one of them so far. It was me.

Okay. I was going to say I already see one, but that was only one. Okay. So the plan is to make pain.

There isn't.

Okay. Okay. Good. Good. So then I think that's a good spot for now. That may be the place, right? Or maybe... Let's see how it works, right? See if that solves the issue of I don't know if it solves the issue of actually seeing a really clean, quick view of where we're at, but it's certainly a great tool to do.

That's the follow-up, the meeting notes. It's not the backlog. It shows the highest priority is questions that were answered and outstanding action items, but it's not a backlog. It should be something separate.

Yeah, cool, cool. Yeah, so that practice is great. But, um... And we can, if we need to talk about them as well, right, we can just link them in the comments and have a thread as well. That way we can sort of keep the channel nice and clean as well. Yeah. Um, All right. So... Just looking at the rest of my... notes. Yeah. Yeah, so shared docs and stuff. The moment you guys are just sharing with me individually, that's fine for now.

Let's see, in terms of... Okay, so I have this kind of what I call the seam which brings everything together. I think we've already cut them off, right? So it was the... Shared ticketing visibility. So we know we are going to have Trello for development. That's cool. Whatever design comes up with,We've already talked about that, right? They need to have some sort of, Yep, so that's cool. Whether you do it in trailer or not, I leave it all up to you.

Okay. Let's see defined marker handoff. Yeah, we've talked about that.

Can I quickly ask if you currently see the work of the two developers on your side, Gabriel and Ivan, and where do they track their work?

Yeah, we don't have anything formal at the moment. That's kind of part of my role, right, is to come in and sort of have a look and say, all right, well, what do we need to make a bit more formal? Certainly don't want to be too formal. We just want to move quick, but we certainly... need something a bit better than we have at the moment. So we don't have a ticketing system that we rely on Really, I mean, I know they use GitHub issues and stuff, but it kind of not really adhered to much, right?

I mean, GitHub has projects. It's just less complex and more simple compared to even Trello. Yeah, yeah.

So yeah, so I'm still having to think about sort of how we wanna approach this. So one of the things that,It. that I'm looking to do is... come in and help transform or Yeah, transform was probably the right way to say it is. the organization into a AI native, Company? Right, and that's really sort of That means a lot of things, right? But one of the things it means is understanding how to manageI'll basically what we're doing and that's, you know, Basically, in my mind, it's creating artifacts, right?

So a ticketing system really doesn't need to... It's kind of, I think... It's evolving. You don't need a ticketing system per se if you have a process in place internally that you essentially are using Markdown to create artifacts. And then these artifacts then become history, right? And your agents and stuff have access to everything they need to know. And so I'm thinking about creating a ticketing system that's essentially and artifacts that's actually checked into GitHub.

Um, But anyway, that's just kind of a long story to sort of say, hey, I'm thinking about how we're going to do managing ticketing and workflow and all sorts of stuff. And... We haven't landed on anything yet. So, yeah.

Sorry, just one comment. We're doing the same on our side with Focus Reactive, agency-wise. All the projects, all the case studies, everything, all chat histories from the Slack and technical proposals. And we're trying to build the knowledge base that you can ask questions and get answers on the agency level. And we are considering now to use an Obsidian, like you said. It's something like artifacts that you place in somewhere in GitHub.

The cron job that just like clean up them because there is too much information that compress and put into the kind of database that is mostly GitHub. And yeah, sounds like the similar what we're trying to do internally as well. That's very useful nowadays because there's too many projects, too many information that like it's in different places. It's nothing that you can check in one place and get the full understanding of the project.

So yeah, thank you, Juvo, for getting on board.

going to be very helpful yeah no worries well we'll i think we'll end up talking a lot more about this because it's something i want to implement with ship through right so um So yeah, we'll end up talking about more. We can share our knowledge about sort of best practices and kind of think through how we can manage it, you know. Yeah, it's really interesting. I've done a lot of thought into it. I'm sure you have as well. So yeah, I look forward to chatting more about that.

Cool, so yeah, so to answer your question, yeah, nothing yet, but hopefully something, you know, really cool and and and AI native moving forward. So yeah. All right, so back to this. So yeah, I know we're, I'm conscious of time, so we shouldn't be much longer. Let's see, feedback over time. All right, just from a stakeholders needs, we talked about that visibility, I imagine For the moment, we could probably use for on the development side, the Trello board would be the visibility for any stakeholder, right? And then whatever you come up with from a design standpoint would be that visibility for stakeholders.

Weekly calls we have, we discuss things and make decisions on the call and we have a summary and blah, blah, blah, we talk about that. Cool. Yeah, and so one of the things to just to consider is that the goal is to To free you guys up a lot more, I know in the past, well, I feel like in the past it's been hard for you guys to move as fast as you want because you're waiting on information from us. And so the goal is to mitigate that so that you have what you need, but also on the flip side, not also require me or Steve or Tariq to have to look and sign off on everything, right?

So if we get the right process in place and identify the right people making the decisions, then we, I think we can achieve that. So that's kind of the overarching goal for me as well. Yeah.

Can I just quickly clarify? So do I understand correctly that Tariq remains the main decision maker for the design team, you is ours and where does Steve sit in this? Like does he approve everything or how?

Um. No, well, I can't speak for Tariq. I'm pretty sure that it's the same case for he and I is that Steve is going to defer to us, right? But that's because... Tariq is talking to Steve and I'm talking to Steve. We are on the same page, right? So again, you know, The visibility I'm asking for you guys is the same visibility I provide to Steve, right? So you guys are providing with... Trello or whatever else so he can see what's going on, you know, but I'll have another system where I'm giving him information about other things, right?

So it, it, And basically he knows what's going on and he's assured that we understand his vision because we've already communicated it back to him and so therefore he can defer to us to make decisions. Anything that we think we need his...

feedback on then we'll go directly to him right so okay yeah i'm just I'm thinking of a use case. So let's say we have our weekly calls and we plan the work that's like next week and something further. And we come back with your questions and proposals. And let's say, I don't know, we take an investigator's pike for a search solution. We come up with a few ideas. We come to you on our weekly call to discuss search.

decision then happens on the call by you or you still take this away discuss with steve and only give us your answer like next day or in a week or so Well, so that's a good point.

One thing I think that I did note it down and I was just skimming it quickly, but one of the key things I have down is that We want to make this seamless, right? So that also means us answering any of your questions. Um, It would be good to give us as much head up as possible on the questions, right, to give us time to come back to you. So that would be a good use case where if you came to me and I wasn't sure, I would say, guys, I'll get back to you, right? And I might go to Steve or I might do my own research. Okay.

Now, that being said, Steve will jump on the call in and out. It's kind of probably what he's been doing anyway, right? now that we're tweaking the times to be more friendly to you and I he'll probably less likely to jump on the call because they won't be friendly to him but he's told me you know that's fine you guys work out what's good for you and I think that also tells you where his mind sets at right is that if he wanted to be on every call making every decision it would be time suitable for him right so yeah Thanks.

Yeah, yeah. Cool. All right. So the last thing for me, unless there's something else for you guys, is just to come up with a new timing for the– I know, you know, that that will solve the request that I can't remember who made, you know, that they were too close together and, and, you know, they backed up on each other. Um, so I thought maybe the habitat call could stay where it is being that Tariq is the primary, right? So that can stay in a time that works for him and you.

Um, My intention would be to not necessarily jump on that call every time. Right. I would probably just follow the summaries and chime in where I was needed. You guys would either ping me as a to-do or give me a heads up that I should join the call. Of course. Yeah, ideally, you know.

Wait, is it like 1 a.m. for you? Yeah. Isn't it? You should sleep at time.

Yes, I'd rather not jump on if I didn't have to.

No, you don't. If we'll need something from you, we'll just invite you beforehand.

And again, with the whole sort of give us enough heads up, right, if it's something that requires sort of, you know, Tariq to come to me, maybe it's an architectural decision as well as a design decision, then... He and I can have that conversation at another time, right? And then... provide you with what you needed. But anyway, I can jump on the call anytime. It's not a big deal, but I'm kind of deferring that to Tariq where possible and then we'll change the call of the dev call toA bit of time for us.

Okay, so how does Thursdays 6 p.m. Work for you.

Thursday at Did you say Thursday at 6pm? Yep. So what do we have now?

one and a half hour earlier than today. or 6.30pm or a seven I just don't know what your working hours are.

Well, I would say the earlier the better for me because I start at 5 a.m. and I'll finish at, say, 3 p.m. So... I mean, you know, a lot of times I'll be working, you know, until five anyway. But so closer to five is better than seven, if that makes sense. You know what I mean?

Yeah.

I don't know what time it is for you guys. What's six o'clock PM my time for you?

Six is 10 for you, Jen, 11 for me.

All right. Are you able to do earlier? Do you guys start late over there, do you?

Usually, yes. So if 9 a.m. works for you, Jen, that could be 5 p.m. your time.

Yeah, I mean, if it works for you, it's better for me.

Yep. Eugene is not in, so yeah.

Are you sure, Eugene? Am I messing with your sleep in time?

No, no. 9am is okay. That's absolutely okay.

Okay. All right. So that would be... 5:00 PM my time on Thursdays, is that right?

Yeah, yeah. And can it be 45 to 60 minutes? I'm just not, I don't want to rush to fit everything into it.

Yeah, yeah, yeah.

Good. So then let's also use this time slot for the upcoming meeting instead of tomorrow, right?

Yeah, do we even have a meeting tomorrow?

Yeah, we have it scheduled, but it's not owned by me. So we will cancel this series and I'll create one starting from Thursday, April 16th.

All right, just to confirm though, I've got on my calendar a 12.30am ship crew and FR weekly sync.

Yeah, that's the one I'll cancel. It's owned by another person as it was started before I joined the project.

Okay, sorry, just because it's 12.30am for me, it's actually saying Thursday, but you're saying it's tomorrow because it's tomorrow for you.

Yeah, yeah.

Yeah, cool. You'll cancel that one and then... The meeting will be Thursday for me and for you. Is that right? Yeah. Is it more of a new Thursday afternoon for me?

Yes, yes. You're ahead of us. It's still Thursday for you and it's morning for us. Yes, yes, that's right. That was time.

It'll make it easy for us to say, hey, I'll chat next Thursday and not confuse each other. Yeah. Thank you. All right, so I'll let you do that. That's great. Thank you. So, yeah, so we'll have that meeting tomorrow. this week at that time, that's cool. And yeah, I don't know. I'll talk to Tariq. I mean, do you have any reason that I should be on this call? Oh, what do you think, Yulia?

I think I should sleep now. But yeah, from why my hand is raised, just because I figured out that last call we talked about some issues I don't want to call this restrictions, but Let's say requirements from the dev side that might be that we as a designer team should take into account. What I mean by that is, for instance, have the same margins all over the website and reuse the blogs, etc. That was Steve's request from last time we talked.

If you can gather in one place all that type of requests, like by talking to Tariq and Steve, you can just follow up with me on this one. You can just drop it in Slack channel or share whatever source you'd like. It'll help us to align earlier, you know, before we plan different pages. Yeah, at the beginning when we kicked off, we didn't really have this. requirements. So we just create it as we see it.

But as time flies, we get more and more different comments on this one that we should keep the margins same and different kind of stuff. If you can gather these details in one place, that would be helpful.

All right, now I'm just looking at your meeting summary that you posted in the chat. Does it touch upon what you need in there or...?

I would say this is the general request. It touches all the pages that have been already designed. I didn't include this specific request in this follow-up, but we checked in with the design team internally. So we would take that in mind starting this week. But as we move forward, if you can... you know, node, any other requests. that you might have regarding Dev Restrictions to Design Team, please do share. Okay.

Yes, so. Well, let me just... So the other guys don't have to stay on the call. Are we... Good guys. I mean, you're welcome to send a call. I just have a few more questions for you. Yeah, that's all. Yeah, so just to clarify, I remember the conversation was about aligning the margins on all the pages and stuff just for consistency. I don't know if that's– why is that a dev concern though? Why do you see that as a dev concern?

Yeah.

'Cause, Except for this comment on margins, there were also requests regarding the... Okay, bye-bye, guys.