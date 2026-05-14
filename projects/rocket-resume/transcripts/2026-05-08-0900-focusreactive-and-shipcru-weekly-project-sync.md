# FocusReactive & ShipCru: Weekly Project Sync

Bot ID: 46cb9f88
Date: May 8, 2026 9:00 AM (GMT+2)
Duration: 56
External: mailto:steve@shipcru.com, mailto:drew@shipcru.com
Language: en
Participants: mailto:eugene@focusreactive.com, mailto:pavel.khurs@focusreactive.com, mailto:anastasiya@focusreactive.com, mailto:denis.urban@focusreactive.com
Provider: gladia_v2_async
Summary: ShipCru shared a new Canvas of top priorities for FocusReactive (deploy at non-canonical URLs, ship ancillary static pages, tracking, better-auth modal, sitemap, landing pages) and confirmed shipping in small pieces is the operating principle. The team agreed FocusReactive will help shut down the legacy ROC Neon database by auditing taxonomy/content data and avoiding sued phrases, and that phase zero infrastructure can be released as soon as Friday/Monday by proxying to the old site before turning pages on. Next steps cover the Resume Builder rebuild (server-side suggestions, prefetching, ditching Formik), eventual Stripe Connect tenant payments, internationalization/SEO, and continuing async collaboration via Slack and Looms instead of more recurring calls.
Topics: Rocket Resume, Architecture, Process, Habitat, AI, Knowledge Sharing
Type: External

[00:01] Anastasiya Sokolova: Yeah, Eugene, we were just talking about knowledge base updates. So Eugene runs this update once in a while after our calls to keep it up to date.

[00:13] Drew Henry: Yeah, I was just commenting that it looks like the format's changed for the scoping. That just happened recently.

[00:20] Anastasiya Sokolova: You're muted, Eugene.

[00:25] Eugene Boruhov: Yeah, that's what I was talking about. I tried to make it not like the three phases with a lot of things in it, but more like we have a track, like search, it's a large thing, and search is suggestions. And analytics and tracking are also large things that include many different tasks. So I tried to make it closer to this rather than three or four phases. I wanted to do this earlier this week, but it was just yesterday, I believe.

[00:58] Drew Henry: Well, it's good actually because Steve and I have been working on a way to best display and communicate our roadmap as well. It looks like you guys have done a good job, so might end up leaning on this. Yeah, it looks great. I like the change.

[01:22] Eugene Boruhov: Generally, I've added just two things as priorities, like first priority, second and third. And tracks is just to understand it's more about like if we can give the whole thing to one developer, because I'd like to split this by domains, it's just easier for me to to understand like the related things and how to split this into small tickets and give to another person and across the team so yeah

[01:55] Drew Henry: Yeah, I found the tracks interesting and useful as well. So, well, I think we don't have to go into two-month depth because what I'd like to do is present to you guys our priorities and then let you guys go away and probably bring it into here. would be my thought but you can you can give us feedback on that um and then the other thing was probably used to talk about the preparation for the phase zero rollout as well um i apologize haven't looked at the agenda is there anything else on the agenda anastasia that you want to cover

[02:40] Anastasiya Sokolova: Yeah, just a quick update, our development update for this week. And yeah, they are sending questions for release plan, the end time for it, and yeah, some next steps. Those are the most important ones.

[02:57] Drew Henry: all right cool is there anything short that you want to knock off now or you just want me to to jump into it, into the. priorities um i don't want us to get hung up because we definitely need to cover off the other things as well um

[03:11] Anastasiya Sokolova: Let's start with that, that's fine.

[03:13] Drew Henry: okay cool um okay so there's a ton of things on the scope right and we don't want to get caught up worrying about addressing every single one of them um by themselves so we've we've just thought about the product and what's the most meaningful things that we want to ship or need to ship for the bottom line of the product. And that's been our approach to view it through that lens. And so we've listed off a number of things that would get us a long way along to achieving those outcomes. It's not exhaustive and it's not meant to be, it's meant to give us stuff to work on over the next few weeks. at the same time while that's ongoing

[04:11] Eugene Boruhov: yep

[04:12] Drew Henry: unblocking or adding the other stuff to the priority list and Keeping that adding it as we go does that make sense so far? I've created a canvas doc if you want to bring it up if you don't mind and Maybe an estate you're sharing right? It's it's a new doc in the channel focus rector doc our channel. Sorry

[04:37] Anastasiya Sokolova: And the

[04:40] Anastasiya Sokolova: files?

[04:40] Drew Henry: Canvas and it's called crew top priorities for FocusReactive

[04:45] Anastasiya Sokolova: let me share my screen just one second yep

[05:02] Drew Henry: yeah cool okay so um the operating principle is basically we want to shipping is the unit all right so we want to ship things quickly in in small manageable pieces um and just maintain momentum. So basically, strip down to minimal, minimize blockage, deploy, and then move on to the next. So the first section, deploy at non-canonical URL patterns. So this is, I think, a new thing. Steve unlocked that on our call today. which I think is a great unlock for us, but we'd like to get your feedback too, obviously. And basically we can ship pages at non canonical URLs. So like the landing page could be shipped or deployed at slash home to start with. And we can do some AB testing direct, you know, some users there without having to roll it out, you know, all at once. And so it makes it much more manageable, we think. And I think that's pretty clear. I'll keep going through the whole list and then come back and answer any questions you have. So basically that's a conceptual unblock, right? So we can ship pages much sooner than we initially had anticipated. yeah um top priorities what we want to ship and in what order so uh the ancillary static pages so that's you know we're doing that already in phase zero it's already in flight um so we can we can you know we can move forward because we're going to come back and discuss where we're at with that phase zero deployment um post that we've identified tracking as core right because at a minimum we need um some tracking before we deploy landing pages. So think about when we say some, the goal would be to be on parity where possible with the existing site.

