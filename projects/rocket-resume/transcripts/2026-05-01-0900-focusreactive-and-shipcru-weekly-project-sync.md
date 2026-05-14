# FocusReactive & ShipCru: Weekly Project Sync

Bot ID: d5643152
Date: May 1, 2026 9:00 AM (GMT+2)
Duration: 42
External: mailto:drew@shipcru.com, mailto:steve@shipcru.com
Language: en
Participants: mailto:eugene@gitnation.org, mailto:pavel.khurs@fr.team, mailto:anastasiya@gitnation.org
Provider: gladia_v2_async
Summary: Weekly project sync with Drew (ShipCru). Drew gave context on the Cockroach DB migration aftermath — late-night migration revealed exceptions only when traffic ramped, ongoing region-coordination work needed. Eugene walked through CI status (PR-scoped Neon branches with auto-applied migrations on merge) and the first-release plan: About + Legal + Footer pages on the redesigned Habitat-Untitled-UI hybrid, with the design-system extension pattern explained at length. Pavel covered analytics scope reduction (no heatmaps/session-replay yet) and the Resume Builder phasing proposal. Agreed on Friday standing slot, target end-of-following-week for go-live with rollout plan from Eugene.
Topics: Rocket Resume,Architecture,Process
Type: External

[00:09] Pavel Khurs: Prerodha.

[00:52] Eugene Boruhov: Hello.

[00:58] Drew Henry: I don't

[00:58] Anastasiya Sokolova: yeah how

[01:02] Anastasiya Sokolova: are you

[01:08] Anastasiya Sokolova: oh

[01:05] Drew Henry: want to say it, but I'm tired again. Every time you go to the university, I'm tired, but it's been a tough week.

[01:13] Anastasiya Sokolova: um i see

[01:14] Drew Henry: Yeah. Just, yeah, we've migrated the DB, so that always is, you know, a lot of work.

[01:21] Anastasiya Sokolova: yeah

[01:21] Drew Henry: Yeah, yeah. So, yeah, so we just... coming out the other side and designing out some of the issues so yeah hasn't been a lot of sleep

[01:32] Anastasiya Sokolova: sure

[01:35] Eugene Boruhov: Yeah, I saw, I saw. I mean, how critical it is. it feels like you are just fixing one after another and trying to reveal new one right so um is it's it doesn't feel like very very critical now right um i mean it's

[02:25] Eugene Boruhov: um

[01:51] Drew Henry: no yeah we've we're we're knocking off exceptions every day um there's what there's kind of one more that that that's kind of meaningful that hopefully we can knock off tomorrow um knocked off knocked off a couple today um it'll be it'll be ongoing work anyway right um it's it's a big change to CockroachDB and how their regions work and understanding sort of, you know, how sort of, you know, your compute regions and your data regions should sort of coordinate, you know, so there'll be some massaging as we go. Yeah.

[03:04] Drew Henry: Yeah.

[02:35] Eugene Boruhov: so so like did you have um stress tests before the immigration i mean um like something like that could reveal this early i mean just it was a bit strange for me in terms of why you haven't pushed back in terms of migration because once you have an errors and production it could it would be possible like to just switch back or something like this just like Steve was okay we are on fire we need to fix everything it's always like okay it's it surprised me a bit

[03:12] Drew Henry: Yeah. No, I mean, it's... I won't speak for Steve, you know, certainly... you know when you're when it's costing you revenue and and customers and yeah it's always a big deal right um

[03:25] Eugene Boruhov: yeah

[03:39] Eugene Boruhov: yeah

[03:26] Drew Henry: so um oh your question yeah so when we migrated it was it was fine we didn't notice anything but you do it you do it late at night right in north america for a reason so you only start really getting valuable data when users start coming online the next day and so we didn't and get a lot out. um everything was fine it always is right when you when you migrate you know at the odd hours and then the next day you know things start to surface so um

[04:03] Drew Henry: yeah

[04:02] Eugene Boruhov: I'm just thinking that probably we need to do something from our side as we're going to migrate like I don't know okay the database is going to be in place so it's it's not so huge I'm just thinking about should we need to do anything to prevent from our side like any flux when we when we come to the job titles and probably more and then queries to database so probably we'll need to come up with some smoke tests and such sort of things. But

