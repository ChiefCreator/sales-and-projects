# ShipCru & FR - weekly sync

Date: March 11, 2026   (GMT+1)
External: mailto:ivan@rocket-resume.com, mailto:steve@rocket-resume.com, mailto:tariq@rocket-resume.com, mailto:gabriel@rocket-resume.com
Participants: mailto:eugene@gitnation.org, mailto:denis.urban@focusreactive.com, mailto:aleksei@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Eugene to move recurring meeting one hour earlier
- [ ]  Denis to share Cloudflare upgrade requirements in writing
- [ ]  Steve to upgrade Cloudflare plan ($5 for workers + 2 buckets for assets and cache invalidation)
- [ ]  Yvonne to share taxonomy schema file and sample data with Denis and team
- [ ]  Denis to add CSS/styling tab for tenant customization once Habitat team provides input
- [ ]  Denis to switch authentication to better auth implementation
- [ ]  Denis to finalize CMS collection structure (merge tenant collections)
- [ ]  Denis to research and propose search solution (considering Cloudflare vector search or Algolia)
- [ ]  Team to coordinate with Yvonne and Gabriel on better auth architecture and multi-tenant user management

### Infrastructure & Deployment Updates

- Cloudflare deployment is functional with no major blockers, though developer experience is less streamlined than Vercel
- All features tested successfully including caching with different validation strategies and draft previews
- Current deployment is on the team's account to avoid access/billing complications during development
- Database migrations present a challenge due to Cloudflare adapter's SQLite limitations (no transactions)
- CI/CD pipelines need to be finalized before production deployment

### CMS Architecture & Features Demonstrated

**Tenant Management System**   

- Collection-based tenant system controls page generation access per tenant
- Access control for industries and job titles with inclusion/exclusion modes
- Default behavior: tenants have no access (404) until explicitly granted
- Future styling/CSS customization tab to be added pending Habitat team input

**Template System**    

- Three-layer architecture: base template, template resolution engine, and variation sets
- Base template defines shared page structure (hero, metrics, testimonials, CTA, etc.)
- Template variables resolve dynamically based on page context during build process
- Variation sets provide content pools where each page selects unique values based on consistent hashing

**Page Customization**   

- Sections organized into three groups: top (ordered), middle (shuffled based on slug), bottom (ordered)
- Template overrides allow customization at industry, job title, or single-entry level
- Settings can be locked globally across all tenants
- Multiple overrides apply in defined order (handling of multiple same-type blocks still in progress)

**Job Title Suffix Variations**   

- Dictionary system for word conjugations and forms
- Generates multiple page variations per job title (e.g., "build resume", "create resume")
- Currently all variations are randomly assigned; canonical handling needs adjustment
- System needs refinement to match current redirect/canonical strategy

### Architecture Feedback & Validation

- Steve confirmed no concerns with overall architecture approach
- Team successfully identified and implemented many existing system patterns
- Cloudflare platform praised for cost efficiency and multi-region support
- Additional page types needed: landing pages/keyword pages (potentially thousands) with canonical/redirect support
- Content types extend beyond skills to six different text types

### Next Steps & Priorities

**Top Priority: Content API**   

- Focus on anything the homepage touches: search functionality, content suggestions
- Universal search needed across content, job titles, and suggestions
- API for getting content based on job title
- Search implementation is most critical for near-term progress

**Secondary Priority: Better Auth**   

- Users and resumes to remain in CockroachDB instance
- Multi-tenant support needed where users can access multiple tenants
- Coordinate with Yvonne and Gabriel who are working on authentication transition
- Denis to implement using open source plugin for Payload and better auth

**Lower Priority Items**

- Resume builder work can be deferred
- CSS/theming customization waiting on Habitat team's competitor research (needs a couple weeks)
- Production deployment strategy needs planning for showing both old and new sites simultaneously

### Content Migration & Data Needs

**Current State**    

- Content currently exists in 3-4 areas across Prisma 1, Taxonomy, and legacy databases
- Taxonomy has same dataset as Prisma 1 with separated schema
- Industry transition planned: unpublish old industries, publish new ones
- Legacy content databases need to be shut down to reduce costs

