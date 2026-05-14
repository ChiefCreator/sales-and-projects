# ShipCru & FR - weekly sync

Date: March 25, 2026   (GMT+1)
External: mailto:ivan@rocket-resume.com, mailto:steve@rocket-resume.com, mailto:tariq@rocket-resume.com, mailto:gabriel@rocket-resume.com, mailto:drew@shipcru.com
Participants: mailto:eugene@gitnation.org, mailto:denis.urban@focusreactive.com, mailto:aleksei@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  @Denis to handle data migration from Google Drive and taxonomy database
- [ ]  @Denis to implement Cloudflare routing on .dev domain for QA testing
- [ ]  Yvonne to spin up CockroachDB development database and provide ENV credentials
- [ ]  Team to refine analytics requirements (server-side tracking, Mixpanel, Google Ads)
- [ ]  Steve to verify Google Drive access permissions for Denis
- [ ]  Team to identify and document master data set for migration (published and unpublished content)
- [ ]  Follow-up meeting scheduled for tomorrow same time to scope analytics and other features

### CMS Architecture Progress

- Merged tenant collections into single unified entry controlling domain, page configs, and future theme customization
- Added extended keyword landing page strategy with flexible pattern control using template variables and fixed words

### Cloudflare Worker Demo

- Built routing demo showing worker sitting on edge to redirect traffic between Vercel and Cloudflare based on KV storage config
- Works with client navigation, page refresh, and programmatic routing
- Disables client-side prefetch using HTML Rewriter to force hard navigation for pages with different bundle architectures
- Can be configured to listen to production domains like [rocketresume.com](http://rocketresume.com)

### BetterAuth Integration

- Implemented dual authentication connecting to CockroachDB (currently using separate Postgres for demo)
- Creates sessions in separate database and syncs shadow users to CMS for permission management
- Team clarified no need for seamless cross-domain session persistence - users will re-login on different brand domains
- Plan to unify both login methods into single experience connected to CockroachDB
- CockroachDB will store all user data, tenant data, and resumes while content stays in CMS database

### Tenant Access & Permissions

- Clarified that only select users (tenant admins/owners) will have CMS access, not regular users
- Will implement onboarding flow where internal users can designate tenant admins who can then invite tenant users

### Data Migration Planning

- Denis has spent 65 of 80 budgeted MVP hours, with 15 hours remaining
- Shared data includes job titles and industries JSON files with mapping from old to new schema
- Need to migrate both published content and unpublished taxonomy data
- Can query taxonomy production endpoint to get complete dataset
- Sitemap queries provide good reference point for data structure

### Feature Parity Requirements

- Need to implement auth modal on landing pages
- Must add server-side analytics tracking (Mixpanel and Google Ads via Tag Manager)
- Search functionality to be addressed
- Homepage builder section can be delayed
- Analytics currently impacts page speed significantly - opportunity for optimization

### Next Steps Strategy

- Goal: Start using new landing pages on production website
- Deploy to [rocketresume.dev](http://rocketresume.dev) for QA testing before production
- Focus remaining hours on architectural/full-stack work rather than manual component work
- Consider reverse proxy approach: place worker in front of production to gradually swap pages

Notes

Transcript

The Xweather website is Life.

It's very nice.

I saw lots of messages in their channel. Yeah, I had a call with...

Is there a channel?

Yeah, yeah, yeah. I had a call with Vladislav tomorrow. Oh, yesterday. And he was like, not excited.

Yeah.

About the release, right? Yeah, yeah, yeah.

Many, many questions and stuff. Hello guys. Hello, goodbye. Good afternoon. Hello there, Ivan. Hey, good morning, guys. Bye. Wonderful. How are you? Good, good. How'd the week spin? Thank you. So far, it, uh, Yeah. Normal, I would say. Thank you. What are we now mostly working on? So, Now we're working on Migrating the database, moving some data. Over a new a new day, please. Yeah, it's been fun. We need to check multiple things there.

We're close to finish. I can see that Steve has changed his haircut. I did.

I got a haircut. It was long overdue. I wait too long, it's like a minute. That's a mess. So I gotta get Erica to run this one.

How are you, by the way? Good, busy just.

500 priorities at the same time is hard sometimes.

It's good. How's everyone?

We got a, is this everybody? Yeah.

From us, thank you. Okay. Bye now.

Good call. Let's get started. Yep. We have. Okay, hopefully you can see the screen.

Yeah, yeah.

Okay, so I'll start with a few CMS changes and then we proceed to. Cloudflare and better off, I think. So, yeah, mostly the visual change for tenants. I merged two separate collections into a single one. So it's just one entry that controls both the basic stuff, like the domain, as well as page configs. And later we add the theme customization here as well. So it's going to be everything in one place.

keyword landing thing, it's right here. Also I added a the extended strategy for pattern control so you can like specify basically everything and it will be generated in a runtime let's say so you can have different variations of words like fixed words template variables and you'll have them all here and all the pages are accessible. like it was before, like with all the different words. So just more flexibility in terms of landing page generation.

Um... Yeah, so... Moving on to the Cloudflare, let me reshare the screen. Um... This one. Okay. Okay, so I built a simple demo. with like simple pages to demonstrate how routing works. when there is like a worker on top of different providers like Versil and called Flare in our case. So So yeah, just simple pages. I didn't add anything specific like landings, job templates and so on. So just to demonstrate how the routing works.

So you can see here the header appears, which is the Cloudflare CMS project. with Greenheader. Blue Header is like a demo Versafil project with the same pages. So yeah, you can just navigate through the pages and it will dynamically redirect based on the config in KV storage where the traffic should be going. It works with client navigation, refresh the pages. programmatic navigation with a router push.

So, Yeah, I think it covers most of the cases you have in your monorepo. Like, it I made the stuff like Next Image Optimizer, and app routers, so it We might get into this later, but yeah, it just works specifically on the PagesRouter. Um... That's because how Next.js handles the Um... JSON files, let's say. But yes, we can replace it with actual files and actual pages, live pages. Um. Yeah. Awesome.

How does that work exactly?

So I just created a call for a worker that sits on the edge. And it. like listens for the traffic that comes to the domain. So you can actually configure in the settings I think. Yeah, so Later on you can just set here rocketresume.com. It will listen all the traffic and redirect to the specified pages. to the actual pages, I mean, based on the config you specify in the KV namespace. So yeah, it just redirects, listens, and redirects.

the Actually, key moment here is that it disables client-side navigation, like all the prefetches and the way like Next.js don't lost the JSON file instead of hard navigation. So I had to disable it because of the bundle differences. Like we're using app-router, you're using pages-router and all the other things like different components. So yeah, all the pages here. here, we'll have disabled Landsat navigation, so link click, like we'll do the heart navigation with ATAG.

So that's like built into the link component? Yeah, kind of. So actually the Cloudflare API has a nice feature called HTML RearWriter. So basically as the snippet of code you define a script. to the top of the page, HTML page, and I just rewrite the default behavior of the link. So instead of like, glance navigation does the the usual heart navigation. Ah, yeah.

And then on the client, it's just like, checking whether it's like the full, I mean, so it's not, is it doing a full page refresh?

Kind of, so it does the usual anchor tag behavior so yes it's hard navigation but only for pages defined here yeah Okay. Um... Yeah, so to the next point, the better off. Share the screen again. Yeah. This one. Yes, I'm not sure if I have... Uh, enough to show like here Let me actually close the browser and open up again. We'll host again, sorry for that. So Basically, I replicated the same setup you have in your Mono repo.

with better auth, so it now has two possible ways to log in. The bottom one is just payload native with email and password and on top we have like a separate better auth that connects to your CockroachDB. For now I'm using just the Postgres, just like a separate Postgres database with user tables and verifications and sessions and all of that. So yeah, you can basically log in with all of these for now.

This account is not on the CMS or like a separate table. nothing are different here. It's just creates a session in the different, database, it syncs this user to the CMS collection. So you can manage permissions and tenants over here, but probably it can be removed once you have these details in the cockroach. But for now, yeah, like, creates the Hello, Tolkien. I mean, it's great session. In the different database, it creates payload token and you can just work in the same as like a regular user outside.

Um, There is like an... I got you here. I'm not sure, I'm really uncertain about how it's gonna work in the real world. for the production setup with multiple tenants as you know, like would you like to have like a seamless transition between different domains and the CMS? For example, if a user logs in here, it will like, and navigate between all the different domains for example like srmaker.io or whatever you have and cms as well so to support multiple domains uh we'll need probably a separate auth service that does the session management uh specifically and all the other um servers and domains, just talk to it and try to create or claim the session.

So yeah, it might get... a bit more complex, but I think it's like covers the basic stuff. It just talks to another database, just syncs the shadow user here.

Questions on that, like, so, I mean, Yeah, I don't, the experience I was envisioning is more like a login with Rocket Resume on the other domains. So like, It will be the same login, but it won't persist. The cookies wouldn't persist across domains. But there's going to be a global user table. And so that would be, we'd have one login. And so I'm anticipating that you had two logins there. I would love, I don't know if that was just for demo or for development, but Like the user is going to log in with their one credentials and it just works everywhere.

And so that's where... We want to make that like a seamless experience for the user.

So you don't expect sessions to be persistent across different domains, right? It's just the same login experience.

Yeah, so like maybe my password ABC works at every domain, but I would re-login on other ones. It's possible that we only want to keep them locked to the one, Bye. like if I log in a Rocket resume, like I don't, I wouldn't expect to be logged in at whatever, tenant you have. It's possible We got to think through that a little bit more. I'm not 100% sure, but like, And maybe we can address that. Hopefully we can delay that decision until later, but like we're going to want one login experience for the CMS for their accounts.

and they get the CMS access if they're a techTenet. So like most people like Rocket Resonate right now is... those users I guess they belong to Rocket Resume. I don't know, I gotta think through that a little bit. I'm not a hundred percent sure. When you said that you need like another auth provider, What would we need? What feature would that help solve?

Or Uh, So yeah, like if you need another auth provider, you just add the plugin, I guess, and the better auth, and it just works. So yeah, basically the same here. I think we just need...

I thought you said another... odd service or something.

Yeah, that would be necessary if you would love to have this seamless transition between different domains. But you said you don't really need this. So that simplifies things a lot.

Yeah, I wouldn't think they would. Most users are not going to be Yeah, when you go to a website, I would think that you'd have to log in there. But I'm curious about... Like what do we need in terms, it would have to be something where you verify, like a universal token or something like how it is.

All right. Yeah, probably as all the domains have their specific cookies, so you'll need like a distinct service that tracks all the sessions and you know, like you log in in one domain, it creates a session, then you go over to another domain. It tries to create the session, but it identifies that you already have one. Uh, somehow probably Yeah, that's a good question actually. What can we use to identify the existing session?

No one does this, right? Yeah, no one. Google doesn't even do that, right? You've got to re-log in everywhere. So, yeah, I don't think we would... Yeah. Want that. Like these are different brands, like to the user, they don't even know that these are the same. Like they could not even know like they're the same. Yeah. Yeah. So yeah, they would log in separately and then yeah, we'd have different auth providers.

But the thing is like, so the, I just want to clarify that you had the two log in, one for the CMS, one for Rocket. That would be unified, right?

Yes, the one above was just for demo so I can login with my CMS users, but ideally you'll have just one login form connected to the Cockroach DB and Rocket Resume. Yeah, we'll just need to think about merging everything into one monorepo, I'd say, so we can share the better auth logic and reuse it across... Like... I'm not sure if you'll If you want to keep the rock and... like the whole Glass monorepo or you'd like to migrate over to the new architecture?

Everything's moving over to the new architecture in the long term. We're going to probably keep both for a while.

But, uh...

Yeah, so we'll probably bring that database over and can view a connection to it over on this one. Mm-hmm.

Thanks. Yeah, okay. So yeah, we'll need to keep it in sync for some time and as well, probably We'll still need to cover the tenants. So when you create tenants here, it'll probably need to be synced to the CockroachDB as well. What do you mean by syncing? I mean, do you want the CockroachDB to have all the user details like permissions, tenants, and stuff like that? Or is it just email and password, basically?

The coverage database is gonna have all user data.

And I imagine tenant data.

Can we query? multiple databases in the CMS?

Yeah, sure. It's just a regular Next.js app.

Yes, I was picturing that we would just connect those resources to the Cockroach database directly. Okay.

You mean like all the resources, job titles, all that, right?

No, no job titles. Like job titles, industries can stay here. All the content will stay here. Website data stays here. It's just like users and resumes. And then I'm assuming tenants will also be there.

Okay. Yeah, sure. We can do that. Bye.

Unless there's another alternative. Yeah. Hey, Eugene.

Yeah. Hi. Just one question. Like from the user perspective, like when I log in and Rocket Resume website, should I automatically get access to the CMS part or it's just a few users, you know, who can manage this part and some like regular users shouldn't get any access, right? So how we can differentiate them? Do you have like any like user table, have a column that can, be used to identify which user should have access, which is not.

Should it be similar like this or will it have something We don't have this functionality, but when we add it, it willThere'll be like something in the CMS where an internal user could probably onboard like say a certain person to be the tenant admin. And then the tenant admin could invite tenant users and then they will have permissions. So we'll eventually need that. like the reality of the tenant aspect of this whole thing is kind of more down the road.

We're building it into this now because Like we probably will launch a second brand, but it's going to be like all rocket people anyways. But yeah, there'll only be certain people that will have it. Like very few, the average person won't have this. Okay. 99% mold. There'll be a few tenant owners, but there'll be one uniform login.

Now that's clear, thanks.

Good question. Um. Cool. So... What's next?

What are you guys, what are we, what are you guys...

Thinking for next steps.

So actually, stupid.

So at first we were thinking to spend around 80 hours for the MVP. I know that Denis has spent 65, so it's like 15 more before he finishes the MVP. It's not very much, you know, should be fixed towards the MVP scope, etc.

But I just want to make sure that we utilize... there is time as sufficient as possible. Probably the rest of his hours should go to the full stack size, to something very architectural rather than doing some manual stuff about the pages, components, etc. If you have an idea about the... the further priorities to be more complicated, more complex for him, that would be... That would be better, yeah.

Good, let's get more complex stuff. I like that. What was it? So I don't have next steps in mind right at this moment, what other than the bigger picture. And so you guys can go about this. And the goal is to like, let's start to use your landing pages. on our production website. So there's like, Yeah, I mean, so like a user look comes they land on that. I mean, we're gonna have to iron out all the routes and everything like also I think I assume we're gonna have to support dynamic routes on that router when you're transitioning because like we have a keyword landing page isn't just we're not going to want to put all 800 of them or whatever they are in that config.

but Like, so ultimately, I would like, I'd love to, I don't know how we get this to like a QA standpoint, but like, I was thinking we would have We have our QA website, rocketresume.dev. I'd like to put or get, I don't know how we do that. Maybe we do it on Like maybe there's a different way of like the, the, the, um, I'm sorry, I'm a little tired today. Some sort of a... demo for like a QA branch.

We have master, but we also need to have the version that uses this.

Yeah, so is the domain assigned to the same Vercel project, but just like a different domain, right? So I think the feature Denise built and showed now, like all this routing thing, we can implement it for the .dev, like for demonstration, etc. It would be a nice start. But before this, We need to run a complete migration, right? All the job titles, all the industries, et cetera. So it could be also another one thing we need to handle.

So I think it would be nice to do on our side, just to like, Denise already have a script, et cetera. So from your side, you just need to provide us with this complete data and we need to plan in terms of like on the later phase when we're going to release this to production, should we like double thing this, like update, I don't know, job titles, et cetera, in case if you change some data between this testing and release phase.

So it's something that we need to plan. And yeah, I think preparation to the release is a good thing. It can be huge or small, difficult to say right now. But yeah, we have already, we have all in place, right? Our landing pages, all these job titles, dynamic routing features, and workers that can do the routing. And we just need to put this on the, like this .dev domain for testing and see how everything works in kind of production environment.

So yeah, that's my thoughts.

Yeah, so I shared the data. I'm not 100% sure that's the full data. Yvonne actually might know. Yvonne and Gabriel are still focused on that database migration, but you guys should start... Thinking about thinking, I think Um, there's a lot more than the content. Like we're going to have, Like, I guess we can temporarily disable search, but like the auth, Like we have that auth modal on our page. Like we're going to want to keep that on the new one.

like all the job title pages need to be imported. So I think I shared with you now, I need to double check. Because right now we have like three versions of the content. We have the one that's on Rocket Resume. Yvonne, help me out here. But I think we have one on Rocket Resume that is our legacy content. It is a bunch of industries and job titles. And then we have a bunch of unpublished content. And that unpublished content I would want to publish it.

At some point, it doesn't have to like the MVP can just be exactly what we have today. But what I want and what we were working on in our taxonomy package, I don't know if you've looked at that. There's a a new schema for our content and job titles. So that's what I'm hoping that we'll have here is that like, For example, we have some that are published and like this one redirects to that one or a canonical from one to another.

But there's a bunch, I think the database taxonomy includes a bunch of unpublished data. Is that right, Yvonne? Or have we not pushed that yet? Yeah.

Yeah, I can double check. If as part of the scripts that we used for taxonomy, we also move the unpublished data. I think with it, we created a script to move everything. So taxonomy. Yeah.

So I think we have, we, what we got to do is like on our end is probably spend a half hour or an hour figuring out, um, And then what I shared with you is a good starting spy. It's in the Slack. There's a link. If you don't have permission, let me know. But it's like two Jasons. job titles and industries. And so And then there's a map from the old industries to the new industries. We just focus on the old industries and just getting that over.

And then eventually... we should be able with the CMS be able to migrate. Like we just say, hey, here's the new industry and then unpublish the old one. And so I want like all the data in there with half of it unpublished and then we can make the switch via the CMS. Does that make sense? Yep.

Yeah, that's clear. Regarding the access, I remember this. I believe Denise had an issue. He requested access. Me too. So if you have time just to double check on email or somewhere to approve those. But yeah, exactly. We can take the data you already put there, start from this and like set up everything what we need, all the preparations to the production release and at some point you will tell us, okay, we have a new set of data or just like few more data and we will just, it's probably better to replace, I don't know, clean up and replace everything.

Probably the easiest way. Something like this. But I don't think it's a huge thing. We now don't have production data yet, so it should be a safe thing. Regarding the login, it's a good catch. I think it's something we haven't added to the landing pages, right, Denis? Yeah, so I think we need to handle the same logic probably that you have already now, but just with new components, I don't know, new login button in header.

What's regarding the source? You mentioned that you'd like to hide it, but why? I think we can, I don't know.

So I'm just trying to think of ways to go faster.

Faster, okay.

Yeah, I mean, if you guys, honestly, there's a few things we haven't really talked a lot about. I brought it up last week, but like the analytics. Yeah. And I want to do it all server side instead of on the client. So we have to have tracking on the homepage. That's not really negotiable because we need to know conversion rates. That's everything we do. So I mean, we can do it temporarily without it, but I would still probably argue that we should do it from day one.

So the analytics, every time someone views a page, clicks something, We have a lot of analytics. I don't know a good way to do that. I was thinking we could do like a... a script. That like it's a separate app and you can download a script and it does very, very lazy loaded asynchronous analytics. And it just sends it to an endpoint. And then we can put that script on both sites. That's what I was thinking.

Or we could actually just do the whole module It's a convoluted mess like the current. analytics, it's, it's actually slows down our page speed significantly. It's like our mic. It's a massive, um, opportunity to fix. Um, That's one thing. So we got the search. Like, For example, we're going to start thinking about the builder. Because on our homepage, we have a section that is the first step of the builder.

We can punt that to later. like delay that but um So those are all basically like in order to reach feature parity, there's quite a few more things.

Yeah, we need to rise all of them. I think like a prototype that you'd like to have for like this production release that we think about like with untitled UI components and we need to reimplement all that stuff as we're going to jumping like me and another one, Dev, since the next week. We need to refine all the requirements for the features to build them because now we kind of know that we need to add tracking with all the, like, in your roadmap, but we don't have enough details.

So we need, this week, we need to refine all that stuff and understand that we get your, like, how you see this, what data you'd like to collect. Like you mentioned that it should be server-side. build the proposal, check with you and implement.

Maybe we have another meeting. I can do something in the morning tomorrow, but then I'm out of office tomorrow afternoon. Um And probably what half of the day on Friday. So, um, But I mean, I can be first thing in the morning. If you want, we can meet, we can scope this out and list.

Let's meet same time tomorrow then. Okay.

Then as far as... Like, The big challenge for Dennis is, I don't know, what do you... I mean,Bye. Yeah, I mean, maybe it's search or I don't even think we have a huge big challenge, but rebuild all of Rocket Resume by Friday. So I, the, I mean, as far as that, like we, there's a lot of things to do, but they're all kind of big tasks we can do. Like the search thing is gonna be there. Maybe I don't know, Dennis, Dennis, you're off for a couple weeks, right?

April? Yeah, yeah. Yeah. Yeah, I'm not sure what we got. I'm like a little brain dead right now. I got like nine other things going on, but the,Maybe we talk through that tomorrow or...

Yeah, we just need at least the initial ideas to move on. For example, if you mentioned analytics, that's a good starting point. It should be server-side. We just need to know what data you'd like to collect. I don't know how to...

We'll want to keep what we have now. Okay. And so we'll have, Like, Tracking is littered everywhere in the product.

Yeah, it's...

Yeah, we don't want to add any functionality.

We just kind of want to change how it works.

And the only really... There's two maybe three types of free tracking. It's Mixpanel, it's Google Ads, which is done through Tag manager, I think. And then there's Google analytics, which we don't really ever use. So I really just care about mixed panel and the Google ads. And then we do like, I think we do, I think it's through Google. And so I've been exploring options there. like your server side, Google Tag Manager, there's also just like an API endpoint.

And then we just, because Google ads, if we're not doing analytics, Google Ads can be done server side. And so that might be simpler, but I think eventually we're going to need Google Tag Manager on the server. And I, so I don't know the best way to do this. And like, I would lean on you guys to kind of, figure out some options but yeah we'll exactly replicate what we have today And so that's the primary.

And then, yeah, it needs to load asynchronously and the cues, all the traffic, and then like I was looking at doing it in a web worker so that it was off the main thread. And so just really focused on like long-term performance. Like, well, that's the big step we're doing with everything. It's like our database right now, it's just like, he's the last us 10 years. And so the tracking is last 10 years.

And then, um, Yeah, this new foundation that Dennis has been working on needs to last us 10 years. That's so we're over engineering a little bit. It seems like we're over engineering, but in reality, I think we're not because we're trying to go long term. So, Yeah, if you want to look through that tomorrow, I don't know if this, what do we want to do regarding, 15 hours of the time he's got left.

Again, I think you need to handle migration, because here it's in context. I don't need... Aus probably is a good thing for him to cover because he just worked on this for a bit and we don't want to make all this context up for another team member. And then, yeah... Then it's mostly preparations for the dev domain, probably the setup routing there. So it's also would be a good start because he created this worker.

He knows how the redirects rules should work. So these three points, I believe it would be Would be nice if he covered them. Yeah.

Do you think we could simplify this a bit, like placing the worker in front of your life? production like the rocket resume and just serve it like a reverse proxy and then we can just swap your pages with our We just need to figure out how to handle the header stuff with search and the login form. But yeah, I mean, it would be easier for now. You just access the. Yeah, I mean, you would just access the router.dev or worker.dev.

and it would just show your production website. And if you navigate to some pages, you would see our versions of these pages. with everything working in the header. So yeah, I think this is my main priority. What do you need for me?

Do you want to walk through?

I don't think I need something like... I can check it in the Modder repo, so yeah. Probably just the access to the Google Drive. just to populate all the data, all chunks of data. So yeah.

Okay, yeah, I just gave you access right now. Yeah.

Yeah, and actually, Cockroach, do you have some development environments so we can check the real user data or something like that? or we can point to the actual CockroachDB. Yvonne.

Yeah, I can help spinning up the database for you in Kogrouch.

We have some and give you the EMVs. Okay, cool. Yeah, I'll talk to you later then about that. Excuse me.

Yeah, I know. Sorry.

Yeah. Oh, I was just thinking the we have As far as the data, there's the data in Google Drive. There's also the data that's in our Dev database and matches production. So all the content stuff is the same in Dev and you should have access to Dev after you talk to Yvonne if you haven't already. But if you run the Vercel you'll download all the ENV variables for dev. It's actually in the package.json script.

But... So, We probably need to take inventory of all the content. I think, and Yvonne might have, do we have access to taxonomy and dev?

Yeah, yeah, I share with the, then use the URL. You can, it's actually public access to the GraphQL server. Beautiful.

Yeah, yeah, it is. Cool. Cool. Good. And so, I wish I knew. I'd have to go look at it. But can you guys try and help them figure out what is the master data that he should be putting in the database. Yvonne, I know that the, I think it's the, like if we look at the, I think it's in the code near the site map for job titles. And industries? That uses taxonomy still? Place to look Dennis is the generation.

I think I would point or entry point to check the data is the latest script we built to see taxonomy. We have the script to see taxonomy and queries all the data. Well, that's using the connection to the Prisma 1 database.

So, or we could maybe export those to--Prisma 1 doesn't have the unpublished data though, right?

Prisma One is production like the legacy, right?

Yeah, we don't have unpublished data in Prisma on production, right? But in taxonomy we do. Yeah. I want to give them the future data too. I want to give them the whole data set. So I want him to see current and the unpublished stuff that hasn't been pushed. I think that's in taxonomy. It is in taxonomy.

Yeah, then we can hit the production endpoint and get the data from taxonomy production.

Okay, yeah, and there's also the queries And the site map. So, Yeah, that's a good reference point. But the queries in sitemap are just querying the published. If you just change it to all, you'll get all the data. But I think that's the master data. Right. Yeah, I agree. I will help you guys out. Okay. Thank you.

I have some invitation for tomorrow.

Yudan, did you want to say something?

Yeah, just would like to. What we're going to cover next call tomorrow is probably like, unless it's tracking, it's kind of clear. If you have any other ideas, you can drop them. But some other features, like if you have a list of them or in your mind, we can cover them tomorrow. Just like how you see this, what we need to research, what we need to understand, and et cetera so that we could start from something.

Probably from proposal, from technical proposal, if it's not clear how to implement right now. But we need a list of things we can start thinking about, start working, building something. I see you have such a list like search API, block and CMS. I don't know what from those you can bring tomorrow. It would be nice if you should see this.

Somewhere. I mean, most of it is just meeting the current functionality. Let's go through it. And so I... Yeah, tracking, search, everything on the landing page off. And then the new design. Sounds good. I think all of it. Okay.

I know that you have another meeting. I'm not going to give you more. See you tomorrow. I've sent the invitation to everyone who is present at the meeting today. Awesome.

Good. See you tomorrow then. Thank you all. Cheers. Bye. Good. See you tomorrow then. Thank you all. Cheers. Bye.