
<!--
-->

Adding a storyboard did nothing useful.
Added a storyboard then another page and a segue between them - and there was no way to build.
Then I added a scheme - still no build.  This appears to be due to schemes not having targets,
[projects have targets]( http://stackoverflow.com/questions/14172953/how-do-i-add-a-target-to-a-test-scheme ).
So I added a project and deleted my old storyboard and view class - still no build.
That was because I had created a bogus scheme - I changed to the scheme attached
to the project and that can build.

> side note: checking on how to compile a storyboard
> [page on ibtool]( http://stackoverflow.com/questions/14172953/how-do-i-add-a-target-to-a-test-scheme )

Now I have forgotten how to add a segue...
Ctrl-drag from a button to another view to create a segue.
It does not like buttons on the first page.

The storyboard has a `viewController` element with a `customClass` attribute
that points at a swift file with a `class` of that name.
The class is a sub-class of `UIViewController` and `UIPageViewControllerDelegate`.

CocoaPods
---------

( https://cocoapods.org/ )

```
sudo gem install cocoapods
```

Sample Apps
-----------

https://github.com/dkhamsing/open-source-ios-apps#sample
https://github.com/dkhamsing/open-source-ios-apps
https://github.com/Lax/iOS-Swift-Demos
https://github.com/binarylevel/Tinylog-iOS

```
$ git clone https://github.com/sger/Tinylog-iOS
$ cd Tinylog-iOS
$ pod install
```

TinyLog needs `xctool`

https://code.facebook.com/projects/359440610825631/xctool/
https://www.infoq.com/news/2013/05/Facebook-buck-xctool-build
https://github.com/facebook/xctool


Storyboards
----------

 * ( http://www.raywenderlich.com/5138/beginning-storyboards-in-ios-5-part-1 )
 * ( http://docs.elementscompiler.com/Platforms/Cocoa/XIB/WorkingWithXIBsAndStoryboards/ )


try more iOS builds
 * search: osx pod install
   ( http://stackoverflow.com/questions/20078636/issue-with-installing-pods-on-mac-os-x )
   ( https://cocoapods.org/ )
 * search: ld: library not found for -lAFNetworking
   ( http://stackoverflow.com/questions/1365211/error-in-xcode-project-ld-library-not-found-for-lcrt1-10-6-o )
 * search: AFNetworking
   ( https://github.com/AFNetworking/AFNetworking )
   ( https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking )
   ( http://www.raywenderlich.com/59255/afnetworking-2-0-tutorial )
 * turns out the problem wasn't networking
 * "pod install" created a workspace file that needed to opened in xcode - not the project file
 * then the AFNetworking link problem went away
 * then discovered that it needed fabric.io (and app) for deployment?
   ( https://www.fabric.io/onboard )
download Android studio
   ( https://developer.android.com/sdk/installing/index.html?pkg=studio )
   ( https://developer.android.com/sdk/installing/adding-packages.html )

http://stackoverflow.com/questions/1488931/how-do-you-show-xcodes-build-log-trying-to-verify-if-iphone-distribution-buil
http://stackoverflow.com/questions/19014359/how-do-i-view-the-full-build-log-on-xcode5


https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/StoryboardSegue.html

Open source game engine for ios
http://gamua.com/sparrow/
http://9to5mac.com/2015/06/10/xcode-7-allows-anyone-to-download-build-and-sideload-ios-apps-for-free/
https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/StoryboardScene.html
https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/ImplementingtheBehaviorofObjectsinaScene.html#//apple_ref/doc/uid/TP40014225-CH42-SW1

http://stackoverflow.com/questions/24075112/launch-sequence-of-swift-app
https://developer.apple.com/swift/blog/?id=7

https://github.com/CocoaPods/CocoaPods
https://en.wikipedia.org/wiki/CocoaPods
http://guides.cocoapods.org/using/getting-started.html
https://en.wikipedia.org/wiki/RubyMotion
https://cocoapods.org/


https://parse.com/


https://developer.apple.com/library/ios/navigation/
https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/index.html

https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Introduction.html


HTTP Server for iOS Apps
------------------------

 * <https://github.com/swisspol/GCDWebServer>
 * <https://github.com/face/MongooseDaemon>
 * <https://github.com/robbiehanson/CocoaHTTPServer>

Framework Mgmt
---------------

Carthage is intended to be the simplest way to add frameworks to
your Cocoa application.

https://github.com/Carthage/Carthage

iOS libraries
--------------


https://developer.apple.com/library/ios/navigation/
http://www.idev101.com/libraries.html
http://www.raywenderlich.com/21987/top-10-most-useful-ios-libraries-to-know-and-love
https://github.com/nothingmagical/cheddar-ios
http://sstoolk.it/
https://github.com/samsoffes/sskeychain
https://github.com/AFNetworking/AFNetworking
http://nshipster.com/
https://github.com/mattt
http://nimbuskit.info/
http://cocos2d-iphone.org/
https://cocoapods.org/
https://github.com/cocos2d/cocos2d-objc
http://www.spritebuilder.com/

Scratch
--------

https://scratch.mit.edu/discuss/topic/60012/
https://wiki.scratch.mit.edu/wiki/Scratch_on_Tablets
https://itunes.apple.com/us/app/puffin-web-browser-free/id472937654?mt=8&ign-mpt=uo%3D4

Apps
----

https://github.com/nothingmagical/cheddar-ios

Access iOS device from OSX
---------------------------

http://stackoverflow.com/questions/18037591/access-ios-filesystem-without-jailbreak#20568346
https://github.com/libimobiledevice/ifuse
http://www.libimobiledevice.org/
https://github.com/libimobiledevice/libimobiledevice

Configurator tool
-----------------

http://help.apple.com/configurator/mac/2.3/
https://support.apple.com/en-us/HT202430
https://www.apple.com/support/business/apple-configurator/
https://www.apple.com/support/business/

Client Certs

https://discussions.apple.com/thread/2409942?start=0&tstart=0

Push Notifications
------------------

https://developer.apple.com/notifications/


Links
------

http://iphonedevwiki.net/index.php/Lockdownd
https://www.theiphonewiki.com/wiki//usr/libexec/lockdownd
http://newosxbook.com/index.php?page=downloads
https://github.com/rpetrich/deviceconsole
https://www.theiphonewiki.com/wiki/System_Log

### Feb

Ratchet began as a series of HTML/CSS prototypes of the Twitter for
iPhone app. These prototypes became invaluable to the process of
testing new feature designs that ended up being shipped as part of
the native mobile app.

As it became clear that this was the quickest and most effective
way to design mobile apps, components were abstracted from these
prototypes and became the framework you know today.

Released in November 2012, Ratchet quickly became one of the most
popular prototyping tools on GitHub. Following that initial launch,
we released v2 – a complete rewrite. With v2 we've abstracted the
platform specific styles into their own theme CSS files, added an
icon set called Ratchicons, and offically became part of the Bootstrap
family.

http://goratchet.com/examples/
https://github.com/twbs/ratchet

Linking to Apps
---------------

up vote
9
down vote
favorite
1
I want to open apps using a link. So when you tap a link in safari, you open an app.

I had already found these links:

Message  --- sms:
Maps --- maps://
App Store --- itms-apps://
iTunes --- itms://
Safari --- http://blanksafari.com/
iBooks --- ibooks://
Videos --- videos://
Music --- music://
Mail --- mailto:
Reminders --- x-apple-reminder://
Calendar --- calshow://

-http:
-https:
-mailto:
-about:
-callto:
-skype:
-gtalk:
-tel:
-sms:
-feed:
-ibooks:
-itms(-apps):
-market:
-maps:
-geo:
-comgooglemaps:
-lastfm:
-git:
-dict:

Touch Events - Pencil
----------------------

https://www.w3.org/TR/touch-events/#touch-interface
https://developer.mozilla.org/en-US/docs/Web/API/Touch
https://w3c.github.io/touch-events/#widl-Touch-force
https://www.w3.org/TR/pointerevents/#the-touch-action-css-property
PEP: pointer event polyfill - http://jquery.github.io/PEP/
https://github.com/jquery/PEP
https://www.w3.org/TR/pointerevents/#h2_intro
https://github.com/quietshu/apple-pencil-safari-api-test


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
