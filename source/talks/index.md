---
layout: page
title: Talks | John Kary
heading: Talks
tags: []
status: publish
type: page
published: true
metadescription: "John Kary: User group and conference speaker. Slides, video and presentation notes from previous talks."
---
I sometimes speak at conferences and user groups about software development topics. Below are presentation slides and video recordings from most talks, in reverse chronological order.

* * * * *
<a name="rethinking-loops"></a>
## Rethinking Loops

<ul class="talk-list">
    <li>
        <a href="https://events.drupal.org/neworleans2016/sessions/rethinking-loops">DrupalCon 2016 - New Orleans, LA; May 2016</a>
        <ul>
            <li><a href="http://johnkary.net/slides/loops/drupalcon-2016/">Slides</a></li>
            <li><a href="https://www.youtube.com/watch?v=p2K2JHFMh1o">Video</a></li>
        </ul>
    </li>
    <li>
        <a href="http://lonestarphp.com/sessions/#rethinking-loops">Lone Star PHP Conference - Dallas, TX; April 2016</a>
        <ul>
            <li><a href="http://johnkary.net/slides/loops/lonestar-php-2016/">Slides</a></li>
            <li><a href="https://joind.in/event/lone-star-php-2016/rethinking-loops">Feedback</a></li>
        </ul>
    </li>
    <li>
        <a href="http://2016.midwestphp.org/session/rethinking-loops/">Midwest PHP Conference - Minneapolis, MN; March 2016</a>
        <ul>
            <li><a href="http://johnkary.net/slides/loops/midwest-php-2016/">Slides</a></li>
            <li><a href="https://joind.in/event/midwest-php-2016/rethinking-loops">Feedback</a></li>
        </ul>
    </li>
    <li>
        <a href="http://www.meetup.com/kcphpug/events/228981334/">Kansas City PHP User Group - March 2016</a>
        <ul>
            <li><a href="https://joind.in/event/kcphp-user-group---march-2016/rethinking-loops">Feedback</a></li>
        </ul>
    </li>
    <li>
        <a href="http://www.meetup.com/Lawrence-Coders/events/227939885/">Lawrence Coders - February 2016</a>
    </li>
</ul>

You likely learned about loop constructs very early in your programming
career and use them every day--so often you don't think twice! The
problem is for() and foreach() are so fundamental developers use them
for everything! Even worse almost every developer will use them
differently to accomplish the same goal. So what would
intention-revealing, expressive PHP code look like without using for()
and foreach()? Let's explore some functional programming concepts and
find out.

Knowing basic functional programming concepts will improve your PHP
code. Your new mindset will favor writing code with better separation of
concerns and decreased complexity: clean code. We will explore some poor
examples of using loops to process data, then ease into learning
functional concepts like map, reduce, filter and collection pipelining.
We'll even use our newfound knowledge to refactor a few loops. Lastly
we'll explore some existing libraries and even experimental PHP RFC
features to make our code even more concise. Beware: after this talk
you'll never look at for() and foreach() loops the same again!

* * * * *

<a name="time-travel"></a>
## Time Travel is Here!