[07:59] Steve Zimmerman: Should we define that a little bit? When we say deploy, the people, the traffic. So I want to clarify that it's just a risk-reward thing. So you guys can push pages that are more MVP as long as they're not going to a lot of people. And we want to get the home page. The ultimate goal is to get the home page replaced in full functionality before we turn it over. The home page, like the literal slash page, before we turn it over to traffic. Now we can have it. We should deploy as soon as possible, like to slash home or slash whatever. But I just want to clarify that there's like there's some phases here and that you guys can use this to reduce your risk of impacting traffic. if you want to push pages like the ancillary pages sort of so i just want to there's an mvp for but like in order to deliver the to traffic we need most of our pages need to be React and so like we need to know who what the pages are so i think that's what he's trying what another way of saying what what um drew is

[09:13] Anastasiya Sokolova: I'm

[09:14] Steve Zimmerman: um saying

[09:16] Drew Henry: Yeah, and please continue to jump on in, Steve.

[09:21] Steve Zimmerman: we just tried to look at this as a way of of like, Letting you guys move fast.

[09:26] Anastasiya Sokolova: going to go ahead and

[09:26] Steve Zimmerman: And so a lot of this is like, how do you want to build tracking? It kind of depends on your call. We want to get pretty much TypeScript ready, not like async Payload, fast, rapid tracking that goes to the back end. And then we

[09:44] Anastasiya Sokolova: wrap up. I'm going to go

[09:45] Steve Zimmerman: go to the next panel from there without impacting as much traffic as possible. So it's really like the more accurate we are and the more we trust it the more we

[09:55] Anastasiya Sokolova: ahead and wrap up. I'm

[09:56] Steve Zimmerman: can deploy to slash home page and other landing pages but um so that's sort of the the idea here um and then also how fast you guys can go and so

[10:08] Anastasiya Sokolova: going to go ahead and

[10:18] Anastasiya Sokolova: wrap up. I'm going

[10:09] Steve Zimmerman: i think what we're going to get to is this auth i think we should be starting the auth migration now like i know that we've been blocked for a while um we now have what i would call a decent

[10:20] Anastasiya Sokolova: to go ahead and

[10:22] Steve Zimmerman: implementation although it's

[10:23] Anastasiya Sokolova: wrap up. I'm going

[10:24] Steve Zimmerman: we're finding bugs in a lot of places right now um but you can understand how our modal so when i when we say off that modal is critical um and so we can do that we should start working on that because that's a blocker for full page full 100 traffic traffic tracking

[10:43] Anastasiya Sokolova: to go

[10:45] Steve Zimmerman: like you pretty much we have to do 100 before we roll out landing pages um off you can do with the redirect

[10:53] Anastasiya Sokolova: ahead and

[11:07] Anastasiya Sokolova: wrap up.

[10:54] Steve Zimmerman: to like the the pages before we get real traffic and when i say real traffic like i don't know 10 20 not more than 10 of traffic um based on traffic volumes and so

[11:16] Anastasiya Sokolova: I'm going

[11:08] Steve Zimmerman: just trying to reduce some risk um i think those are um kind of the order there and then we can you want to keep going i don't mean to cut you off.

[11:28] Anastasiya Sokolova: to go ahead and

[11:19] Drew Henry: Yeah, no, no, no, no, please jump in. You have a lot of context that you can add. that's very useful um while we're talking about better off um like for us the full you know google sign on

[11:37] Anastasiya Sokolova: wrap up. I'm

[11:38] Drew Henry: one tap uh is really meaningful to the business now that doesn't have to go you know in this mvp um

[11:47] Anastasiya Sokolova: going to go

[11:55] Anastasiya Sokolova: ahead and

[11:48] Drew Henry: you'll see down further um it's it's you know it's tied in with the oaf modal number six, but the whole point is that

[11:58] Anastasiya Sokolova: wrap up. I'm going

[12:00] Drew Henry: if it is a

[12:03] Anastasiya Sokolova: to go ahead

[12:08] Anastasiya Sokolova: and wrap up.

[12:04] Drew Henry: kind of trivial amount of work, right, a lot of work's been done already, if it's just a matter of, you know, one or two, you know,

[12:10] Anastasiya Sokolova: I'm going to

[12:10] Drew Henry: changes, you know, in the code, just to turn on Google's, you know, sign on, then we should do it.

[12:17] Anastasiya Sokolova: go ahead

[12:21] Anastasiya Sokolova: and wrap up.

[12:20] Drew Henry: Yep. We don't have to.

[12:21] Steve Zimmerman: do it where do it in legacy or

[12:25] Drew Henry: No, no, this is all, this is all, all

[12:28] Steve Zimmerman: in

[12:29] Drew Henry: ship-proof. Yep.

[12:30] Anastasiya Sokolova: I'm going to go

[12:30] Steve Zimmerman: trip group okay

[12:31] Drew Henry: Yep. yeah um

[12:34] Anastasiya Sokolova: ahead and

[12:36] Drew Henry: that was just the last point here on better off

[12:38] Anastasiya Sokolova: wrap up. I'm going to go ahead and

[12:39] Drew Henry: so that's why i just uh i brought it up because we're talking about that better off um now a sitemap steven you can probably talk more to this as to the the need for sitemap as well

