# ShipCru & FR - weekly sync

Date: March 18, 2026   (GMT+1)
External: mailto:ivan@rocket-resume.com, mailto:steve@rocket-resume.com, mailto:tariq@rocket-resume.com, mailto:gabriel@rocket-resume.com, mailto:drew@shipcru.com
Participants: mailto:eugene@gitnation.org, mailto:denis.urban@focusreactive.com, mailto:aleksei@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Dennis to test search performance with large dataset (20-30M entries) and implement KV caching if needed
- [ ]  Steve to send database export (job titles, industries, skills, work experiences) via Zip file
- [ ]  Dennis to adjust sitemap generation to align with canonical configuration in CMS
- [ ]  Dennis to create demo deployment on both Vercel and Cloudflare to test routing/rewrite strategy
- [ ]  Dennis to implement better auth integration (coordinate with Gabriel and Yvonne to avoid duplicate work)
- [ ]  Steve to grant folder access for roadmap using correct email address
- [ ]  Steve to follow up on down payment invoice via Slack

### CMS Progress & Features Demonstrated

- **Keywords landing pages**: Similar functionality to job titles and industries with section reordering, template variables, and suffix variations
- **Canonical URL configuration**: Star checkbox system to designate canonical forms, with configurable redirect strategies
- **Content structure**: New schema for resume content with 6 categories and separate discriminator, 500 test entries imported
- **Relational data**: Job titles linked to industries, mirroring current Cloudbase structure
- **Search functionality**: Parallel trigram and semantic search across all content types (resume content + job titles), with configurable priority and streaming results to improve performance
- **Sitemap generation**: Basic version implemented that checks tenant page configs and generates based on access permissions and suffixes, needs adjustment for canonical alignment

### Database Selection Decision

- **Leaning towards Superbase**: Offers true geo-based read replicas across multiple regions (unlike Neon and PlanetScale which only offer same-region availability zones)
- **CockroachDB considered**: Has 85% Postgres protocol coverage and vector support, but team has had issues using it with Drizzle ORM
- **Final direction**: Likely Superbase since workload is read-heavy and team is using Drizzle ORM

### Rollout Strategy Discussion

- **Approach**: Use Vercel routing rules or Cloudflare workers as reverse proxy to redirect specific paths (e.g., /resumes) to new server
- **Current setup**: Cloudflare is already in front of Vercel
- **Client-side navigation**: Should work seamlessly since it's JSON for client-side rendering passing through the worker
- **Demo needed**: Team wants to see proof of concept for how routing works when clicking links

### MVP Priorities & Phased Approach

- **Before production deployment**: Need design from Habitat, analytics implementation (Mixpanel), consistent header with sign-in, and better auth setup
- **MVP goal**: Get landing pages to production with CMS where team can manage sites and pages with new design
- **Phased rollout**: Landing pages first → builder redesign → profile → payment functionality
- **Current focus**: Backend CMS functionality and landing pages, not builder yet

### Design & Content Coordination

- **Habitat partnership**: Working on design system that will be implemented once ready
- **Landing page variety**: Most landing pages are the same with zero sections; one unique example is /resume templates or /free resume templates with different layout and color
- **CMS flexibility**: Dennis can invite marketing team to CMS once ready to test page-level template overrides and modifications
- **Copy development**: Marketing will write copy aligned with design blocks once designs are finalized

### Canonical & Metadata Discussion

- **Current limitation**: Can only set one canonical per job title, but configurable at job title level
- **Suggestion**: Create generic pages resource with canonical and metadata for all page combinations, including keyword landing pages

### Technical Notes

- Search may need optimization for 20-30M skill entries, but Postgres trigram indexes should handle ~200ms with potential KV caching
- Team is using Drizzle ORM consistently
- GraphQL endpoint doesn't expose all needed content/job title information

Notes

Transcript

Hi Steve. Okay. Well, How's it going? I'm busy, busy, but okay. How are you?

Good. You've been busy also.

I'll just take you one more time. Like it is database migration or you have something like even higher?

That's like the dev stuff. I have a lot of higher things like. I mean, we're hiring people and we're, legal stuff too. And so it's just like that takes up a lot of time. Yeah, and then I tried, and then I tried to code, vibe code inside, and that never works out. Thank you. It's the 90% of the way there and you're just like annoyed because you got to find the last 10% and write the code.

Yeah, that's true.