**New Taxonomy Schema** 

- Different structure from Prisma 1 allowing hierarchy of categories and parent categories
- Flexible parent-child relationships
- Configurable redirect vs. canonical designation for children

**Requirements**  

- Need schema and sample data from Yvonne for seeding new database
- Content from all sources to be consolidated into new CMS
- Vector search likely not feasible with SQLite/D1 on Cloudflare
- Algolia considered as alternative (expensive but good ranking feedback loop)

Notes

Transcript

Okay. Hi, Eugene. Even how do like the designs behave it for Talent Walk. Troop.

Haven't seen them yet. I haven't opened it yet.

Cool. Hey, how are you? Good, good. -Wonderful.

Based in Europe, right? Yeah. Yeah. Yourself? I I am in Nepal right now. In NAPL? No, Ecuador. Ecuador, I think. Okay, Ecuador.

Are you from there originally?

Yeah, yeah. I'm from here. I'm based here. Yeah, hopefully in the future we'll travel to the US and work there.

Is Moses Christos from Ecuador?

What's that story?

Moises Kaysedo Yeah, yeah, yeah.

Let's go. Yeah, there are two guys from Ecuador playing in professional soccer, I think. Football, well, we've got to look for football here. Who's the second? Don't remember. I haven't followed for some time but I know that there's another guy. They just recently played each other's teams. It was Arsenal versus... uh I don't remember. Yeah, I'll check that. Okay.

Yeah. I've lost time.

I like football, but I haven't followed for some time, to be honest.

Is that Pierre and Capierre?

I think so, yeah. That's another one, yeah. Yeah, I see. Okay. What's your team guys? What team you followed?

It's only me. Yeah, I follow Liverpool. Oh, I see, cool. But I watch a lot of English Premier League games. So yeah, when you said Arsenal,  I don't understand the squad of each of them. Yeah. Yeah, I've just checked the squad of Ecuador National TVF, Pierre Incapierre plays for them. So that's correct.

Yeah.

I think we have to...

Let me see. The guys are joining. I know they are taking some time. Yeah. Yeah, those are the two. Yeah, I just wrote to Steve, but it is Moises Caicedo, Chelsea, and they're in the A&L. Right. Yeah.

So is Ecuador playing at the World Cup?

Yeah, yeah, we are. Just a quick note, Steve is joining in a minute. Okay.

All right. No worries.

Yeah. Yeah, I think now we have a better team from past years because what I know is that No, some VTs. Um, Director of Techniques in Spanish. I don't remember in English. Oh yeah, the leader of the team. They start to giving the chance to young people, you know?

Yeah, yeah, yeah, yeah. Mm-hmm. Hello, guys. Hey, hey, how are you? I was going to say good morning, but I think you are on the other side of the... Yes. That's right.

US leading which country specifically?

Eugene and myself, we live, we are based in Poland. Denis is based in Belarus. Originally, The three of us are from Belarus, but the majority of us just live in a different country.

I think Europe is big too. Hopefully, I know those countries one day.

How about Poland? Have you heard of Poland?

Yeah, yeah.

Yeah, Poland is more... famous for just common person in the world than Belarus.

Yeah, but I see it's next to Poland. It's on the right of Poland.

Right, right. Yes, yes, yes. Yeah. Gabriel, are you also based in Ecuador? No. Actually, I'm from Costa Rica. It's a little bit to the north. of Ecuador. in Central America. Oh, Kayla and Abelston. Yeah. It's the reference. Yeah. It's just the first association with the countries I've never been to. But I know the frontmen of... of those countries. Yeah.

Yeah, he's just, he's,It's a reference for us too.

Probably one of the best in Costa Rica's history. Mm. Okay. What is the population of Costa Rica? like around 5.5 million in the first wall. It's my country. Okay, small but I've heard it's, It's very green Yeah, it is.

It really is always close to the beach. He has like... I will say weekend an hour to the beach or something like that. Yeah. Thanks. And you also have like the two oceans so you can decide if Atlantic or Pacific, you know. It's good. Hey.

