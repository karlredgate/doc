
<!--
-->

There are also some generic compiler links in this.

https://en.wikipedia.org/wiki/Jikes
https://en.wikipedia.org/wiki/Jikes_RVM
https://en.wikipedia.org/wiki/List_of_Java_virtual_machines
https://en.wikipedia.org/wiki/HotSpot
https://en.wikipedia.org/wiki/JamVM
https://en.wikipedia.org/wiki/Android_Runtime
http://jcvm.sourceforge.net/
http://www.sablevm.org/
https://en.wikipedia.org/wiki/Soot_(software)
https://en.wikipedia.org/wiki/GNU_Compiler_Collection#GENERIC_and_GIMPLE
https://en.wikipedia.org/wiki/Static_single_assignment_form
http://www.cs.utexas.edu/~pingali/CS380C/2010/papers/ssaCytron.pdf
https://en.wikipedia.org/wiki/NanoVM
https://en.wikipedia.org/wiki/Free_Java_implementations
https://en.wikipedia.org/wiki/GNU_Compiler_for_Java
https://en.wikipedia.org/wiki/Java_virtual_machine#C_to_bytecode_compilers
https://github.com/ReadyTalk/avian

WAR Files
---------

Can you run a war?

http://stackoverflow.com/questions/1842972/how-do-i-run-a-class-in-a-war-from-the-command-line#3804844

Looks like no - not directly.  It requires a container server;
like tomcat, wildfly, etc.  There is a tiny servlet container
( http://tjws.sourceforge.net/ )

### Tiny Java Web Server

 * https://github.com/drogatkin/TJWS2

I wonder how difficult it is to load JACL with the JARs packaged in the WAR?

JACL
----

 * http://wiki.tcl.tk/1637
 * http://tcljava.sourceforge.net/
 * https://en.wikipedia.org/wiki/Tcl/Java

I Wonder if I should just use Groovy?

Groovy
------

JAX-RS
-------

JAX-RS: Java API for RESTful Web Services (JAX-RS) is a Java programming language API that provides support in creating web services according to the Representational State Transfer (REST) architectural pattern

 * https://en.wikipedia.org/wiki/Java_API_for_RESTful_Web_Services
 * https://github.com/resteasy/Resteasy
 * https://developer.jboss.org/wiki/ResteasySkeletonKeyWebSSOOAuth

Spring
------

<http://stackoverflow.com/questions/3153546/how-does-autowiring-work-in-spring>
http://stackoverflow.com/questions/19414734/understanding-spring-autowired-usage
http://docs.spring.io/spring/docs/3.0.x/reference/beans.html#beans-autowired-annotation

First, and most important - all Spring beans are managed - they
"live" inside a container, called "application context".

Second, each application has an entry point to that context. Web
applications have a Servlet, JSF uses a el-resolver, etc. Also,
there is a place where the application context is bootstrapped and
all beans - autowired. In web applications this can be a startup
listener.

Autowiring happens by placing an instance of one bean into the
desired field in an instance of another bean. Both classes should
be beans, i.e. they should be defined to live in the application
context.

What is "living" in the application context? This means that the
context instantiates the objects, not you. I.e. - you never make
new UserServiceImpl() - the container finds each injection point
and sets an instance there.

In your controllers, you just have the following:

```
@Controller // Defines that this class is a spring bean
@RequestMapping("/users")
public class SomeController {
    // Tells the application context to inject an instance of UserService here
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public void login(@RequestParam("username") String username,
    @RequestParam("password") String password) {
        // The UserServiceImpl is already injected and you can use it
        userService.login(username, password);
    }
}
```

A few notes:

In your applicationContext.xml you should enable the
<context:component-scan> so that classes are scanned for the
@Controller, @Service, etc. annotations.

The entry point for a Spring-MVC application is the DispatcherServlet,
but it is hidden from you, and hence the direct interaction and
bootstrapping of the application context happens behind the scene.

UserServiceImpl should also be defined as bean - either using <bean
id=".." class=".."> or using the @Service annotation. Since it will
be the only implementor of UserService, it will be injected.

Apart from the @Autowired annotation, Spring can use XML-configurable
autowiring. In that case all fields that have a name or type that
matches with an existing bean automatically get a bean injected.
In fact, that was the initial idea of autowiring - to have fields
injected with dependencies without any configuration. Other annotations
like @Inject, @Resource can also be used.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