[04:37] Drew Henry: yeah by then you'll have a lot of real world um experience right and understanding the issues to to watch out for and we'll have tested under load for for a while and yeah so we'll be in a better spot you know when it comes to to the work that you guys do um yeah it was kind of because i wasn't involved much at all right i only kind of jumped into the last moment so it was kind of baptism by fire for me so um again it's one way to learn quick

[05:53] Drew Henry: yep

[05:10] Eugene Boruhov: yeah, so now Steve would like us to join on the... I know he shares with you, right? So what he done and why he asked us to join like this. new work and edge runtime API. I've added Denis there because he has probably the more experience than me in terms of like workers and all that stuff. So and I need to jump to another thing related with release. I just want to complete that we discussed with you last calls like all all these tickets to make the first release as soon as possible. So we decided to split this work like this. So Denis will work on that stuff that Steve created in PR. He will review and give us more details what he thinks. It might tend to just continue this work or probably rethink the architecture and stuff. But yeah, just for your understanding.

[06:18] Drew Henry: yeah so that yeah that's a work in progress it's only kind of new right um steve and i'll be able to talk about it more in the coming days as well um you know he both we're all distracted this week the last couple of days um but steve and i had a chance to go have a meeting around our roadmap as well which which was good um so that'll help um next week as we um take our conversations further along so yeah um yeah so i'm sorry did you have anything else you wanted to talk about with regards to that work or um probably not right Yeah.

[07:00] Eugene Boruhov: Yeah, not right now. We just need to collect more information. Probably we'll just share our thoughts in Slack so you will be able to see the work we're going to do. But I think today's conversation is mostly about what we've done, what remains to make this first phase zero release and updates from our side.

[07:53] Eugene Boruhov: Cool.

[07:23] Drew Henry: Yeah, cool. Yeah, that's the big push. Phase zero. I, yeah, I'll have, most of my time will go towards that next week, as opposed to the opposite this week. So, yeah, so that's, that's my agenda is to spend, you know, I don't know, if I put a figure on it, you know, ideally 75% of my week on phase zero. So yeah, I'll do what I need to. I was trying to unblock you guys during the week. I know Steve came in and gave some good feedback as well. So that helped unblock you guys too, right? So yeah, cool.

[08:06] Eugene Boruhov: yeah so we now have uh ci work so it's we try to make it like similar to Vercel like when you create a PR uh it's creating you on branch i i'll i'll add this to our knowledge base and share this in channel it just was my late work tomorrow yesterday so um now when we create a PR it's create a new one branch that is like isolated from the main branch so you can preview changes you can login in admin see Fields um i don't know play around this uh see that migrations uh working because like every change in the cms we need to create migration to database and we need to verify that it works actually and doesn't have any errors once you merge PPR in main branch so it's drop this neon database branch apply migrations to the main and that's it. So we just need like this testing environment and like to make things automated so without like human in the loop so that run migrations from their machines etc so it's it's something like we like oversell for so

[09:26] Drew Henry: Yeah, cool. I'm looking forward to seeing that actually implemented. It's very cool. When I was reading through the plan and then I hadn't really done a lot of work with Neon. And so when I understood what Neon could do, I was like, oh, this is very cool.

[10:24] Drew Henry: yeah yeah

[09:40] Eugene Boruhov: yeah very convenient very good dx so i would like to use it all the features that provide us so ci is working and i checked ECO so probably can share the screen just to not just speak about this and okay. Elsa I'd like today to share some credentials I believe we have only us yeah we need I'll create a user for you to be so you're able to log in in CMS for Steve, I don't know, for everyone who'd like to join this stage. What is important? We are mostly talking about the law of collections already, like job titles industry. We migrated to data, but it's everything for the future, not for now. For now, we're going to use only pages that are kind of landing pages. We have a Page Builder here, like you can pick a section, fill in data, so you have a landing page. So, the three we already built. don't see how much was just for testing but support and legal pages. Let me open it in a new tab. So for example we have this page with FAQ items, with text and it is just a collapsible blocks where it can fill in the data. It's just a standard for any our project you can like compose different sections to build a page. as easy as this. Regarding ECO, I found that there is a lot of structured data on legal pages like this one, not like legal pages but this one, antitrust lawsuit. So they're implemented like JSON-LD as just additional fields because I just tried to select the easiest path is just put the same data I found. on the production and put right here. Usually we implement it in a bit different way. So we have, for example, FAQ. Yeah. And we need to add structured data for FAQ to make the results page better. So and we just reuse the FAQ section data to automatically add the structured data for it. But this a bit another case as it's not an article actually, but just to make it like. the same as in the current production. That's a workaround how we can do this.

