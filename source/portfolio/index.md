---
layout: page
title: Portfolio
heading: Portfolio
tags: []
status: draft
type: page
published: false
---
<div class="screenshot_container">
<div class="screenshot_wrapper" style="width: 223px;"><a style="text-decoration: none;" href="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage.jpg"><img class="size-medium wp-image-188" title="University of Kansas Homepage" src="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-223x300.jpg" alt="University of Kansas Homepage" width="223" height="300" /></a>
University of Kansas - Homepage
XHTML, CSS, JavaScript, jQuery</div>
</div>
<p style="text-align: left; ">The University of Kansas homepage was designed by lead designer Corey Stone and implemented by Matt Garrett and John Kary. Care was given to accomodate loading time (goal of &lt; 2000ms from a fresh cache) and reduce server bandwidth to serve the 3.7 million pageviews (600K+ uniques) per month to the homepage. As always, we validated our XHTML against</p>
<p style="text-align: left; ">I researched the site's analytics report and found 80% of our visitors were geo-located within 30 miles of campus, and about 79% of those visitors were repeat visitors. So I came back with the idea of hosting an on-site media server to serve the KU Template's images and scripts that are used across our 6 different web servers. This allowed us to push-out template updates to 1 location instead of 6, and ultimately reduce total bandwidth and page load time thanks to browser caching all common template files, so pages load quickly no matter where on the site the user lands.</p>
<p style="text-align: center; "></p>

<div class="screenshot_container">
<div class="screenshot_wrapper" style="width: 250px; float: left;"><a href="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-slide-order.png"><img class="size-medium wp-image-200" title="KU Homepage Slideshow Admin - Order Slides" src="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-slide-order-299x300.png" alt="KU Homepage Slideshow Admin - Order Slides - Admin PHP, XML, cronjobs, jQuery" width="240" /></a>KU Homepage Slideshow Admin - Order Slides
PHP, XML, cronjobs, jQuery</div>
<div class="screenshot_wrapper" style="width: 250px; float: left;"><a href="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-ad-order.png"><img class="size-medium wp-image-212" title="KU Homepage Admin - Ad Order" src="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-ad-order-300x298.png" alt="KU Homepage Admin - Ad Order" width="240" /></a>KU Homepage Slideshow Admin - Order Ads
PHP, XML, cronjobs, jQuery</div>
</div>
<p style="text-align: left; ">KU's homepage content is controlled by the University Relations office, who wanted a custom web app to quickly add content to the dynamic sections of the homepage: News Slideshow, News Headlines, Scene on Campus images and Sticky/Event Ads. So I built an easy to use <strong>PHP</strong> app that allowed for managing all of these assets.</p>

<div class="screenshot_container">
<div class="screenshot_wrapper" style="width: 183px;"><a href="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-slide-edit.png"><img class="aligncenter size-medium wp-image-217" title="KU Homepage Admin - New Slide" src="http://johnkary.net/wp-content/uploads/2010/02/ku-homepage-slide-edit-183x300.png" alt="KU Homepage Admin - New Slide" width="183" /></a>KU Homepage Admin - New Slide
PHP, jQuery</div>
</div>
<p style="text-align: left; ">News slides can be easily added, where a live-preview (very bottom) allows the user to see what their slide will look like when placed on the homepage. Slides and Sticky/Event Ads can then be sorted using drag-and-drop using a <strong>jQuery</strong> plugin to the order they should appear.</p>
<p style="text-align: left; ">We hosted the homepage admin app on our application server, but still wanted to serve assets from the primary domain and media server. Using a series of <strong>cronjobs</strong> running every 60 seconds, we pull text data feeds via <strong>XML</strong> and <strong>rsync</strong> images from the apps server to the production servers.</p> 
