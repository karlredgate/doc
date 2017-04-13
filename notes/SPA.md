Single Page Apps
================

Navigation
----------

http://blog.teamtreehouse.com/popular-web-design-trends-for-responsive-navigation
https://codemyviews.com/blog/website-navigation-trends-10-tips-examples
https://medium.com/@MerciMichel/la-plus-grande-cave-%C3%A0-bi%C3%A8res-du-monde-c2db691104a5#.48azqx8xs

Green Sock GSAP - HTML5 Navigation
http://greensock.com/gsap

http://merci-michel.com/La-plus-grande-cave-a-biere-du-monde

The HTML5 Creation Engine - 
Create beautiful digital content with the fastest, most flexible
2D WebGL renderer.

http://www.pixijs.com/
http://www.pixijs.com/gallery
https://pixijs.github.io/examples/#/basics/basic.js


### Full Screen Nav

https://github.com/codrops/FullscreenOverlayStyles
https://github.com/damonbauer/Full-Screen-Nav

SVG
----

Pixel perfect Icon solutions - <https://icomoon.io/>
https://linearicons.com/
https://commons.wikimedia.org/wiki/Category:SVG_electrical_symbols
http://svgdiscovery.com/index.htm

http://www.creativebloq.com/design/examples-svg-7112785
http://svg-wow.org/

<http://000000book.com/>

https://sarasoueidan.com/blog/structuring-grouping-referencing-in-svg/
https://sarasoueidan.com/blog/svg-coordinate-systems/
https://www.sitepoint.com/tips-accessible-svg/

Presentations:

http://slides.com/sarasoueidan/styling-animating-svgs-with-css--2#/
http://slides.com/sarasoueidan/animating-svg-with-css-and-smil-full-version#/

### Scale and Mirror

http://stackoverflow.com/questions/23899718/scale-and-mirror-svg-object#23902773

### How to find screen location of Symbol

http://stackoverflow.com/questions/26049488/how-to-get-absolute-coordinates-of-object-inside-a-g-group
http://stackoverflow.com/questions/6858479/rectangle-coordinates-after-transform

http://frontendbabel.info/articles/svg-grouping-and-reusing-elements/
https://sarasoueidan.com/blog/structuring-grouping-referencing-in-svg/
http://taye.me/blog/svg/a-guide-to-svg-use-elements/
https://www.quora.com/How-do-I-get-XY-coordinates-of-points-on-browser-window-when-drawing-SVG

### Mozilla Docs for SVG DOM

https://developer.mozilla.org/en-US/docs/Web/API/Element/getBoundingClientRect
https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform

and some from microsoft

 * SVGMatrix object <https://msdn.microsoft.com/en-us/library/ff972082(v=vs.85).aspx>
 * SVG Coordinate Transformations <https://msdn.microsoft.com/en-us/library/hh535760(v=vs.85).aspx>

### Snap SVG

SVG is an excellent way to create interactive, resolution-independent
vector graphics that will look great on any size screen. And the
Snap.svg JavaScript library makes working with your SVG assets as
easy as jQuery makes working with the DOM.

http://snapsvg.io/
https://github.com/adobe-webplatform/Snap.svg

### Vectr app - SVG editor

https://vectr.com/
https://vectr.com/user-guide/

https://en.wikipedia.org/wiki/Comparison_of_vector_graphics_editors

### Bezier

 * search: d3 bezier curve

I was looking for bezier curves and ran across this guy:

https://github.com/jasondavies?tab=repositories
https://github.com/jasondavies/bloomfilter.js

https://www.jasondavies.com/
https://www.jasondavies.com/animated-bezier/

https://www.dashingd3js.com/svg-paths-and-d3js

### Shadow DOM

https://www.html5rocks.com/en/tutorials/webcomponents/shadowdom/
https://www.html5rocks.com/en/tutorials/webcomponents/shadowdom-201/
https://developers.google.com/web/fundamentals/getting-started/primers/shadowdom

http://tympanus.net/codrops/2015/07/16/styling-svg-use-content-css/
https://code.tutsplus.com/tutorials/intro-to-shadow-dom--net-34966
https://glazkov.com/2011/01/14/what-the-heck-is-shadow-dom/
http://webcomponents.org/articles/introduction-to-shadow-dom/

These are related to ShadowDom and how jQuery searches the DOM.