[12:50] Anastasiya Sokolova: wrap up. I'm going to go ahead and

[13:09] Anastasiya Sokolova: wrap up. I'm

[12:51] Steve Zimmerman: yeah so this should be not a design like this is a it is a visual site map so like a user but like we're losing a lot of our pages and our links with the new design and so i want to add a page i imagine it's just job title search and then with query parameters that allow Google to paginate through all the data.

[13:15] Anastasiya Sokolova: going to go

[13:16] Steve Zimmerman: So basically Google can get to all job title pages and all industry pages

[13:21] Anastasiya Sokolova: ahead

[13:45] Anastasiya Sokolova: and

[13:23] Steve Zimmerman: as soon as we can. I guess we're not going to be migrating over the homepage for a little bit, but that's something that when we do turn it off, we're going to need that site map when we reach 100% traffic to the new pages. Yeah, it's like a user-friendly, like you can browse and search.

[13:48] Eugene Boruhov: Yeah,

[13:48] Anastasiya Sokolova: wrap up. I'm

[13:49] Steve Zimmerman: It might be like a search results page. Like that's an interesting way to look at it. But it's a search result page with page-native results. Starts with all of them.

[13:58] Anastasiya Sokolova: going to go ahead and

[14:01] Eugene Boruhov: that

[13:59] Steve Zimmerman: It can be filtered. Don't take it too far.

[14:04] Anastasiya Sokolova: wrap up. okay

[14:02] Steve Zimmerman: But like that's the extreme. We just got to get Google to all the pages at first. We can take it further later.

[14:12] Drew Henry: yep and then we get to landing pages um so we've already talked about you know non the the use of non-canonical urls um yeah you know by by having by getting the tracking and the the better off and and the site map and all that done prior um it means that once we're happy we can then promote to the canonical urls um

[14:53] Steve Zimmerman: So, um, let's go

[14:57] Drew Henry: no no please i was going to move on so if you if you have something you wanted to, yeah.

[14:58] Steve Zimmerman: ahead. I was going to move on to some, I got, I got ADD'd. Sorry, go ahead. I'll get there in a minute.

[15:05] Drew Henry: Cool. Yeah, and then we come to the modal. So that's the specific modal that Steve was talking about, the importance of that. Yeah,

[15:26] Drew Henry: cool.

[15:20] Steve Zimmerman: And yeah, the last step tracking is where I got ADD'd. I don't know if you're familiar with us.

[15:29] Eugene Boruhov: is

[15:30] Steve Zimmerman: I don't understand. To me, the new tracking is going to the server. So tracking MVP is just sending all events to a tracking API, not I don't know how you guys have started building it. My vision was that it's all going through an API, our internal API, before going. Instead of going from the client to Mixpanel, we're going to our API in the Mixpanel.

[15:57] Eugene Boruhov: plant. a plan. We just created a proposal. I remember you read it and left some comments. I've updated with your comments. There is a services peak. So I just expect, someone told us, yeah, that sounds like a good approach, the good thinking about this. And then we can start it right away.

[16:20] Steve Zimmerman: Okay. So you need, yeah, let's go at the end of this, let's go through everything you need from us.

[16:27] Eugene Boruhov: Yeah, because there should be open some accounts like in those services. So we need some preps before we start this. But yeah, that's something that's not blocking us right now, because now we're just like move this simple layer of analytics that you already have without like creating this like server API.

[16:50] Steve Zimmerman: Yeah, I think that you had. yeah i think i'm pretty good with it there was only one thing that i had questions about i don't remember i had to read it but the um was it party town is what you wanted to use in the last one or is that an older version

[17:07] Eugene Boruhov: No, it was an older version, it was just an idea. So we can like, instead of idle callbacks, we can do this like party town or just worker or something like this. But that's,

[17:17] Steve Zimmerman: i think we should build our own worker for that

[17:20] Eugene Boruhov: yeah, yeah, yeah. Now this, now this like on the worker. So yeah,

[17:24] Steve Zimmerman: great cool um okay

[17:31] Drew Henry: Let's go right

[17:32] Steve Zimmerman: so yeah i would just combine this this tracking drew into the last one um and then like even higher level for like the whole team like the goal is to get feature parity with rocket resume and allow marketers to build pages um so basically the entire front end which includes tracking

[17:59] Drew Henry: there.

[17:59] Steve Zimmerman: it includes the content search and then we have side priorities from a business perspective so that's a product perspective but a business perspective is also like we need to shut down our rock database and i think that was that i'm hoping you're working on and then um i think we focus on that first um there is also a potential business opportunity for saving bandwidth on Vercel um which i know like the main reason and but i think i have like a 90 drop in that data usage so um That's not as big of a priority as it was before. But what is a huge priority for us, and it's like the cost of an engineer, is just shutting down Rock Database. So the usage of that. And so that's combining taxonomy and the content text. I think that's all that's left on Rock Database. So it's

[19:23] Steve Zimmerman: great.

[19:03] Eugene Boruhov: but, but am I right that is like current consumers is um um uh a rocket resume like i mean current uh production website so i'm just trying to understand you know where where our like responsibility because it feels like we're not we're not gonna use that one because we already migrated the data and we have a yeah so should we should we go and help like your guys or what what do you expect from us because we're not going to use

[19:30] Steve Zimmerman: Oh, it's moving on the website?

[19:34] Eugene Boruhov: sorry

[19:34] Steve Zimmerman: Oh, I'm sorry.

[19:35] Eugene Boruhov: ah replace

[19:35] Steve Zimmerman: I didn't mean to interrupt.