Hey, good morning. Hello there. How are you?

Good day, good day, good day, guys. Excellent.

There's that positive attitude. Good. I've already got the... The call with Hebert?

No, that's right. Okay, I see. Okay. Good. We don't have that much time, I guess. Yeah, Dennis. Are you going to shine? Yeah. So. I hope so. Yes, sir. Good. Hey, Tarek.

Hey, guys. Good to meet you guys.

I wanted to just kind of jump on and just pay a little attention, but just be a fly on the wall today. Great. Okay, so hopefully I can see it. Yeah, so again, I'll start one by one, starting from the keywords, landing. Uh. Nothing much to show here, I think, as it works in the same way as job titles and industries. So basically... the same thing as I showed the last time. Uh... So right here with all these features like section reordering, template variables and so on.

It does also use suffix variations. So it generates keyword landings based on this configuration. Also, here you can see a few more new things like the star next to the word. the checkbox here what it basically means is that this particular word is a canonical for this form so we can decide what job titles is actually a canonical URL. So all the other URLs can point to that canonical URLs or redirect to that URL.

And this is also configurable here. So you can choose the strategy you'd like to have. So for now, it's just as a proper meta text. Um... you can have just one canonical form, particular word set. But you can swap them as you like. Um The next thing I think is a new structure for the skills for resume content entries. So yeah, That's like six. categories with a separate discriminator here. I did import like 500 entries here and for job titles it's this many.

Not all of them, just enough to test things. But yeah, everything is clear there. I guess I'll just need to get the sources somewhere. I don't think that GraphQL endpoint exposes this information for contents and job titles. So yeah, just a single entry here for now. Okay.

Are they relational? Like the job titles are inside an industry?

Yes, they are relational. So job titles are linked to the industry. Yeah. So basically in the same way as your current cloud base does have. The next thing is, I think, search. So, yeah. Let me show how it works. Um So, For now, it works. like into separate parallel ways. It does a trigram search. It's like an advanced string matching and also semantic search. And yeah, you can tweak the order here by adjusting the priority here.

But yeah, so it pulls all the data into single collection. For now, it just resume content. So all the six type of entries and job titles. So searches across all this information, but it can be configured to search only across job titles or only skills or anything you'd like. Um, It may... work slow, I think, on the remote as diagram search is slightly faster than the semantics, so I think I'll tweak this a bit, it will stream in the semantics results, just to avoid the slow speed you know, performance in terms of search results.

Do we want to, I mean, So I think it's going to get slower the more injuries we have, right? Yes, definitely. I want to be able to search job titles, industries, skills. work experiences and we have upwards of 20 to 30 million just skill stuff And so I think it might make sense that we instead of optimizing maybe this is go to like an index space search or some sort of...

Yeah, it does. It does use indexes and like trigrams. It like has a separate index type in Postgres. So... I think it does pretty quick. I'll test how it works in a large amount of data, but I think it's like... it will take maybe 200 milliseconds, but we can also introduce KV caching in between just to speed up the whole search process.

I can give you the database too. I have all our job titles, all our industries. And the schemas is a little different, but it's basically what you have. And then all those skills, work experiences and stuff. Most of those are AI generated, but we can, share them all.

Okay, yeah, I think I can get it myself from your GraphQL endpoint. So yeah. Sorry?

Don't overwhelm it. No, how about I just, I have it already in Zip. Let me just send it to you. Okay, sure. just to be safer. Okay.

Yeah, I think that's pretty much it. Not much for today.

Do we have like a title landing page?

subtitle landing page. I'm not sure what do you mean exactly?

The job title.

Yes, yes. I mean, like this one and for industry as well. So I didn't show the things that I showed the last time. So yeah, everything is here. Just a broken template. It's my fault. But yeah, everything works in the same way it did before. One thing, We already have some basic version of sitemap. It does check all the tenant page configs like what a particular tenant can have access to in terms of pages and suffixes and generates based on this configuration.

But for now, it doesn't. Count like all the canonical stuff that you said in your CMS right here. So plenty of interest here, let me show. So yeah, I'll probably need to adjust that to make it more aligned with your current setup. And yeah, the same for job titles. Yeah, I think that's it for the... CMS part. Um... or database I haven't decided yet. which one to choose but I'm leaning towards Superbase as it offers like true geo-based read replicas across multiple regions unlike Neon and PlanetScape they just offer in the same region but multiple availability zones so it's not really worldwide I'd say and It will be just read your application, but I think it's fine.