Hello Steve, how are you? We had a call with Habitat running a little late. Sorry. That's fine. That's fine. So we... I guess we will have a pretty Pretty quick one. So actually the objective is just to share the updates to share the conditions of the MVP done so far. And Steve, am I right that Your coast time has changed recently, right? Yeah. Bye. How do you think about moving the call one hour earlier?

That's fine. Yeah, no, I understand.

Yeah.

It's not a blue graphy, but it's nice to have. If you have this possibility, that would be super good for us. Yeah, yeah, I can do that. Habitat just did the same thing. Ah, okay, okay. I didn't know that the title changed. I didn't realize until Monday. I was like, wait a second, all my clocks are off. Ah, I see, I see. Good, I'll move it then. Great. Danis, you can go ahead with sharing the screen.

Yep. Just a moment.

Okay, so hopefully you can see it. Yes.

Let me actually cover the infrastructure side of things first. SoYeah. I think there is no big issues with deploying everything to Cloudflare. I faced a bunch of I'd say developer experience problems is a bit painful comparing to Verso. You'll need to configure like every binding yourself, every database, every bucket. But other than that, I think there is no like anything huge, maybe just database migrations is like another headache because of the Cloudflare adapter and how it works with SQLite, no transactions.

just in case if any SQL statement breaks in the middle. Yeah, good luck, have fun with rolling that back. But I think, yeah, we can live with that once we finalize the CI/CD pipelines on your end. And yeah, so you may have seen that I didn't deploy the app on your account as Yeah, I didn't want to have any problems with access, paid plans and so on. So yeah, I decided to do that on our end. So for now, everything looks fine, like caching with different validation strategies, draft previews and such things.

So yeah, it works well. and we'll see how it goes. So yeah, I'll do a quick update on what you will need to do so we'll be able to deploy that on your side. You'll need to buy a $5 plan for the workers and I think there are two buckets. One is for assets like images, videos, and another one is for cache invalidation. But yeah, I think this will be everything for the setup. And yeah, moving on to the CMS.

Um... Yes. Probably a quick note that this structure is not final and will be slightly changed probably in the future. Like these tenants collections will be merged in a single one, like to have this in one place. Also these ones as well. So yeah, I'll be working on it in the next few days, I think. Uh... So yeah, I'll start with the tenants. For now, this is pretty simple, just a collection of available tenants.

For now, just one tenant here. where we can control which pages exactly each 10 have access to, like in terms of generation. So for the simplicity, it has all the industries, all the job titles, but yeah, we can choose which ones to include, which one to exclude, and so on. Does the exclusion work? I thought we were gonna have like one global for those, but that's interesting. Yeah, so by default, all the tenants don't have access to the pages at all.

They will get 404 on each industry and and job title. So you'll need to explicitly set like the access mode here. Exclusion, I mean, it's basically like you have access to all the entries except the ones you specify here. Not sure if it's needed, but yeah, I just said it just in case. So yeah, we'll add, I'll add one more tab here once we... Once we discussed the styling with Habitat, there will be another tab for styling and CSS.

side of things. But yeah, for now it's pretty simple. Um, Yeah, so for the main entries here. industries, job titles, skills, nothing here for now, but we'll add some later. And industries are grouped by categories. I'm not sure if it... does work like that on your current stuff, but it's just for easier management and reference in other places. Yeah, not much here for now, but yeah, just to test things out.

And for generation logic, I'll start with the template. So as you have so many job titles and industries, I thought that it would be a good idea to have some basic template that all pages share and are generated from. So that's the first layer of the system. Basically, it is like a list of sections like hero and sections like, let me actually show that on the UI. I mean, like hero, don't mind the UI, it's pretty awful for now, but yeah, metrics, testimonials, blocks, CTA.

So these are all section listed here. and all pages share the same structure. uh in the first place. and we can customize it like in the later stages. The next one, the next layer is, let's say, template resolution engine. So we can use different template variables that are picked from the exact page context. So different pages have different variables and they're getting resolved during page build process.