[12:28] Drew Henry: okay

[12:30] Eugene Boruhov: So and like just a standard title, description, og image fields. So nothing crazy, everything is simplified as we can. Everything is editable, so you can change the text that we migrated it. from the current production. I don't think we need to change any words or anything in these terms. Regarding the designs, we now created a schema, just pick some sections that look similar from the current production, but designers already built those pages. I think we just need to refresh UI a bit because it looks different from that we created, but we don't gonna touch schema. So schema is in place, so we're gonna just do like polish UI a bit.

[13:25] Drew Henry: okay

[14:00] Drew Henry: yeah

[13:26] Eugene Boruhov: The next step that what remains is out page, right? We need approval from Tariq, the designers just reworked because last version, like what we did, like we migrated to the Untitled UI design system, but we tried to use, you know, smaller components like buttons, I don't know, these labels, as much as possible from the Untitled UI. But it turned out that new About page doesn't look as good as the one they created before, fully custom. So the new approach we decided to choose with designers is, it is fine to create new small components, even like labels, buttons, etc. but it should be just based on the tokens from Untitled UI. Yeah, because even these small components look visually very different. Sometimes the UI doesn't have a lot of customizability options to make them look very custom. So to make it look really like, to give a feel of custom website that Tarek wants, we need to probably implement some new even lower level components. So that's our plan. I mean, it's our previous thinking was about like, don't use sections, but use. primitives. Now our thinking is don't use sections and don't use some primitives that look template-based or just don't feel like a custom design. You're fine to implement them but based on the Untitled UI tokens. So the Habitat now implements the about page with this idea in mind.

[15:23] Drew Henry: so what does that mean though are you saying you you're you're writing so what do you what are you using then to what for those atomic units or the primitives

[15:34] Eugene Boruhov: Yeah, just to give you a... a more clarity on this. For example, here was the first version of custom design based on Habitat design system. Like these numbers, let's pick those or like this green label or subtitle. That version on the right that was after rebuild, they make it gray but hopefully it's a bit visible still This label looks a bit different without icon and they cannot add icon in this like Untitled UI primitive component. It just doesn't have this option in Figma to make and these numbers as well. So you don't have, you know, the same styled like boxes.

[16:28] Drew Henry: Aren't they just fonts? I don't, I don't, um, you'd probably get a, like, like there, I'm just, to me that would be just fonts, right? And, and colors and

[16:41] Eugene Boruhov: Yeah, but...

[16:41] Drew Henry: and font sizes and weights and

[16:44] Eugene Boruhov: Yeah, but what the plan was like this, this small thing is actually a component. It's like primitive component and this box with the numbers is also like components and they just put one into another. And we thought about reusing this smaller level components like, you know, the labels, I don't know, the typography is also implemented like components and these boxes is like everything is components in the Untitled UI and we thought the idea is to use them as much as possible, not to implement that already happened in Untitled UI. But now we think, yeah, we need to just don't use them so much, only in places where they correlate with what designers think.

[17:40] Eugene Boruhov: I mean Figma,

[17:35] Drew Henry: so what do you so you're you're are you saying when you're saying component there you are you are you interchange that primitive or are

[17:44] Eugene Boruhov: yeah, yeah. I'm not able to find it. But yeah, what I mean is, yeah, it's like primitive components. It's just there are a lot of them in Untitled UI. I mean, it's not only like buttons and like icons, there is a lot of them. So the idea was to use them as much as possible. But yeah, it resulted in like different designs. So the idea is like we can use Untitled UI, but probably less even on the primitive level, but more on like you use tokens that is like typography, colors, I don't know whatever else they have like border art.

[18:31] Drew Henry: you just saying gonna use like uh like an h1 in a in a span or something and just style it with Tailwind is that what you're say

[18:40] Eugene Boruhov: Yeah, something like this.

[18:43] Drew Henry: okay

[18:45] Eugene Boruhov: Yeah, so it's not a huge deal. I mean, we just thought that the component library that Untitled UI provide us is more customizable, I'd say. So we can change a lot of things and we can just take the React components pre-built to not re-implement them on our side. But yeah, it just require a bit more custom work, let's say.

[19:15] Drew Henry: Okay,

