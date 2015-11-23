
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

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