So the actual value will be present here. I will show how that works in a minute. Another unusual thing is a variation set. So it basically works as a full of content. like the set of different strings that page can take values from each page. takes unique value based on hash basically. So it is consistent during different builds, but if something changes like the pool size or the page title slack, then it picks a different value.

Not sure if some parts work in the same way it does in your current code base, but I think something is similar. So yeah, back to the default template. So yeah, I covered the template variable. So you can hear, see the quick reference like with all the available options just for the Um. I'll say comfort. But yeah, content pools. What else? Here it's the same. We'll switch to the template overrides.

Yeah, actually. One more thing. So each section, can be assigned to a different uh, groups on a page. So it's like broken down into three groups. one, two on the top and on the bottom that keep the same order as in CMS. And the one in the middle is just shuffles different section based on the slack. So for example, where we have different Let me show that different suffixes for the same job titles.

It means that the order of the section in the middle of the page potentially can be different. So yeah, and for different job titles that works in the same way. You can change it just if you'd like to keep the order consistent to before or after or anything else. And Switching to template override. you nothing here for now but here you can customize the page template for a specific group for example for the whole industry or the whole or just for a single job title so what you can do here is just Um.

let's say change some of the section properties or hide this section for a given job title or industry just in case you don't want to have it for a specific entry and you can choose to lock these settings on a global level so all the tenants will have the same setup for the industry or job title or whatever you choose here. So yeah, you can have multiple sectional rights that will applyBye. like in the order they are defined in the collection, but I'll still need to figure out the cases where we have multiple blocks of the same type.

So yeah, I will add this a bit later, but yeah, it's basically just an override for a specific entry. Um, yeah. Yeah, and for the job titles, I think we have something called suffixes, suffix variations. Uh, This handles the different combination of words in the Slack. like this one, this one. So what you can do is you have like a dictionary of all the available swords here. with all the possible conjugations and forms just to make the text template resolution easier and more predictable.

What you do then is you just select a different combination of these words that you'd like to have in your setup and all the job titles. will be generated like from this set. What that means is like for now, for example, each job type will have this set of pages so you can access them in your browser. like this and this affects the template variable resolution. So I'm not sure if we'll find it here.

Okay. Smell builder. built your resume. For example, here we have create verb, build verb, and also it affects the section order on the page. Um... I'm not sure it's in its final state as I think you have like a one canonical page and all the different other different options just referencing to this canonical and yeah I'm not sure if you have all these options in your sitemap, so I'm going to figure that out and probably adjust that slightly, but Yeah, for now it works like that.

As for that one, we have all of them are just randomly assigned. So we have them and then we set them to the canonical. I don't know what we do right now. We redirect. or we show, I think you can type in any page. Like if you go there, just change it to CV. It will like just one of those. change resume to CV,Yep. Does that work? No, that's really turned it off. But we used to load that. We used to load every version of every page, which ended up being insane.

But I... And then we would canonical them all to the group one. I don't know the best. I don't know if this is all really that great. I bet the canonical is very important. We need to be able to canonical even to the industry page, to any page. And so canonical doesn't just go to a job title page. Job title canonical can be. to go to the home page for what it's worth. So, Overall, you picked up on a lot of some stuff that I'm that is deep in that code.

So this is impressive. that you found all that. So just generally speaking, yeah, you've picked up a lot of stuff. I don't know how much of this stuff we're going to keep using, but it's good. You found it and then might as well. The only other things is like we have like a landing, like we have that. I don't know if you've seen the like the browse page and then the landing page. There's like a keyword landing page, I think is what we call it.

All right. Yeah, so basically you can create any other pages like here. So everything you need, like with the same level of customizability, but like for specific slots only. So like the homepage, or you can have resume, resume templates, browse page, so everything will go here.

I mean, we technically have like a thousand of those. Mm-hmm. Or even more. I don't even know the number. So it's just like a job title, but maybe we just call it like the template page or something or the... keyword, like just a landing page. And then all it does is it gets all those word variations and creates a landing page for each one.