[19:14] Anastasiya Sokolova: So we tried this custom work and it just doesn't look good. Tariq was completely unhappy with the more standard look of this new page. we had to go back to the previous custom version which to just with the Untitled UI tokens.

[19:38] Drew Henry: but yeah, okay, so but we're talking about things like we're not talking about buttons, right? We're not going to recreate our own buttons. We're going to use an entitled button

[20:18] Drew Henry: Isn't

[19:46] Eugene Boruhov: Yeah. Not really. We're gonna use Untitled UI but we're gonna extend it because our SyncWiz designers, they told us that we need some more sizes. We're not gonna recreate it completely but we're gonna take it from Untitled UI, like copy and add some more sizes or some more custom things in it because now they need to use more different sizes, let's say. And now they try to use... Sorry. Yeah, yeah, it's on

[20:38] Eugene Boruhov: app.

[20:23] Drew Henry: so you're saying you can't just use Tailwind classes on their primitive button to to size it any way you want That's the that's my my idea is that a primitive you can make whatever you want is passing and Tailwind glasses right you tell me i

[21:19] Drew Henry: was

[20:43] Eugene Boruhov: Yeah, it's on our side, but what I mean is that it's something that should be synced with the design system as well. So we can add whatever we want, like any class, you know, wherever we'd like. But it first should be implemented in the design. So if we'd like to increase the button size and we now don't have this size in the design system, we can add this in the design system. in our configuration, but designers should do the same thing on their side. So they should take the they have like and just it's really easier to just probably go to this.

[21:22] Drew Henry: going to say what what are they giving to you if we understand what they're giving to you yeah okay

[21:29] Eugene Boruhov: Yeah, for example, like here, like a button that probably here is. Yeah, you see the component properties here. It's exactly the like props, let's say so we can. like pick different size for example like SML and it results in different button size

[21:54] Drew Henry: yeah

[21:55] Eugene Boruhov: but the the thing is to make the design the same quality as Habitat need we need to add more sizes to add more sizes we need to change the like default Untitled UI components first in Figma add more sizes options and then we When we pick this component on our site for development from Untitled UI, we pick this React component and extend this as well. To make this sync with the design system and what Habitat has created. So it's not only like, even on the primitive component level for buttons, we will need to extend certain things. That's the point.

[22:42] Drew Henry: yeah yeah probably the best thing is to actually show me it once you once you've done Give me a working example. Yeah. Yeah.

[22:48] Eugene Boruhov: Yeah, yeah, sure, sure. Once we, yeah, I believe everything is going to be clear after we build about page. So yeah, it's probably,

[22:57] Drew Henry: Yeah.

[22:57] Eugene Boruhov: I just, difficult to explain for me. We just need to, yeah, really think, see a working version as you told.

[23:04] Drew Henry: Yeah.

[23:06] Eugene Boruhov: So yeah, what remained is about page is Polish, the lawsuit and support pages just to make them, yeah, it's a bit. But they already implemented. We just need an approval from Tariq. We don't want to start before he told us that everything is fine. Yeah, we will share the access to the CMS and I'll add some notes about how to test this. For example, we have... We have tenants route that's just a new without the App Router. So there's only pages from the new CMS and I'll share it with you the App Router. So it's already proxy to the current production. So here is landing from production. But if I'll okay here like support if I'll switch to the one route we have it's okay it's still still not there or lawsuit oh it's tenants yeah so okay I'll just show you some examples of of how App Router works in this like channel I just need to double check I wrote so that you see the how the proxy works on like some wrote to the production version, some wrote to the actual new pages. So you would be able to test this next week.

[25:38] Eugene Boruhov: Yeah,

[25:03] Drew Henry: Okay. So next week, yeah, so this will be the mechanism for us to preview the work, but also for us to, if we want to. well we don't necessarily want to but it's Payload CMS right we could um change content we could um lay out components differently that that's probably you know not not what we're going to do maybe we'll play around in a on another page that's not part of phase zero you know but um okay yeah well great as soon as you get us access to this it starts becoming more crystallized and more real um and then yeah and then we i think you know

[25:50] Anastasiya Sokolova: We

[25:51] Drew Henry: we'll move even quicker which is great so when next week do you

[25:57] Eugene Boruhov: yeah, yeah, yeah, I mean,

[25:57] Drew Henry: think um yeah in mind or you get is it going to be like a you'll give it to us and there'll be like one or two pages done or are you saying you want to give it to us with all the pages done what's the plan cool

