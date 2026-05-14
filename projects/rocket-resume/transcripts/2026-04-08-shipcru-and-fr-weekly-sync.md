# ShipCru & FR - weekly sync

Date: April 8, 2026   (GMT+2)
External: mailto:ivan@rocket-resume.com, mailto:steve@rocket-resume.com, mailto:tariq@rocket-resume.com, mailto:gabriel@rocket-resume.com, mailto:drew@shipcru.com, mailto:steve@shipcru.com
Participants: mailto:eugene@gitnation.org, mailto:denis.urban@focusreactive.com, mailto:aleksei@gitnation.org, mailto:anastasiya@focusreactive.com, mailto:pavel.khurs@fr.team
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Drew to get access to Figma
- [ ]  Drew to discuss with Steve whether to proceed with Untitled UI or wait for Habitat designs for the release
- [ ]  Team to share internal Notion documentation with Drew for project context
- [ ]  Team to create infrastructure documentation for Cloudflare setup
- [ ]  Team to ask Steve in Slack about ShipCrew repository being public (should be private)
- [ ]  Team to confirm with Steve in Slack about blog migration timeline (before or after release)
- [ ]  Gabriel and Ivan to help clarify data migration questions in Slack
- [ ]  Team to create Trello board and invite Drew and others
- [ ]  Drew to reschedule future calls to 45-60 minutes
- [ ]  Eugene to share project documentation after the call
- [ ]  Drew to discuss repository status and open questions with Steve in daily call

### Development Progress Update

- Migration to Cloudflare completed - all workers and storage moved to Steve's designated space
- Header reimplementation in progress by Pavel to match old website styling for seamless transition
- Authentication and hero pages to be implemented with Untitled UI over the next two weeks
- Team working in parallel with design team, not blocked as they're using Untitled UI library rather than waiting for final designs

### Drew's Onboarding

- Drew recently joined (couple of days ago) and is still gathering information and getting up to speed
- Currently has access to project initiation doc and files in Slack channel, but needs Figma access
- Drew's role will be to help team move quickly and reduce dependency on Steve for approvals and access
- Drew has daily calls with Steve and will be able to answer questions once fully onboarded
- Drew typically comes online around noon San Francisco time

### Critical Design Decision Needed

- Team needs confirmation from Steve on whether to release with Untitled UI components or wait for final Habitat designs
- This decision significantly impacts timeline: releasing with Untitled UI means weeks, waiting for Habitat means about a month as all sections would need reimplementation
- Steve previously indicated it was acceptable to release with Untitled UI, but team wants to double-check

### Data Migration Questions

- Steve shared job titles and industries data dumps, but team has questions about the data
- Job titles dataset has 77k more entries than Taxonomy API and lacks relations with other content like skills
- Denise previously used Taxonomy API for migration, which had more complete relationships
- Gabriel and Ivan confirmed both datasets (new architecture taxonomy and old) contain same content in different schema
- Team can proceed using Taxonomy API with existing script from Denise
- Gabriel and Ivan offered to help verify production data and compare results using existing scripts

### Better Auth Migration Status

- Gabriel and Ivan's team is finishing Better Auth integration and data migration
- Migration includes move from MySQL to CockroachDB with multi-region support
- Also migrating from Prisma 1 to Drizzle ORM
- Expected deployment this week or maximum next week
- This is for current Rocket Resume production site
- After migration, Gabriel and Ivan will have more capacity to help the team

### Repository and Infrastructure

- ShipCrew repository is currently public, which team believes is unintentional and should be private
- Repository was created by Steve about a month ago for the new production website
- Team has access to Glass repository which contains all production pages and serves as reference
- Steve created separate ShipCrew repo to use new technologies without blocking the monorepo

### Release Planning

- Main priority is preparing for release by making MVP production-ready
- Release will use smart routing to serve some pages from new project and others from old website
- Team needs to determine which pages stay on old website (likely resume builder, account area) and which migrate to new site
- Steve wants release "as soon as possible" but no strict deadline set
- Remaining work for release: data migration, UI tweaks, and routing decisions

