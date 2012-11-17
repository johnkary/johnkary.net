---
layout: post
title: ! 'git add -p: The most powerful git feature you''re not using yet'
description: "The Pragmatic Programmer advocates you should know your editor inside and out. So why don't you know your version control system just as well? Discover git add \"patch mode\" and learn how to make more concisely crafted commits leading to a cleaner git history and more friends."
tags:
- git
- tutorials
status: publish
type: post
published: true
alias: /git-add-p-the-most-powerful-git-feature-youre-not-using-yet
---
[git][] and GitHub have revolutionized not only how I do development, but how we developers share code.

I have two tools I need to do software development: an editor and version control.

[The Pragmatic Programmer][] advocates you should know your editor inside and out. **So why don't you know your version control system just as well?**

### Patch Mode

If you use git, you've used the command `git add`. But do you know about git add's "patch mode" using `git add -p` ?

Patch mode allows you to stage *parts* of a changed file, instead of the entire file. This allows you to make concise, well-crafted commits that make for an easier to read history.

Since I learned about it a year or so ago, patch mode has taken my git usage to another level. It's one of the most powerful git commands, right up there with rebasing, but much less dangerous!

### Screencasts

I have recorded two 10-minute screencasts about how I use git add's patch mode. And I want to share them with you for free.

In the first video I walk you through why patch mode is something **you should be using today**, then demonstrate its basic features.

In the second video I talk through the dark art of editing hunks. Even some of the most knowledgeable git users I know have struggled with this! To really master patch mode you will want to know how to edit hunks. Never fear "patch does not apply" again!

I hope that after watching you will be armed with a new skill you can start using **right away** and begin to know git at a deeper level.

### Intro to git add patch mode tutorial

<iframe width="560" height="315" src="http://www.youtube.com/embed/Wl0NfWYrvlY" frameborder="0" allowfullscreen></iframe>

### How to edit hunks in git add patch mode

<iframe width="560" height="315" src="http://www.youtube.com/embed/1tqMjJeyKpw" frameborder="0" allowfullscreen></iframe>

  [git]: http://gitscm.org/
  [The Pragmatic Programmer]: http://pragprog.com/the-pragmatic-programmer