[19:36] Eugene Boruhov: i mean i mean um Yeah, it just feels that we can drop it even on the current production, just like switching to the new database, right? So I just don't know a lot of context about this because

[19:50] Steve Zimmerman: Yeah. Exactly. So let's let you guys can come in and work on that repo.

[19:57] Eugene Boruhov: I think, yes, yeah.

[19:58] Steve Zimmerman: Yeah. So we want to add that and then we want we want to do at least two things. Obviously, it needs to be better and faster than our current one, which isn't that hard. So the that's important. The we need to do a data audit of everything that's in taxonomy and rock. I think there's two different data sets because I think I posted it yesterday or today or yesterday for you guys or actually while you were asleep probably. There's a there's I think there's like seven or eight gigs in taxonomy and I think there's only like two gigs or two and a half on the new taxonomy. So we should do a data audit. I don't know if that's just because of our schema but I want to understand what's in those databases, if you guys can help with that.

[21:02] Eugene Boruhov: Yeah, I think we have access, right? What?

[21:07] Steve Zimmerman: I think taxonomy

[21:08] Eugene Boruhov: Yeah, but.

[21:09] Steve Zimmerman: has, I don't know what you have, and I have like four different locations of data. So like, I think taxonomy has the job titles in the industries. It has the legacy and the new, and the new are not published. I don't know if you've seen that. So taxonomy, I believe, has that. I don't know if you have access to that. I just gave everybody you guys access today. And then I think the strings are in the rock database, the ones that we use, and then there's like 30 million. And so the problem with that is just going to be really taxing on your vector search. But at the same time, like I think I mentioned this previously, all those strings were generated. on a per job title basis. So whatever skills a marketer has, there's a list of 80 of them for that marketer and then there's a marketing associate and then there's 80 for them the overlap of those two strings are going to be similar and so i was hoping we could do some sort of vector cleaning purging where we look for similarities on the vector space and we remove duplicates

[22:47] Steve Zimmerman: and

[22:34] Eugene Boruhov: Yeah, yeah, this makes sense. We need to check. It would be nice if we just check this, like, have this data and we can, like, exactly see, like... how it works, what we can do, etc. So, let's just

[22:57] Steve Zimmerman: the other way

[22:47] Eugene Boruhov: check what access do we have, all these databases and we can do this job. Yeah, and I think we can... Yeah, I think we can... I'm just...

[23:03] Steve Zimmerman: we can also regenerate like

[23:08] Eugene Boruhov: How it was created, I mean, is it like...

[23:11] Steve Zimmerman: i can there's a there's a TypeScript in our scripts file folder that has the queries to generate content strings based on a query like what are skills and a resume and i give an example and it's just a prompt i ran for every single job title um and it was on i don't know it was a while ago so they're probably way better now um but like uh so i'm okay with how you want to approach this the only thing is we can't deploy to production There's a competitor that has sued us for some of the phrases they claim they own. We agreed to take some down so we can't ever show. There's certain phrases we can never show on our website. And so we have to, before we deploy, it's important, everyone, that we just, we do a data audit and we want to clean some and then add some more. We can do that. I'm okay with just using what we have now. and then we can start purging it down and then adding back where the gaps are. But we need to double check that there's certain phrases that can never go in our database. And so that's very important.

[24:20] Eugene Boruhov: Okay, so just for my understanding, we have an old taxonomy on the old database, right? That we want to shut down. We have the CRDB with a new taxonomy, right? No,

[24:38] Eugene Boruhov: it's just...

[24:33] Steve Zimmerman: So there's Taxonomy, which is an old NEON database. And right now, we only use it for the XML sitemap and I think page generation. So what I would do is I would search for the taxonomy project in our database or in our code base and see where that's used. So it's the glass taxonomy has its own client, that's Neon. That taxonomy project has, I think it has the job titles and the industries we want. The old ROC database, the one that's in RDS, the one that we did the migration for in the last week, that has a resource of content texts. That's where we have, I think, the 20 or 30 million strings that are tied. It also has job titles and industries, but it has V1 job titles and industries. It has V2 texts and then taxonomy has V1 and V2 job titles and industries. And then it has like a V1.5 texts, I think.

[25:57] Steve Zimmerman: yeah

[25:52] Eugene Boruhov: Yeah, I think LGD is very useful, going to be for us. I mean, we need to check all these sources and prepare for ourselves. probably for everyone just a table to be on the same page and then we can just understand what we should take from where and yeah that's gonna be solved.

[26:11] Steve Zimmerman: okay

[26:12] Eugene Boruhov: Yeah let us do this we will check first the services and if we don't have any access we just ping Drew and you

[26:27] Eugene Boruhov: yeah

[26:20] Steve Zimmerman: okay appreciate that and then it would be great if we kept like a source or sources for all the content in the database so we track that somewhere

[26:36] Eugene Boruhov: okay.

[26:38] Steve Zimmerman: okay any other questions so the goal is to get yeah if you have those apis if you have the upsert resume api getting ready to test that would be great I want to clarify, drizzle is optional now. We're having headaches with drizzle and cockroach. And so if you guys have a preference for an ORM or just raw SQL or however you want to do it, feel free to, I know it might be too late, but feel free to take or suggest some ideas there. We're open to whatever you guys think is best.

[27:23] Eugene Boruhov: Okay, yeah, thank you. I think Denise is mostly working on this. Regarding the, like, we see this canvas with top priorities. I just need to understand if this introduce any changes into the phase zero, like our initial idea was like just take these three pages like about legal and support. a simple analytics layer without heat maps and without recordings. And generally all the infrastructure. So is it the same, the planets like this? I mean,

