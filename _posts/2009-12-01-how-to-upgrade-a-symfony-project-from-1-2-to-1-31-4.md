---
layout: post
title: How to upgrade a Symfony project from 1.2 to 1.3/1.4
description: "Today, the Symfony crew has released Symfony 1.3 and 1.4. I recently deployed a pretty basic 1.2 app, and decided to try upgrading it to 1.3, and then on to 1.4, just to see if these \"easy upgrade\" claims were as advertised.

I will be following the 1.2 to 1.3/1.4 Upgrade Instructions below, so you should read over them before we get started."
tags: [php, symfony, tutorial]
status: publish
type: post
published: true
comments: true
alias: /how-to-upgrade-a-symfony-project-from-1-2-to-1-31-4
---
Today, the Symfony crew has [released Symfony 1.3 and 1.4][]. I recently deployed a pretty basic 1.2 app, and decided to try upgrading it to 1.3, and then on to 1.4, just to see if these "easy upgrade" claims were as advertised.

I will be following the [1.2 to 1.3/1.4 Upgrade Instructions][] below, so you should read over them before we get started.

* * * * *

### Step 0: Create a new branch in your version control checkout for this new version

If you're not using version control, now might be a good time to learn. I am using Subversion for this specific project, but suggest you look at git. The rest of this post will give examples using Subversion for keeping your project up to date.

Let's create a new branch from our trunk to handle upgrading to 1.3.

{% highlight console %}
svn copy http://svn.example.com/repo/trunk http://svn.example.com/repo/branches/symfony1_3 -m "Creating branch of trunk to upgrade to Symfony 1.3."
{% endhighlight %}

Checkout your new branch to your development environment and let's get started.

{% highlight console %}
svn co http://svn.example.com/repo/branches/symfony1_3 ~/Sites/myproject/symfony1_3
cd !$
{% endhighlight %}

* * * * *

### Step 1: Check for 1.3 versions of your plug-ins

Many core plugins were recently updated for 1.3, so check the [plugin repository][] for a 1.3 branch. (Some plugins may work without modification, but this is a case-by-case basis.)

Your plugins may not be as well maintained. Depending on how critical your plugin functionality, you may not be able to continue upgrading at this time.

In my case, I was only using the [sfFormExtraPlugin plugin][] to add some a multi-choice options to my forms.

* * * * *

### Step 2: Update Symfony core files to 1.3

Our Symfony core files live in `symfony1_3/lib/vendor/symfony`. I had manually installed the core files from a ZIP archive when I started developing the project, so they were not yet using [svn:externals][].

We will remove the old 1.2 files and install the core files from the central 1.3 repository branch. By referencing the 1.3 branch, every time we execute `svn up`, our Symfony core libraries are updated to the newest version. This may or may not be the best solution in your case. If you do not want your core libraries automatically updated, reference one of Symfony's [RELEASE tags][].

Since the application I developed is not a critical application, I chose to live on the edge and reference the 1.3 branch.

{% highlight console %}
svn rm lib/vendor/symfony
svn propedit svn:externals lib/vendor

symfony http://svn.symfony-project.com/branches/1.3/

svn commit . -m "Remove Symfony 1.2 core libraries. Install Symfony 1.3 core libraries via svn:externals."
svn up
{% endhighlight %}

* * * * *

### Step 3: Get newest plugin versions

You can try to update your plugins via the traditional `php symfony
plugin:upgrade yourPluginNameHere`, or check the [plugin repository][] for a 1.3 branch or 1.3-compatible development in the trunk.

*sfWidgetFormPlugin* has a 1.3 branch, so again, let's remove the old plugin and link up the new one. My previous version was installed via the traditional `php symfony plugin:install sfFormExtraPlugin` command, so it should first be uninstalled, deleted, then linked up with an `svn:externals` reference.

{% highlight console %}
php symfony plugin:uninstall sfFormExtraPlugin
svn rm plugins/sfFormExtraPlugin
svn propedit svn:externals plugins

sfFormExtraPlugin http://svn.symfony-project.com/plugins/sfFormExtraPlugin/branches/1.3/

svn commit . -m "Update sfFormExtraPlugin to 1.3-compatible branch."
svn up
{% endhighlight %}

Repeat this process for all of your plugins that have new versions
available.

* * * * *

### Step 4: Upgrading your project code to 1.3