[June 2015, Lawrence Free State Festival](http://freestatefestival.org/)

This talk (not about software development) discusses how time travel is possible today. Science fiction didn't lie to us, it simply set our expectations too high. We explore how modern technology has reached this point, and how time travel will change in the future (pun maybe intended) as fields like Artificial Intelligence, Augmented Reality and Virtual Reality inevitably become mainstream.

* * * * *

<a name="funtions-part1"></a>
## Functions in PHP: Writing Your Own Functions

[February 2015, Kansas City PHP User Group](http://www.meetup.com/kcphpug/events/219469114/)

[Slides](https://speakerdeck.com/johnkary/functions-in-php-part-1-writing-your-own-functions)  
[Video](http://youtu.be/F4VNT-gAaAs)  
[Attendee Feedback](https://joind.in/event/kcphp-user-group---february-2015/functions-part-one-your-first-custom-function)

This talk is geared towards developers comfortable using PHP's native
functions and are curious how to write better custom functions. John
presents 4 guidelines that if followed will result in clear, focused
functions that are easy to read, reason about and reuse.

* * * * *

<a name="dates-times"></a>
## Working with dates and times in PHP

[January 2015, Kansas City PHP User Group](http://www.meetup.com/kcphpug/events/219461977/)

No slides or video. Most of presentation was done in a REPL and editor.  
[Attendee Feedback](https://legacy.joind.in/talk/view/13193)

Modeling dates and times in programs is tricky. After this presentation
you'll learn how PHP's built-in DateTime library helps you avoid the
most common pitfalls. You'll also find recommendations on open-source
libraries to work with things like date recurrence and calendar logic.

* * * * *

<a name="software-soft"></a>
## Keeping Software Soft

[January 2015, Lawrence Coders](http://www.meetup.com/Lawrence-Coders/events/219469346/)

[Slides](https://speakerdeck.com/johnkary/keeping-software-soft)

Software provides continual value when it can evolve with the business. But without proper care it's easy for software to become rigid and difficult to change--it stops being soft. In this talk John introduces ways to think of software and systems we build as independent, replaceable components.

* * * * *

<a name="scratch"></a>
## Scratch: An On-Ramp to Programming

[August 2014, Lawrence Coders](http://www.meetup.com/Lawrence-Coders/events/193770022/)

[Slides](https://speakerdeck.com/johnkary/scratch-an-on-ramp-to-programming)

Learning to program computers in the traditional sense has many pitfalls that are barriers for newcomers. The future job market for programmers is bright and kids should be taught to control technology rather than only consuming it.

John talks about [Scratch](http://scratch.mit.edu), the visual programming language from MIT, and how he thinks it's the best "first" programming language for the next generation of developers. Scratch hits the sweet spot to overcoming introductory pitfalls and provides a safe environment for kids to learn, explore and share their digital creations.

* * * * *

<a name="refactoring-less"></a>
## Refactoring: Less Code, Less Problems (Part 1)

[April 2014, Kansas City PHP User Group](http://www.meetup.com/kcphpug/events/169569762/)

[Slides](https://speakerdeck.com/johnkary/refactoring-less-code-less-problems-part-1)  
[Video](https://www.youtube.com/watch?v=PjHZFTbg6gg)

John talks about guidelines and code smells for improving object API design. He takes an existing class and demonstrates refactoring it to a leaner more focused version of its previous self. Most importantly, what questions to ask yourself as you're writing new classes.

Pass 1 (and a future Part 2) will approach refactoring a class from the outside as opposed to the inside. We discuss topics like breaking apart bigger classes to make smaller classes that do one thing, programming without getters and setters, consistent entry and return points, and guidelines for object instantiation. This talk focuses less on in-function refactoring and more on API-level refactoring.

* * * * *

## Last Month in PHP

Recurring talk at most [Kansas City PHP User Group][] meetings. I
summarize important news stories and happenings in the PHP community
from the previous month before the presentation was delivered. Gives
special attention to issues relevant to most of our regular attendees.

[April 2014](https://speakerdeck.com/johnkary/last-6-months-in-php-april-2014)  
[September 2013](https://speakerdeck.com/johnkary/last-month-in-php-september-2013)  
[August 2013](https://speakerdeck.com/johnkary/last-month-in-php-august-2013)  
[March 2013](https://speakerdeck.com/johnkary/last-month-in-php-march-2013)  
[February 2013](https://speakerdeck.com/johnkary/last-month-in-php-february-2013)  
[December 2012](https://speakerdeck.com/johnkary/last-month-in-php-december-2012)  
[November 2012](https://speakerdeck.com/johnkary/last-month-in-php-november-2012)  
[September 2012][]  
[July 2012][]  
[June 2012][]

* * * * *

## Writing Extensible Code Using Event Dispatcher

[October 2012, Kansas City PHP User Group](http://www.meetup.com/kcphpug/events/85746812/)

Demonstrate refactoring a typical Controller to using Symfony2 EventDispatcher component to make writing decoupled code easier.

[Slides](https://speakerdeck.com/johnkary/writing-extensible-code-using-event-dispatcher)  
[Video](http://www.youtube.com/watch?v=q3hfa3wdT0s&feature=plcp)  
[Attendee Feedback](https://legacy.joind.in/talk/view/7551)

* * * * *

## Git In It: Beginning to Use Git

[June 2012, Kansas City Drupal User Group][]

Covers common misconceptions about version control, how to setup your environment to work with git, how to get up and going with git in your daily development workflow, and where to go to learn more.

[Slides][1]  
[Video][]

* * * * *

## Vagrant + Drupal + Drush: Automating setup of a Drupal development environment

[May 2012, Lawrence Coders](http://www.meetup.com/Lawrence-Coders/events/62273962/)

Repeatable development environment for teams looking to do collaborative Drupal development. Major props to [Chris Escalante][] for his role in technically implementing this solution for our team. 

[Slides][2]  
[Video][3]

* * * * *

## Everyday Effectiveness With git

[April 2012, Lawrence Coders](http://www.meetup.com/Lawrence-Coders/events/55342892/)  
April 2012, Kansas City PHP User Group

Working effectively with git on a daily basis is a lot easier with a few tips on setting up your environment and making common commands faster to type. I also cover different code-sharing models and common workflows for working in a collaborative environment.

[Slides][4]

* * * * *

## Scared Straight: Mitigating OWASP Top 10 with PHP

January 2011, University of Kansas Web Developers monthly meeting

Overview of the most common security threats facing modern web
applications and how to mitigate them when using PHP.

[Slides][5]

* * * * *

## YUI Graded Browser Support

November 2010, University of Kansas Web Developers monthly meeting

Current state of YUI Graded Browser Support. Please note, much of the information in this talk is outdated as of September 2011. Yahoo Graded Browser Support no longer grades browsers, and instead advocates for supporting a list of certain browsers, but ultimately pushes developers to do their own analytic testing and support browsers most-used by their user base.

[Slides][6]  
[Video][7]  
[Yahoo Graded Browser Support][]

* * * * *

## Beyond Arial: Using @font-face to unleash web typography

September 2010, University of Kansas Web Developers monthly meeting


Current best practices advice on using @font-face, history of fonts on the web, browser support and font format support and challenges of @font-face.

[Slides][8]  
[Video][9]

* * * * *

## Using Virtual Machines in Web Development

January 2010, University of Kansas Web Developers monthly meeting

[Slides][10]

* * * * *

## Intro to Debugging PHP with Xdebug

January 2010, Lawrence Programmers Hack Day

[Slides][11]

  [Kansas City PHP User Group]: http://www.meetup.com/kcphpug/
  [September 2012]: https://speakerdeck.com/johnkary/last-month-in-php-september-2012
  [July 2012]: https://speakerdeck.com/johnkary/last-month-in-php-july-2012
  [June 2012]: https://speakerdeck.com/johnkary/last-month-in-php-june-2012
  [October 2012, Kansas City Drupal User Group]: http://www.meetup.com/kcphpug/events/85746812/
  [June 2012, Kansas City Drupal User Group]: http://www.meetup.com/Greater-Kansas-City-Drupal-User-Group/events/66995032/
  [1]: https://speakerdeck.com/johnkary/git-in-it-beginning-to-use-git
  [Video]: http://vimeo.com/44991859
  [Chris Escalante]: https://twitter.com/tidrion
  [2]: https://speakerdeck.com/johnkary/vagrant-drupal-drush-automating-setup-of-a-drupal-development-environment
  [3]: http://vimeo.com/42516291
  [4]: https://speakerdeck.com/johnkary/everyday-effectiveness-with-git
  [5]: http://www.slideshare.net/johnkary/scared-straight-mitigating-owasp-top-10-with-php
  [6]: http://www.slideshare.net/johnkary/yui-graded-browser-support
  [7]: http://vimeo.com/28845949
  [Yahoo Graded Browser Support]: http://yuilibrary.com/yui/docs/tutorials/gbs/
  [8]: http://www.slideshare.net/johnkary/using-fontface-to-unleash-web-typography
  [9]: http://vimeo.com/15402487
  [10]: http://www.slideshare.net/johnkary/using-virtual-machines-in-web-development
  [11]: http://www.slideshare.net/johnkary/intro-to-debugging-php-with-xdebug