### Blog Migration

- Team needs confirmation from Steve whether blog should be migrated before release
- Blog content is mostly markdown without complex blocks, making migration relatively straightforward

### Process Improvements

- Team identified that Steve being the bottleneck for approvals is slowing progress
- Goal is to shift to team making decisions independently with Steve providing initial context
- Drew's role will help address this by being able to answer questions and provide approvals
- Team encouraged to use Slack for quick questions rather than waiting for weekly meetings

### Meeting Logistics

- Future calls will be extended to 45-60 minutes to allow more time for discussion
- Drew will take ownership of scheduling future meetings
- Team maintains Dev Team Weekly Sync Agenda in channel for tracking outstanding action items
- Team uses Trello for backlog management and will share access with Drew and others

Notes

Transcript

I believe so.

Um, Because I saw two of his emails in the invite and one was denied, another didn't answer at all, so I wasn't sure.

I thought he was, yeah, but I can't confirm 100%. Okay.

Hello everyone, nice to see you.

Hello, good morning. Good morning everyone.

Ivan, Gabriel, do you know if Steve is joining us today? Thank you.

I don't know. Okay. Yeah, I'll ping him. Let me double check too.

Okay, please do.

Not sure if he is joining, maybe in some minutes. Okay.

I mean, we can start if anything. Yeah, we will see. So good, let us introduce ourselves once again, almost in person. So I'll be this project's project manager and Pavel is our developer who will be doing the job and you already met Eugene multiple times, so he is our tech lead. Right, so I hope you can see my screen. We have some development update for you and a couple of most urgent critical questions to discuss. Probably let's start with a quick update and then most of the time we will spend on questions. So you, John, you want to give the update?

Yeah, so I'm not going to show you anything, like no screen share, just explain what we've done for this week. We previously, like Denise, set up everything on our Cloudflare space. all the workers, all storages. So we moved this to the space Steve created for us. So now everything is there, everything is working. And now the next huge step that we, as we discussed previously, is going to be the data migration. Steve shared with us the files, the bumps, but I have some questions about them probably later.

Probably someone from your team can help us to understand, but yeah, that's just for later. So the next step is going to be like data migration. Then Pavel works on the header. We're going to like re-implement this header in a new project, but it's mimic the same style. So when we will shift in from the old new website, it's going to be at least header will be the same and give the feel like you are on the same site.

The pages itself are going to be implemented with untitled UI, so the hero and authentication tracking is three points. We're going to work this and next week. Yeah, something like this. Yeah, and actually, can I ask Drew, like, if the Steve passed you all the context about the project, next steps, what we decided, all the decisions we made on the previous calls, etc. Or do you need any overview from our side?

Yeah, I know I don't have a lot of context yet. It's only been a couple of days for me. So I'm just gathering information and sort of just onboarding, you know, getting systems up and running. So I will need, and that was gonna be one of my questions is if you guys have any maybe documentation that you can pop me to that would give me the information and then perhaps I could then ask follow-up questions after reading that, but I don't know if you might suggest a different approach.

I know I see some files in the Slack channel.

important links and files and I don't have access to Figma, so I'll have to get access to Figma. And, the The only other file aside from the time report is the project initiation doc. that I had a look at, but it doesn't seem to give me a lot of detail. It seems like I really need access to Figma.

Can you try this link? It should be without any additional accesses. Let's see.

So for now, the design team-Sorry, the link-oh, the same link is what you're saying.

Just one I sent to the channel.

On the channel? Okay. Yep.

While you're opening it, so we are working in parallel with design team. We are not really blocked by them because we are not doing any of their designs. We are working with Untitled UI for the moment and that's actually one of our main questions for the release plan whether we are going with Untitled UI or waiting for these designs. So that's probably an action item for you Drew to take away and discuss with Steve. Cool.

Yeah, you, yeah, great. You're adding that. Cool. Regarding the documentation, we actually have a document like our internal where we capture all the Yeah, we captured all the questions, all what Steve mentioned, the plan, the tickets we're going to take, not before release, but mostly after. So we tried to collect everything in one Notion document. I think we can share it with you. It'll probably give you a context of all our previous calls, everything that we discussed and open questions that we still have.

