
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

```
$ git clone https://github.com/sger/Tinylog-iOS
$ cd Tinylog-iOS
$ pod install
```

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


iOS libraries
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

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