[28:38] Eugene Boruhov: yeah.

[28:11] Steve Zimmerman: yeah i mean you don't even have to do tracking like like i would just i would i would sprint to getting some i want to see it on production so i can play around with it um and uh yeah so there's uh yeah you i'm all for shortening the mvp make as minimal as possible and and then but just do it in a way that doesn't impact our traffic so um and if you're creating new pages that don't have traffic There's no reason why. that wouldn't be a problem so you can just put up pant pages

[28:47] Eugene Boruhov: It's probably a good time. Yeah, I see that RSC already opened the release plan. So actually, we got an idea this week that why we need to wait until the design is going to be implemented and approved, etc. If we can just release the infra without a page at all and just proxy to the old website. And we think now that it's going to be a first step and we can do this any day because everything is actually done in terms of infrastructure, CI, etc. So and we can test infrastructure only if we have errors, we can errors, we can roll back quickly and then we can turn on page by page just by changing the routing configuration. Yeah, that's kind of a plan that Denise introduced here. And yeah, it's simple as that. So we would like first to check on the staging. If everything is going to be good there, we can pick a date with you. I don't know, low traffic or if like, um,

[29:45] Steve Zimmerman: great

[29:46] Eugene Boruhov: I don't know, it's difficult for me to say, probably Mixpanel will give us a better idea of the timing, where should it be released.

[29:54] Steve Zimmerman: um if you have a rollback plan like you can do it anytime in your hours like midnight um after like 10 o'clock my time is probably safe like do it soon in that window and as long as if it's going to be a multi-day thing like our database. Now we're at multi-weeks. um the uh you can do it i mean preferably the lowest traffic of the day is like friday at midnight my time because then you have like saturday as low as our slowest day and then sunday is a very slow day um and so if you needed multiple days friday at night is the best so

[30:36] Eugene Boruhov: Okay. Yeah, so, actually, we are good to release it.

[30:47] Eugene Boruhov: I...

[30:47] Steve Zimmerman: you have a i'm sure right

[30:51] Eugene Boruhov: Sorry, sorry.

[30:52] Steve Zimmerman: you'll have the ability to figure out if you broke something and roll back pretty quick, right?

[30:57] Eugene Boruhov: Yes, there is a bottom of this plan. Can you scroll a bit down? There is a rollback,

[31:05] Steve Zimmerman: for Vercel

[31:05] Eugene Boruhov: like

[31:06] Steve Zimmerman: or no no it's conflict i'm sorry

[31:11] Eugene Boruhov: different scenarios of how we can push this back. So yeah, just to be sure that we can do this quickly and without headaches.

[31:24] Steve Zimmerman: yeah

[31:41] Steve Zimmerman: okay

[31:25] Eugene Boruhov: Yeah, let's just figure out what were the exact date. uh we can do this friday monday i think um yeah i think i think so uh yeah

[31:44] Steve Zimmerman: that's yep that's great or if you want to do it tonight um up to you guys uh the sooner the better and like yeah you don't need the designs speaking of what what's up with designs i thought you guys had designs

[32:00] Eugene Boruhov: yeah yeah um

[32:02] Steve Zimmerman: are we approved

[32:05] Anastasiya Sokolova: The Habitat team had to rebuild all of the pages with Untitled UI tokens, which they did last week and they had to correct this week. And just yesterday Tariq approved the majority of the pages with minor comments. So we are basically unblocked and the pages were selected for the first release

[32:30] Steve Zimmerman: okay

[32:30] Anastasiya Sokolova: after phase zero. and we've already started building them about page about us page footer and then a support page and the legal pages Next.js

[32:44] Steve Zimmerman: great okay good i i wish i thought you guys had this but um okay yeah let's start doing them the designs don't don't need to be pixel perfect so um we're gonna go back and forth so

[32:58] Eugene Boruhov: okay yeah Yeah, I think the first one is going to be like we already implemented the legal pages actually, but before the Habitat created a design. So we have like our peak of Untitled UI UI components. and yeah, they already work. We migrated the content, all this, you know, there is a menu or something like this. Yeah, we just need to refresh UI a bit because the Habitat created a design and it actually looks better than just an Untitled UI rough sections. Yeah, but I think we can we can start from Lego pages first. Next week after the first rollout we can just wait for it like... days just to check that anything happened. And then we can just turn on the legal page lawsuit or support. It is how it looks like now.

[33:57] Anastasiya Sokolova: okay

[33:57] Steve Zimmerman: awesome does it i mean okay yeah i'm gonna start picking up things apart don't worry though um is it sticky on the left the menu

[34:07] Anastasiya Sokolova: yep

[34:09] Steve Zimmerman: yeah awesome is the and so the only thing that throws me off is that i don't know if the design is like that but is the is the line of the left edge of the text line up with the title section all the way at the top

[34:22] Eugene Boruhov: Yeah, it looks pretty strange. Yeah,

[34:25] Steve Zimmerman: is that what they did on the design

[34:28] Anastasiya Sokolova: yeah no no that's the thought

[34:30] Eugene Boruhov: the defaults on titles of your section. it's our peak of Untitled UI actions. It's not designed, it's how the designs look like. Oh, okay, actually,

[34:41] Anastasiya Sokolova: they also

[34:41] Eugene Boruhov: on the right it's...

[34:44] Anastasiya Sokolova: to the title component but just change that a little

[34:49] Steve Zimmerman: okay

[34:52] Anastasiya Sokolova: bit better than the one that's already built