as I assume you have mostly grid-heavy workload, right?

For this, yeah, so I'll be reading basically.

Yeah, so I think...

It's consistently consistent. It doesn't even have to be.

Yeah. Yeah, also thinking about CockroachDB, So, yeah, I'll probably ask how was your experience with it. It does say it has like 85% coverage for Postgres protocol and all the features, but I still need to check how it works in real life. It also has like a vector and... all the indexes type so I think we should be good but yeah I need to double check if it worksYeah.

I mean, when it comes to database, I think SuperBase is probably a great option, even Neon. I think the idea of vector searching is important. the But in the end, we'll just cash it. I don't even think we need global REEDs. Maybe we do, but, Yeah, those will be, I imagine, will be hashed pretty aggressively on the reads so that we don't aren't hitting the database very often anyways. And I think cockroach is probably overkill, but we've had some issues with using it.

We are using drizzle, so it'd be nice to keep that Um in our ecosystem but open to other ideas still that's good for you Yeah, we're using drizzle as well. Okay, good. Yeah, drizzle with cockroaches like not been done yet. There's also down a little bit. So it's, yeah, so something where eventually when that's there, I'll be good, but I think we would probably, I would probably hold off on cockroach.

Okay, okay, go on. Okay, so this is probably going to be a super-based time. Um... Yes, so for the I think that's it.

Yeah, so what are you, what's next? Like. I have a few things in mind. I don't know if that I guess we could get this. The point somewhere, I mean, how do we, I mean, we're working on the design that will have to be implemented. Like we're gonna need to do tracking on the front end if once we, and it needs to be consistent with our current one. And so I'm thinking about that right now, but the, like how we roll this out.

So let's just say the design was working, everything else was, was, high quality, how do we start to roll this out. Uh. Yeah, I guess we'll also need better auth integration too. I think you mentioned that last week, but I'm assuming that that's probably going to start slowing you down a little bit. Um, but it would like just figuring out the tenant structure of that. And then We'll have to make a decision on how to do that with our current, I guess, with cockroach.

and then migrate that to multi-tenant or vice versa. Um, Yeah, and I think it's going to be in cockroach for the authentication. So I don't know if that's something else that we want to work on. I don't know what the next, what do you have in mind for the next phase?

Well, I think it's going to be, again, design stuff. And I have a couple of few things to improve here.

One thing I said is for sitemaps, probably we'll move something like in CMS in different places, but in general, Yeah, better off Um...

Yeah, plenty of things. So I need to think What should I focus on? Probably the design is the last thing. So once I figure out all the stuff I have pending right now, like to keep to have it's purely working and without any bugs and such. I'd like to focus on better auth. So if you have some like knows about that, that would be great. And regarding the rollout, I was thinking about redirects configuration the verse vessel so you can have like rules for each individual page or like a pattern so we can I redirect all the traffic to the new Cloudflare Infra.

I can probably show you. Paul Gluck's. How would you redirect, right? Like the URL should be the same, right? Not exactly. So it can be like a different domain and Cloudflare, anything Netlify. And the thing is that it happens on the edge, so it's pretty quick. So let me share the screen. So yeah. I think you have your current website deployed on Verso, right?

It is on Vercel, our current one, yeah.

Yeah, so I was thinking between Cloudflare and Vercel, and I think Vercel is like... more easiest way to do that. So you can just go to CDN, routing rules, create role, and here, like we can use pattern and let's say we'd like to rewrite all the resumes Resumus. paths to point to our new server so we can do that here And let's say rewrite. Well, that's the only option we need to use. And we can like set our workers that therefore whatever it will be.

And I think that should work. It works like reverse proxy, so users won't see any domain swap or anything like that. It should be instant and caching should work and all the stuff. I think we can do this on Cloudflare.

Right now we have Cloudflare in front of our cell.

Oh, you have-OK, OK, that might change things. OK, we can do that on Cloudflare 2. So we'll need a separate worker that like redirects all the traffic to required locations.

Then how is the internal page routing going to work? So if you're on that, I mean, so the idea is like to the user, like slash resumes is still gonna be slash resumes on, the new one, but yeah, so I can see a rewrite and then Like when they click a link in there, How does that client-side navigation work? I guess it's since this client side it would just, okay, it should just work, right?