Running this command will automatically upgrade your code base to
Symfony 1.3.

{% highlight console %}
php symfony project:upgrade1.3
svn commit . -m "Upgraded project to Symfony 1.3."
{% endhighlight %}


#### Doctrine 1.0 to Doctrine 1.2

Assuming you are using [Doctrine][] as your ORM, Symfony 1.3/1.4 also upgrades Doctrine from 1.0 to 1.2. You will need to manually check your code against the upgrade documentation for [Doctrine 1.0 to 1.1 Upgrade][] and [Doctrine 1.1 to 1.2 Upgrade][].

In my project, I was using a few non-static methods that had been changed to static methods in Doctrine 1.2.

#### Propel 1.3 to Propel 1.4

[Propel][] ORM has also been updated to Propel 1.4 in Symfony 1.3/1.4. Check [Propel's Documentation][] for any new changes.

* * * * *

### Step 5: Rebuild your models/forms/filters and clear the cache

With all our code updated, it's time to run the gauntlet of updating our forms, filters and models.

{% highlight console %}
php symfony doctrine:build --all-classes php symfony cache:clear
{% endhighlight %}

* * * * *

### Step 6: Test your site in the browser

Load up the dev environment for your application in your browser and cross your fingers :) Check the Web Debug bar and see that you're running on Symfony 1.3.0 and the version of your ORM.

<div class="image">
    <img src="/images/posts/symfony-debug-toolbar-1.3.0.png" title="Symfony 1.3 Debug Toolbar" width="500">
</div>

Assuming everything works, commit back to SVN.

{% highlight console %}
svn commit . -m "Fully upgraded to Symfony 1.3."
{% endhighlight %}

* * * * *

### Step 7: Check for deprecated code using `project:validate`

Now that our project is up to date with Symfony 1.3, we need to prepare to move it to Symfony 1.4. Fabien recently added an amazingly helpful command [project:validate][] that checks your code for use of deprecated code that has been removed for Symfony 1.4. Running the command against your project gives a list of deprecated classes in use and their location.

{% highlight console %}
php symfony project:validate
{% endhighlight %}

<div class="image">
    <img src="/images/posts/php-symfony-project-validate.png" title="php symfony project:validate output" width="500">
</div>

Since I started writing this project on Symfony 1.2.8, and this is a relatively straightforward project, there is not much to change. If you started from 1.0 or 1.1, there is undoubtedly a lot more code to change.

Most of the deprecated code above appears in the `/base/` directory of the Doctrine-generated code, which will be fixed when we regenerate our models/forms/filters.

### Fixing Deprecated Code

#### sfWidgetFormDoctrineChoiceMany

`project:validate` found one use of `sfWidgetFormDoctrineChoiceMany` in `EventForm.class.php`. Since I redefined my Event form in the `EventForm::configure()` method, I need to find the fix for using this deprecated class.

After checking the [Deprecated Code page for 1.3][], the `*Many()` form widgets have been deprecated. `sfWidgetFormDoctrineChoiceMany` has been consolidated into the `sfWidgetFormDoctrineChoice` class by adding the option `array('multiple' => true)` to denote a multi-select.

Symfony 1.2:

{% highlight php startinline %}
$this->setWidgets(array(
    'keywords_list' => new sfWidgetFormDoctrineChoiceMany(array(
        'model' => 'Keyword',
        'renderer_class' => 'sfWidgetFormSelectDoubleList',
    )),
));
{% endhighlight %}

Symfony 1.3:

{% highlight php startinline %}
$this->setWidgets(array(
    'keywords_list' => new sfWidgetFormDoctrineChoice(array(
        'model' => 'Keyword',
        'renderer_class' => 'sfWidgetFormSelectDoubleList',
        'multiple' => true,
    )),
));
{% endhighlight %}

#### sfValidatorDoctrineChoiceMany

Since I was using a deprecated form widget, I also double-checked the widget's validator for the same field. [sfValidatorDoctrineChoiceMany][] has *not* been deprecated. Instead, it calls its parent `configure()` method in its parent class `sfValidatorDoctrineChoice`, and sets the option `multiple` to true. 

Sounds very similar to the explanation above, doesn't it? Why the developers chose to deprecate the widget and not the validator, I'm not sure. Regardless, I chose to change `sfValidatorDoctrineChoiceMany` just to stay consistent with my form widget. 