[34:55] Steve Zimmerman: yeah the way those don't align curves me off

[35:02] Eugene Boruhov: So yeah, I mean, LEGO Pages is done in terms of like CMS schema and content. You just need to refresh UI a bit. It's like a matter of hours, so and it's gonna be, I think the lawsuit can be the first one we turn on in Realtor.

[35:17] Steve Zimmerman: yeah we'll make tweaks it doesn't have to be perfect

[35:20] Eugene Boruhov: Okay. Yeah, and we start crafting the Resume Builder document just for ourselves and to align with you. Like the current state, how we're going to rebuild it in the first phase. I mean, just like implement the same thing, but on the new stack. And then what's going to be the future? Like how we see it, at least like what we can improve, how we can improve rendering. Anything that we think can make RichText level Page Builder. I just need to review something that Pavel created this week. So I just reviewed this doc and would like to check at some point with you what you think about that. But first, first phase is kind of clear. We just need to migrate this thing to our stack, to our new... application. It's more about, you know, align with you about the future things we're gonna...

[36:22] Steve Zimmerman: okay you want to talk right now

[36:24] Eugene Boruhov: No, no, no, no, no, let's do this like next time.

[36:28] Anastasiya Sokolova: can you join next friday

[36:34] Eugene Boruhov: It's

[36:31] Steve Zimmerman: this is not easy time for me but yeah I can do it by the way it's

[36:35] Eugene Boruhov: not...

[36:35] Steve Zimmerman: your first your

[37:44] Eugene Boruhov: Okay,

[36:36] Steve Zimmerman: first line of phase one you got a ditch that's form 100% the things that are things a nightmare so we want um I mean I don't I don't really care we were looking at React hook form obviously performance is so important And actually how we architect the Resume Builder, it's tied to the API. So like, like I know we're working on the resume API right now, but like right now. So for example, like when someone goes and creates a resume, I believe we update the resume on the API level. We update it and then we fetch it and then we return it. And then the front end gets that resume and then it fetches it again on the Next.js. And so you're getting a lot of redundant fetching. And so what I want is like, I want, and I want the page. I don't know who's doing the front end stuff, but like, I care a lot about like, it literally like should be instantaneous as possible. And like, you can, maybe

[37:45] Eugene Boruhov: let's...

[37:45] Steve Zimmerman: you can do auto saving so that that page transition when they click it, it's just like, boom.

[37:54] Eugene Boruhov: Okay, yeah, no problem. I mean, the phase zero is... Yeah, I agree with you. It should be not... It's like the same Resume Builder but... in a good shape, right? Fast and on the modern technologies.

[38:08] Steve Zimmerman: And so. Also, those suggestions that you just saw, like let's move them server side. Right now they're on the client. But so the API like we can request suggestions. And so they should be potentially done on the server.

[38:29] Eugene Boruhov: Okay, done on the server. I'm not just... I mean it is like before we even click, before we even...

[38:41] Steve Zimmerman: Yeah. So

[38:42] Eugene Boruhov: Okay,

[38:43] Steve Zimmerman: when they click, we'll go we'll send Pull Request to the server. But it also could be on the autosave. And also there could be. You might want to decouple suggestions from saving just so that you can have two Pull Request. The saving could be, the suggestions could be slower. But right now the suggestions are all synchronous on the front end.

[39:26] Steve Zimmerman: Yeah.

[39:11] Eugene Boruhov: yeah, I got you. Yeah, yeah, yeah, makes sense. So we should prefetch everything that we can. Yeah, that's pretty standard. I just like, I just, yeah, Recall this different, give it different names. So I'm just like having it like prefetching or something like this. Yeah, now it's clear.

[39:33] Steve Zimmerman: Okay.

[39:45] Drew Henry: So, yeah, so, so guys, yeah, the intention was to sort of say, Hey, look, this is what we want to achieve. It wasn't to pull apart and say, all right, what are the specific pieces of the puzzle to get us there? I'd like you guys to come back and say, all right, these, this is what we need. If there's any blockers, then they're the ones we deal with first. Right. Any scope requirements? because I know the big question was like, you guys are blocked. you don't understand certain features we need to scope them properly let's just apply that to this right now so if you look at this and come back and say all right i need we need scope i understand the scope for something in particular then let's focus on those pieces

[40:35] Eugene Boruhov: Yeah,

[40:50] Eugene Boruhov: sure.

[40:37] Drew Henry: and i haven't seen the deep dive is that kind of where you would want i know that it says deep dives maybe not the right approach but It looks like this is going to be where you're going to start tracking or we're going to start tracking scope. Is that kind of the plan or?

[40:53] Eugene Boruhov: Yeah, so what we've faced is like there is certain pieces we are very clear about and there is some that kind of huge and we need to think a lot about this and even more like we need access sometimes and we need aligning and not just implement but before iterate with you with Steve to ensure that it's the right way. And that's like my idea was just create spikes and the deep dive is the result of the spike. It's like we are reverse engineering the cut base. explain ourselves and create this document, like current state and the kind of breakdown of phases and our proposal, how we as your partner see it can look like in the future and the phases and what we can do for this. And that's kind of approach. It's not for everything. I mean, now at like Search, Resume, Page Builder, Analytics and Tracking, and I don't know what's next. So it's only for the huge pieces of the application, not for everything I'd say. Because for example, job titles is kind of huge, but we already solved this. I mean, Denise has made all the heavy lifting, so we're not gonna like iterate back on this. It's gonna, it is solved. But anything next that's going to be huge, we're going to do this way.