Bye. Yes, I think so. I mean, it's just JSON for client-side rendering. and it just went through this new worker. It will just pass it to the Vercel and I think it should be fine.

Okay, yeah, so I would, Um, see if we can get a demo of this in some way or another. because this one is interesting. And then also like what happens when you click a link? I guess all those will be. normal links when you're leaving the page, right? Yeah. So then they'll go and re-fetch the page. And then like that's going to be like where that line is like we'll start off in one place, but as we go down like it will evolve.

Awesome. So that's interesting how to do that.

Yeah, OK. I'll do a little demo and deploy.

the same project on both Verso and Cloudflare and we'll see how it works.

I think that's a good idea. Um. Yeah, so we're waiting on the design for us. In order for us to deploy this, there's a few things. Obviously we need to design, we're gonna need to do analytics and like our header It does the sign in like we want to be able to sign in on that home page so. Gabriel and Yvonne have been working on it for some time now and can help out with the authentication. But we need to get that better off set up, I think.

Thanks. And then the next phase is the builder. And I think phase MVP of the builder is match current functionality. And then the next phase will be like, uploading your resume, I think there's going to be an off project. Sorry, I'm getting really far ahead, but. There's just trying to throw things out there and see what you guys feel about it. But yeah, no, I mean, that looks really good. That's really impressive for, for how long we've been working on this.

I'd love to get a page where we can poke around andPlay with it.

Yeah, me too. Good work. Jim.

Yvonne, Gabriel, do you guys have any thoughts? Oh, I have one other thought before we transition is the canonicals are, it means basically you have one, right? Like we only have one canonical page. What if we wanted a canonical to like three?

Yes, that's how it works for now. You can just have one canonical for a job title, but you can override that on a job title level. Okay. So probably Yeah, I'll think it through how to better do that in CMS so you can have multiple combinations for canonicals.

Would it make sense to have like a pages resource that has like a generic canonical and a generic, 'cause we're gonna have to have descriptions for even those keyword landing pages. Like,All right. a metadata like we have the keyword landing pages with all combinations but then we also have a generic page for every page that is uh includes anything we want and then it's just one resource instead of doing it on the keywords or whatever, but that's the thought.

Yeah, okay. I think about it.

How to do it properly?

And then maybe like even a keyword. combination. I guess that's not really a resource, but it could have a page. Okay. Just to get out loud. Good, good, good work. Yvonne, Gabriel, do you guys have thoughts? Tariq?

Ta-ra. I think it looks good. Yeah, excited to see a demo we can play with too at the time you asked. You know, you published that. But also, yeah, open to talk about the weather outing. No questions. I see it looks good. Good. That's all for me. Okay. Okay, cool. Thank you. Yeah, nice work.

Steve, do you still expect... That is to integrate the better thing for the next call or...

I--What is the question? I don't have a clear, I'll let you guys kind of pick what you think is next. I'm just trying to say like, we'll need that before we can deploy. And there's still a couple other things, obviously the design, analytics need to be consistent all before we can push this to production. And so I'll kind of let you pick it expectations wise. Like, I just want to keep moving at this point.

I think we're making great progress. And so I think if... Yeah. Dennis. Yeah, if Dennis wants to work on better off, then I think that that's probably important. Let's just make sure we're not going. into redundant work between what we were doing already done on our end, but so we can give like maybe a a document or something to kind of sink on that. Uh, So my expectation is just keep moving towards the MVP.

Got the teams laughing and giggling over there. Yeah, sorry.

That's fine.

I just forgot the word in English.

Oh, this is okay.

I guess hold the time. Great.

So yeah, in case you give us the flexibility and the You know, it's up to us to decide what's picking up next. Yeah, I'm leaving it all to Jen to do that is to pick the correct priorities then.

Yeah, just to reiterate, like whatever the, like we have our MVP is to get this on production where we can manage sites and pages with the new design. And I would think that that's even before the builder gets redesigned. Now we can start working on the builder before that. But I think I'm picturing a phased approach, like the landing pages, then the builder, and or the profile. And then the The payment stuff is sort of, I think down funnel is probably the way to go.

And it's not like the best experience for users, but it's still, it's probably the fastest for us to build. unless somebody else has a strong opinion. I just, we just want to get to that. as quick as possible.