Symfony 1.2:

{% highlight php startinline %}
$this->setValidators(array(
    'keywords_list' => new sfValidatorDoctrineChoiceMany(array(
        'model' => 'Keyword',
        'required' => false,
    )),
));
{% endhighlight %}

Symfony 1.3:

{% highlight php startinline %}
$this->setValidators(array(
    'keywords_list' => new sfValidatorDoctrineChoice(array(
        'model' => 'Keyword',
        'required' => false,
        'multiple' => true,
    )),
));
{% endhighlight %}

#### sfCompat10Plugin

`sfCompat10Plugin` is also deprecated in Symfonry 1.4, so we must
remove all references to it. In my case, I had excluded it from loading in myproject/config/ProjectConfiguration.class.php.

Symfony 1.2:

{% highlight php startinline %}
$this->enableAllPluginsExcept(array('sfPropelPlugin', 'sfCompat10Plugin'));
{% endhighlight %}

Symfony 1.3:

{% highlight php startinline %}
$this->enableAllPluginsExcept(array('sfPropelPlugin'));
{% endhighlight %}

At this point, we have removed all deprecated code and are ready to
upgrade our project to Symfony 1.4! Commit our latest changes.

{% highlight console %}
svn commit . -m "Removed deprecated code for Symfony 1.4."
{% endhighlight %}

### Step 8: Upgrade to Symfony 1.4

Once again, you should check if your plugins have Symfony 1.4 versions, and update their `svn:external` references to their 1.4 branches.

If you plugin does not have a 1.4 version, the 1.3 version may work without modification. If the `project:validate` task does not return any deprecated code used in plugins, you may be clear.

{% highlight console %}
svn propedit svn:externals

plugins #Update your repo URLs to their 1.4 branches

svn up
{% endhighlight %}

With our Symfony core libraries referenced via `svn:externals`, we also need to update that reference to the Symfony 1.4 branch.

{% highlight console %}
svn propedit svn:externals lib/vendor

symfony http://svn.symfony-project.com/branches/1.4/

svn up
{% endhighlight %}

Now regenerate our forms, filters and models.

{% highlight console %}
php symfony doctrine:build --all-classes
php symfony cache:clear
{% endhighlight %}

And assuming everything works, commit everything back to our development branch!

{% highlight console %}
svn commit . -m "Upgraded to Symfony 1.4. Whew!"
{% endhighlight %}

Congratulations! You are now working with the latest version of Symfony 1.4!

* * * * *

Well that *was* rather painless! You may or may not agree depending on how much legacy code you are maintaining :)

Congratulations to Fabien Potencier, Fabien Lange, Jonathan Wage, Kris Wallsmith and everyone who submitted patches to make this release possible!

With your new Symfony 1.4 install, why not start learning some of the more advanced tutorials in the [Symfony 2009 Advent Calendar][]?

  [Doctrine]: http://www.doctrine-project.org/
  [Doctrine 1.0 to 1.1 Upgrade]: http://svn.doctrine-project.org/tags/1.1.0/UPGRADE_TO_1_1
  [Doctrine 1.1 to 1.2 Upgrade]: http://svn.doctrine-project.org/tags/1.2.0/UPGRADE_TO_1_2
  [Propel]: http://propelorm.org/
  [Propel's Documentation]: http://trac.propelorm.org/wiki/Documentation/1.4
  [project:validate]: http://symfony.com/blog/upgrading-to-symfony-1-4
  [Deprecated Code page for 1.3]: http://symfony.com/legacy/doc/tutorial/1_3/en/deprecated
  [released Symfony 1.3 and 1.4]: http://symfony.com/blog/a-week-of-symfony-152-23-29-november-2009
  [1.2 to 1.3/1.4 Upgrade Instructions]: http://symfony.com/legacy/doc/tutorial/1_4/en/upgrade
  [plugin repository]: http://svn.symfony-project.com/plugins/
  [sfFormExtraPlugin plugin]: http://www.symfony-project.org/plugins/sfFormExtraPlugin
  [svn:externals]: http://svnbook.red-bean.com/en/1.0/ch07s03.html
  [RELEASE tags]: http://svn.symfony-project.com/tags/
  [Symfony 2009 Advent Calendar]: http://symfony.com/blog/one-more-thing
