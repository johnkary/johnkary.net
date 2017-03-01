---
layout: post
title: "Who is to blame when the magic runs out?"
image: /images/posts/crash.jpg
description: "Amazon S3 experienced an outage yesterday, making some SaaS products appear broken while others downright unusable.

When they breakdown, the technologies that empowered us so effortlessly now limit us. We become demoted from value-add to net negative. And it's all beyond our control because we don't understand the magic behind that technology's curtain. We look to project failure onto someone else--onto the real reason we can't do more.

But when it's broken, who is to blame?"
comments: false
published: true
tags: [software]
---
<div class="image">
     <img src="/images/posts/crash.jpg" width="700" title="Who is to blame when the magic runs out?" alt="A plastic LEGO man in race car driver attire flies through the air over his race car that has lost two wheels." style="max-width:100%;">
     <span class="photo-credit">Photo Credit: <a href="https://www.flickr.com/photos/clement127/12194820693/">clement127</a></span>
</div>

<div class="audio">
    <h2>Prefer audio? I narrated this post.<br>Click play to listen. Like it? Let me know! <a href="https://twitter.com/johnkary">@johnkary</a></h2>
    <audio controls preload="metadata">
      <source src="http://johnkary.net-media.s3.amazonaws.com/audio/who-is-to-blame-when-the-magic-runs-out.mp3" type="audio/mpeg">
    Your browser does not support the audio HTML tag.
    </audio>
</div>

> Everything is amazing, and nobody's happy. &mdash; Louis CK

Amazon S3 experienced an outage yesterday, making some SaaS products appear broken while others downright unusable. This outage took down large parts of the internet. Ouch.

The outage wasn't limited to online. Some Internet of Things gadgets depend on services like [IFTTT](https://ifttt.com/) to integrate between the gadget interface in the real world and the Internet-connected world. It feels a little like magic when it works as planned.

But when that magic is broken?

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Mmm. Can't turn some of my lights on at home cos <a href="https://twitter.com/IFTTT">@IFTTT</a> is down. Welcome to the future!<a href="https://twitter.com/internetofshit">@internetofshit</a> <a href="https://t.co/CPw0rGaKR5">pic.twitter.com/CPw0rGaKR5</a></p>&mdash; Stuart Thomas (@stuartthomas) <a href="https://twitter.com/stuartthomas/status/836640721826365440">February 28, 2017</a></blockquote>

<hr>

Not being able to turn on the lights is one thing. What if an outage becomes a fire hazard?

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Not to raise alarm here or anything, but I&#39;m unable to turn off my <a href="https://twitter.com/hashtag/IoT?src=hash">#IoT</a> oven ever since <a href="https://twitter.com/hashtag/s3?src=hash">#s3</a> went down...

It&#39;s getting kinda toasty in here</p>&mdash; pronto@ °.• 🕚 (@_pronto_) <a href="https://twitter.com/_pronto_/status/836655399336038401">February 28, 2017</a></blockquote>

<hr>

During the outage the Amazon Web Services status page, which itself reports on service availability, ironically experienced an outage itself, due to its own reliance on S3.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">The dashboard not changing color is related to S3 issue.  See the banner at the top of the dashboard for updates.</p>&mdash; Amazon Web Services (@awscloud) <a href="https://twitter.com/awscloud/status/836656664635846656">February 28, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

When they breakdown, the technologies that empowered us so effortlessly now limit us. We become demoted from value-add to net negative. And it's all beyond our control because we don't understand the magic behind that technology's curtain. We look to project failure onto *someone else*--onto the *real reason* we can't do more.

**Who is to blame?**

## When the Magic Runs Out

Grant loves Twitter. It's a quick escape on his 30-minute lunch break that's all too short before he crawls back to his call-center cubicle to proposition another unsuspecting victim.

Finally free from the clutches of his headset, Grant fires up his favorite Twitter app, TweetPad. He just wants a laugh, one laugh, to calm the defeat he feels in his heart from making failed direct sales calls all day. But today the funny images aren't showing up. Tapping those familiar buttons does nothing. Pieces of the interface are missing. TweetPad is **broken.** [This is bullshit.](https://www.youtube.com/watch?v=q8LaT5Iiwo4)

Grant blasts TweetPad in his next tweet, posted from another Twitter client that doesn't rely on S3. TweetPad loses trust amongst Grant's followers as a reliable service. In turn, attracting less users, resulting in less growth, and less profits.

**Who is to blame?** TweetPad engineers, for relying on a single point of failure? Amazon, for not providing a reliable service? An Amazon engineering team, who didn't design a fault-tolerant system?

## The Great Lawrence Internet Outage of January 2017