Okay, I see.

And what I think we'll do is eventually is we'll start canonicaling them too, 'cause right now we have too many pages. And so the goal here is to canonical them to them, but we need to create them first so that we can then canonical them or redirect them. So I would assume a page has a redirect to another page or a canonical to another page. Mm-hmm. So every page has that. But yeah, there's a couple, I think that's all.

I think otherwise we picked up on a lot of things that I didn't expect you to even notice. That's good. Good work. And yeah. And so impressive for the first week.

Okay, thank you. So, like, general question, is it something you would expect, like, from terms of new architecture or... So any thoughts?

Oh. On the architecture?

Yeah, on the architecture side of things.

I'm good with... I don't see anything on the architecture side that I'm worried about. I can give you access to or whatever you need in Cloudflare. Feel free to just ask for that. So you needed to upgrade some plans. Can you just put that in writing so I can remember? Yeah, sure. And then. Yeah, I mean, I'm liking Cloudflare a lot. I've been using it a lot more lately. I'm glad that you get rid of it.

I know it's like the setup's not out of the box as much, but... I think we're gonna benefit from costs and from like multiple regions. I think they're just, their products are nice and they're actually fairly cheap. But I like the only other thing I want to mention is like it's not just skills, it's like. And then there's like six types of texts. One of those is skills. And so the, one of the things that, I want to do, I don't know if you guys can help with that or we'll do it, is I want to migrate our content.

to to use this pretty quickly. So like, I'd love to put all our job titles, all our industries. We have a bunch of data. And Gabriel and Yvonne have worked on this back in the day. But like getting that data on this and then using this on the website, like in terms of like searching for job titles, showing content.

I don't necessarily think that we have, I think what you want, we can populate the data. I don't remember where the cutoff is exactly, but From a business perspective right now, Yvonne and Gabriel are switching over to a new database and we have a couple legacy content databases. I just need to shut those down because they're just wasting money. And so I'd like to use Cloudflare for the content stuff.

Um, And so from an architecture perspective, I think you're on point. And then I have one question that we need to start, I think, need to start thinking about. And by the way, you're on the right track. And again, still very impressive is the-idea of how do we deploy this with just the home pages with rocket resume and we can migrate down funnel so we can get the home pages and then we can do the builder and then we'll move everything over to ship crew on the transition so that's that's the I think the The tricky part, and then how does it support multi-tenants?

like on the app side of things? Does it fetch I'm curious about how-you've probably already thought about that, but if you have multiple tenants, does it support multiple tenants yet? Yeah, it does. Awesome. And so is that like a middleware function that like, yeah. Awesome. And then you have tenant page config. So great. Not that we have to do this yet, but for example, there'll be secrets that one tenant will have a different Stripe account than another tenant.

And so we'll need to be able to load that, but that's down the road. We can probably use Cloudflare secrets for that, but that's just something I just wanted to mention. Otherwise, you guys are, yeah, those are just top of mind things.

Yeah, good work, Dennis. Thank you.

Dennis, I guess you can just quickly highlight what you're gonna work on for the next, Yeah, so... Uh... We have a couple more areas we can focus on in the next week. So these are Resume Builder, Um... CSS schema for different tenants like different customization like for components for sections and like better auth i'm not sure if we have all the details we need for that so uh what are your thoughts on these topics so where should we focus on like That's my priority.

That's a good question.

I wouldn't put, I wouldn't worry about the resume builder part.

The content APIs, I would think like, so in order to like, I think we do some fetching of content, getting the look in like, I do like that I did start thinking about better off because the team right now, Yvonne and Gabriel are doing that for So I imagine they're going to help to the transition to multi-tenant. Um, I think. we want, so we still want users and resumes in our CockroachDB instance. And then those users and resumes are going to be They'll have a tenant, but they're gonna be global, someone could log into multiple tenants in theory.

So we'll have, I don't think you need to worry. I don't know how we do, I need your help on thinking about that. Because we need we haven't done anything multi-tenant on our end, but maybe we can do it on on ship crew and then we can pour it over or we can start connecting to the new database. that Yvonne and Gabriel are finishing up right now. So So the...