[26:08] Anastasiya Sokolova: basically have only a few pages, so we have already agreed to build the About Us in the redesigned state the legal pages the Habitat team used some component like standard section from Untitled UI so it's also quick to be built and that's what we also should do this quick redesign and we also were discussing about you the the new footer uh that uh design team uh also built is the standard one but it looks better than the current one three things

[26:47] Drew Henry: yeah so um it'll it'll

[26:48] Anastasiya Sokolova: should build uh I was just concerned what's going to be our like flow of approval. So those pages, so for example About Us page was already approved by Tariq before we took the initiative of rebuilding the design system. So Tariq was unhappy on the last call with the new page, so now we're back with the previous version. I'm assuming it's approved by Tariq, but what's going to be flow between us, between you Drew and Steve? So how is this going to happen with approval so that we can take it into work and not worry?

[27:33] Drew Henry: go from tariq um down to you guys well tariq to Habitat Habitat you guys that's the flow right um yep

[27:44] Anastasiya Sokolova: Okay, so once Tariq approved, we're just letting you know that we are working on those and those pages and that's fine.

[27:52] Drew Henry: yeah yeah the only thing i would expect you to call out before you start working is if you if you see any something that's a technical challenge that you might want to say hold on you know let's let's think about this um yeah

[28:05] Anastasiya Sokolova: Good. So in this case, About page is ready to be picked up, footer is ready to be picked up. Legal page is almost ready, it just has a few changes to be done from the last call with Tariq. Other than that, it's also a quick page, so just getting a rough estimate that next week we should build everything. Just a few days for the valid page, day or two for legal page and footer. That's the plan for the next week.

[28:37] Eugene Boruhov: oh yeah. The one item that we forgot is, I see, it's analytics setup, but it's pretty easy. I mean, the Steve feedback was just don't add the hit maps and session replace right now, because it was the piece that, you know, difficult to make performance. So it's nice that we can drop this, but the rest is just like pretty simple. We just add this, how it works now on the Rockets resume production.

[29:09] Drew Henry: good and just well did you say you're going to wait until you've done those pages before you hand it off to us is that is that what you were saying or are you going to give us and then with a couple of pages and then keep working on the pages what's the plan

[29:35] Drew Henry: okay

[29:28] Anastasiya Sokolova: Yeah, it's just a few pages, so we built them next week and share it with you as soon as they're ready. You'll have access to the CMS, you'll be able to see the work.

[29:40] Eugene Boruhov: Yeah, I just would like to give you access earlier, as you told, you'd like to have next week more tenant this, so you can check how the CMS works. We implemented some pages, not just final design, but the schema is going to be the same, so you can see how blocks and stuff work in there.

[30:21] Anastasiya Sokolova: Yeah,

[30:00] Drew Henry: yeah all right so agreed you'll give me access ahead of time i'm not going to go and say to you guys what this page just doesn't look right i'm not going to do that this is for me to look around sort of the the in the insides and sort of you know Yeah, yeah, cool. No worries, don't worry, I'm not going to come and say, hey, what's up with this design? It doesn't match. No, when you say it's ready to review, then that's when we'll look at it.

[30:25] Anastasiya Sokolova: that's a good flow, nice. So in parallel with that, this week we were also working on thinking ahead. what we should do with the Resume Builder and Pavel prepared the proposal with few options so when you have time you can have a deeper look into that so we are like planning ahead and knowing what we are going to do next.

[30:53] Drew Henry: Yeah, that's a big one. So you haven't sent it to me yet, have you, Pavel? Okay,

[31:01] Anastasiya Sokolova: Not yet.

[31:02] Eugene Boruhov: Yeah,

[31:02] Drew Henry: cool. Yeah.

[31:03] Eugene Boruhov: I'd like to review this a bit, like Pavel has created. I just want to glance at this as well before sending you. But the analytics and tracking, we're now preparing to the phase zero, but we need to unblock future tasks as well because after phase zero, we'll need to start working on another stuff. So we're trying to unblock ourselves in terms of future work. And Resume Builder and tracking and analytics is two first steps. things we took to reveal them, plan them ahead, like split them in phases, like because there can be simple versions that we can implement like in weeks and then can be something more complicated because from Steve we get the idea he'd like to have everything you know the best quality and like like a rocket but we'd like to split this into the small pieces options and create a proposal to actually like, you know, align with you with steve on on what we're gonna build actually

