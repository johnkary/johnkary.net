---
layout: post
title: Keeping your users' trust in web applications
description: "Trust is priceless. Breaking the trust bond in a relationship, whether friendly, emotional or vendor-to-end-user, is a serious breach of social contract. As web app developers and content creators, we must instill trust in our users with the goal of making them feel comfortable using our applications and ultimately giving up some of their personal info."
tags:
- rant
- rants
- usability
status: publish
type: post
published: true
meta:
  _edit_last: '1'
alias: /keeping-your-users-trust-in-web-applications
---
Trust is priceless. Breaking the trust bond in a relationship, whether friendly, emotional or vendor-to-end-user, is a serious breach of social contract. As web app developers and content creators, we must instill trust in our users with the goal of making them feel comfortable using our applications and ultimately giving up some of their personal info.

How often do you give away your personal information just because somebody asks for it, but not really knowing what they will do with it? You know what I'm talking about. Signing up for that "free" magazine subscription. Giving your phone number to the cashier when buying that new movie. Plugging in your email to receive order status updates about that $1.49 cable you bought from a company you never heard of but saw on SlickDeals. Like you, I've done all of these. But not without thinking twice about it.

As application developers, we have insight on both sides: consumers signing up for online services, and building our own services for others to use. When building services, you're in one of two camps: those that harness their users' info for marketing purposes, or those that don't. Regardless of where you fall, you have a responsibility to be transparent and open about how you intend to use or not use the data you're given. And how you present your site design, sign up forms and privacy policy (if you have one) play an important role in how much info your users will trust you with.

### Tell your users in simple terms: *Your data is safe with us*

I'm going to guess the majority of us building unique web applications aren't in the market of sharing our users' data with a third-party. We just need a way to track them in our `user` table. But how do our users know this?

Sure, they could read the privacy policy, but nobody *wants* to wade through legalese. There are a million apps out there I could sign up for. I just want to use the app. Let me in. Check. Done. But when given a long privacy policy, I can't help but think, "&hellip;I don't know what I'm agreeing to, but I'll give these guys the benefit of the doubt."

I feel much better if I'm given a friendly note on the sign up form: "We don't share your info, promise!" In fact, I will usually trust a company *even more* if they come right out and say it, rather than hiding behind a privacy policy checkbox.

Of course, if you're shooting for the "next big thing" status, you'll eventually need a legalese privacy policy. But why not give the full legal version, *and* a cliff notes version? (Hello, mortgage industry?)

### Tell your users what is going to happen, and do it

When presented with a sign-up form, another thought goes through my mind: "Will I need to verify my email address?" Depending on what I think might happen, I will either give up my @hotmail address (spam-friendly) or my more personal @gmail address.

If you tell your users what is going to happen, and actually follow through on it, you **automatically** build trust. "Hey! They did what they said they would!" If your user needs to confirm their email address after submitting the form, tell them. Set expectations and set yourself up to meet them.

### Ask for all required info on your Register form

If you really, really need a user's address and phone number to start an account, make it obvious. Give a little red \* or REQUIRED next to your required fields.

The absolute worst thing a company could do is present a simple Register form (Name, Email, Password), require e-mail verification, then after verifying the address with a URL, *require* the user to give up their Mailing Address, Phone Number and Birthday before fully activating their account.

Not only will you likely increase the number of "@\*\$\# you" occurrences in your database, but you are asking users to jump through yet another hoop to use your site. All fields should be on one form with required fields noted, so the user can quickly see which info is required, and if they want to give it to you.

Make the barrier for entry as low as possible. Don't get roped into the backwards old-media ways of thinking! It is not the user's privilege to use your site: it is YOUR privilege that they have chosen to use your site. Without your users, your site doesn't exist.

### Don't create more work for the user

If the user clicks Submit and has to correct a few fields, you're not doing your job as a data filterer or a form architect. And you're certainly not building trust. Even if the user enters the wrong info and has to re-complete some fields, they WILL BLAME YOU for not making it more obvious.

This means setting proper labels for your form fields, using color or size to denote required fields and not overwhelming the user. Don't give them a chance to become distracted. You want them to complete your form the first time through instead of making 3 round trips to the server. This not only slows them down from jumping in and using your application, but detracts from the confidence and trust the user has in your application's ability to work correctly and in the way they intend.

### User Testing and Production Analysis

A lot of the pitfalls discussed here can be prevented with proper user testing and good feedback questions asked of your test users. Don't just focus on objective data: "How quickly did the user complete the form?" Pull questions on the **emotions** the user felt when first looking at the site, and after completing registration. "On a scale of 1-5, how much do you trust this company to abide by what they say? To store your data? To perform how you expect?"

The flip side is gathering statistical analysis of your production data after launch. If the bounce rate for your Registration form is high, something is scaring people away. Does your website appear friendly? Is your form well-laid out? Can a user quickly skim through it? Do you treat your users like a humans or spam bots? (Is your CAPTCHA harder than Contra?)

Usage statistics won't tell the full story. What is your clean record to dirty record ratio? Are you collecting real data or are users entering gibberish? Re-evaluate. Do you *absolutely need* the info you're requesting?

### Further Reading

The following are must-reads for architecting web forms and general web content with a slant towards usability and building users' trust.

-   [Web Form Design Patters: Sign-Up Forms](http://www.smashingmagazine.com/2008/07/04/web-form-design-patterns-sign-up-forms/) - Smashing Magazine
-   [Don't Make Me Think](http://www.amazon.com/Think-Common-Sense-Approach-Usability/dp/0789723107) - Steve Krug
-   [Jakob Nielsen's Alertbox: Current Issues in Web Usability](http://www.useit.com/alertbox/)
-   [Clear And Effective Communication In Web Design](http://www.smashingmagazine.com/2009/02/03/clear-and-effective-communication-in-web-design/) - Smashing Magazine
-   [12 Excellent Examples of "Lazy Registration"](http://webjackalope.com/lazy-registration/) - Web Jackalope

Feel free to leave additional reading recommendations or other ideas in the comments. What methods do you go through when laying out your web forms? Is your development front-end test-heavy, or more reliant on A/B results in production?