What were the couple other things you mentioned?

Uh... Yeah, like CSS, I mean not the CSS, but like the theme customization for different tenants. So I think we need the input from the Habitat team. I'm not sure what are they using as a reference for their components and stuff, but yeah, that probably will affect the way I'm building the whole customization system.

Yeah, so I would wait until they're on the CSS stuff, wait until they're ready. They're still doing competitor research stuff right now. So they're going to need a couple of weeks, I think. And then you said something about the schema, right? Is it that one you were talking about, the theme stuff?

Yeah, yeah, yeah. That's like the same thing. So just to quickly summarize about the better auth. So for now we like have two points. So you'd like to keep your users in CockroachDB and the other one They're like... multi-talent. So we can build the things considering these two points. Just speaking out loud, I was thinking to use an open source plugin for payload and better auth. But yeah, I wasn't sure if I can because there are too little details about your setup.

But I think we can... we can handle it on our end just to propose some solution as for now it uses built-in payload authentication strategy but yeah I can I will switch the better off in the next few days I guess Yeah.

I mean, so I think I don't know. I think Gabriel and Yvonne and you guys should talk about better auth. I don't think my gut as an engineer is that... It's probably secondary to like the content API. So like anything the homepage touches, like it doesn't touch a ton of content. And you have those landing pages, like some of them we use content suggestions are in there. You can skip the resume builder section, but like we have like a search bar and we have search on for content or for job titles, but I'd like for it to be like universal search.

So it searches content, job titles and suggestions. That's going to be in the builder too. Bye. Anything that touches that first page is really, I think, the top priority in my opinion, and that is also better off. But I would like to give better off a secondary priority and so that Yvonne and Gabriel can finish their transition and then we can kind of see how to do this migration. I think what's going to happen is we're going to just We'll pull over the schema from what Yvonne and Gabriel are working on.

Thank you. And then... Um, we'll turn that into multi-tenant is my guess. And so, Yeah, so then we'll have to support two databases for the auth.

That's the Um. That's what I'm thinking at least.

Yeah, okay. Sounds good to me.

So I think Content API is like the schema for content. like in the schema for page titles, I can send you over all our content. We have it in like three or four areas and like I'm not saying for you to import it unless you want to. I don't think it's hard to import. I'm happy to do that. Um, We have new industries. What we have, I think maybe Gabriel or Yvonne know better than than I do, but there is a whole database.

We were gonna transition our content from one set of industries to a new set. And in this database, we had published and unpublished. And so the published stuff was what was showing, but we were going to switch them from published to the new ones, which we're going to be-we're going to unpublish the old ones and publish the new ones. And that's how we were going to do the transition. I think it's all built into our taxonomy.

state of set. But then we also have some of the content lives in our current database. I don't know Yvonne or Gabriel, do you like what the goal is? Remember that what we did with taxonomy and the site pages? I want to do all taxonomy, but do it inside of this content management. Do you remember giving insights on that?

Yeah, how taxonomy worked in the current status?

Yeah, and like the data sources right now, I think we have I think it's, we have our Prisma 1. where we have so on me. are both being used right now. And I want both of those, they should be able to be merged. I think they're copies of each other or they're close to copies of each other. And then I want, we need to seed this database with job titles, industries, and I think we need to work on search is probably my guess until Habitat gets to design.

But do you remember... Anything?

I'm sorry.

Yeah, so Taxonomy right now has the same data set as Prisma 1. So at the moment we migrate, if any change we could check what's the change, but I think are the same in terms of content. We do have the schema separated from the Prisma 1, maybe that's useful. So we have that schema on taxonomy, which is using the architecture we planned some months or years ago. Yeah, I would say, yeah, and what I remember is that it was a little...

more difficult or more than difficult, it took us more time to implement the search. just to make it work as it was on Prisma 1. The recommendations are good. The algorithm was... returning good recommendations. So yeah, that's the status I remember on taxonomy, but I Gabriel, did you help with that too?

