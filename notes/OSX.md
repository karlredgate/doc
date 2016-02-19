OSX Notes
=========

<!--
-->

Disable `.DS_Store` file creation on network shares.

```
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

Disable spotlight on USB sticks

```
touch .metatdata_never_index
```

 * []( https://github.com/rentzsch/mach_inject )
 * []( https://www.aorensoftware.com/blog/2011/12/24/death-to-ds_store/ )
 * []( https://github.com/snielsen/DeathToDSStore )
 * []( http://superuser.com/questions/212896/is-there-any-way-to-prevent-a-mac-from-creating-dot-underscore-files )
 * []( https://support.apple.com/en-us/ht1629 )

Green updates:
 * ( http://sparkle-project.org/ )

 El Capitan - rootless
 ---------------------

 Also known as
 [System Integrity Protection]( https://en.wikipedia.org/wiki/System_Integrity_Protection )

  * []( http://apple.stackexchange.com/questions/193368/what-is-the-rootless-feature-in-el-capitan-really )
  * []( http://www.trankynam.com/xtrafinder/sip.html )
  * []( http://blog.binaryage.com/on-el-capitan/ )
  * [Apple SIP doc]( https://developer.apple.com/library/mac/documentation/Security/Conceptual/System_Integrity_Protection_Guide/ConfiguringSystemIntegrityProtection/ConfiguringSystemIntegrityProtection.html )

  * []( https://github.com/binaryage/asepsis/issues/30 )
  * []( http://www.tgwbd.org/darwin/binaryprotection.html )
  * []( http://asepsis.binaryage.com/ )
  * []( https://www.reddit.com/r/osx/comments/39irta/curious_new_restricted_file_system_flag_in_el/ )
  * []( http://www.macrumors.com/2015/06/12/os-x-el-capitan-trim-support/ )

Appears to be based on FreeBSD *secure level*.

  * []( https://en.wikipedia.org/wiki/Securelevel )
  * []( http://www.watson.org/~robert/freebsd/2004bsdcan/20040515-2004bsdcan-trustedbsd.pdf )

RPM for OSX
------------

osx rpmbuild
http://stackoverflow.com/questions/5247627/how-can-i-build-an-rpm-on-my-macos-system
http://rpm4darwin.sourceforge.net/

iWork Format
------------

http://www.apple.com/mac/numbers/compatibility/
OSX number iwa files
https://github.com/obriensp/iWorkFileFormat/blob/master/Docs/index.md#iwa
http://google.github.io/snappy/
https://github.com/google/snappy/blob/master/framing_format.txt
https://github.com/obriensp/proto-dump
https://github.com/obriensp/iWorkFileFormat/tree/master/iWorkFileInspector/iWorkFileInspector/Messages/Proto
http://www.macworld.com/article/2063353/how-to-work-with-iworks-new-file-formats.html

Bundles
-------

https://developer.apple.com/library/mac/documentation/CoreFoundation/Conceptual/CFBundles/DocumentPackages/DocumentPackages.html
https://developer.apple.com/library/mac/documentation/CoreFoundation/Conceptual/CFBundles/BundleTypes/BundleTypes.html#//apple_ref/doc/uid/10000123i-CH101-SW26
https://developer.apple.com/library/mac/documentation/CoreFoundation/Conceptual/CFBundles/CFBundles.pdf
https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPFrameworks/Frameworks.html#//apple_ref/doc/uid/10000183i
https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPFrameworks/BPFrameworks.pdf

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