[32:20] Eugene Boruhov: yeah

[32:06] Drew Henry: Yeah, and if it helps, like something like the Resume Builder, right? so we have these other plans some some some really cool features right but we we will definitely want to launch with essentially parity with

[32:32] Eugene Boruhov: yeah

[32:20] Drew Henry: what's out there already because that's we know we have that we know it works and then when we introduce new things we won't turn it on for everyone we'll a b test you know what i mean um and we've got a benchmark it's the the original the base so so just keep that in mind we have to go with the what the the current stuff anyway before we build the rocket you know what i mean so if that framing okay

[32:46] Eugene Boruhov: yeah absolutely makes sense absolutely yeah um yeah and after this uh yeah we just we just started planning what what what goes next after the phase zero uh we will try to scope this and blocking ourselves so i just you you know, gonna work on this and we'll share some ideas our next call

[33:15] Drew Henry: yeah well i imagine um Yes, we'll be more active on the comms next week. But regardless, you guys have, you're not blocked. You have your roadmap for next week. And I think you had, what else did you have on the agenda? Did we go everything or not? Let's see.

[34:38] Drew Henry: Yep.

[33:42] Anastasiya Sokolova: Yeah, so I just wanted to mention that we are currently discussing our team expansion to add back Dennis, that was our plan for May. He was the initial developer who was kickstarting this, all of that. So we want to bring him back and see where he can help. kind of second attack lead so very very experienced guy and this was steve's intention to have a larger team and we are in progress planning a call with team with steve on monday it wasn't scheduled yet i believe but we wanted to catch up to see his intentions and uh whether it's possible now what whether it's reasonable now uh so yeah again so plan ahead um So that's the plan with Steve. I also wanted to ask if we could keep these calls on Fridays, like same slot, just Fridays.

[34:45] Drew Henry: Oh, you prefer Fridays? Yeah. Well.

[34:48] Anastasiya Sokolova: Works well for me. Eugene, Pavel, how about you? It's Friday.

[34:52] Eugene Boruhov: no difference

[34:59] Anastasiya Sokolova: Okay.

[34:55] Drew Henry: yeah no this is this this works for me i mean yeah i guess yeah yeah that's fine

[35:02] Anastasiya Sokolova: Okay. Nice. Let's keep Fridays. And so I was also thinking, should we? pick up a date for going live to keep in mind considering that we already know we will be building the pages next week so something like week after that considering some additional testing and preparation could be our target

[35:26] Drew Henry: well i i could throw out and say the the end of the following week but you guys have to push back and give feedback as well right like you tell me i mean when you when you so you're saying next week are you saying which day friday you're going to give us the design pages

[35:45] Anastasiya Sokolova: uh yep

[35:45] Drew Henry: ready for

[35:47] Anastasiya Sokolova: looks looks doable

[35:48] Drew Henry: friday uh that's Your Friday?

[35:54] Anastasiya Sokolova: yeah

[35:57] Drew Henry: What does that mean for me? That's Saturday. What does that mean for Steve? You guys are ahead as well, right? So yeah, Friday for him. Yeah. Okay. Well, no, that's fine. I'm just trying to think. So that gives us all of next week for iterations. Look, I reckon we should aim for that following week to be the week that we get it ready to go,

[36:27] Anastasiya Sokolova: yeah

[36:38] Eugene Boruhov: yeah yeah

[36:28] Drew Henry: right? And then, so we have to think about rolling out, right? It's kind of like, it's a mini DB migration, right? There's things we have to manage, right? So

[36:40] Eugene Boruhov: yeah that's true yeah

[36:41] Drew Henry: we have to think ahead. So I think, yeah, we need to actually think about that, what that plan is, practicalities around that.

[36:55] Anastasiya Sokolova: Yep.

[36:55] Drew Henry: And so which day should that be? You know, what time of day, all that stuff.

[37:01] Anastasiya Sokolova: And who is involved.

[37:04] Drew Henry: Yeah, yeah. So let's shoot for, I'll already, I'll have the discussion next week with Steve anyway about how we envision the rollout, timing, that sort of stuff. And then we can get back to you on that next week.

[37:24] Anastasiya Sokolova: Yep,

[37:25] Drew Henry: And so that'll help define, you know, when we're going to go. But let's just shoot for the following week, end of the following week. So you give it to us next Friday and we'll. let's just for now just say the end of the following week will be a look to switch it over