Where I live in Lawrence, Kansas, a college town of about 90,000, a single ISP supplies internet to the majority of residential and business customers. One afternoon, the #LFK hashtag was ablaze with reports the internet was down. The ISP, fittingly named "WOW!", (yes, that's actually their name) became a parody of itself.

Some local businesses even tweeted they were unable to accept business because their point-of-sale terminals were unavailable without an internet connection.

**Who is to blame?** The business, for not having a backup payment processor? The ISP, for not providing a reliable internet service? The point-of-sale terminal, for designing a service with a single point of failure?

(According to the ISP, a fiber-optic cable was severed due to a car crash near a major junction box. **Who is to blame for that one?**)

## The Chain of Blame

Where does the chain of blame end when everything we do is dependent on so many lower-level things going *just right?*

Ben and Katie's favorite restaurant is closed because the kitchen is unable to prepare food without electricity. Customers are understandably frustrated, but Ben and Katie feel their anniversary dinner plans are ruined. The businesses lose real profits and the unconscious trust they had in it.

**Who is to blame?** The restaurant, for not having a redundant power supply? The electric company, for not providing reliable service? The electrician, who improperly installed the down-converter that blew up causing the outage?

The driver's side tire of a late-model four-door car flies off while zipping down the highway. This freak accident causes a crash, claiming the life of the car's driver. Twenty-eight year old Saura was hurrying back to her laboratory to analyze the latest samples in her groundbreaking biology research. Sadly, the world may never know the outcome.

**Who is to blame?** The mechanic, for not properly re-tightening the lug nuts? Saura, for not checking her car was in proper working condition before driving? The car manufacturer for designing a non-standard wheel system that cut costs to meet shareholder demands for profits?

## Software Ownership

Every technology is powered by a magic that we take for granted. Is there magic in software development?

Developers routinely pull open-source libraries into their projects. If a developer can re-use code someone else has already written, it leaves them to focus on higher-level problems and deliver more value more quickly, yada yada. Congrats, that's why we're all here, to build "technology."

However nearly all developers think nothing of how that code came to be or what quality it bares beyond the magic curtain of its public interface.

After a few weeks, a problem crops up. The developer narrows down the problem to a bug in the open-source library that miscalculates payments. Customers are being charged twice the normal price. Oops.

The negative app store reviews practically write themselves. In the short term, no amount of damage control apologies and free coupons will repair the lost trust between the company and its paying customers.

**Who is to blame?** The developer who installed the code, for not reviewing the code themselves? The original developer who wrote the bug in the open-source library? What about the open-source community itself, for not seeing and fixing the bug sooner? (Hint: Almost all open-source libraries contain licenses releasing their authors from liability. Good luck filing a lawsuit.)

## Stop Blame Behind the Magic Curtain

When a failure occurs within your team or company, you know all the details. It wasn't personally your fault and maybe not even your team's fault.

Searching for blame and fault behind the curtain is toxic. It creates a [Blame Culture](https://hbr.org/2010/05/how-to-stop-the-blame-game) that drags down the team's creativity and ability to work together to do amazing work. Even searching for blame erodes trust among the very people who should trust each other the most in your organization.

Instead, when something goes wrong, collectively accept the blame. "Yep. It was ME. It was US. We did it. And we're gonna to fix it."

When bugs reach customers it's not likely because the author was incompetent. Instead maybe the team's code review practice was just not good enough. Maybe their checklists weren't followed or simply didn't exist.

Throw a party! A weakness has been discovered! This otherwise bad situation becomes an opportunity to improve.

Task those who could be blamed with contributing to a plan that keeps it from happening again.

## Stop Blame Outside the Magic Curtain

We as makers especially fall victim to blaming technology and its makers when their magic runs out. Certainly *we* would have never made such a stupid mistake. I mean, how can you screw up Copy & Paste?!

Have compassion. Cultivate empathy. Everyone else is working just as hard to make great things and empower you and everyone else to build even bigger things.

This goes for everything we use in life. The person, people and team who made that tool are probably working their hardest to make the best thing they can given their constraints on time, talent and budget.

Stop for a moment and forgive their oversight. Think of the power you gain from when their tool works correctly. It's much, much more than the small crash or deficiency you just found.

If you can help, submit a bug ticket. Or even submit that diagnostic report after the app launches again. And don't include some smart ass insult.

Stop perpetuate blame culture on both sides of the curtain.

That includes not trashing Amazon for the S3 outage yesterday, and all the products relying on AWS to build great things.

I mean, give it a second. *It's going to space!*

<div class="embed-container"><iframe src="https://www.youtube.com/embed/q8LaT5Iiwo4" frameborder="0" allowfullscreen></iframe></div>
