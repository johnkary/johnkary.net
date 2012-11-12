---
layout: post
title: git 1.7.7 changes affecting the everyday developer
tags:
- software
status: publish
type: post
published: true
meta:
  _edit_last: '1'
alias: /git-1-7-7-changes-affecting-the-everyday-developer
---
[git 1.7.7 was released](http://git-scm.com/) within the last few weeks. You can [view the 1.7.7 release notes](https://raw.github.com/gitster/git/master/Documentation/RelNotes/1.7.7.txt) for a full list of changes.

Most changes will probably not affect your every day use of git, but two new additions should prove very useful for many developers:

### "git stash" learned an "--include-untracked option"

[git stash](http://schacon.github.com/git/user-manual.html#interrupted-work) is one of my favorite git features. If you don't know about `git stash` yet, it allows you to take all of the changes in your working tree that haven't been committed and temporarily store them, then cleans your working tree.

Basically it tells git, "Hey, I'm not ready to commit all of these changes, but I really need to get back to the way my repository was right after I made my last commit. So save my most recent changes with this given description, so I don't forget what I was working on, and I'll come back to them later."

Prior to git 1.7.7, if you ran `git stash save` it would only stash changes for files that were already under version control. So if you had created a new file that was part of the feature you were working on and wanted to stash it, you were stuck with an ugly work around of having to add it to the repo using `git add`, then stashing your changes. When later replaying the stash, those files would still appear in the staging area/index.

But with the new option `--include-untracked`, or simply `-u`, `git stash` can now save your working tree exactly the way you had it when you created the stash.

    git stash -u
    git stash --include-untracked

### "git submodule update" reports any errors at the end instead of halting on error

[git submodules](http://schacon.github.com/git/user-manual.html#submodules) allow you to embed and track a foreign repository in your parent repository. They are great when you want to distribute code between multiple projects, but keep the distributed code in its own repository with its own version history.

Prior to git 1.7.7, if you ran `git submodule update` and there was a problem, git would immediately halt. Halting in the middle of updating might update some of your submodules and leave others unupdated.

But now, git will continue updating all submodules and instead report a list of errors after attempting to update all submodules.