[37:52] Drew Henry: yep

[37:43] Eugene Boruhov: Yeah, I think it's probably useful for you if I'll prepare a rollout plan, right? So what rollout means? I mean, we need to reassign domain, etc. It would be, yeah, I'll do this.

[37:57] Drew Henry: yeah better coming from you um obviously i think so um yep

[38:05] Eugene Boruhov: Okay.

[38:07] Anastasiya Sokolova: sounds good.

[38:10] Drew Henry: yep

[38:10] Anastasiya Sokolova: That's everything from my agenda. Anything else, Drew, you'd like to cover?

[38:17] Drew Henry: um nope nope i think next week um uh you get me access you'll give me access early um i can You can probably point me somewhere in the code base, right, Eugene, just to give you an example of what we're talking about with extending Untitled UI,

[38:41] Eugene Boruhov: Yeah.

[38:41] Drew Henry: right?

[38:43] Eugene Boruhov: Yeah.

[38:43] Drew Henry: Yep.

[38:43] Eugene Boruhov: But yeah.

[38:45] Drew Henry: However you want to do it, I just want to get my head around it and make sure that we're on the same page. I mean, I don't want to find out we chose to go Untitled UI and we're rebuilding stuff from scratch because then it defeats the purpose, you know what I mean? So I want to understand what that means.

[39:03] Eugene Boruhov: Yeah sure, once we will get some first designs approved, I just send you this example in Slack, so you could check with your hands how it works.

[39:16] Drew Henry: Yeah, yeah. it'd be good to understand um actually probably the whole flow right i'd like to see the the design system um and see how that gets consumed by engineering that'd be good to know but

[39:33] Eugene Boruhov: Yeah, I believe we also plan to sync with Tarek because his request was to add some flexibility inside the CMS to change, for example, button not only like text inside of the button or link. It's also like about colors, probably size, et cetera. And built in writing CMS, it's pretty common. We often do this stuff just like to sync with him before we built any scene to see

[40:04] Drew Henry: yeah

[40:05] Eugene Boruhov: where he'd like to add customizability because for us it's always choose as only like text be editable or add more options to change visual style as well. So we'd like to think with him and get. like more clear picture on what things he he was his vision on this

[40:38] Eugene Boruhov: yeah

[40:24] Drew Henry: yeah no we we have to do that for sure and and if you do feel like it's it's diverging or it's getting um too custom if you know what i mean right Let me know because I can have

[40:45] Eugene Boruhov: yeah

[40:39] Drew Henry: that chat with Tariq. That's not a problem. There's always that push and pull, right, between designers and engineers, right? So we need to find that balance. So we need to find it early on. So I'll spend some time looking at the designs as well that you'll be sent across.

[40:57] Anastasiya Sokolova: But just to let you know so far Tarik didn't do anything. extra or unusual. That's a level of flexibility we can provide to our customers. I mean, so far so good.

[41:12] Drew Henry: Yeah, no, that makes sense. I would have assumed that that would end up happening. I've built CMSs before and clients always want to have those. you know what I mean? So yeah,

[41:23] Eugene Boruhov: that's true

[41:24] Anastasiya Sokolova: I mean, we say out loud when we are not happy with the absolute flexibility and where we can foresee mistakes. That's not the case yet at least.

[41:35] Drew Henry: good, good.

[41:38] Anastasiya Sokolova: Good.

[41:39] Drew Henry: Awesome. Well, thanks guys.

[41:42] Anastasiya Sokolova: Thank you too for your time.

[41:44] Drew Henry: All right.

[41:44] Eugene Boruhov: yeah

[41:44] Drew Henry: Good chatting. Yeah.

[41:45] Eugene Boruhov: a good one

[41:46] Anastasiya Sokolova: You should go and have some rest.

[41:47] Drew Henry: Ciao. I'm going to have, I'm going to have probably something naughty for dinner. Nothing, you know, nice and you know, fatty and greasy probably. And then some, some sort of drink, alcoholic kinds. Yeah,

[42:01] Anastasiya Sokolova: Have fun.

[42:06] Eugene Boruhov: Yeah.

[42:04] Drew Henry: we'll do. all right thanks guys enjoy the rest

[42:08] Eugene Boruhov: Bye.

[42:07] Drew Henry: of your week maybe the rest of your day yeah