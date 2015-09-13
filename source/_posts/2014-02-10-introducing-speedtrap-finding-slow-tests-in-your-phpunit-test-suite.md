---
layout: post
title: "Introducing SpeedTrap: Finding slow tests in your PHPUnit test suite"
description: "As your test suite grows, you can expect it to run longer. But if you're not careful, some slower tests can creep in and disproportionately increase your suite's total execution time.

Introducing SpeedTrap: a lightweight PHPUnit listener that reports on slow-running tests right in your console."
comments: true
tags: [php, phpunit, testing]
---

> This post was accurate when it was published but may be outdated. See the [johnkary/phpunit-speedtrap](https://github.com/johnkary/phpunit-speedtrap) project on GitHub for the most recent instructions.

All developers should strive to write "fast tests," and "fast" will be different for each developer, language and software stack. Traditionally, unit tests should be very fast, a few milliseconds or faster, while functional tests and end-to-end tests will run a bit longer, maybe a few seconds.

As your test suite grows, you can expect it to run longer. But if you're not careful, some slower tests can creep in and disproportionately increase your suite's total execution time.

## SpeedTrap

[SpeedTrap](https://github.com/johnkary/phpunit-speedtrap) is a PHPUnit Listener that reports on slow-running tests in your PHPUnit test suite console output.

<div class="image" style="margin-bottom:1.2em">
    <a href="http://i.imgur.com/Zr34giR.png"><img src="http://i.imgur.com/Zr34giR.png" width="100%" alt="Screenshot of terminal output of SpeedTrap"></a>
</div>

Many factors affect test execution time. A test not properly isolated from variable latency (database, network, etc.) and even basic load on your test machine will cause test times to fluctuate.

SpeedTrap helps you **identify slow tests** but cannot tell you **why** those tests are slow. For that you should check out something like [PHPUnit\_Listener\_XHProf](https://github.com/sebastianbergmann/phpunit-testlistener-xhprof) to help identify specifically which methods in your call stack are slow.

## Installation

SpeedTrap is installable via [Composer](http://getcomposer.org) and should be added as a dev dependency:

{% highlight console %}
composer require --dev johnkary/phpunit-speedtrap
{% endhighlight %}

## Usage

Enabled it with default configuration by adding the following to your test suite's `phpunit.xml` file:

{% highlight xml %}
<phpunit bootstrap="vendor/autoload.php">
...
    <listeners>
        <listener class="JohnKary\PHPUnit\Listener\SpeedTrapListener" />
    </listeners>
</phpunit>
{% endhighlight %}

Now run your test suite as normal. If tests run that exceed the slowness threshold (500ms by default), SpeedTrap will report on them in the console after the suite completes.

## Configuration

SpeedTrap has two configurable parameters:

* **slowThreshold** - Number of milliseconds a test takes to execute before being considered "slow" (Default: 500ms)
* **reportLength** - Number of slow tests included in the report (Default: 10 tests)

These configuration parameters are set in `phpunit.xml` when adding the listener:

{% highlight xml %}
<phpunit bootstrap="vendor/autoload.php">
    <!-- ... other suite configuration here ... -->

    <listeners>
        <listener class="JohnKary\PHPUnit\Listener\SpeedTrapListener">
            <arguments>
                <array>
                    <element key="slowThreshold">
                        <integer>500</integer>
                    </element>
                    <element key="reportLength">
                        <integer>10</integer>
                    </element>
                </array>
            </arguments>
        </listener>
    </listeners>
</phpunit>
{% endhighlight xml %}

This allows you to set your own criteria for "slow" tests, and how many you care to know about.

## Inspiration

SpeedTest was inspired by Rspec's `-p` option that displays feedback about slow tests.

## License

phpunit-speedtrap is available under the MIT License.