You did the site map stuff, right?

I think so, yeah.

I was trying to remember because I uh, I know I did something, but I... was having trouble remembering what he did and I think yeah Okay.

Cool. So I think, From we need to get you out of the schema. I think it's visible. There's going to be two of them and you'll be confused. because I think taxonomy is actually like the better schema. or the more up to date, but we're also using the data model in rock where it has like content texts. So... Those are the two. We can probably link those to you. And I have to probably look for content stuff, but I'd like to get that.

I think that needs to be seeded so that we can start using the APIs. I think building those APIs so like, And I think it's like searching a job title, search in general And then like getting content for a job title. That's probably lower priority, but search is probably most important.

And so I... Another insight on the taxonomy I was just reviewing is that we do have a different schema than Prisma 1 because we wanted to have the hierarchy of categories and parent categories. And also because on the current side, we have industries and job titles, and that's kind of a fixed relation between each other. But on the new taxonomy schema, we do have the same data, but it's structured in a different way where you can create parent and children's and also you can decide which children's are going to be a redirect and which children's will be canonical to some parent categories.

Yeah, so let's, I don't know Yvonne, can you? find that. file and then send it to Dennis and the team. Sure. And then. Maybe we should start talking about search. because that's like the most important. I don't know how you guys would go about that. I've looked into like Algolia or if you just want to do a vector search. I know you guys have done this job yourself. So, That's something I think will be important.

Yeah.

I don't think we can use vector search with SQLite, especially with D1. Yeah. But I'll need to find this out. Probably we'll do some research on that. But yeah, it would be very helpful if you could share the schema and some small chunks of data so we could see the database with actual... So,Okay, yeah, we'll get those to you.

Ivan will get them. I might have the database somewhere. but we'll have to massage it. So we'll go back and forth a little bit, but... We can share that with you. And then Cloudflare might have some sort of vector thing for its Do you want to do this? And so that's an option. Algolia, I really like their product. I've never used it, but I've read about it and just like the The feedback loop that you get from like a purchase can then go back into ranking like search results, I think is very important.

out of the box is very, very nice, although it's very expensive. Yeah. And so, anyways, I don't mind. I think we should be with the Cloudflare app. But if you guys wanted to do something quicker, I'd be open to Algolia too. Okay. So we'll get you the schema and the content and then maybe we start architecting talking about better off and then deciding. So I think the three things, Priority is content.

Thinking about better auth, how do we do that, but maybe that's delayed and then Uh,Thanks. Oh, and then how do we architect? how do we get this onto production? Once we get the design on there, how do we actually show users both websites at the same time. Like that, that to me is the, the gold, the question.

Okay, I'll think that through. But that will be probably just redirects. maybe even in CMS here. So yeah, we'll figure that out.

Nice logo choice.

Thank you. It's just a cloud code generated. So, yeah, nothing fancy.

A cloud generated. Yeah.

I saw you have a bunch of rules and skills in your Glass codebase. That's pretty awesome.

I've tried to add stuff.

Some of it's a mess. But like, yeah, there's been weekends where all I did was cloud code and like, I don't know half the stuff that's in there anymore.

But yeah, it does help.

Like some of the cloud stuff, like, Having tests and I'm starting to learn how to code better with Claude. It's just like it needs a lot of tests, it needs a lot of context. Obviously. And so, yeah, some of that stuff, those skills, I've been playing around with them.

Awesome, well, thank you guys. Is there anything else you need from us? I don't think so.

Okay, we'll look for the any upgrades onSure. Bruce on the popular account. I'll be honest, I don't even have a bank account for that business yet. So it might be a day or two. It takes a minute to get a bank account in the US for new businesses. So I'm checking it right now. Good. Okay.

I will share what you actually need for Cloud Power to be able to deploy this thing. So yeah, probably today or tomorrow. Yeah.

Beautiful. Keep it up, man. Keep it up. I love it. Good start. Thank you.

Thanks, guys. Have a good one. Thanks, guys. Have a good one. You too. Thank you. Thanks, everyone.