
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
