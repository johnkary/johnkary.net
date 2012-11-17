---
layout: post
title: Color temperature and why I don't yet own an iPad
description: "Like some of you, I have not yet caved and bought an iPad. Or any other tablet device, for that matter. But given that \"the new\" third-generation iPad was officially made available at 8:00AM this morning, that might change soon.

But even with its revolutionary display panel, I'm still reluctant to buy for one small, but very significant feature that's still lacking: color temperature control."
tags:
- hardware
status: publish
type: post
published: true
alias: /color-temperature-and-why-i-dont-yet-own-an-ipad
---
Like some of you, I have not yet caved and bought an iPad. Or any other tablet device, for that matter. But given "the new" third-generation iPad was officially made available at 8:00AM this morning, that might soon change.

When the iPad debuted in April 2010 I didn't feel I had a use for it that justified the cost. I mean, "my laptop can do anything," I thought at the time. "Why would I want a crippled computer?" Was the world really ready for the new device Steve demoed?

But two years later, the tablet as a device is now a sustained product (I'm reluctant to call it "matured"), has first-class content available for it, and has carved its own niche in the device landscape. That $650 in my wallet is starting to feel mighty heavy&hellip;

### My device usage

I currently spend most of my screen-time working from a 17" MacBook Pro: the normal 8-ish hours for my full-time employment, then after hours doing some reading, researching, personal programming projects and open-source work.

The iPad would mostly take over as a device for casual browsing with Instapaper, HackerNews, Twitter and RSS. It would also see the occasional movie or gaming while traveling. A single device for these purposes would allow me to focus on reading, instead of being distracted by email, code, chat and all the clutter that comes with normal work when using my laptop.

Much of this type of usage would happen in the late evening and into the night.

Yet there is one killer app I use on Mac OS that isn't natively available for iOS, but makes working in the evening exponentially more comfortable: [F.lux](http://stereopsis.com/flux/).

<div class="image">
    <a href="http://stereopsis.com/flux/"><img src="/images/posts/flux-logo-lg.png" title="f.lux" width="293" /></a>
</div>

F.lux a little app that runs in the background and automatically adjusts the [color temperature](http://en.wikipedia.org/wiki/Color_temperature) of the screen according to the current position of the sun in the sky.

During normal daylight hours the screen is unaffected, resulting in light emitted at about 6500K, or about the same color temperature as sunlight radiating under a clear blue sky. But as the sun sets and the color of the light outside changes, F.lux gradually transitions the color temperature of the screen from 6500K to 2700K, which is closer to that of indoor incandescent tungsten lighting. This color-shift makes the laptop screen appear similar in color to your working environment, making it less jarring and easier on the eyes.

<div class="image">
    <img src="/images/posts/flux-kelvin.gif" title="Common light source color temperatures measured in degrees Kelvin" alt="The color appearance of various light sources can be defined in terms of color temperature, measured in kelvin (K). Northern Light/Blue Sky (8500K); Daylight Fluorescent Lamp (6400K); Clear Mercury Lamp (6000K); Clear Metal Halide Lamp (4500K); Cool White Fluorescent Lamp (4000K); Tungsten Halogen Lamp (3200K); Warm White Fluorescent Lamp (3000K); 40W Incandescent Lamp (2600K); High Pressure Sodium Lamp (2000K); Candle (1800K)" width="500" />
</div>

The human brain is very good at determining colors in varying lighting conditions and deciding, "that's blue" or "that's white".

It's so good that you often will not notice a difference in color because all other colors are contextually and equally shifted towards the blue or orange end of the spectrum depending on the light source.

You are likely only aware of a difference when looking at a picture and being removed from the actual experience. If you're familiar with fixing the white balance of a photo, your brain is doing exactly that, all in real time.

This effect is most pronounced when comparing color swatches side-by-side and deciding which one appears more blue or more orange.

<div class="image">
    <img src="/images/posts/flux-grays.png" alt="Two color swatches, one blue-ish gray, the other orange-ish gray, each with three strips of varying darkness" title="Swatches of varying shades of gray" width="100%" />
    <span class="caption">Source: <a href="http://en.wikipedia.org/wiki/File:Grays.svg">http://en.wikipedia.org/wiki/File:Grays.svg</a></span>
</div>

When working in a mixed light source environment, such as an orange incandescent lamp illuminating your living room while you work on your couch with the blue-white glow of your laptop, your brain is actually in a constant tug-of-war.

The brain is trying to create an equilibrium by balancing the colors in the room towards the blue of the laptop, and the laptop light towards the orange of the room. But switching context between looking at your laptop and glancing around the room creates a constant battle for how the brain balances the colors the eye sees. You might better know this tug-of-war as a headache.

F.lux stands to save your headache by correcting this contextual imbalance and tuning your laptop screen to emit light close to that illuminating your working area. Just select from the presets for the different types of lighting: tungsten, halogen, fluorescent, daylight, and a custom setting to set your own color temp.

To demonstrate how beneficial this is, install F.lux and fire up your laptop after the sun has set. Then select "Disable for an hour" from its icon in the menu bar. You will notice how jarring the blueish 6500K screen feels and how it hurts your eyes. It's like hearing a high-pitched screeching noise after listening to the relaxing tunes of, say, [Jonn Serrie](http://www.youtube.com/watch?v=FJbP5wozNUM).

### Color temperature's effect on sleep

The F.lux website has an entire page [dedicated to research](http://stereopsis.com/flux/research.html) that negatively correlates drowsiness, while positively correlating alertness, in people exposed to light that is close in color temperature to that of a normal computer screen. This is essentially sunlight that makes you feel more alert and less tired.

These [findings](http://www.jstage.jst.go.jp/article/jpa/24/2/24_183/_article) can be appropriated to say that using your computer or iPad (without F.lux) before attempting to sleep may lead to trouble falling asleep, and/or being less likely to experience the deeper levels of sleep required for to feel fully rested.

### What about the iPad

The iPad emits a cool light of [about 7000K](http://www.displaymate.com/iPad_2_ShootOut.htm#Measurements), which is even slightly more blue than the normal 6500K daylight and even further from the 2700K incandescent light color temperature.

This leads me to believe that using an iPad in the evening hours would only keep me awake, which isn't a desirable side effect. I'd rather be winding down from the day than trying to keep myself away. Right now I don't have that problem because I use F.lux on my laptop.

But the F.lux authors do not offer a native iOS app. Instead, they offer an [unofficial iOS app](http://stereopsis.com/flux/ios.html) that can only be installed after jailbreaking the device. This is because there are no open APIs to hook into adjusting the colors of the display.

I would love it if Apple incorporated this type of color shifting technology into its hardware by adding a sensor for light temperature and allowing the screen to adjust. It would work as an optional setting, as the color shifting is greatly undesirable when doing work like photo editing, where the screen's color is of utmost importance.

I think the general public would see this as magical, and could even be marketed as a health benefit&mdash;which surely could earn points for Apple in the mass media, who likes to inflate stories about how extended use of technology is bad. Maybe this could even bring the concept of color temperature and its physiological effects more into the mainstream awareness.

### Thoughts?

It may seem silly that the absence of a single small application would make me think twice about buying a shiny new gadget. But that's really because of the positive impact it has had on me.

It's one of those things that after you start using it, you can't imagine going back.

Have you noticed this jarring effect when using a laptop in the evening?

Or maybe you already use F.lux. Is it as revolutionary for you as it is for me?

Has anyone installed the F.lux iOS app or found an alternative that makes reading from a screen easier at night?
