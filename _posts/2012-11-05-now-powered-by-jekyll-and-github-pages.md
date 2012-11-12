---
layout: post
title: Now Powered By Jekyll and GitHub Pages
categories : [github]
---
My previous blog post on `git add -p` hit the HackerNews frontpage and the huge influx of traffic brought down my blog. This had happened once before, ironically when a previous git post of mine hit HN, but I thought [Chris](http://twitter.com/tidrion) and I had prevented it from happening again by using the WP-Cache Wordpress plugin.

Well looks like HN sent so much traffic our 512MB server running Apache + MySQL + WP-Cache still couldn't keep up.

That's impressive considering when the same post was on the frontpage of [/r/programming](http://reddit.com/r/programming) it did about 20,000 views all together, 15,000 of which during one day. I guess front page of HN at noon CST on a Monday lands you a lot of traffic really fast.

### Peace out Wordpress ###

So in the interest of not investing more time battling outdated WordPress versions and a bunch of dynamic functionality I simply don't need, and a desire to learn a bit more Ruby, I've decided to move this blog and the rest of my personal site to be hosted via GitHub Pages and Jekyll.

This means now all of my posts are written in a text editor, formatted in Markdown, stored in a git repository, compiled to static HTML using Jekyll, then deployed via `git push`.

My content is no longer held hostage, holed up in some remote database. It's in plain-text, in a version control repository, where it belongs.

### Migrating Wordpress to Jekyll ###

Wordpress has built-in export functionality, which dumps all of your pages, posts and comments to XML. It's conveniently accessible from the admin panel at `/wp-admin/export.php`.

The Jekyll docs then have a section on [Blog Migrations](https://github.com/mojombo/jekyll/wiki/blog-migrations). I followed the instructions to exchange my newly-generated `wordpress.xml` into freshly-minted static HTML pages in a format Jekyll expects.

    gem install hpricot
    ruby -rubygems -e 'require "jekyll/migrators/wordpressdotcom"; Jekyll::WordpressDotCom.process("wordpress.xml")'

I then leveraged [Pandoc](http://johnmacfarlane.net/pandoc/) to convert the resulting HTML files to straight Markdown.

    cd ~/Sites/johnkary.github.com/_posts
    pandoc --from=html --to=markdown --no-wrap --output=2009-12-08-my-post-title.md 2009-12-08-my-post-title.html

The Pandoc-generated Markdown files were very accurate for the most part. The only fail was I had to re-split the paragraph text because the original Jekyll import dumped my paragraphs without `<p>` tags, so Pandoc just merged that text together. I also had to clean up some poor formatting from some older posts, but nothing major for my 20 blog entries.

### Liquid Templating Language ###

Jekyll uses the [Liquid Templating Language](http://liquidmarkup.org/). I felt very at home with it right away because it's basically exactly like [Twig Templates](http://twig.sensiolabs.org/doc/templates.html). And Twig is inspired by Jinja2 templates, which uses the same syntax. I don't know who was "first" in all of this, but there was no additional learning curve to learn templating.

### Syntax Highlighting ###

Jekyll has support for the great syntax highlighting Python library [Pygments](http://pygments.org/) which supports just about every language you could ask for.

It supports PHP, but I had to dig around a bit to find its PhpLexer option `startinline`. If you don't specify the `startinline` option, Pygments will only start highlighting after it finds `<?php`. I don't use `<?php` in my code examples, so my highlighting wasn't working until I found [this Jekyll issue](https://github.com/mojombo/jekyll/issues/31) introducing `startinline`.

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

If you see any problems with the site, please ping me on Twitter [@johnkary](http://twitter.com/johnkary)