[42:15] Steve Zimmerman: we're yeah i mean we're gonna have to hit scale too so like we have quite a few users and we're gonna be ramping up and we're gonna be scape so the next so the business priorities if you want to go higher we got seo there's like yeah there's seo what you guys are doing it's the cms stuff it's the page content the Page Builder so we're going to bring on a an seo team and i imagine they're going to have feedback and they're going to want to do things that they can't do yet and so we'll have to add those. Those are that should be fairly easy. I'm glad you want to move fast. We're going to internationalize the website. So we got to do it in

[42:51] Eugene Boruhov: Yeah,

[42:51] Steve Zimmerman: these different languages and translations. I'm sure you guys are great at that, too. That's not rocket science. There's in terms of those are the big core things we're going to bring over the Page Builder. We also need to switch payments. It's going to be a massive thing. At some point, I haven't decided. when we need to do this, but probably start thinking of it now, is tenant payments. So ShipCrew has a Stripe account, and Rocket's going to be one of the Connect accounts. So I don't know how familiar you guys are with Stripe, but

[43:34] Eugene Boruhov: we are.

[43:35] Steve Zimmerman: okay, great. And so we want to architect that for the future. And so I need help understanding. how you do payments is it on behalf of who's the merchant record all these questions um i was just at stripe sessions last week so uh the uh but if uh that's a big project what i want to do before we get into crazy product and which crazy more far stretch stuff is we've got to bring the website over we want to add resume uploading so taking any file converting it into our schema potentially trying to make the template work. I don't know how you import a template, but that would be an interest. That's optional, but I'd love to definitely pull in the text and the content. And I think that's good with an LLM. I don't think it's a really tough project either. And then Drew and I are going to figure out some, we have a bunch of ideas for what's after that. One of those that I've tossed around a few ideas of. is a resume reviewing product however depends how quickly you guys can get there because we um yeah because ai is going to take over this business pretty quick so we need to be launching with partners and so basically now we've built a white label we're going to go get customers that are going to host the Resume Builder on their website and then we're going to start building products for them and improving our builders so like an ai agent that helps you you build your resume, but then also. once we get partners on board they're going to post job listings and then we're going to give them an ai agent to go find um people to apply to jobs and then they're gonna the PPR gonna find so our agents are gonna be the middleman and so we're gonna be communicating with ai between the two sides so we're gonna create a marketplace but we need to create the partner side so that we can then do the interactions but like for example an ai agent could do things like go fill out a form an application on someone else's website so we actually learn about the person go and go find them a job search the internet for it then go apply um like apply go reach out send emails and like all these things like when do we do this what time and like how do we present ourselves to this user so this is going to be a an agent that acts on your behalf um and like you might be like hey i don't I don't trust you, so don't do anything without my permission." Or you might be like, hey, I don't care. Do anything you can to go get me a job. So a lot of things in there. To get to that level, we got maybe steps in between, but we got to get marketplace before we can really understand how to do that and get all that . So the goal is to get that data, and we need to migrate to tenant so we can process people. And then we got to bring over Rocket Resume, but we also got to grow Rocket Resume. So at the same time as doing all that, Rocket Resume is going to bring us the revenue that's going to pay for the development elsewhere. So international and SEO and GEO are the big core tenants of the growth of the company. So, and you guys are working on that correctly. So what you started on was the SEO, but we're going to bring somebody, people in here to bring, make content. And then we need to internationalize. I want to be launched in like 90 percent of the world, at least, that anybody who actually Filds resumes. I want them to have it in their native language. Right to left is going to be tough, but we're ready for right to left languages, too. So these are all these are all things. resume Payload is on there i'm glad you guys are crushing it so keep crushing it but there's plenty don't be worried about crushing too much i want to keep moving and then by the way what's going to happen is once i get in there i'm going to start seeing stuff i'm going to call it out we're going to have the last 10 to 20 percent is not going to be as smooth as the first 80 percent so i have high standards for you guys you're doing a great job

[48:05] Drew Henry: Yeah, and let us know if something's not landing. We're obviously still trying to find out what's going to land right so that we're all, you know, moving in sync and moving fast. So that was our goal to sort of give you sort of, hey, this is, you know, this is what we're aiming for. This is our objectives. These are the, you know, for now. And then Steve just gave you the, you know, the future as well. But, yeah, just help if it hasn't landed. come back to us right and we'll get there we'll find it yeah yeah

[48:38] Steve Zimmerman: and like can we create like a hashtag in Slack that's like blocker um because there's a lot of noise and i'm i think we've missed some messages i've missed some um but if you guys are blocked like i want to like i don't i know not on you guys but like if we haven't solved it by the next day just repeat it and call it out and uh but i i mean drew and i should be paying close attention if you guys i think you guys need access to some things um but like we should we should be solving that unblocking you guys you guys are critical so keep moving fast and but if you're blocked scream it scream it let us know don't be afraid to speak up great

[49:22] Eugene Boruhov: Yeah, and we already introduced that like the next week another one guy joined the team, right? And we already requested access for him. in the chat.

[49:34] Drew Henry: yeah that's on

[49:35] Anastasiya Sokolova: yeah

[49:35] Drew Henry: my list he doesn't

[49:36] Eugene Boruhov: Okay.

[49:36] Drew Henry: start to click right but i'll have that done um yeah

[49:46] Drew Henry: yeah

[49:40] Anastasiya Sokolova: sure yep this yeah so Monday our morning he'll be joining so yeah should

[49:48] Drew Henry: yeah oh yeah

[49:48] Steve Zimmerman: does everybody have what they need right now