The Our main focus now is to prepare everything to the release because Steve said that, okay, we have a lot of things to do. Actually, a lot of future features that we'd like to implement, they're complex, they're going to take a lot of time, and they're not clear. I mean, we should propose the solutions, the ideas, how they can be implemented. But now, although they're not relevant, we are now preparing to the release.

So we need to migrate data, prepare, make the MVP, created on previous phases, make it production ready and we will have the old and new website hosting separately but just with the smart routers that will navigate to one page, a new project or on another project. It depends on what pages we'd like to serve from the MVP versus from the old website. So yeah, that's our main priority now but we don't have any strict lines from Steve. He said, as soon as possible. And so now we are very focused on that.

There are just actually not so many things we really need to implement to make this possible. One is data migration that I almost done. I just need a bit of clarification probably from Gabriel or Ivan about the data that Steve shared with us. Also some UI tweaks that Pavel covered. And we need to know in terms of routing, what pages should stay on the old website. We understand that it should be like resume builder and account area, all the pages in account, probably some pages that we missed as well. So if probably we'd like to ask this to Steve at like how he sees what should stay on the old website, because we don't really understand like, you know, this separation. Yeah.

So that's just like current, focus and what we are working on right now. We'll share with you docs. I think it will help you to onboard all that stuff. And we will create another one, probably like infrastructure documentation, because we'll set up a lot of things on Cloudflare. I think we should capture this somewhere as well, so you will be aware of all that stuff, all the services we use there as well.

Yeah, and Anastasia mentioned one big question that we have. As far as I remember, Steve said, okay, we are okay to release with untitled UI components, not the final design from Habitat team, but with this UI library. But we should double check, is it what he'd like to do or not? Because if we will need to wait until Habitat, it's like another story, we will need to reimplement all the section and stuff.

from ground up and it means that release will be like in a month, not in weeks. So yeah, that's the hugest open question that we have. Yeah, okay.

There are a few smaller things that we can probably discuss now. One confusing thing: I wanted to understand if the repository for ShipCrew is public on purpose or is it a mistake?

Um, Yeah, I don't know. When you say the repo and ship crew...

Uh,What was it?

I need to have my coffee. All right. Guys, can you share the link?

Yeah, so I'll make it up. I do see a ShipCrew repo. Yep. Um, There's nothing in there, right? Let's see. Oh, there is something. Okay. So yeah, I don't know anything about the repo.

It looks like it was just initialized a month ago. Yeah, that's the one where we are supposed to work.

Yeah, it's something that Steve created for us. So there is our, what we called MVP, but now it's going to be the production website, the new website. But yeah, we just noticed that it's like public repository. It's most likely shouldn't be public, but yeah.

Yeah, yeah.

Yeah, I would agree. Yeah, and I don't know Steve's intentions fully around this repo.

Again, something I need to have a chat with him about.

We can write this in Slack.

Sorry, go ahead.

No, no, I just thought that we probably just need to rise this in the slack because it's often happened that no one knows what Steve meant and we need input from him. That's something we're going to change. And he said himself that he shouldn't be the bottleneck in our practices. We should get all the content from Steve and make the decisions ourselves, like with everyone who is now joining this meeting mostly.

And that's a huge goal because now it's pretty, slow, you know, all the decisions we cannot like, you know, to approve everything, don't have access to this sometimes. So it's something we would like to like rework or change.

Yeah, and that'll be part of my role, right, is to free you guys up. And so that's, me understanding getting on the same page as Steve and getting up to speed and then I'll be able to answer your questions and help you guys move really quickly. So unfortunately right now I'm still not quite up to speed so you have to bear with us a bit longer. But yeah, I can certainly get information to these things today for you.

Yeah, that's absolutely fine. Take your time. We're just outlining the most important questions so you know what to focus on. Good. Maybe guys, Gabriel, Ivan, you can give us updates on your book because some of it is blocking us from the creation at all. Yeah, I can start, I can say the things that I understand about the project and still intentions from the repo and similar things.