A couple of more things as a friendly reminder to you, Steve. The first one is that I've requested the access to the folder that you've shared with the roadmap. And you shared it with the... Yeah, with the focus reactive email, but my Google SSO is attached to the other one. I've requested an access to the folder. If you can... if you could share it with me, or I will just... double send you the incorrect email address to share it with Google for the access to That is the first one.

And the second one is the down payment in case you somehow missed that one. The what? the down payment. invoice. What about it?

I paid for that, right?

So yesterday we talked about the advanced payment invoice that I issued in the beginning of March. You were going to make a payment yesterday. Yeah, I did. I sent that. You did. So like the accountants have not marked it as pay then. Okay. I got it. Yeah.

It's going to, I mean, it's an international payment. It's going to take a couple of days to get there. Good.

Good, then. I'll send you then the email with the...

We can... Let's just keep payments between you and I, but we can do... I sent you a... You should have gotten an email when that payment went out. I have not. Okay, let's slack about it. Cool. Good.

Thanks, Steve. Yeah. Like Justin said. Okay.

Yeah, I'm just trying to grasp, guys, where we are and sort of, you know, where we're sort of going. And here's sort of what I understand, and please correct me if I'm wrong here, right? Right now, we're kind of just focused on the back end, right? And really kind of creating sort of the functionality and the application itself. So the CMS as an application And then we'll sort of get to the builder eventually.

So one point of clarification is we have still not got to the builder is kind of my understanding, right? We're just focused on the CMS as sort of phase one. That's an accurate statement. Guys.

Yeah, yeah. So they're focused on the landing pages right now. And so, But we have a ton of landing pages. They're all kind of the same. The idea is that you guys will be able to modify and change them. So he showed the dashboard for where you would be able to modify those. right here and then like every job title as you can do modifications, we can add more content in here. So if you wanted to do a section that was just Open content markdown or something we could add that okay.

He's basically a Correct me if I'm wrong. We're just wiring up front end long term, which might be only a few weeks, is that we're implementing the designs that we get from Habitat and then moving down funnel with the builder using the new designs. And right now he's done landing pages and the content, he's put fake content up there. And so for searching, Um, And then in order for us to actually use this on production, there's a couple of technical things.

But we also got to do, we still got a lot, like we still got to do analytics. We got to do the design. And then we go to authentication on the server. on this version, which will be basically a port from our existing authentication, but still needs to be added and wired up in CMS.

Just on the analytics piece, that'll be like, Mix panel and getting the code end to end.

Yeah. Okay. Okay. I got it. Okay. Thanks guys. So, yeah, I mean, I kind of agreed with what Steve said before is really, you know, to take sort of this phase approach, you know, we're currently working with habitat and just sort of, you know, really getting sort of the, the design piece down.

We're going to start writing copy and align the copy blocks and the with the design and then once those two sort of are there, then you guys can build sort of the CMS to really align with that, right? We'll take kind of a page-by-page approach But I think one of the things that might be helpful at this time is to understand like when Steve says, hey, there's just multiple landing pages and some of them aren't the same and some of them are not.

If... If I can start to understand how many landing pages, how many variety of landing pages are there and how they're different and just some examples maybe that might be helpful as to what you have and what you've seen. Or is it all the same? I'm not sure. I get it.

Like they don't even have access to that data yet. So like I can... I can share that. You're going to be able to make those changes. So I think the whole point is so that you can do those. We do have one, just so everybody knows, there's the resume. So Dennis, we have like the slash resume templates or slash free resume templates. I can give you the exact data, but basically like if you go to Rocket Resume, it's the only page that's kind of unique in its landing.

Yeah, if you scroll up, like it's just kind of a different layout. different color call to action, but it's the same component and all we're doing is passing in a few properties that modify. So this is one example that marketing wanted that we implemented viaBye. our current CMS. So this can stay or this can be redone. But I imagine right now everything's going to be basically the same. With zero sections, we'll change it, and that's it.

You can actually modify. You can choose... like individual pages and modify as you'd like. So yes, you can modify just this exact page in the CMS with templates overrides. I'll try my best to invite you as soon as possible to the CMS once it's ready. So you can play around with all this stuff.

Steve, we have that other call with Habitat right now. I know, I know.

Yeah. All right. Well, we got to get going.

Good work guys, keep it up and then. Like I just any questions or things on feel free to reach out and slack I'll send you that data that is. We can go from there.

Yeah. Thanks again. - Yeah. - Thanks again. - Thanks, sir. - Have a good one. Cheers, everyone. - Bye. - Bye.