[49:53] Eugene Boruhov: Yeah, I mean,

[49:54] Drew Henry: you'll get it yeah go ahead

[49:57] Eugene Boruhov: no, no, I'm just, yeah, I think we have everything, just need to, like, we haven't blocked anywhere, I mean, we just need to, like, figure out the database question, like, there are a lot of sources and so on, so we just need to double check what access we do have and then ping you, but on the other things, we are not blocked. planning the release i believe to monday and yeah we'll just been giving Slack about how things going on.

[50:26] Steve Zimmerman: great is there going to be a release like a dev dot dev environment

[50:33] Eugene Boruhov: Yeah, yeah, first staging.

[50:35] Steve Zimmerman: that's the [rocketresume.dev](http://rocketresume.dev) or is that different

[50:39] Eugene Boruhov: Let me check. Is it

[50:42] Denis Urban: Yeah, it's still a pleasure.

[50:42] Eugene Boruhov: yeah, [rocketresume.dev](http://rocketresume.dev). Yeah,

[50:45] Steve Zimmerman: okay um awesome and then uh one other note i think i mentioned it but like eventually tenants and this is way down the road, the tenants are going to hopefully sign up with like a CNAME once. So I don't want to have to do it like the API should work. Everything. So I'm guessing everything runs on a path, not a subdomain. And so then we can CNAME one route for per tenant. So I don't know if that makes sense, but I'd like to make that eventually. Like right now, it's fine. I don't care. But like if you can think of that. like how you architect things might change i don't i know that usually switching that stuff's not hard but i just want to put that out there for the future

[51:33] Eugene Boruhov: okay. Yeah, one short question. I just don't remember. We discussed what What should be called globally versus tenant scope? Like is it block is inside each tenant or it's like global data?

[51:55] Eugene Boruhov: Tenant.

[51:52] Steve Zimmerman: so everything everything should be tenant level like even searching like so we'll be able to like turn on and off features but like you guys could build a widget we could build a whole new company with this platform

[52:04] Eugene Boruhov: Okay.

[52:04] Steve Zimmerman: and it doesn't have anything to do with resumes and it could be enabled for somebody who's a partner so i don't think we need to distinguish what everything needs to support tenants tenants i mean pretty much i think like job title pages are not going to be on every page we can't have duplicate content so like but they might have their own i don't know for now like we should be able to try to do as much as you can tenant don't go too far and don't go insane but like like try to be like analytics needs to be tenant um uh the content should be saving a resume should be um all that should be in domain eventually not today though exciting exciting is it going to have a better page speed score than our current page there

[53:08] Eugene Boruhov: Sorry, what is it? Page speed score?

[53:11] Denis Urban: Yes, of course, for sure.

[53:12] Steve Zimmerman: it is that's that's all right there it is yeah it's not hard right now we're like a 50 or or something.

[53:23] Eugene Boruhov: Okay, so I think it's a good discussion. Yeah, a lot of things now clear. So we have a clear roadmap and a lot of things to do.

[53:35] Anastasiya Sokolova: Steve, do you want us to schedule some check? checkpoint with you on your time, once in two weeks, in three weeks, once a month.

[53:45] Steve Zimmerman: No, I can hop in on these. I mean, if we want to do a call after you guys deploy to show us around or I can hop in.

[54:18] Steve Zimmerman: Yeah,

[53:57] Eugene Boruhov: Yeah, I mean, if you don't need call, I think we can just solve everything in Slack, like in a way we do this currently. For such sort of things like onboarding, if it's complicated for us to find common time, I can just record the Loom. It works great. I mean, we use it often for clients in different time zones, so I can explain things there. So yeah.

[54:23] Steve Zimmerman: perfect. And that's probably makes you go faster, too. That's great.

[54:29] Anastasiya Sokolova: And we also have a plan to have a call with Tariq just to show the CMS and working with pages and agree on the level of flexibility he wants to have there.

[54:41] Steve Zimmerman: Awesome. Awesome. Yeah.

[54:44] Drew Henry: yeah yeah

[55:25] Drew Henry: yeah

[54:45] Steve Zimmerman: And if you have a meeting, you can add me to that one. i don't necessarily i don't love meetings like i think you guys just hands on keyboards that's done like that's really the philosophy but um if you guys need a call i'm happy to hop on these periodically or we can do every once in a while we can do an 8 a.m my time i know it's not great for everybody but um i don't know let's play it by ear i i mean i think this is fine with drew and i can hop in it's gonna be less and less i'm gonna be like i'm gonna be i have all these ideas that i've built up so like eventually they're all going to be built and i'm going to be like i have no more ideas and then drew's going to be the idea cat

[55:28] Anastasiya Sokolova: Sure,

[55:36] Anastasiya Sokolova: that's

[55:29] Drew Henry: the idea of looms as well uh because they can be their meetings and they can be multiple meetings a week you know what i mean um that we don't have to get on the call for as well so yeah that sounds good

[55:41] Steve Zimmerman: perfect

[55:42] Anastasiya Sokolova: the plan. That's the plan. Thanks.

[55:46] Steve Zimmerman: well anything else

[55:48] Anastasiya Sokolova: No, that's it for today. Thank you very much for your time. Let's stay in touch. Bye.

[55:53] Steve Zimmerman: sounds great have

[55:53] Eugene Boruhov: Yeah, thank you guys. Have

[55:54] Steve Zimmerman: a good day

[55:54] Drew Henry: you guys

[55:55] Steve Zimmerman: bye

[55:56] Eugene Boruhov: a good one.

[55:56] Denis Urban: Thank you, bye.