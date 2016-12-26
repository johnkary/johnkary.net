---
layout: post
title: Deserializing XML with JMSSerializerBundle in Symfony2
summary: "Serializing existing objects with the Symfony2 JMS Serializer Bundle is pretty easy, but deserializing a third-party XML response is a bit more work."
comments: true
tags: [symfony]
---

> Note: This post was published when **Symfony Standard Edition 2.3** and **jms/serializer 0.12.0** were the latest stable releases, and may be outdated with later versions.

The [JMS Serializer library](http://jmsyst.com/libs/serializer) and its accompanying [Symfony2 bundle](http://jmsyst.com/bundles/JMSSerializerBundle) are must-haves if your PHP-based application needs to expose an HTTP API. If you have used it before, you're probably most familiar with its ability to transform an object graph to XML or JSON, and this couldn't be easier in Symfony2:

{% highlight php startinline %}
$this->get('jms.serializer')->serialize($user, 'json');
{% endhighlight %}

The resulting JSON might look something like this:

{% highlight json %}
{
   "first_name":"John",
   "last_name":"Kary",
   "logins":5,
   "last_login":"2013-07-21T01:16:22-0500",
   "address":{
      "number":"555",
      "street":"4th Street",
      "city":"Lawrence",
      "state":"KS",
      "zip":"66045"
   }
}
{% endhighlight %}

What I've seen less of, and what this post will highlight, is the Serializer library's ability to take XML (and JSON) and transform it back into an object graph.

### Data exchange formats and composite data types

Serializing PHP objects to JSON or XML is painless because the rich data types encapsulated by a PHP object are transformed from their PHP data constructs, which allow composing rich "composite types" of data (e.g. your domain objects) made up of primitive types (e.g. strings, integers, booleans, etc), into a format like JSON or XML that is limited to only primitive data types.

Having a small number of primitive data types is an advantage of a data exchange format like JSON or XML. They are easy to create and allow high-level languages to work with data in their native language constructs before decomposing that data back into a data exchange format to allow another application to use it.

To take advantage of the exchange format and rebuild our feature-rich PHP objects, we must provide the Serializer service more explicit details about what data types our domain objects expect each property to use.

You've probably seen PHPDoc annotations like `@var string` or `@var \DateTime` on PHP objects. [phpDocumentor](http://www.phpdoc.org) and most IDEs will parse and use these for data completion, but the Serializer component uses its own annotations that provide a bit more detail.

### Annotating object properties with Serializer Types

Your `Acme\DemoBundle\Entity\User` object probably has a lot of things it can do in the form of methods, and likely has several relationships to other objects. We want to take advantage of that rich domain model and the behavior of those objects once we receive data from our third-party API. Not only that but we want to hydrate those model objects without writing a bunch of boiler-plate code.

With a little additional configuration, we can allow the JMS Serializer to take JSON or XML and properly deserialize it back into PHP domain objects.

Here's our basic `User` object. I have omitted all of the normal behavior methods and all getters/setters for brevity, so we'll just use public properties. Chances are your User object would have a lot more methods and use private properties exposed by getters and setters.

{% highlight php startinline %}
namespace Acme\DemoBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;

class User
{
    public $firstName;
    public $lastName;
    public $logins;
    public $lastLogin;
    public $address;
    public $friends;

    public function __construct()
    {
        $this->address = new Address();
        $this->friends = new ArrayCollection();
    }
}
{% endhighlight %}

Let's say your company stores its user data on another server and exposes it via an HTTP API to your custom application. You decide to fetch an XML representation of that user resource via a request `GET http://someapi.com/users/10` and the response body might look like this:

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<result>
  <first_name>John</first_name>
  <last_name>Kary</last_name>
  <logins>5</logins>
  <last_login>2013-07-21T00:55:59-0500</last_login>
  <address>
    <number>555</number>
    <street>4th Street</street>
    <city>Lawrence</city>
    <state>KS</state>
    <zip>66045</zip>
  </address>
  <friends>
    <friend>
      <first_name>Chris</first_name>
      <last_name>Escalante</last_name>
      <logins>3</logins>
      <last_login>2013-07-11T12:22:41-0500</last_login>
    </friend>
    <friend>
      <first_name>Dustin</first_name>
      <last_name>Gordon</last_name>
      <logins>1</logins>
      <last_login>2013-06-26T14:16:33-0500</last_login>
    </friend>
  </friends>
</result>
{% endhighlight %}

Given this response, you probably thought you would try using JMS Serializer to deserialize this XML into a User object. You probably discovered the `SerializerInterface->deserialize($data, $type, $format)` method, passed in your XML data, provided the fully-qualified class name to your target object and told it to use the XML format:

{% highlight php startinline %}
$this->get('jms.serializer')->deserialize($xml, 'Acme\DemoBundle\Entity\User', 'xml');
{% endhighlight %}

If you tried this as-is you would be met with a `JMS\Serializer\Exception\RuntimeException` with an exception message like this:

{% highlight php %}
You must define a type for Acme\DemoBundle\Entity\User::$firstName.
{% endhighlight %}

We must tell the Serializer what format or data type to use when translating an XML node like `<first_name>John</first_name>` back onto our User object's property `public $firstName`.

Let's annotate our properties to parse this XML. Be sure to reference the [official Annotation documentation](http://jmsyst.com/libs/serializer/master/reference/annotations) for all possible annotations:

{% highlight php startinline %}
namespace Acme\DemoBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation as JMS;

class User
{
    /**
     * @JMS\Type("string")
     */
    public $firstName;

    /**
     * @JMS\Type("string")
     */
    public $lastName;

    /**
     * Number of times has logged in.
     * @JMS\Type("integer")
     */
    public $logins;

    /**
     * Last time logged in using ISO 8601 format.
     * @JMS\Type("DateTime<'Y-m-d\TH:i:sO'>")
     */
    public $lastLogin;

    /**
     * @JMS\Type("Acme\DemoBundle\Entity\Address")
     */
    public $address;

    /**
     * @JMS\Type("ArrayCollection<Acme\DemoBundle\Entity\User>")
     * @JMS\XmlList(entry="friend")
     */
    public $friends;

    public function __construct()
    {
        $this->address = new Address();
        $this->friends = new ArrayCollection();
    }
}
{% endhighlight %}

The annotations we're using above:

* [@Type](http://jmsyst.com/libs/serializer/master/reference/annotations#type)
* [@XmlList](http://jmsyst.com/libs/serializer/master/reference/annotations#xmllist)

We can now take that XML response and deserialize it back into a rich User object. Here's the full code embedded in a controller where you might make your request to the HTTP API and do something with the XML response:

{% highlight php startinline %}
namespace Acme\DemoBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class DemoController extends Controller
{
    /**
     * @Route("/", name="deserialize")
     */
    public function helloAction()
    {
        // Assume you get your XML from some third-party
        $xml = <<<EOT
<?xml version="1.0" encoding="UTF-8"?>
<result>
  <first_name>John</first_name>
  <last_name>Kary</last_name>
  <logins>5</logins>
  <last_login>2013-07-21T00:55:59-0500</last_login>
  <address>
    <number>555</number>
    <street>4th Street</street>
    <city>Lawrence</city>
    <state>KS</state>
    <zip>66045</zip>
  </address>
  <friends>
    <friend>
      <first_name>Chris</first_name>
      <last_name>Escalante</last_name>
      <logins>3</logins>
      <last_login>2013-07-11T12:22:41-0500</last_login>
    </friend>
    <friend>
      <first_name>Dustin</first_name>
      <last_name>Gordon</last_name>
      <logins>1</logins>
      <last_login>2013-06-26T14:16:33-0500</last_login>
    </friend>
  </friends>
</result>
EOT;

        $user = $this->get('jms_serializer')->deserialize($xml, 'Acme\DemoBundle\Entity\User', 'xml');

        var_dump($user);
        exit;
    }
}
{% endhighlight %}

I'm using var_dump here to show exactly how the data appears when hydrated onto the User object:

<div class="highlight"><pre><code class="language-php" data-lang="php">object(Acme\DemoBundle\Entity\User)[416]
  public 'firstName' => string 'John' (length=4)
  public 'lastName' => string 'Kary' (length=4)
  public 'logins' => int 5
  public 'lastLogin' => 
    object(DateTime)[436]
      public 'date' => string '2013-07-21 00:55:59' (length=19)
      public 'timezone_type' => int 1
      public 'timezone' => string '-05:00' (length=6)
  public 'address' => 
    object(Acme\DemoBundle\Entity\Address)[434]
      public 'number' => string '555' (length=3)
      public 'street' => string '4th Street' (length=10)
      public 'city' => string 'Lawrence' (length=8)
      public 'state' => string 'KS' (length=2)
      public 'zip' => string '66045' (length=5)
  public 'friends' => 
    object(Doctrine\Common\Collections\ArrayCollection)[450]
      private '_elements' => 
        array (size=2)
          0 => 
            object(Acme\DemoBundle\Entity\User)[455]
              ...
          1 => 
            object(Acme\DemoBundle\Entity\User)[454]
              ...
</code></pre></div>

We can now work with our User object and it can boast all of its rich behavior and relationships with other objects!
