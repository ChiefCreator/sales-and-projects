# ShipCru - Analytics requirements sync

Date: March 26, 2026   (GMT+1)
External: mailto:steve@rocket-resume.com, mailto:steve@shipcru.com, mailto:gabriel@rocket-resume.com, mailto:ivan@rocket-resume.com
Participants: mailto:eugene@gitnation.org, mailto:denis.urban@focusreactive.com, mailto:aleksei@gitnation.org
Project: Rocket Resume (https://www.notion.so/Rocket-Resume-3049e5177cdd8003896efc4dcd8c2688?pvs=21)

Summary

### Action Items

- [ ]  Eugene and another developer to work on analytics and tracking implementation next week
- [ ]  Denis to work on migration plus landing pages and outflow
- [ ]  Create technical proposal document for analytics architecture with different options for review
- [ ]  Start building the resume builder section on the homepage to understand architecture and relationships
- [ ]  @Anastasiya (PM from FocusReactive) to join project next week and help with documentation and planning
- [ ]  Move weekly call from Wednesday to Tuesday, same time
- [ ]  Put technical proposals and opinions in the channel for team review
- [ ]  Steve to share PRD for authentication and onboarding flow
- [ ]  Follow up on homepage design timeline with Habitat design team

### XWADAR Project Update

- Eugene found some non-critical issues, including a sitemap problem with production URLs that was fixed quickly
- Patricia raised performance concerns, which Eugene is now focusing on
- Most of Patricia's complaints were addressed with explanations, and remaining work is minimal

### Meeting Delay and Attendance

- Meeting was delayed 30 minutes waiting for Steve, who was on an important call with attorneys
- Team discussed design meeting involvement and current project work while waiting

### Analytics and Tracking Requirements

- Main priority: rebuild tracking script to load asynchronously using web workers off the main thread
- Current problem: Mixpanel library in client bundle is 90% of JavaScript load, impacting page speed
- Need single endpoint for tracking server events on internal domain
- Future routing: events to Google Tag Manager, Mixpanel, and directly to internal database/warehouse
- Consider AWS or other analytics-optimized databases for data warehouse
- Plan to extensively document current tracking with Claude, then share for architecture recommendations

### Project Priorities and Roadmap

- MVP focus: everything on landing page except builder section
- Critical path: authentication (auth modal) is highest priority, though designs not ready yet
- Auth modal includes email/password, text messaging, Google sign-on, and potentially Facebook, GitHub, GitNation login
- Resume builder can start with basic form components while waiting for designs
- Only send delta changes instead of whole resume to improve performance
- Backend processing with Ingest has become expensive and may migrate to Cloudflare queue system later

### Multi-Tenancy and Long-Term Vision

- Rebuilding entire website as multi-tenant, phased rollout starting with landing page
- After Rocket Resume, will create second brand to beta test multi-tenancy
- Goal: partner with recruiters to provide resume builder platform on their websites
- Build marketplace connecting candidates and employers with AI-powered job matching and application automation

### AI and Advanced Features Roadmap

- Resume upload with LLM processing to convert files into schema, fine-tuned model based on training data
- Import from LinkedIn and Google during account creation
- Onboarding flow includes pushing users to add cell phone for text messaging
- Resume reviewing page: upload resume, invite friend, pay professional, or use AI for review
- Shareable links for Reddit and other platforms
- Resume enhancements: grammar, spelling, improvements, suggestions, dynamic content, translation

### Translation Plugin Discussion

- FocusReactive has existing translation plugin that works with AI (GPT-4.0)
- Takes all text from CMS, processes per page for context, returns translated strings
- Uses server components, fetches only necessary language, statically generated or cached
- All translatable content should live in CMS
- Plugin needs adaptation for complex job titles logic

### Content Search and User Feedback

- Need feedback system for content quality: track clicks vs skips for job title content
- Algolia offers client-side tracking and revenue-based sorting, but expensive
- Current challenge: 20-30 million strings with redundancy across job titles
- Consider vector search with real user feedback integration for prioritized content
- Analytics tracking exists but data hasn't been used yet

### Team and Collaboration

- Team currently operating as two separate projects, plan to unify into one team
- Head of engineering starting Wednesday with aggressive revenue goals
- Project expanding to 4-5 people from FocusReactive, potentially 10+ later
- Yvonne and Gabriel will help with authentication and other internal tasks
- Team should work independently without Steve to avoid delays
- FocusReactive specializes in headless CMS + Next.js + Vercel and headless e-commerce (Shopify/Remix)
- Dennis led GitNation technical work for several years

### Design and Project Management

- Habitat has shown four similar initial design concepts for homepage
- Tariq traveling in India, missed last meeting
- @Anastasiya from FocusReactive joining as PM next week to chase design team and help with backlog documentation
- Backlog includes migration, new products, and massive feature set

### Technology Stack Mentioned

- Next.js, Vercel, headless CMS platforms
- Mixpanel for analytics
- Claude AI for documentation and architecture planning
- Web workers and request idle callback for performance
- Cloudflare (R2 storage, queue system)
- CockroachDB for user data

Notes

Transcript

Hello there. Hello. Hello. What's up, Dennis? How is it today on the XWADAR project, Eugene? Hmm.

Yeah, I found some issues, but not critical. I mean, the one with sitemap was, but yeah, we fixed it pretty quick. At the same, like we released Arriva. Uh, We also forgot to update sitemap with production URLs, so this is part was completely broken and here is the same thing. But yeah, they're just a bit... complain about performance and that's my focus Yeah.

Let's see. Hello, Gabriel.

Hello. Hello.

But as far as I understand, Patricia already knows, right? About the updates on the sitemap, right?

Yeah, yeah. I wrote everything in the channel. So he... She said thank you for explanations because some of her complaints was just, you know, As usual, not really relevant and realistic. So I explained everything and told you what I'm going to fix. And I almost finished, so everything should be fine. It's not so much work regarding the points she left. Good, good, good.

Yeah, luckily you had some time today. That's cool. Do you know, Gabriel, if Steve has any meetings already?

Nope, I don't. I don't know where he is.

Okay, peace of mind. It's lagging but didn't get response. you Yeah, same. Hey, guys. Hello. How about you? Good, I'm sorry for the delay.

Thanks, everybody, for pinging me.

Yeah, no worries. Are you aware if Sieve is available?

I was chatting with him like an hour ago, but... Not sure. He hasn't responded to me in a while. Okay.

But I believe he is the main stakeholder about discussing all those things related to the analytics tracking and stuff.

Yeah, I think we can help bodies good to kind of stick here. So. We can all agree on... Yeah, and everything important. Um. Yeah, I don't see Steve responding.

Let's wait for a couple of more minutes. If he does not respond, then we'll need to reschedule it.

Yes, thanks for waiting.

No worries. Do you guys also attend the design-related meetings?

The what, Spree?

Can you repeat that? The design-related meetings. Oh, I see.

Yeah, about the. Do you attend them? Yeah, yeah.

No, so we are not involved in design yet.

Okay. I just...

I was curious how fast they were progressing there as well.

Yeah, we have seen we are part of the channel in like communications, but we don't have much information yet. I guess after we do the TB migration we're working on. We can jump in and help too. What about you guys? What are you working on? I mean, in general. apart from Roque de Rosemey.

So we mainly we build like Preferably marketing platforms on Headless CMS plus Next.js plus Vercel. Sometimes the clients ask us to to build the headless e-commerce websites. also on a modern stack. Shopify There's a, There's a Shopify frontend framework. which is called Remix. Not sure if you've heard of it. Yeah. Um, Yeah, all the things related to headless CMS, Next shares for sell, this is like preferable stock to work with and the most comfortable for us.

Oh, awesome. Also, also a good nation, right? Yeah.

Yeah, this is like a The other part of the business of our stakeholders, they organize JavaScript engineers events. Mm-hmm. Worldwide. The closest location for you would be New York, I guess. But yeah, some locations in Europe,Yeah. Yeah, Dennis actually was... the technical leads on the whole Geek Nation part of things, the whole website, the whole portal. and Yeah, everything behind that was... led by Dennis for a couple of years.

Awesome, yeah. I have seen that page maybe some time ago. But it's cool, yeah. You guys are in everything. Community, clients. Yeah, yeah, yeah. Yeah, that's correct. Thank you. Yeah, if you want and we don't use your time more, maybe we can reschedule.

so yeah I'll then follow up in the chats Probably I'll suggest just tomorrow, same time, or probably a bit earlier, if this is okay for you.

Yeah, let's chat in the general chat with Steve. Sorry about not joining. I think as we are migrating some things, we actually noticed some... Degradation, I think is the word. Degrade. We were fixing that. Let's see. Yeah, Steve just responded. He says one minute.

Sorry, Steve answered his Jordan.

Yeah, yeah, yeah. In one minute. He just...

Okay. Hey, Steve. Hey. Sorry, guys. The The sky is falling. I was getting, I was on a call with attorneys, a really important call. It just kept going. That's okay. That's okay. A lot of things going down this and next week that are outside of... building product for me. So I, it'll be, hopefully it will improve and it won't be like that. So I'm sorry. Not respectful. I don't know. That's okay. Okay.

Yeah. What do you guys need?

What do you guys need? want to go through right now.

Yeah, I think the main thing is just kind of scope, what we're gonna work, like me and other dev next week. Just like, you know, it's analytics and tracking, that's clear. You mentioned a search. Some work will be done by Denis, we already discussed this, like it's migration plus landing pages, outflow, etc. So other than analytics and tracking, if you'd like, we can just try to reverse engineer it from Money Reaper.

But if you have anything in mind, to make it more easier for us, to just set this direction of other things you have in mind, so it would be helpful. Yeah. I have like a, document here.

That, I mean, the... All I really did was I just went into like Claude and just said, hey, I want to build a like an asynchronous script that doesn't block anything that runs in web workers and works with an API. And Basically, I want to migrate what I have in my code base into that, and I want it to be in TypeScript. Um, And So, I Are you guys like, yeah, maybe we are recording this. We, uh, it might be good to take notes, but, um, Yeah, basically like...

We want to recreate what we have, but we want to, the problem that we have on our current, and I haven't gotten around to fixing yet, is that the bundles are all in the client. So the entire mix panel library is in the client. I think I just pushed or I'm about to push. lazy loading it. I want to see how much that affects the bundle size, but I haven't really, like I spent like 80%, like I finished 80% of it.

So that's the problem with Claude is you get to 80% and you just get stuck there. Yeah. But, um, If you look at our bundle size and run our bundle analysis, the tracking JS script, which includes the mixed panel import, is massive. It's 90% of our JavaScript load. We worked really hard to get our page speed down. We even lazy load. I think you've noticed, Dennis, lazy loading some components. I don't know.

The search bar gets lazy loaded. The And then there's a couple other, maybe I haven't, we haven't talked about it yet, but there's a couple, All the, a bunch of the components below the fold get lazy loaded. And we really tried to cut our initial JavaScript. And so part of that is we've worked as hard on everything but the tracking script on getting everything reduced and so if we want to talk what I all I want is like and it's it's done it's basically like it's I mean I'm not saying it's done it's been done Like the Google Analytics script that you insert in your page and Like...

I don't know if we need to go that far, but like we just need a script that loads everything when the page is request idle callback and then basically, um, connects with web workers to run off the main thread. Uh, and then basically doing exactly what we have. And so I don't know the architecture. I have a few ideas on that. And so the architecture, you guys can kind of come up with. I mean, what I was thinking is, I think no, regardless, we need an endpoint for just tracking server events that we can run on our domain.

So it's an internal, It needs to... It needs to identify initial session properties like, like UTM parameters like generates a device ID, It generates a session ID. But that's done in like two places right now. It's done in our middleware, where we drop a cookie, but it's also done as a fallback on the client in case that cookie's not there. And I don't think that's actually being used. So right now, what...

Basically, yeah, we're recreating what we have already. The problem is, and I would extensively use Claude and maybe the best way to go about this is to have Claude Document tracking extensively, just come up with a document that is our current tracking and then share that in the group. We could do that pretty quick, share it in the group. And Or ask Claude, hey, what do you recommend to improve this to best in class architecture?

I think... For now, I think at a minimum, we need just one. So basically the front end is going to interact with one endpoint. Eventually, we're going to route these events places. So if you just get the client to the server, I think we're good. But eventually we might route some events to Google Tag Manager. We might route some to Mixpanel. I want to route all of them to a database. So an internal database.

whether I don't want to go through Mixpanel to a database, I want to go straight to a database and then use Mixpanel on top of that. So that's really important. We don't do that now. So we do need a way to get all this data into a warehouse. I know this is Yeah, there's a couple service providers for databases that really do well with analytics. I don't know if you have recommendations there, but, um, Or we can just use like AWS or...

I don't like Snowflake, but we can use AWS or something.

Yeah, I think there's many of them. We can just pick what is more relevant for this. Yeah, but it's kind of clear. Yeah, we do take notes, especially like I record these because, yeah, it's convenient to read from the transcripts information. Okay, that's one task for one developer. If we will think about another one, like Aspect. If there is anything else, what is kind of big thing, And we need to migrate this to...

Well, I mean, so we can keep going. Basically, we're rebuilding our entire website, multi-tenant. with the priority being everything that's on the landing page so that we can push that to production. The goal is then going to be to phaseMm-hmm. Roll it out. So then we'll start working on the builder. and then we'll work on payments will probably be less. We'll just go down funnel, And so... what would be next is Well, MVP is everything on the homepage except the builder section, I think.

You can probably even cut out some other stuff. I think what's more important for you guys, for another engineer, I would start building the resume builder. I say that I think auth is the next most important, but Yvonne and Gabriel, I've been working on auth and are going to come in, I think, probably help a lot with that work. There might be I mean, that was going to be shared responsibilities because there's going to be a lot of other things that we need to do internally that Yvonne and Gabriel will help with.

But I would say it's either the builder or the off. The off is more critical path because you have to have off on the landing page. The builder is not critical path. So... We could start prototyping we can start building the off like so I'm a big part of and I'm going to be really pick about it is this that off modal that we have. I don't know if you guys have noticed like when you log in, we have the ability to use that to up like basically onboard people very efficiently.

So like if you're building your resume without an account, That auth model comes up with like, hey, save your resume and you click next and you just organically are just adding an email, adding a password. And then now you're onboarded. we're gonna enhance that to support text messaging, and Google sign on and then maybe Facebook, GitHub, I don't know what else we, we have But... Uh... Does Git Nation have a login?

Yeah, sure. We'll build that into it too. Does it work with better off?

No, it's our custom implementation.

Yeah, okay. You guys need a universal login like GitHub. Yes, we do have. We have all the social media. X Facebook I think well, I mean like you guys need to be the social media so that people can log in with get naked on Rock. It'll be cool Yeah I want to do that for Rocket someday. So like, I want to log in with Rocket resume and allow our partners to have that as a login. That's something I want to build.

But obviously not important today. So if I were to pick, we have authentication is the most critical path. I would Maybe we could start the front end of that. Uhm? Yeah, but--We don't have designs.

Yeah, we don't have designs. We can cover the like underneath logic. And probably we can... take the account area, profile and other stuff What is there? Because I haven't seen it yet. Yeah, because I don't know what you have there. So it would be nice to...

It's a That's not hard at all. But also we don't have that design. So the first design we're going to get is a homepage. So I think, I think we focused on the homepage, we got tracking and then tracking setup and then you can start wiring up the builder without like just with basic form components Yeah. The builder's interesting. We'll need an API for... for upsetting a resume. I have some ideas on how to improve that.

Like I only want to send the changes. Right now, we send the whole resume up. I want to only send the Delta. And so that will help a lot with some, a few things that we do. Um, So I don't know, maybe we could just build that section on the homepage. That's the first step of the builder.

Yeah, I think that will be helpful. It helps us to understand what is the relations and all the stuff behind this feature. We can start building something simple like a section and then we will understand the architecture.

We can create a breakdown of all the things I included right now and then with you we will plan what we'd like to like area by area like you know all the ideas you have yeah it's gonna be yeah yeah i'd love for you guys to provide input um all my all my stuff's up here i don't have time to write it down so uh the more that you guys can do that and we can talk about it the better sure There is also In jest.

like long-term We have ingest running our back-end processing That's probably the last thing we migrate, although it just got super expensive. like in the last month. Um, and so, um, I would love to move that to Cloudflare. They have like a queue system, but... Anyways, that's something else that's on the radar, but I'm just mentioning that's probably down the road. So today, user lands on the page, there's the harding of of content, there's all the landing pages, There's the content, there's the search, there's...

off and then there's tracking. I think those are the only things that and then off is kind of on temporary hold until we can push our new database and then Yvonne and Gabriel can help. with that but there's going to be other things that they have to do too so like This is basically the first version. So there's going to be some improvements that we'll have to make too. once we once we pushSo is there like, do you wanna go into details on analytics?

No, I think what you already mentioned is pretty detailed. So we can create a kind of technical proposal, like how we see these features with different options. We can discuss with you on call or in Slack once we start working on this. And it's going to be a first step to not re-implement this later. So just first approve with you, suggest your ideas, and then we can go further. And yeah, that's already covered what we wanted.

We know what other things we're going to take next week. So it's clear for me now. Okay.

One thing I want just to clarify. Yeah, I think creating a document is great. put it on the channel yeah put your opinion opinions in there so like be opinionated on what we do um is very valuable um i mean you kind of you got a sense of this and then if i want ivan and gabriel chiming in on their opinions and then um I want you guys working almost without me. Cause like, look at how I'm already slowed you down today for, for four.

30 minutes. So get me out of the loop. I'll hop in when I can. But let's try and get this functioning without me. Okay, cool. Sorry, continue with where you were going.

No, no, I just had one more question. How is it going on with Habitat? You mentioned the homepage designs. How soon do you expect them to I don't know.

So that's Tariq's kind of the boss on that. We have seen some designs that we like as like initial designs. They're not like... the end goal they're like a good i think that will be i meanGood concept. Yeah, thank you. Yeah, so I think we'll have... We have like four concepts. They're pretty similar. I think we have enough. They should be able to start handing things over. I don't know how they do.

I don't know what their process is. And Tariq's traveling in India right now. So he's been... He hasn't... He missed the last meeting. So... Um Yeah, as soon as that comes, we're pushing for them to focus on the landing page. And as soon as that's ready, we'll get that to you. And you guys feel free to talk to them directly too. I know, Alexi, you are. Yeah, yeah. Next week, we... We're adding the PM from our side.

She's going to chase them. So yeah. I'm not pushing them at this specific moment, but from the next week, Anastasia, you'll meet her. She's going to chase them, yeah. She's awesome. Yeah. Okay, good. Everyone on this call is awesome. We just made it. So good. We'll have one more awesome person. Um, Yeah, no, I appreciate you guys taking a little bit of the PM responsibilities. I know that without a PM, you kind of need a little more rigid.

formal stuff but we'll have that here so I apologize for that um is there anything else you guys needNot from my side. Yeah, the question just to finalize, how about we shift the weekly call from Wednesday to Tuesday same time? Because I know that you have back-to-back meetings with ourselves and Habitat, and sometimes we're not within 30 minutes. Yeah. What if a shift starts... That's fine. Yeah. Good.

Um, I know that last week you were pinning Tarik about starting to draft things about the backlog for the long term for expanding the team. As far as I understand, Tarik is not available for this specific time. Um... Yeah, I just imagined that Anastasia, the PM from our side, she's joining the project from the next week. Will she have anything to deal with around the draft backlog from your side, just to iterate it with you, together with our team and Tariq and the technical lead you were mentioning?

The backlog is kind of what we talked about. Like the... What do you mean by... By backlog. Like... Yeah, Jozin is now trying to understand the backlog for the first week, just for us to accelerate a bit. How about the weeks further? You have a roadmap, you have a draft plan. Anastasia will have to document that, but we'll need to iterate infinitely on the requirements. And I know you were pinning Tariq to assist from your side as well.

Yeah, we have a lot. We have a massive backlog. There's going to be new products. I mean, but like the first stage is getting the whole website over. Yeah. And then when we rebuild the resume builder, we might add like... Here's the first thing I think he kind of wants. is a resume upload. So basically it's an... But that, I don't know if... It's AI. You guys should be able to handle this. You guys are incredible.

But I just want to double check that this is in your wheelhouse. The ability to upload a resume, which I envision doing with an LLM, will process a file, convert it into our schema. And it needs to be probably a fine-tuned model based off of training data, which the training data we won't necessarily have at first, but we'll collect it over the initial run, so it'll be kind of in beta mode while we collect training data.

But the ability to upload it, still put it in R2, process it, All in a few seconds. or all in within like 10 seconds for the user. And then they can just import that. And then like we're gonna have importing your resume from LinkedIn. Um, And. Yeah. And so, uh, There's going to be a whole, that's going to be all big part of off too. So like there's going to be a page where you can import, you can upload your resume, you can import from LinkedIn, you can import from Google, you can import from, there's not a whole lot you can get from Google and not even LinkedIn is limited, but yeah, This is all going to be part of creating an account.

Once you create an account, it goes to... It goes to basically onboards them to create an account. And in every account, we push them to add a cell phone number so that we can text people. And so that I have a PRD with for that. I can share that. I'll put that in the... I have to find it, but I have, I clawed right up. It's kind of off, but it's close. to what we want to do. So as long as it's look at, like everyone looks at it with a grain of salt, like, Hey, it's got a few issues with it, but the general idea is good.

I can share that. But that to me, everything kind of ties together. It's authentication. It's uploading a resume. It's the resume builder. All three on one screen, basically. And then like going beyond that, like I really want to do a resume reviewing page. So you can upload your resume, invite a friend to review it. You can pay a professional to review it or you can pay an AI to do it. And it's a link that you can share.

globally. And so people can post links about Rocket Resume on a website. There's a subreddit for reviewing resumes. And I was just thinking, if we can reach that subreddit, I think we'll meet a really good use case. what else do we have? I mean, there's, there's a, a ton of like enhancements to your resume, like grammar, spelling, like improvements, suggestions, dynamic content suggestions, translating.

These are all features to a resume that we want. Um, And those are all things to the current product. And then if we want, like, and I'm just like doing the whole roadmap in my head, but then. By the time we've migrated to the multi-tenancy, so as we're adding features and we're going to be doing multi-tenancy at the same time as we're adding, once everything's multi-tenancy, we're going to have a second company.

This is going to be a second brand. That has a resume builder and that's where we're gonna beta test this multi-tenancy it's gonna be of Rocket, it's gonna be, we're gonna own the company. It's going to be-It could be like nursing resume builders or something. But... Then the next After that customer succeeds and we iron out all the details and the dashboard and everything, Like then we're going to.

go to a partner and say, hey, would you like a resume builder on your website? And so they're going to host the resume builder. Um, And so what we're going to do is we're going to pay them. So the goal here, the business model is, is to find recruiters, typically recruiters that don't have very good websites, They don't have, they aren't good at technology, but they have a lot of good networks and they're good at getting people connecting them to jobs.

We're going to go to them and say, hey, we'll be your website for you. We'll bring you, we'll give you access to our website. platform or our network of resumes. and we'll connect you to them and you'll have access to that and we'll pay you. And then now we're gonna use, because we're paying them, We should be able to sign up thousands of partners with thousands of websites, which we'll use for SEO benefits and all these things.

Once we have a thousand websites, we'll start building more features for them. And so, If you're a recruiter, how can we save you time? So if you need to fill this role, post this job listing. We'll use AI, we'll process it, and we'll go find you five, 10, 20 hot candidates for that job listing within an hour. And we'll eventually... own the communication between the employer and the candidate. And so what we'll then do is like we'll offer features to the candidate.

Just click this button. It's autopilot and we'll go out there and we'll go find your next career. We'll fill out forms on websites. We'll apply for jobs. And then candidates will be like, Post a job listing or give us a few details. We'll fill out your job listing and then we'll go get you the candidates. And so we'll create a marketplace between the two sides. So that's what I want to build. Can you guys do that?

Yeah, definitely. I mean, that's exactly what we would like to hear from you. It's like the big future plans. And yeah, I believe the reason why Alexei asked about PM and what should he start from. She should start from grilling us about questions, how this should look like, more details. And it's probably now it's Maybe too early to speak about all of those stuff because now we focus on this initial rollout.

But yeah, at some point it will be necessary to just start building the more precise docs and plans, roadmaps, etc. So I think she will cover this with our help. But yeah, sounds cool.

And what I kind of like short term, Like we'll have a PM involved. Yvonne and Gabriel, Like right now we're kind of operating two separate projects. But I want to unify this into one team. And so I imagine Yvonne and Gabriel... will be involved with this as well. And so we, like I think we've talked about four or five people from from a focus reactive um but like this could it could be 10 or more and so um i also want to mention that on wednesday i don't think i've told everyone um wednesday our head of engineering is starting um and so he's going to need to get up to speed he's also a really big coder he's big into product and ai um and so our goals we have some really aggressive revenue goals that he's going to try and hit and like he needs everybody on those.

And so we're going to have to do all these things, big vision while also growing the current business. And so the current business is about to launch. Once this project's done, we're launching it globally. So we're going to see it in Poland. um, pretty soon. And, uh, the, um, And so, and all over the world. So, yeah. that's going to help grow revenue and profits and then allow us to continue to grow the company.

But we have very ambitious goals. And so we need very ambitious engineers.

Yeah, sounds cool. Actually, you mentioned like translations, but we haven't touched this yet, right? We just added the possibility, but I believe you'd like something like AI translations, right? So we already have a plugin and that's something that we can integrate in this project. Probably test this after release or before. I think it's something good to have.

How does that work?

It just takes everything from your CMS, all the text fields, rich text fields. When it's rich text, it's a huge object, so it traverses this object. And then it works per document, per page. So it has a context of the page. It tries to scope it to have better context because all the page content is related and then we just pass it to one of the AI providers. Now we use mostly GPT-4.0, I believe. It's still good for this price.

And it gets us translated strings back. We'll add them back to the CMS. That's how it works.

That's amazing. How do you guys do translations on a NextStats? So that was so we've done this before we pay paid one of those translation services. And what happened was our bundle size got massive. Like we weren't good about... I don't want to serve all the languages to every page.

No, no, no. It should be something statically generated or as you have many, many pages, we cannot just make all this build time. But we just fetch a necessary language. We don't need to fetch everything. So when we fetch the page, we fetch only the content for one language and we cache it. And that's solved. I don't actually see a case need all the languages for every page and bundle because it's something in server components that is already optimized.

So it's like it's even not in GS bundle, it's like optimized server components just in HTML. without any dynamic logic and insertions.

Cool. So I guess we end up putting all content in the CMS, right?

Yeah, ideally it should be there. Everything that we'd like to manage from inside the CMS. It's not about users and all the stuff should be really in your CockroachDB, but everything that should be like images, I don't know, any text titles, it should be in the CMS because it's the right place to manage it and to have it there.

Well, that's awesome. I love that you guys have that. And that's something we need. And we'll start translating.

Yeah, we just need to adapt to this plugin because you have a complex logic with these job titles, etc. It's not like usual our website where we have page by page. But the core logic which takes the data and this translation workflow, all this is already there. So it's just like superficial changes in how it consumes the data and where to find necessary things.

Awesome. And to add to the content search and the analytics. So like a lot of these things are not silent projects. They all kind of depend on each other. But like the, we need feedback on what is a good piece of content. So like when we show a list right now, we just show a static list for a job title. But some of them, we have data on what they're clicking, like the analytics tracks, which ones they're clicking, which ones they skip over.

And so we need a... Thank you. Like we need some sort of feedback. It doesn't have to be like the most amazing like personal experience yet, but we do need still. I want to know I want to sort what is shown to the user and that's why I like Algolia because Algolia does that out of the box and then they actually do client-side tracking so you can tell them which ones lead to like revenue and then you can it will sort based on revenue and so Algolia has got a cool setup, but I'm sure you guys, we don't necessarily have to, Algolia is super expensive.

And the problem with Algolia and our data right now is we've generated a list of like 60 strings for every job title. So we have like 20 to 30 million strings And a lot of them are redundant. A lot of them are, it's not like a, we need like a vector search that ties in Like, Yeah, maybe vector search is a good thing there, but we also need to somehow feed it back real user feedback. And that's something to think about.

Obviously, that's not MVP. MVP is just a search result. But thinking down the line a little bit, we will want... prioritized content strings and so that's something I just want to mention we do track that now but we've never used that data and so Yeah, that's a good area.

I mean, connecting analytics with the data and having review or quality check and outer updates maybe even of this content. It's a feature that we thought about for a long time but haven't implemented for any project. So yeah, we're definitely interested in something like this. Yeah, we can start thinking about this just at a high level, how it can be work, how it can be implemented. Cool.

So we have all these things and I can't wait to tell them to the PM and we'll just start knocking them out. Um... So, but... Yeah, so that's part of search. And we have a lot of work to do. So I hopefully came to the right team. Yeah. Good.

Thank you, Steph. It seems like...

we're loaded with lots of info. So most likely you will, Eugene, you'll be preparing like your your vision of a couple of things, how we're going to implement them in the nearest days, week.

And yeah, with the open discussion for Gabriel and Ivan. Uh, What do they think of the approach? Great. I'll move the Wednesday meeting to Tuesday just for you to get acquainted with the team. I do not expect It's going to take a lot of time discussing the closest tasks to do because Eugene is going to prepare us the how to say, the base. Where are we gonna? be busy. Next week. Yeah, it's just mainly to meet a couple of more people from our team.

Yeah. Yeah. Great. Exciting. Thank you again. Thank you for your time.

Yeah. And if you guys have any technical questions, feel free to throw that on the channel. Yvonne and Gabriel are able to help and I can hop into. But you guys should start working together.

Thank you. Thank you. Thank you. Thank you. Have a great day. Sorry again for being late. Bye. No problem. Bye. Bye.