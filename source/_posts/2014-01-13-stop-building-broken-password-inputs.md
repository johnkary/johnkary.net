---
layout: post
title: "Stop building broken password inputs (and how to work around the offenders)"
description: "I have run into some sites (usually within a security-focused domain like banking or health care) that use misleading or downright bad security practices during their user registration process. Overall these practices decrease the user experience, and at worst encourage their users to succumb to poor security practices.

Why might these sites choose to do this? What are the side effects? And how can savvy developers work around them?"
comments: false
tags: [security, javascript, ux, ui]
---

I spent some time recently setting up a new username and password on a site handling some of my finances. This is the type of site that thinks security questions and a "personal image" are a good addition to the security theater they subject their users to when creating an account.

When registering my account on this specific site, I randomly generated a long, complex password and copied it to my clipboard with the intent to paste it into the password and password-confirmation text inputs.

I placed my cursor in the password box and pressed "⌘ + V" to paste my clipboard text into the input. Nothing. Maybe I didn't copy the password correctly. I generated another password and pasted again. Nothing. Ah great, **another site preventing its users from pasting text into text boxes.**

I tweeted the following, partly wondering allowed, partly in frustration:

<blockquote class="twitter-tweet" lang="en"><p>Why do some sites disallow pasting from clipboard into text inputs? I really don&#39;t want to type my 32-character randomly generated passwords</p>&mdash; John Kary (@johnkary) <a href="https://twitter.com/johnkary/statuses/419928097551437824">January 5, 2014</a></blockquote>

Site features should be oriented towards business goals, right? So what business goal might a company have with not allowing a user to paste text?

I image the business saying their goal was "to decrease incorrect registration data, resulting in less user frustration and less required user support." Sounds good in theory... Keep users happy when using the site, and keep company expenses down by requiring less staff to support users misusing their software.

## Balancing the sliding scale

Implementing information security is a trade-off between convenience and security of data. This almost always functions as a sliding scale: practices that are easier to use are often less secure. But the most secure actions often take much more effort on behalf of the user. Too much inconvenience and the user will forgo implementing security all together.

When I think of "online security" I think of things like encryption, anonymity and privacy. The last piece, "privacy," is usually implemented as segregation of data access, implemented via user account and password.

If an account can only be accessed by one who knows its password, data is reasonably more secure than if it were publicly available. (The inconveniences in using other stronger authentication mechanisms have probably prevented widespread adoption for most consumer-facing applications.) So in order to use online accounts with some added privacy, users tolerate the inconvenience of creating a new user account and password for each site they want to access privately.

## Solving the wrong problem

Most sites require entering a username and entering the same password twice when creating an account.

The current standard practice to decrease erroneous password entry is requiring the user to enter their password twice: once in two separate text inputs. A password like `il0vemydog123!` isn't too inconvenient to type two times on a full sized keyboard, and is perhaps mildly inconvenient to type twice on a mobile phone keyboard. The trade-off is the inconvenience of typing a password twice **is less inconvenient** than if the user were to mistype their password once and **become locked out of their account.**

Yet I firmly believe **password confirmation boxes are solving the wrong problem.** The only reason a user must type a password twice is to decrease the likelihood they mistyped their intended password one of the two times. Why might they mistype it? **Because the user can't see the result of their typing.**

