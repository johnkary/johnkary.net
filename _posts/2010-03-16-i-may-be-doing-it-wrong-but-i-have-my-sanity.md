---
layout: post
title: I May Be Doing it Wrong, But I Have My Sanity
description: "Marco Tabini recently wrote on the php|architect blog that \"programmers are doing it wrong.\" He argues that many programmers have become hung up on writing mythical perfect code that abides by all modern best practices instead of doing what we are hired to do: solve problems quickly and efficiently. But if you spend time writing it well the first time, you too can save your sanity."
tags:
- best practices
- php
- rants
status: publish
type: post
published: true
meta:
  _edit_last: '1'
alias: /i-may-be-doing-it-wrong-but-i-have-my-sanity
---
Marco Tabini [recently wrote](http://www.phparch.com/2010/03/10/programming-youre-doing-it-wrong/) on the php|architect blog that "programmers are doing it wrong." He argues that many programmers have become hung up on writing mythical perfect code that abides by all modern best practices instead of doing what we are hired to do: solve problems quickly and efficiently. But if you spend time writing it well the first time, you too can save your sanity.

I'll admit, I'm in that latter group of striving to write "perfect code." I constantly read articles, pour over well-written open-source code (mostly Symfony code) and review conference presentation slides posted by notable developers on [SlideShare](http://www.slideshare.net/search/slideshow?searchfrom=header&q=PHP).

Like every one of us, I've come a long way from where I was when I started writing PHP. (With a long way to go, still, I'm sure.) I remember the days of constantly hitting syntax errors before discovering IDEs and performing search and replace over an entire project to update code duplicated across multiple files. Yeah, it was a nightmare. One I would prefer to not repeat.

So while I'm not going to read a single article about a design pattern and roll it into my next production product, I am going to continue learning from the best developers in the industry and explore the concepts they advocate.

### The Redheaded Stepchild: WordPress (and its many siblings)

Marco also claims that even though WordPress is regarded as "unmaintainable" by many in the community, it has plenty of maintainers and many plugin contributors. But making the "quantity over quality" argument here holds no weight.

WordPress has a lot of maintainers because it still relies on concepts and methods that many junior developers think are OK. Meaning, "WordPress developers" haven't become fed up with their code quality enough to push deeper. WordPress' codebase is how beginners write code, so it is familiar to a large number of developers eager to put their mark on something. Many PHP programmers never progress past this stage. And their ignorance is probably bliss.

Given WordPress' popularity, many junior developers view the code under the hood and think, "WordPress is successful. This must be how you write successful PHP code." NO! It's not! Writing code like that is what makes you hate your job!

Marco argues that if your code works and you are releasing software, you are doing it right. But how much did you hate your life when&hellip;

1.  you had to fix more than one security issue per release cycle
2.  you spent hours trying to fix a single bug, only to have squash it, and it broke twenty other things
3.  realizing you missed other occurrences of that same bug after fixing it in the previous release
4.  the API/software you write third-party code for breaks your plugin with every release (just like WordPress does.)

Having to fix broken code not done well the first time will cost your client more money, and cost you your patience and ambition. Spend time thinking about your next function before you haphazardly write it. Think about its context, where might it be reused in the future, and what parts could be swapped out to make it more reusable and easier to test.

Where do you want to spend your time&hellip; Up front researching, reading and writing quality code up front with [DRY principles](http://en.wikipedia.org/wiki/Don't_repeat_yourself) and hopefully at least [some unit tests](https://leanpub.com/grumpy-testing)? Or at crunch time cursing your monitor and slamming your head on your desk agonizing over code you wrote 3 months ago?

### Do Something! Learn From the Best

When you're writing code or debugging old code and thinking, "There's got to be a better way&hellip;!" There is.

Start with the PHP Advent series: [2009](http://phpadvent.org/2009), [2008](http://phpadvent.org/2008), [2007](http://shiflett.org/blog/2007/dec/php-advent-calendar-2007).

Learn [what Dependency Injection is](http://fabien.potencier.org/article/11/what-is-dependency-injection) and [how you can use it](http://www.slideshare.net/fabpot/dependency-injection-confoo-2010). 

[Follow](http://twitter.com/pmjones) [some](http://twitter.com/shiflett) [of](http://twitter.com/coates) [the](http://twitter.com/derickr) [most](http://twitter.com/s_bergmann) [respected](http://twitter.com/rasmus) [PHP](http://twitter.com/giorgiosironi) [developers](http://twitter.com/jwage) [on](http://twitter.com/phparch) [Twitter](http://twitter.com/fabpot).

And start writing better code.
