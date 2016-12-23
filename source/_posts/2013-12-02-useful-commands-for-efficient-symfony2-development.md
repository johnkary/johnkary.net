---
layout: post
title: Useful Commands For Efficient Symfony2 Development
description: "These commands allow me, and hopefully you, to work faster and more efficiently with the Symfony2 framework."
comments: true
tags: [symfony]
---

> This post was published when **Symfony Standard Edition 2.3** was the latest stable release, and may be outdated for later Symfony versions.

Have you explored all of the Console commands that ship with the Symfony Standard Edition? The long list of tasks after entering the `php app/console` command might feel a bit overwhelming at first, but the more you use Symfony, the more comfortable you'll feel and the more likely you will have memorized a few common commands.

But there are a few commands that you don't hear much about that are very useful during every day development, but only garnish a quick blurb in the [official documentation](http://symfony.com/doc/current/index.html).

I spend most of my working day developing web applications where the frontend JavaScript application is fed data by an API built on the Symfony2 framework. What follows are some of the protips I've devised to help me work more efficiently and some of the non-obvious Symfony commands I use on a daily basis. I hope they help you develop faster and more efficiently!

1. [Alias your most common Symfony commands](#alias)
    A. [Alias the Symfony Console itself](#alias-sf)
    B. [Alias the cache:clear command](#alias-sfcc)
    C. [Alias the command to run your test suite](#alias-sft)
    D. [Find other common commands you can alias](#alias-history)
2. [Finding a specific service id or a service's class](#container-service)
3. [Finding a specific container parameter](#container-parameter)
4. [Finding a specific route name or URI](#router-debug)
5. [Show all info about a specific route by its name](#router-name)
6. [Find which route matches a given URI](#router-match)
7. [Query your database from the CLI](#database)
    A. [DQL queries](#database-dql)
    B. [SQL queries](#database-sql)

---------------------------------------

## <a name="alias"></a> 1. Alias your most common Symfony commands

There are 3 commands I use so often I have short bash aliases setup for each:

### <a name="alias-sf"></a> Alias the Symfony Console itself

Developing with Symfony2, you will type `php app/console` many, many times. Having a faster way to type this is an instant productivity boost.

Add the following line to your `.bash_profile` file in your home directory to take your first step towards Symfony console mastery:

{% highlight console %}
alias sf='php app/console'
{% endhighlight %}

Now reload your .bash_profile within you current shell session with the command `source ~/.bash_profile` and you can now access the Symfony console by typing `sf` in all places you would type `php app/console`.

Try using your new powers and ensure they're working properly:

{% highlight console %}
$ sf
Symfony version 2.3.7 - app/dev/debug

Usage:
  [options] command [arguments]

Options:
  --help           -h Display this help message.
  --quiet          -q Do not output any message.
...
{% endhighlight %}

### <a name="alias-sfcc"></a> Alias the cache:clear command

You will clear the Symfony cache relatively often, so it deserves its own shell alias. As many will tell you, step 1 of troubleshooting Symfony issues is first clearing your cache!

{% highlight console %}
alias sfcc="php app/console cache:clear"
{% endhighlight %}

The command `sfcc` will now clear your ["dev" environment](http://symfony.com/doc/current/cookbook/configuration/environments.html) cache. The `--env=dev` option is implied for all Symfony commands unless otherwise specified, but you can easily specify any other environment too:

{% highlight console %}
$ sfcc --env=test
{% endhighlight %}


### <a name="alias-sft"></a> Alias the command to run your test suite

You should be running your test suite often during development. The full command to run the Symfony test suite using PHPUnit is a bit long:

{% highlight console %}
$ bin/phpunit -c app
{% endhighlight %}

Not too bad, but again, given how often you will be running this command, it deserves its own alias. (If you don't use PHPUnit, modify the alias to use whatever your test runner requires):

{% highlight console %}
alias sft='bin/phpunit -c app'
{% endhighlight %}

Quickly reload your .bash_profile again via `source ~/.bash_profile` and you can now execute your test suite by typing `sft`:

{% highlight console %}
$ sft
PHPUnit 3.7.28 by Sebastian Bergmann.

Configuration read from /path/to/your/project/app/phpunit.xml.dist

...............................................................  63 / 120 ( 52%)
.........................................................

Time: 312 ms, Memory: 5.75Mb

OK (120 tests, 236 assertions)
{% endhighlight %}

With your new-found powers you can now quickly do things like only run tests within a specific directory:

{% highlight console %}
$ sft src/Acme/DemoBundle/
{% endhighlight %}

Or run a specific test by its name:

{% highlight console %}
$ sft --filter=testUserStartsAsActive
{% endhighlight %}

Or quickly generate code coverage:

{% highlight console %}
$ sft --coverage-html=coverage
{% endhighlight %}

Of course you could always run these exact commands without the alias, but the key is allocating less mental energy to mundane things like typing long commands for commonly used commands.

### <a name="alias-history"></a> Find other common commands you can alias

You could try noticing your habits and alias other common commands, but why not let your console history just tell you?

{% highlight console %}
$ history | grep 'php app/console'
[... your most recent history containing 'php app/console' will appear here ...]
{% endhighlight %}


## <a name="container-service"></a> 2. Finding a specific service id or a service's class

Often you will need to see if your newly defined [service](http://symfony.com/doc/current/book/service_container.html#what-is-a-service) is wired up how you intend it to be. The following command will display all defined services in the Symfony2 [service container](http://symfony.com/doc/current/book/service_container.html):

{% highlight console %}
$ sf container:debug
{% endhighlight %}

If you have an idea of what you're looking for, pipe this command's output to `grep <you search string here>`. For example, let's list all the services containing the word "doctrine":

{% highlight console %}
$ sf container:debug | grep doctrine
database_connection                                    n/a       alias for doctrine.dbal.default_connection
doctrine                                               container Doctrine\Bundle\DoctrineBundle\Registry
doctrine.dbal.connection_factory                       container Doctrine\Bundle\DoctrineBundle\ConnectionFactory
doctrine.dbal.default_connection                       container stdClass
doctrine.orm.default_entity_manager                    container EntityManager5292d7ee8f526_546a8d27f194334ee012bfe64f629947b07e4919\__CG__\Doctrine\ORM\EntityManager
doctrine.orm.default_manager_configurator              container Doctrine\Bundle\DoctrineBundle\ManagerConfigurator
doctrine.orm.entity_manager                            n/a       alias for doctrine.orm.default_entity_manager
doctrine.orm.validator.unique                          container Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntityValidator
doctrine.orm.validator_initializer                     container Symfony\Bridge\Doctrine\Validator\DoctrineInitializer
form.type_guesser.doctrine                             container Symfony\Bridge\Doctrine\Form\DoctrineOrmTypeGuesser
monolog.logger.doctrine                                container Symfony\Bridge\Monolog\Logger
sensio_framework_extra.converter.doctrine.orm          container Sensio\Bundle\FrameworkExtraBundle\Request\ParamConverter\DoctrineParamConverter
{% endhighlight %}

This command also accepts a service id as its first argument and will output even more information about that how it is wired up. Let's look at the service with id "twig.loader":

{% highlight console %}
$ sf container:debug twig.loader
[container] Information for service twig.loader

Service Id       twig.loader
Class            Symfony\Bundle\TwigBundle\Loader\FilesystemLoader
Tags
    - twig.loader                    ()
Scope            container
Public           yes
Synthetic        no
Required File    -
{% endhighlight %}

(I wish this output contained things like what other services/parameters are wired into it, what factory methods are run when instantiated, etc. If you know how to find this output from the Console, please comment below.)


## <a name="container-parameter"></a> 3. Finding a specific container parameter

While `sf container:debug` outputs a list of services, calling this command with the additional option `--parameters` will dump a list of all [service container parameters](http://symfony.com/doc/current/components/dependency_injection/parameters.html) and their values. This is useful to ensure your config or bundle is overriding the intended parameter or just to see what all parameters are available without digging into a Bundle's [Extension](http://symfony.com/doc/current/cookbook/bundles/extension.html) or [Configuration](http://symfony.com/doc/current/cookbook/bundles/extension.html) files:

{% highlight console %}
$ sf container:debug --parameters
{% endhighlight %}

Using this command's output with grep, like in the previous example, is also your friend.

You can also use the similar option `--parameter="..."` (notice no "s" in "parameter") to find the value for a specific parameter. Let's find exactly which class will be used for Doctrine's EntityManager by finding the value for the "doctrine.orm.entity_manager.class" parameter:

{% highlight console %}
$ sf container:debug --parameter="doctrine.orm.entity_manager.class"
Doctrine\ORM\EntityManager
{% endhighlight %}


## <a name="router-debug"></a> 4. Finding a specific route name or URI

Like finding values in the Service Container, a similar command exists to search Symfony's [Router](http://symfony.com/doc/current/book/routing.html) for route names and URI paths:

{% highlight console %}
$ sf router:debug
[router] Current routes
Name                Method Scheme Host Path
index               ANY    ANY    ANY  /
users_list          ANY    ANY    ANY  /users/
users_new           ANY    ANY    ANY  /users/new
users_edit          ANY    ANY    ANY  /users/{id}
{% endhighlight %}

I often use this command as a dummy-check that my Controller [@Route annotations](http://symfony.com/doc/current/bundles/SensioFrameworkExtraBundle/annotations/routing.html#usage) are wired properly and that they have the correct [@Method annotation](http://symfony.com/doc/current/bundles/SensioFrameworkExtraBundle/annotations/routing.html#route-method) values.


## <a name="router-name"></a> 5. Show all info about a specific route by its name

The first optional argument to `router:debug` is the route name. This shows all details for the route named "users_list":

{% highlight console %}
$ sf router:debug users_list
[router] Route "users_list"
Name         users_list
Path         /users/
Host         ANY
Scheme       ANY
Method       ANY
Class        Symfony\Component\Routing\Route
Defaults     _controller: Acme\DemoBundle\Controller\UsersController::indexAction
Requirements NO CUSTOM
Options      compiler_class: Symfony\Component\Routing\RouteCompiler
Path-Regex   #^/users/$#s
{% endhighlight %}


## <a name="router-match"></a> 6. Find which route matches a given URI

You might know the URI path but not the route name. The `router:match` command works like `router:debug` but does the reverse operation by accepting a URI argument instead of the route name.

The following example shows which route matches the URI "/users":

{% highlight console %}
$ sf router:match /users
Route "users_list" matches

[router] Route "users_list"
Name         users_list
Path         /users/
Host         ANY
Scheme       ANY
Method       ANY
Class        Symfony\Component\Routing\Route
Defaults     _controller: Acme\DemoBundle\Controller\UsersController::indexAction
Requirements NO CUSTOM
Options      compiler_class: Symfony\Component\Routing\RouteCompiler
Path-Regex   #^/users/$#s
{% endhighlight %}


## <a name="database"></a> 7. Query your database from the CLI

It can be a hassle to write up a functional test or other code that executes DQL or SQL you are tweaking for a new query or troubleshooting an existing query. Thankfully Doctrine offers two commands that let you run queries straight from the command-line.

### <a name="database-dql"></a> DQL queries

You can query your database using [raw DQL](http://docs.doctrine-project.org/en/latest/reference/dql-doctrine-query-language.html) right from the command-line using the command `doctrine:query:dql`. Just pass in the full DQL you want to execute:

{% highlight console %}
$ sf doctrine:query:dql "SELECT u.firstName, u.lastName, u.lastLogin FROM AcmeDemoBundle:User u" --hydrate=array

array (size=1)
  0 =>
    array (size=3)
      'firstName' => string 'John' (length=4)
      'lastName' => string 'Smith' (length=5)
      'lastLogin' =>
        object(stdClass)[325]
          public '__CLASS__' => string 'DateTime' (length=8)
          public 'date' => string '2013-11-26T00:00:00-06:00' (length=25)
          public 'timezone' => string 'America/Chicago' (length=15)
{% endhighlight %}

Appending the option `--hydrate=array` like in the previous example is also useful if your selected entities have other entity relationships, where the resulting var_dump() of object data creates a lot of additional clutter. Hydrating as an array is a bit cleaner to look at if you're only interested in the data and not the underlying object structure.

### <a name="database-sql"></a> SQL queries

You can also directly query your database using raw SQL without connecting through the `mysql` binary or a GUI application. Like querying for DQL, the connection data from `parameters.yml` or `config.yml` is used, so there's no hassle with passing the right credentials with each query:

{% highlight console %}
$ php app/console doctrine:query:sql "SELECT * from users"

array (size=1)
  0 =>
    array (size=5)
      'id' => string '5' (length=1)
      'firstName' => string 'John' (length=4)
      'lastName' => string 'Smith' (length=5)
      'logins' => null
      'lastLogin' => string '2013-11-26' (length=10)
{% endhighlight %}


## Did I miss anything?

What do you think? Did you learn something that can make you more productive? Are there other productivity wins you wish I had included? I'd love to hear your feedback in the comments section below!