I side with [Luke Wroblewski](http://www.lukew.com/about/) on how to solve this issue:

1. Password boxes should offer a "Hide/Show" button adjacent to a single password box that obscures the user's typing by replacing each character with an asterisk.
2. Using this strategy, **the user's password is typed in plain-text and is visible by default**, leading to visual confirmation that the password was typed correctly the first time.

Mobile devices continue to increase in penetration, where typing is much more difficult, so developers should firstly reevaluate this long-held and broken user experience practice of requiring a user to confirm their password using two password boxes.

Luke does a great job illustrating the pros and cons of this approach in his post [Mobile Design Details: Hide/Show Passwords](http://www.lukew.com/ff/entry.asp?1653=).

## Disabling pasting text could decrease password security

My friend and go-to security expert, Bryan Geraghty, offered this insight in response to my earlier tweet:

<blockquote class="twitter-tweet" data-conversation="none" lang="en"><p><a href="https://twitter.com/johnkary">@johnkary</a> Not allowing users copy and paste passwords means that you are likely an easier brute-force target. We don&#39;t report that ATM.</p>&mdash; Bryan C. Geraghty (@archwisp) <a href="https://twitter.com/archwisp/statuses/419934717392076800">January 5, 2014</a></blockquote>

Why might this be the case?

A long, complex password is inherently difficult to type. If a user must type a complex password twice, there are probably a certain percentage of users that will forgo typing a long password and either use a shorter password or one that requires less key-presses to type.

This is where Bryan's point aligns with the security sliding scale: a user experience that makes it more difficult to use a better security practice will likely lead to a choice that is **easier for the user and less secure for their data.** In this case, a weaker password is easier to guess or extract via a [brute force attack](https://en.wikipedia.org/wiki/Brute-force_attack).

## Working around the inability to paste

Sites that disable the ability to paste do this with JavaScript, often by listening for the `paste` browser Event, then preventing the default behavior that would normally take the clipboard text and place it at the cursor location. Less sophisticated preventions might simply intercept a platform-specific key combination.

There are several ways we can work around this restriction by executing our own JavaScript:

1. Use a password vault browser plugin with "auto-fill" capability
2. The browser's Location bar prefixed with `javascript:`
3. The browser's Developer Console
4. A custom bookmarklet
5. Write a custom browser extension

## Password Vault Browser Plugin

Password vaults like [LastPass](https://lastpass.com/) or [1Password](https://agilebits.com/onepassword) have browser extensions that will fill in a saved username and password into a site's text inputs for user login. These extensions use JavaScript and a stored input selector associated with a site/URL to target each field that must be filled.

These extensions are your best bet for security by&hellip;

1. Preventing you from ever needing to manually type your password (preventing keylogger interception)
2. URL/domain matching prevents entering credentials into phishing sites appearing as legitimate sites.

If you're not using a password vault yet, I highly encourage you to start today! If you're not yet ready for that commitment, keep reading. We can still circumvent sites preventing you from fully using their registration form.

## Custom JavaScript solutions

The remaining four solutions require us to execute custom JavaScript we write ourselves. This vanilla JavaScript will force our own text value into a text input.

But first you need to find a way for JavaScript to select the target text input. There are several ways to select the element (id, class, name), but the easiest is by its HTML "id" attribute via `getElementById()`. If your site requires a different solution, I will leave that to you to investigate.

{% highlight javascript %}
document.getElementById('password').value = 'mypassword';
{% endhighlight %}

We can execute this code on the page in a few ways.

## Location Bar

The Location bar can execute JavaScript when code is prefixed with `javascript:`:

{% highlight console %}
javascript:function fillpw()%7Bdocument.getElementById('password').value='mypassword';%7Dfillpw();
{% endhighlight %}

The downsides of this approach are that this text could be sent to the browser vendor (via auto-complete engine or other statistics-gathering techniques), submitted to the browser's default search engine if mistyped, or persisted in the Location bar's plain-text history.

At the risk of exposing your password in persisted plain-text, there are better solutions.

## Developer Console

If you only need to override the ability to paste just one time, the following technique is probably your next best option after the password vault technique above.

Open the developer console using its keyboard shortcut ([Chrome](https://developers.google.com/chrome-developer-tools/docs/shortcuts#opening-devtools), [Firefox](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly#w_tools)) or menu selection, and enter the following JavaScript:

{% highlight javascript %}
document.getElementById('password').value = 'mypassword';
{% endhighlight %}

## Custom Bookmarklet

If you have one offending site that you repeatedly visit, you'll want a more dynamic solution. A bookmarklet stored in your browser's Bookmarks Bar can execute JavaScript, just like the "Location Bar" suggestion above.

The rough steps go something like so:

1. Create a bookmark by dragging a link to your browser's Bookmarks Bar.
2. Edit the bookmark you just created and enter the following JavaScript, replacing the element's id with your offending site's input id:

{% highlight console %}
javascript:function fillpw()%7Bdocument.getElementById(prompt('Password element id:')).value=prompt('Password:');%7Dfillpw();
{% endhighlight %}

Using this solution, you can click the bookmarklet and be prompted for the HTML id of the text input you would like to modify its value, then prompted for the text you would like to enter. Entering via a JavaScript prompt prevents your password from being stored in plain-text at any point in the process.

You can now navigate to the offending site, click the bookmarklet in your bookmark bar and enter in your credentials.

## Custom Browser Extension

If there are many offending sites you must visit, you could expand the "Custom Bookmarklet" solution with more code that switches on the current `document.location.host` or `document.location.href` to target the correct username and password widgets for a given URL.

If you're considering this solution, you're probably much better off by adopting a password vault that already has this functionality built-in. That is unless you really want to learn how to build a browser extension.

Each browser has its own conventions for writing extensions or add-ons, and exactly how to do that will be outside the scope of this post, but check the following resources:

* [Getting Started Building Chrome Extensions](http://developer.chrome.com/extensions/getstarted.html)
* [Building a Firefox extension](https://developer.mozilla.org/en-US/docs/Building_an_Extension)

## Wrap up

It should be your responsibility as an informed developer that the next time you're tasked with creating a registration or login form, to instead opt for a single, visible-password entry widget that offers a corresponding button to obscure the user's typing.

When creating your next registration form I suggest following the implementation details in Luke Wroblewski's post: [Mobile Design Details: Hide/Show Password](http://www.lukew.com/ff/entry.asp?1653=).

Let's continue making the web more friendly and easier to use, and lead our users to embrace better security practices.

<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
