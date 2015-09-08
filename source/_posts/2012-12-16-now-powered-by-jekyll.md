---
layout: post
title: Now Powered By Jekyll
description: "A few of my previous posts have been fortunate enough to become front-page worthy on Hacker News and /r/programming. But the rush of traffic toppled my WordPress blog. So I toppled WordPress and replaced it with Jekyll."
comments: true
tags: [jekyll, wordpress]
---
My previous blog post on `git add -p` hit the front page of [Hacker News](https://news.ycombinator.com/) and [/r/programming](http://www.reddit.com/r/programming) and the huge influx of traffic brought down my blog. This had happened once before, ironically when a previous git post of mine hit HN, but I thought [Chris](https://twitter.com/tidrion) and I had prevented it from happening again by using the WP-Cache WordPress plugin.

Well looks like those sites sent so much traffic our 512MB server running Apache + MySQL + WP-Cache still couldn't keep up.

That's impressive considering when the same post was on the front page of [/r/programming](http://reddit.com/r/programming) it did about 20,000 views all together, 15,000 of which during one day. I guess front page of HN at noon CST on a Monday lands you a lot of traffic really fast.

### Peace out WordPress ###

So in the interest of not investing more time battling outdated WordPress versions and a bunch of dynamic functionality I simply didn't need, and a desire to learn a bit more Ruby, I've decided to move this blog and the rest of my personal site to be generated by [Jekyll](https://github.com/mojombo/jekyll).

This now means all of my posts are written in a text editor, formatted in Markdown and stored in a git repository. Deployment is done via a `post-merge` hook from my local dev repository to my remote server via rsync.

My content is no longer held hostage, holed up in some remote database. It's in plain-text, in a version control repository, where it belongs.

### Migrating WordPress to Jekyll ###

WordPress has built-in export functionality, which dumps all of its pages, posts and comments to XML. It's conveniently accessible from the admin panel at `/wp-admin/export.php`.

The Jekyll docs have a section on [Blog Migrations](https://github.com/mojombo/jekyll/wiki/blog-migrations). I followed the instructions to exchange my newly-generated `wordpress.xml` into freshly-minted static HTML pages in a format Jekyll expects.

{% highlight console %}
gem install hpricot
ruby -rubygems -e 'require "jekyll/migrators/wordpressdotcom"; Jekyll::WordpressDotCom.process("wordpress.xml")'
{% endhighlight %}

I then leveraged [Pandoc](http://johnmacfarlane.net/pandoc/) to convert the resulting HTML files to straight Markdown.

{% highlight console %}
cd ~/Sites/johnkary.github.com/_posts
pandoc --from=html --to=markdown --no-wrap --output=2009-12-08-my-post-title.md 2009-12-08-my-post-title.html
{% endhighlight %}

The Pandoc-generated Markdown files were very accurate for the most part. The only fail was I had to re-split the paragraph text because the original Jekyll import dumped my paragraphs without `<p>` tags, so Pandoc just merged that text together. This was a result of how the text was stored in the WordPress database. I also had to clean up some poor formatting from some older posts, but nothing major for my 20 blog entries.

### Development Mode ###

When I'm developing on my site, I run the built-in Jekyll web server then load the site in my browser at http://0.0.0.0:4000

{% highlight console %}
cd ~/Sites/johnkary.github.com
jekyll --server --auto
{% endhighlight %}

`--server` tells Jekyll to run its WEBrick web server (instead of just generating the site).

`--auto` tells Jekyll to watch my source files for changes, and regenerate my site files on save. So if I'm writing a new blog post or editing CSS and save my file, Jekyll regenerates the corresponding static file.

### Liquid Templating Language ###

Jekyll uses the [Liquid Templating Language](http://liquidmarkup.org/). I felt very at home with it right away because it's basically exactly like [Twig Templates](http://twig.sensiolabs.org/doc/templates.html). And Twig is inspired by Jinja2 templates, which uses the same syntax. I don't know who was "first" in all of this, but there was no additional learning curve for me in learning the templating syntax.

### Syntax Highlighting ###

Jekyll has support for the great syntax highlighting Python library [Pygments](http://pygments.org/), which probably supports every language you know.

It supports PHP, but I had to dig around a bit to find its PhpLexer option `startinline`. If the `startinline` option is not given, Pygments will only start highlighting after it finds `<?php`. I don't use `<?php` in my code examples, so my highlighting wasn't working until I found [this Jekyll issue](https://github.com/mojombo/jekyll/issues/31) introducing `startinline` functionality.

{% highlight jinja %}
{% raw %}
{% highlight php %}
// No source highlighting
$name = $person->getName();
{% endhighlight %}

{% highlight php startinline %}
// Source highlighting without opening PHP tag
$name = $person->getName();
{% endhighlight %}
{% endraw %}
{% endhighlight %}

### Redirects From Old Site ###

A number of my blog posts have been picked up on various link portals over the years, and people regularly find my posts using Google. If I took my new blogging engine and gave no care to redirect to the new post URL I would lose my search engine rankings. Google would likely see my new posts as simply new content with no credibility.

Instead I'm choosing a two-headed approach:

1. Use Apache's `.htaccess` file to explicitly use `301 Redirects` to the new URLs. This will tell Google and other crawlers the page has permanently moved. I have then instructed the Google crawler to re-crawl my site to pickup the new URLs. Given a few weeks to a month, my new URLs should reflect in search engines.
2. Use a Jekyll plugin called [alias_generator](https://github.com/tsmango/jekyll_alias_generator) to generate an `index.html` page at the old URL which has a meta-redirect to the new page.

Yes, a meta-redirect is not ideal and isn't good practice. In the long-term I may move my site to be powered by [GitHub Pages](http://pages.github.com/), which doesn't support `.htaccess` or other means of redirects. It's at this point that anyone still linking to my old posts can still find their way to the new path.

This alias_generator plugin parses an `alias:` key in the YAML Front Matter, which is just some YAML in the heading of every Jekyll template file. This per-file configuration allows configuring how the page is rendered.

Installing this custom plugin is easy. Just copy it into `./_plugins/alias_generator.rb` and Jekyll will pick up any file ending in `./_plugins/*.rb` when compiling.

To setup the "redirect", let's use my example blog post previously at <http://johnkary.net/git-add-p-the-most-powerful-git-feature-youre-not-using-yet/>. I can use the following `alias:` key and Jekyll will generate an HTML page at `./git-add-p-the-most-powerful-git-feature-youre-not-using-yet/index.html` which redirects to the new post's URL.

{% highlight yaml %}
layout: post
title: ! "git add -p: The most powerful git feature you're not using yet"
status: publish
type: post
published: true
alias: /git-add-p-the-most-powerful-git-feature-youre-not-using-yet
{% endhighlight %}

The plugin then sticks an HTML file at the path specified and anyone encountering that page will be forwarded to the new URL.

{% highlight html %}
<!DOCTYPE html>
<html>
<head>
<link rel="canonical" href="/2012/10/30/git-add-p-the-most-powerful-git-feature-youre-not-using-yet.html">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0;url=/2012/10/30/git-add-p-the-most-powerful-git-feature-youre-not-using-yet.html">
</head>
</html>
{% endhighlight %}

### Moving Comments to Disqus ###

All of my old comments were stored in WordPress. But now I have no WordPress.

[Disqus](http://disqus.com/) provides comments as a service via a JavaScript widget. They also provide [good instructions](http://help.disqus.com/customer/portal/articles/466255-exporting-comments-from-wordpress-to-disqus) for abandoning WordPress comments.

I chose the "Manual Import" method because frankly I didn't want to bother installing the plugin. I used my previous `wordpress.xml` dump from before and uploaded it through their site. The comments imported correctly *but at the old WordPress URL paths.*

The problem here is, I moved my blog posts from being at the root of my domain (e.g. /my-title-here) to instead live under /blog/my-title-here.

At time of writing, Disqus allow you to address this issue from its Dashboard by instructing its spider to crawl your domain and process any 301 Redirects you have setup. So my `.htaccess` redirects have caught those and the URLs associated with my old comments are now on their new respective pages.

Well done, Disqus.


### Source Code Available ###

The source code for this site is available on GitHub: <https://github.com/johnkary/johnkary.net>


### That's It! ###

Overall I'm really happy with this new setup. I feel much more in control of my site, and am much more comfortable writing into a text editor with vim bindings than a WordPress textarea.

I looked at [Octopress](http://octopress.org/) but felt it did too much for what I wanted to accomplish. I wanted a more micro-approach.

I may also redesign the site at some point in the future, maybe to make it responsive, but right now double-tapping on the content body it's still very readable and focuses only on the content.

If you see any problems with my site, please ping me on Twitter [@johnkary](https://twitter.com/johnkary)