https://weblogs.asp.net/bleroy/css-isolation-there-has-got-to-be-a-better-way
http://googlecode.blogspot.com/2009/11/introducing-closure-tools.html
[Instance private, class private, package and friends](http://erik.eae.net/archives/2008/11/14/23.47.04/)
https://www.paulirish.com/2010/10-things-i-learned-from-the-jquery-source/
http://stopdesign.com/archive/2009/02/04/recreating-the-button.html

Angular
-------

http://stackoverflow.com/questions/14350412/full-list-of-angularjs-directives#14350425
https://www.cheatography.com/proloser/cheat-sheets/angularjs/#downloads
https://docs.angularjs.org/api/

Curated list of angular directives
http://angular-js.in/

### Slide and Push Menus

http://tympanus.net/codrops/2013/04/17/slide-and-push-menus/
http://tympanus.net/Blueprints/SlidePushMenus/#

### Select Dropdown

<https://docs.angularjs.org/api/ng/directive/select>

```
<div ng-controller="ExampleController">
  <form name="myForm">
    <label for="singleSelect"> Single select: </label><br>
    <select name="singleSelect" ng-model="data.singleSelect">
      <option value="option-1">Option 1</option>
      <option value="option-2">Option 2</option>
    </select><br>

    <label for="singleSelect">
    Single select with "not selected" option
    and dynamic option values:
    </label>
    <br/>
    <select name="singleSelect" id="singleSelect" ng-model="data.singleSelect">
      <option value=""> - - -Please select - - - </option>
      <!-- not selected / blank option -->
      <option value="{{data.option1}}">Option 1</option>
      <!-- interpolation -->
      <option value="option-2">Option 2</option>
    </select><br>
    <button ng-click="forceUnknownOption()">Force unknown option</button><br>
    <tt>singleSelect = {{data.singleSelect}}</tt>

    <hr>
    <label for="multipleSelect"> Multiple select: </label><br>
    <select name="multipleSelect"
            id="multipleSelect"
            ng-model="data.multipleSelect"
            multiple>
      <option value="option-1">Option 1</option>
      <option value="option-2">Option 2</option>
      <option value="option-3">Option 3</option>
    </select><br>
    <tt>multipleSelect = {{data.multipleSelect}}</tt><br/>
  </form>
</div>
```

```
<div ng-controller="ExampleController">
  <form name="myForm">
      <label for="repeatSelect"> Repeat select: </label>
      <select name="repeatSelect"
              id="repeatSelect"
              ng-model="data.model">
      <option ng-repeat="option in data.availableOptions"
              value="{{option.id}}">{{option.name}}</option>
      </select>
  </form>
  <hr/>
  <tt>model = {{data.model}}</tt><br/>
</div>
```

Angular UI
----------

Components for Angular

https://angular-ui.github.io/
https://angular-ui.github.io/bootstrap/
https://angular-ui.github.io/bootstrap/#/getting_started

Angular D3 Integration
----------------------

search: svg map of world angular view

https://medium.com/@tweededbadger/tutorial-dynamic-data-driven-svg-map-with-angularjs-b112fdec421d
http://jvectormap.com/

http://grokbase.com/t/gg/d3-js/132r1sa1hj/building-an-interactive-map-with-d3-and-angular-js

Open Internet for everyone. Lantern is a free application that
delivers fast, reliable and secure access to the open Internet for
users in censored regions. It uses a variety of techniques to stay
unblocked, including domain fronting, p2p, and pluggable transports.
https://getlantern.org

https://github.com/getlantern/lantern

This is the repository for the UI of Lantern. It is maintained as
a separate repository to facilitate development. This code can be
run independently of Lantern's Java backend with a lightweight
node.js http server using Faye to implement Lantern's bayeux server.

https://github.com/getlantern/lantern-ui
http://faye.jcoglan.com/

Angular Components
------------------

http://www.angularjshub.com/examples/forms/checkboxinput/
https://docs.angularjs.org/api/ng/directive/ngModel
https://docs.angularjs.org/api/ng/type/ngModel.NgModelController

http://ng-table.com/#/pagination/demo-api
https://github.com/samu/angular-table
http://ngmodules.org/modules/ng-table
http://ng-table.com/#/
http://www.w3schools.com/bootstrap/bootstrap_tables.asp

Angluar Dependency Injection
----------------------------

The key part is

```
function f($scope,a,b) { ... }
var s = f.toString();
/expression to get args/.match(s);
// find the arg list
f.call(someObject,args);
```

http://teropa.info/blog/2014/06/04/angularjs-dependency-injection-from-the-inside-out.html
http://teropa.info/blog/2014/03/18/using-angular-2-0-dependency-injection-in-a-backbone-app.html
http://merrickchristensen.com/articles/javascript-dependency-injection.html

Bootstrap Menus
---------------

[sub-menu on navigation toolbar](https://github.com/twbs/bootstrap/issues/160)
http://www.w3schools.com/bootstrap/bootstrap_navbar.asp
http://stackoverflow.com/questions/17380517/bootstrap-3-level-collapsing-menu

http://bootsnipp.com/snippets/featured/multi-level-dropdown-menu-bs3
[bootstrap 3 slide menu](http://www.bootply.com/71211)
http://stackoverflow.com/questions/20863288/bootstrap-3-slide-in-menu-navbar-on-mobile

http://www.jasny.net/bootstrap/javascript/#offcanvas

The offcanvas plugin allows you to hide an element from sight and
than show it by moving either that or any other element. It's
intended to be used for off canvas navigation, like push menus.

Another example
https://jsbin.com/seqola/2/edit?html,css,js,output

### Smart Menus

http://www.monolinea.com/responsive-multilevel-menu-with-bootstrap-3/

http://www.smartmenus.org/download/
http://vadikom.github.io/smartmenus/src/demo/bootstrap-navbar.html
http://vadikom.github.io/smartmenus/src/demo/index.html
http://www.smartmenus.org/about/themes/

Angular Scopes
--------------
https://github.com/angular/angular.js/wiki/Understanding-Scopes

In AngularJS, a child scope normally prototypically inherits from
its parent scope. One exception to this rule is a directive that
uses scope: `{ ... }` - this creates an "isolate" scope that
does not prototypically inherit.（and directive with transclusion）
This construct is often used when creating a "reusable component"
directive. In directives, the parent scope is used directly by
default, which means that whatever you change in your directive
that comes from the parent scope will also change in the parent
scope. If you set scope:true (instead of scope: `{ ... }`),
then prototypical inheritance will be used for that directive.

Scope inheritance is normally straightforward, and you often don't
even need to know it is happening... until you try 2-way data binding
(i.e., form elements, ng-model) to a primitive (e.g., number, string,
boolean) defined on the parent scope from inside the child scope.
It doesn't work the way most people expect it should work. What
happens is that the child scope gets its own property that hides/shadows
the parent property of the same name. This is not something AngularJS
is doing – this is how JavaScript prototypal inheritance works. New
AngularJS developers often do not realize that ng-repeat, ng-switch,
ng-view, ng-include and ng-if all create new child scopes, so the
problem often shows up when these directives are involved. (See
this example for a quick illustration of the problem.)

This issue with primitives can be easily avoided by following the
"best practice" of always have a '.' in your ng-models – watch 3
minutes worth. Misko demonstrates the primitive binding issue with
ng-switch.

Having a '.' in your models will ensure that prototypal inheritance
is in play. So, use

```
<input type="text" ng-model="someObj.prop1">
```

rather than 

```
<input type="text" ng-model="prop1">
```


WOFF
----

https://en.wikipedia.org/wiki/Web_Open_Font_Format
https://www.w3.org/TR/WOFF/

http://stackoverflow.com/questions/9017922/how-to-convert-woff-to-ttf-otf-via-command-line#10374611
https://github.com/hanikesn/woff2otf

https://people-mozilla.org/~jkew/woff/
https://arty.name/woff2otf/
https://github.com/arty-name/woff2otf
https://people-mozilla.org/~jkew/woff/
https://github.com/typesupply/woffTools

http://stackoverflow.com/questions/12812441/how-do-i-use-woff-fonts-for-my-website
http://webdesign.about.com/od/fonts/a/woff.htm

Font Awesome
------------

http://fontawesome.io/
http://fontawesome.io/icons/
http://fontawesome.io/examples/
http://fontawesome.io/get-started/

Graphs - (sigma.js)
-------------------

### Sigma.js

http://sigmajs.org/
https://github.com/jacomyal/sigma.js/releases/
https://github.com/jacomyal/sigma.js/blob/master/README.md
https://github.com/jacomyal/sigma.js/wiki

https://gephi.org/

Gephi is the leading visualization and exploration software for all kinds of graphs and networks. Gephi is open-source and free.
Runs on Windows, Mac OS X and Linux.

https://gephi.org/gexf/format/

GEXF (Graph Exchange XML Format) is a language for describing complex networks structures, their associated data and dynamics. Started in 2007 at Gephi project by different actors, deeply involved in graph exchange issues, the gexf specifications are mature enough to claim being both extensible and open, and suitable for real specific applications.

Game Tools
----------

https://medium.freecodecamp.com/learning-javascript-by-making-a-game-4aca51ad9030#.nwqx801ay

http://game-icons.net/
http://opengameart.org/
https://bulkresizephotos.com/
http://spritegen.website-performance.org/

Movies - Videos in Angluar
--------------------------

http://www.videogular.com/
https://github.com/colthreepv/angular-media-player
http://stackoverflow.com/questions/17913613/custom-html5-video-player-controls-with-angularjs
http://www.videogular.com/tutorials/how-to-start/
http://blog.oxrud.com/posts/creating-youtube-directive/

Drag and Drop tables
--------------------

https://github.com/RubaXa/Sortable
http://rubaxa.github.io/Sortable/

http://marceljuenemann.github.io/angular-drag-and-drop-lists/demo/#/nested
http://stackoverflow.com/questions/18614695/sort-or-rearrange-rows-of-a-table-in-angularjs-drag-and-drop

http://ourcodeworld.com/articles/read/288/how-to-handle-drag-and-drop-file-feature-in-electron-framework
https://www.npmjs.com/package/electron-drag-drop
https://github.com/sindresorhus/awesome-electron
https://blog.dcpos.ch/how-to-make-your-electron-app-sexy

https://github.com/feross/webtorrent-desktop/blob/master/bin/package.js
https://www.npmjs.com/package/electron-workshop

Routers
-------

http://rubaxa.github.io/Pilot/
http://www.funnyant.com/angularjs-ui-router/

Markdown
--------

https://github.com/yoshuawuyts/vmd

Other Interesting
-----------------

Maybe?

https://github.com/angular-fullstack/generator-angular-fullstack

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