So we have these glass repository that belongs to Rocket Resume with all the production pages and the applications and that's the reference, right?

We used to get the content or actually I see that the migration, that's the place where we, We are going to see and share with you like any access or any data or any pages like the questions you have on which pages we should port over to the side you guys are building the developers and In general, I think this ship crew repository is a new repo Yeah, definitely should be private in my opinion, but also It's because Steve wants like to use these new technologies or don't be a blocker on creating a new application in our monorepo sometimes cause issues.

So on that side, I will say that's easy on us to also help you. If you send us some Slack messages, we can pretty fast help you on those things. And we are open to help you on these small challenges. configurations or even like the data out or data migration. So about specifically about this project, my understanding is that we're using all these things these new things apart from the repo. Yeah, we are working on some other things on our side.

It's obvious, but... Yeah, what else? Let me... Thank you. Um... So yeah, I will say only that, that if you guys contact us in Slack, we can help with Gabriel also on the better outing. Yeah, sure.

I think it's the right way. Just being in Slack, not wait for this meeting. Yeah, I agree with you. So Better House is just here because the question, as far as I remember, Steve mentioned that you are kind of in process of integrating Better House on your side and we shouldn't do anything with it. We should wait for you and then receive some updates or something like this. But it's How I remember this...

Is it sounds like a truth or like...

Yeah, actually, that project, I think we're almost over with that. We're finishing data migration and we are probably going to deploy soon. So yeah, that's the answer. What do you think, Ivan, probably this week? Maybe next. Yeah, I would say maximum next week. Actually, we just finished migrating the data and we are just planning the last steps on that to deploy. It will be today and tomorrow, actually.

But we have that in the master branch and everything up to date on the GlassWrapper you also have access. Yeah.

Briefly, what have you done, guys? Is it like data migration or like you reshaped, I don't know, something under the hood? What that was?

Yes, so we are now using CockroachDB. So we have multi regions and we've been working on moving two main technologies on the backend side. Prisma 1 which was old to Drizzle and MySQL to CockroachDB. So yeah, and we built everything to migrate those not only the technologies, but every part of the code of the full application to make it work now with the new database. So... Yeah, that's our current status.

Just about to deploy the application with the new code. And we also port over some authentication service we have that now we use better out.

Yeah, sounds like a huge release. So it's something like for current Rocket Resume production sites, right? Yeah. Okay. I think it's the right time to drop a question regarding data immigration. Steve shared two things: job titles and industries. Previously, when Denise migrated the data, it used Taxonomy API, and there is much more relations with other stuff, like skills, etc., etc., but here we have only job titles in industries, and job titles number much higher than it is in Taxonomy API.

It's like 77k more job titles, and they don't have relations with another content and entries. So I can migrate those, but it doesn't feel kind of right for me. It looks for me like some job titles won't have any relations with other stuff. I just don't understand what data he takes from which place and what is right to do to make this production-ready setup for payload CMS. If you can help us, it would be great.

Yeah, sure. I think we are on the same page there because to be honest, I haven't reviewed it. The files that Steve sent you about the content. And it's possible that some of those records, as you found out, have a different status than published or even, like you said, doesn't have relations with any other tables. So, when I do that, we can help check what's the production data on the current database and compare the results.

I know that we have a script that will take us less time because we did something similar in the past.

Yeah, that sounds cool. It's going to be like... If you can, I don't know, what is taxonomy API? Is it something you're going to replace? Or, I mean, do you have like two places now? It's like old SQL database. Is this like connected to taxonomy APIs that we used for like previously? And the new database with much more job title, something like this?

Yeah, both match right now. Since the last time we used this new architecture, which is taxonomy, is using the same content, just in a different schema. But it is the same exact content. So yeah, in our end, it wouldn't matter if we choose one or the other. Okay.

Yeah, so if I can use taxonomy, it would be easier because Denise already created a script that takes the data from it. I just thought that probably the data Steve shared with us is more like, relevant new or something like this but if you tell it's okay to take this from taxonomy it would be like easier for our site otherwise if you can if if it's yeah that's true like i we can do this right okay so no questions yeah in this case cool yeah um Yep.

So regarding the question of untitled UI versus waiting for Habitat designs, I think we just need to drop this in Slack for Steve. Another one for block. Yeah, we discussed the block with Steve on our initial calls. It was far past, but now we need to know if the block is something we're going to migrate before the release or not. Seems it's quite not complicated job. We just need, again, it's mostly markdown, as he explained.

There is nothing like difficult, complex blocks inside this rich text field. It should be pretty easy for us. I just had a question to double check with Steve to be sure, like, okay, we will take this and migrate all this data into the PLO CMS. So something that probably we also have to send in Slack mentioning him because I believe no one can approve this or or something like this. Um... Yeah, and regarding the list, Yuvan mentioned that you can help us to understand what we're going to migrate, what is not. I mean, in terms of pages.

Bye. I think... Yeah, we just... Yeah, sorry.

Yeah, no, sure. Yeah, Gabriel and I, Gabriel is the expert on BetterOut, and he also knows the application well, so I think we can jump in in Slack and help you. Cool. Yeah, we hope we are with less workload after the migration. It's pretty soon, but yeah.

I understand, okay, sure. Um... Yeah.

Should we have a common backlog with the guys or we can create our own? We usually do it in Trello and share access with you. What's... What's the best way for you?

Yeah, look, I mean, I'm still getting up to speed.

I would suggest the quickest would be for now would be for you guys to follow your approach.

And I heard that was to create a Trello board and invite us to that. Is that right?

Yep, yep, that's it. Yep, let's do that. And if we need to change it at some point, then we can discuss that, but let's not. Hold things up Okay, nice.

And can we, should we reschedule these calls? I think we need more time for the future, when everyone has more context. 45 to 60 minutes. You can share with me your time slots and we'll find something. And I'll also be owning the meetings as it's created by Alexey, but I'll recreate from my account.

Yeah, cool. That'd be great. I mean, certainly the The timing, if we can tweak that, it'd be good.

Okay, so just send me the text. Yeah. Nice. Good. Any questions you have?

No, just confirming.

So are you guys in fact going, yeah, you guys are gonna share a doc with me. Is that right? Yeah, okay. Just anything to help me get up to speed ASAP. I have a daily call with Steve anyway, Right, so and Tariq and you know and once you know Ivan and Gabriel um get through the migration, you know, I'll be pinging them a lot more as well to pick their brains and get up to speed as well. So, So just bear with me if you can.

We'll get up to speed as soon as possible. But any information you can provide me, that's already been discussed. will be obviously super helpful. Yeah, sure.

No problem. So I'll have this list that's in our channel here in a tab, Dev Team Weekly Sync Agenda, everything outstanding action items will be here and right after the call, Eugene will share a documentation we have with all of the context.

Yeah, cool. No worries. And then so,Yeah, just so you guys understand my timing is, I usually will come online around noon, San Francisco time. Mm-hmm. Um. So, you know, my plan now is to... It's pretty much just to jump on the call, you know, do what we've done and then go back and get some sleep before I get up and start my day. So is there anything super pressing right now that you need from me before I get, you know, Start my day.

Nothing right now. No, this can wait a day or two.

Yeah, because when I start my day, one of the first things I'll do is have a call with Steve and you know what I mean? So I'll be able to start answering some of these questions. So if having access to the repo is not a major issue right now, I mean, certainly agree it should be private, but I just don't know if that repo is the right repo, right? We might want to create a different repo. Okay. Things like that. You know what I mean? So, yeah.

So if you guys can wait till then, then that's the plan. Yeah. Just blocking us. We have our work to do. We just want to align on the next steps. So take your time. No rush. If anything is urgent, we drop a message in the channel. Thank you. Amazing. Nice. So thanks everyone for your time. Let's stay in touch. If anything, we have our channel. See you there.

Thank you, guys. Nice to meet you all. Nice to meet you. Bye. All right. Bye-bye.