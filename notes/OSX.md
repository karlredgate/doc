OSX Notes
=========

<!--
-->

Open Source OSX apps
--------------------

 * https://github.com/jeffreyjackson/mac-apps
 * node lib to get app info - https://github.com/gillstrom/osx-app

 * http://www.westwind.com/reference/OS-X/where-files.html

Command Line Notes
------------------

https://github.com/herrbischoff/awesome-osx-command-line

SpotLight etc
--------------

Disable `.DS_Store` file creation on network shares.

```
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

Disable spotlight on USB sticks

```
touch .metatdata_never_index
```

How to prevent the creation of `.DS_Store` files.

 * []( https://github.com/rentzsch/mach_inject )
 * []( https://www.aorensoftware.com/blog/2011/12/24/death-to-ds_store/ )
 * []( https://github.com/snielsen/DeathToDSStore )
 * []( http://superuser.com/questions/212896/is-there-any-way-to-prevent-a-mac-from-creating-dot-underscore-files )
 * []( https://support.apple.com/en-us/ht1629 )
 * []( http://asepsis.binaryage.com/ )

Green updates:
 * ( http://sparkle-project.org/ )

Boot
-----

This is an OSX bootloader - to use with virtualizing OSX.
But it had some other features you wanted to look into.

https://github.com/Piker-Alpha/RevoBoot

Extended Attributes
-------------------

All files have attributes.  Most seen is the download
attributes for files downloaded from a browser.

Tools: `xattr` and `mdls`.

xattr does not show the details of the download attribute.
Use mdls instead.

https://tinyapps.org/blog/mac/201011300700_os_x_edit_metadata.html
http://stackoverflow.com/questions/11978851/change-kmditemwherefroms-extended-attribute-when-saving-file-from-chrome


```
$ mdls browser_tests-1.03.tar.gz
_kMDItemOwnerUserID            = 510
kMDItemContentCreationDate     = 2016-07-20 12:22:03 +0000
kMDItemContentModificationDate = 2016-07-20 12:22:07 +0000
kMDItemContentType             = "org.gnu.gnu-zip-archive"
kMDItemContentTypeTree         = (
    "org.gnu.gnu-zip-archive",
    "public.data",
    "public.item",
    "public.archive"
)
kMDItemDateAdded               = 2016-07-20 12:22:05 +0000
kMDItemDisplayName             = "browser_tests-1.03.tar.gz"
kMDItemFSContentChangeDate     = 2016-07-20 12:22:07 +0000
kMDItemFSCreationDate          = 2016-07-20 12:22:03 +0000
kMDItemFSCreatorCode           = ""
kMDItemFSFinderFlags           = 0
kMDItemFSHasCustomIcon         = (null)
kMDItemFSInvisible             = 0
kMDItemFSIsExtensionHidden     = 0
kMDItemFSIsStationery          = (null)
kMDItemFSLabel                 = 0
kMDItemFSName                  = "browser_tests-1.03.tar.gz"
kMDItemFSNodeCount             = (null)
kMDItemFSOwnerGroupID          = 600
kMDItemFSOwnerUserID           = 510
kMDItemFSSize                  = 809169
kMDItemFSTypeCode              = ""
kMDItemKind                    = "gzip compressed archive"
kMDItemLogicalSize             = 809169
kMDItemPhysicalSize            = 811008
kMDItemWhereFroms              = (
    "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/browsersec/browser_tests-1.03.tar.gz",
    "https://code.google.com/archive/p/browsersec/downloads"
)
```

Forensics
---------

https://github.com/jipegit/OSXAuditor

http://forensicswiki.org/wiki/Mac_OS_X_10.9_-_Artifacts_Location
https://github.com/pstirparo/mac4n6

Security
--------

This page has good info - should clone it also

https://github.com/drduh/OS-X-Security-and-Privacy-Guide

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

Applications
------------

### Icons

https://developer.apple.com/library/content/documentation/GraphicsAnimation/Conceptual/HighResolutionOSX/Optimizing/Optimizing.html

http://stackoverflow.com/questions/12306223/how-to-manually-create-icns-files-using-iconutil

```
mkdir MyIcon.iconset
sips -z 16 16     Icon1024.png --out MyIcon.iconset/icon_16x16.png
sips -z 32 32     Icon1024.png --out MyIcon.iconset/icon_16x16@2x.png
sips -z 32 32     Icon1024.png --out MyIcon.iconset/icon_32x32.png
sips -z 64 64     Icon1024.png --out MyIcon.iconset/icon_32x32@2x.png
sips -z 128 128   Icon1024.png --out MyIcon.iconset/icon_128x128.png
sips -z 256 256   Icon1024.png --out MyIcon.iconset/icon_128x128@2x.png
sips -z 256 256   Icon1024.png --out MyIcon.iconset/icon_256x256.png
sips -z 512 512   Icon1024.png --out MyIcon.iconset/icon_256x256@2x.png
sips -z 512 512   Icon1024.png --out MyIcon.iconset/icon_512x512.png
cp Icon1024.png MyIcon.iconset/icon_512x512@2x.png
iconutil -c icns MyIcon.iconset
rm -R MyIcon.iconset
```

### dmg

Bash script that does this:

https://github.com/andreyvit/create-dmg

others

https://pypi.python.org/pypi/dmgbuild
https://github.com/LinusU/node-appdmg
http://stackoverflow.com/questions/96882/how-do-i-create-a-nice-looking-dmg-for-mac-os-x-using-command-line-tools

```
hdiutil create -srcfolder "${source}" -volname "${title}" -fs HFS+ \
      -fsargs "-c c=64,a=16,e=16" -format UDRW -size ${size}k pack.temp.dmg

device=$(hdiutil attach -readwrite -noverify -noautoopen "pack.temp.dmg" | \
         egrep '^/dev/' | sed 1q | awk '{print $1}')

```

Store the background picture (in PNG format) in a folder called ".background" in the DMG, and store its name in the "backgroundPictureName" variable.

Use AppleScript to set the visual styles (name of .app must be in bash variable "applicationName", use variables for the other properties as needed):

```
echo '
   tell application "Finder"
       tell disk "'${title}'"
            open
            set current view of container window to icon view
            set toolbar visible of container window to false
            set statusbar visible of container window to false
            set the bounds of container window to {400, 100, 885, 430}
            set theViewOptions to the icon view options of container window
            set arrangement of theViewOptions to not arranged
            set icon size of theViewOptions to 72
            set background picture of theViewOptions to file ".background:'${backgroundPictureName}'"
            make new alias file at container window to POSIX file "/Applications" with properties {name:"Applications"}
            set position of item "'${applicationName}'" of container window to {100, 100}
            set position of item "Applications" of container window to {375, 100}
            update without registering applications
            delay 5
            close
        end tell
    end tell
' | osascript
```

Finialize the DMG by setting permissions properly, compressing and releasing it:

```
chmod -Rf go-w /Volumes/"${title}"
sync
sync
hdiutil detach ${device}
hdiutil convert "/pack.temp.dmg" -format UDZO -imagekey zlib-level=9 -o "${finalDMGName}"
rm -f /pack.temp.dmg 
```


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

System Tools
------------

### How to list drives

http://osxdaily.com/2009/12/01/list-all-mounted-drives-and-their-partitions-from-the-terminal/
http://apple.stackexchange.com/questions/107953/list-all-devices-connected-lsblk-for-mac-os-x

Using Frameworks
----------------

OSX C program include framework

https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPFrameworks/Tasks/IncludingFrameworks.html
https://developer.apple.com/library/mac/releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_10.html#//apple_ref/doc/uid/TP40014484-SW6
https://developer.apple.com/library/mac/releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_10.html

READ THIS
https://www.mobomo.com/2010/12/a-visual-guide-to-creating-an-embeddable-framework-for-mac-osx/

https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/OSX_Technology_Overview/SystemFrameworks/SystemFrameworks.html

### Apple Pencil and UITouch

Article on developer support for the Pencil

https://developer.apple.com/library/content/releasenotes/General/WhatsNewIniOS/Articles/iOS9_1.html

UITouch is a framework for using the Apple pencil.

https://developer.apple.com/reference/uikit/uitouch
http://devstreaming.apple.com/videos/wwdc/2015/233l9q8hj9mw/233/233_advanced_touch_input_on_ios.pdf

Sandbox
-------

I was wondering if this could be used for namespace isolation.
It does not appear so - it looks more like permissions control.
Based on Trusted BSD.

http://reverse.put.as/wp-content/uploads/2011/09/Apple-Sandbox-Guide-v1.0.pdf
https://media.blackhat.com/bh-dc-11/Blazakis/BlackHat_DC_2011_Blazakis_Apple_Sandbox-wp.pdf
https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man7/sandbox.7.html

Jails
-----

The big difference between Darwin and all the other UNIXen that I
have used: Linux, Solaris, HP-UX, True64..., is in the shared library
arrangement.

At runtime other systems search some sort of shared library path to
find an appropriate library to link. Darwin is different. The path to
the linked shared libraries is written into an executable at static
link time. At runtime, dyld (the launcher) will always look at that path
first. It only uses the DYLD_LIBRARY_PATH if the library is not found at
the right path. (do an 'otool -L' on any library or executable) So you
can have as many virtual systems as you like, build and run using them
and almost the only thing they need in common is the kernel (and maybe
some GUI stuff if you use it). Look at the way Xcode uses SDKs and the
systemroot and other useful compiler and linker options. (the linker is
very different RTFM)

Packages
--------

https://mathiasbynens.be/notes/shell-script-mac-apps
http://apple.stackexchange.com/questions/120026/how-to-create-a-package-which-runs-a-shell-script

http://lifehacker.com/how-to-make-your-own-bulk-app-installer-for-os-x-1586252163

This one has apps you want

https://github.com/bkuhlmann/osx

```
man 5 bom
man lsbom
man mkbom
man ditto
```

`pkg` file is a tarball that contains

```
Distribution
core.pkg/Bom
core.pkg/PackageInfo
core.pkg/Payload
core.pkg/Scripts
```

Payload and Scripts are gzipped cpio archives.  Payload contains the
install files, that should all be listed in the `Bom`.  Scripts contains
at least `postinstall`

### Package building

These were gathered january 2017 - read them
and review the source code:

https://macops.ca/rolling-os-x-packages-with-fpm-and-homebrew
https://github.com/jordansissel/fpm/wiki/OS-X-packages
https://cauldrondevelopment.com/svn/osxbom/trunk/
http://stackoverflow.com/questions/2323818/packagemaker-for-creating-mac-packages-on-windows-linux/8016507
[Help with my first PKGBUILD script](https://bbs.archlinux.org/viewtopic.php?id=12214)

### Scripts

 * http://stackoverflow.com/questions/19978553/running-postflight-script-when-installing-a-package-on-mac
 * http://macinstallers.blogspot.in/2012/07/scripting-in-installer-packages.html
 * http://macinstallers.blogspot.in/search/label/Distribution
 * http://macinstallers.blogspot.in/2013/01/xml-attributes-of-packagemaker.html#allowed-os-versions
 * http://apple.stackexchange.com/questions/113489/unattended-installation-of-pkg-file
 * https://github.com/tjluoma/pkginstall/blob/master/pkginstall.sh
 * https://github.com/tjluoma/autopkginstall
 * http://code.google.com/p/munki/
 * https://github.com/munki/munki
 * https://github.com/munki/munkiwebadmin
 * https://github.com/munki/createOSXinstallPkg
 * https://munkibuilds.org/
 * http://code.google.com/p/munki/wiki/GettingStartedWithMunki
 * http://groups.google.com/group/munki-dev

### From another author

  Scripting in Installer Packages

In my previous post, I discussed about creating packages to deploy
your application bundles. However, installation of some applications
is more complex and requires many actions other than copying the
payload. For example, you want to check if a particular application
is already installed on the system before installing your application.
For all these tasks, you can use the preinstall, postinstall and
Distribution scripts which are included in the package and run by
the installer during the installation. After the Installer application
finishes checking installation requirements, it performs an install
through distinct operations, known as install operations. You can
define all but one of these operations, which copy payloads to their
installation destinations. You should not use install operations
to fix install problems, such as incorrect ownership and access
permissions. You should use install operations only when other
managed-install features, such as installation requirements, are
not adequate for the chore you need to perform as part of installing
a package.

Install operations allow you to configure the destination environment
before the payload is copied to the file system and to perform
additional processing afterward. Install operation executables must
be named according to the install operation you want to define. The
files can be binary files or text files containing shell scripts.
All install operations are optional.

You can use following arguments and environment variables which are
available to install operation executables.

 * `$1:` Full path to the installation package the Installer application is processing.
    For example: /Volumes/Users/Vikrams/Desktop/TestPkg.pkg
 * `$2:` Full path to the installation destination.
    For example: /Applications
 * `$3:` Installation volume (or mount point) to receive the payload.
    For example: /Volumes/Tools
 * `$4:` The root directory for the system: /
 * `$SCRIPT_NAME:` Filename of the operation executable.
    For example: preflight
 * `$PACKAGE_PATH:` Full path to the installation package.
    Same as $1.
 * `$INSTALLER_TEMP:` Scratch directory used by Installer to place
    its temporary work files. Install operations may use this area
    for their temporary work, too, but must not overwrite any
    Installer files. The Installer application erases this directory
    at the end of the install.
    For example: /private/tmp/.vikrams.pkg.234.install

Your script must return 0 on success and any other number to denote
failure. The name of the scripts must be “preinstall” and “postinstall”.
You can see some sample scripts below-

```
#!/bin/sh
#This is a sample preinstall or postinstall script.
#Your logic goes here.
if [ your_logic_returns_false ]
then
     exit -1
fi
exit 0
```

Lines starting with # are comments. First line `#!/bin/sh` is called
"Shebang" and denotes that it is a shell script. Any return value
other than 0 denotes failure. If you return anything other than 0,
your installation will stop with a failure message.

Scripting Quickies 

Let’s discuss about some common and some complex scenarios where a lot of people can get stuck:

*I have some resources which need to be accessible from the preinstall and postinstall scripts.*

In older style packages (bundles), since the path inside the package
was accessible, we kept the resources in the resources directory
and had access to them using `PACKAGE_PATH/Contents/Resources/` path.
In case of flat packages, the installer extracts the scripts directory
to some temporary directory while running. So, we can keep any
resource with the scripts while packaging and when the installer
is run, these resources will be present in the same directory from
where the scripts are run. In this way, we can access any resource
from preinstall and postinstall scripts.

*How can I perform installation requirements check?*

Bundle packages supported installation check using `InstallationCheck`
script. However, flat packages no longer support `InstallationCheck`
script. In flat packages, this installation check phase has moved
to the `Distribution` file. You can write Javascript functions and
assign them to be called during `installation-check` phase. Your
distribution file should contain `<installation-check
script=”your_function()” />` and if your function returns false,
the installation will not proceed.

*Can I perform installation requirements check for component packages?*

No, you must use a Distribution package if you intend to perform
InstallationCheck or VolumeCheck.

Apart from preinstall and postinstall scripts, a lot of functionality
goes in the Distribution script. I will cover all the aspects of a
typical Distribution file in the next post.

AirDrop
-------

`awdl` is the airdrop wireless interface.  It appears to be
dynamically created?

tool for disabling this?

https://github.com/mariociabarra/wifriedx

same thing for iOS

https://github.com/mariociabarra/wifried

You can enable or disable AirDrop with the following defaults commands.
Here’s how to turn AirDrop off:

```
defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES
```

Here’s how to turn AirDrop back on:

```
defaults write com.apple.NetworkBrowser DisableAirDrop -bool NO
```

You’ll need to logout and log back in to see the changes.

You can set your computer to receive files via Airdrop using the
following shell script:

```
#!/usr/bin/osascript
tell application "Finder"
    activate
    tell application "System Events" to keystroke "R" using {command down, shift down}
end tell
```

```
defaults read > /tmp/defaults
cd /Library/Preferences/
mv com.apple.Bluetooth.plist com.apple.Bluetooth.saved
netstat -nr | grep awd
ssh fe80::44d2:66ff:fe5f:6ea%awdl0
ping6 -I awdl0 ff02::1
dns-sd -B _airdrop._tcp
```

http://www.cultofmac.com/275081/better-security-macbook-turn-file-sharing-enable-airdrop-os-x-tips/
https://discussions.apple.com/thread/7252461?tstart=0
http://apple.stackexchange.com/questions/250855/airdrop-not-working-in-mac-osx-10-11-6-el-capitan-with-iphone-6s-ios-9-3-5
http://apple.stackexchange.com/q/212083/5472
http://apple.stackexchange.com/questions/212083/debug-airdrop-between-macbook-pro-and-iphone-6s-plus/212086#212086
https://itunes.apple.com/us/app/wifi-explorer/id494803304?mt=12

### Kismet for MAC

https://kismetwireless.net/
https://en.wikipedia.org/wiki/KisMAC
https://github.com/IGRSoft/KisMac2

 * http://recode.net/2014/10/16/os-x-yosemite-arrives-what-does-it-mean-for-older-macs/
 * https://medium.com/@mariociabarra/wifried-ios-8-wifi-performance-issues-3029a164ce94#.o4glg14bb

/System/Library/PrivateFrameworks/DeviceToDeviceManager.framework/PlugIns/awdl_d2d.bundle/Contents/MacOS/awdl_d2d

 * https://medium.com/@mariociabarra/wifriedx-in-depth-look-at-yosemite-wifi-and-awdl-airdrop-41a93eb22e48#.jxk39xc47

 * http://stackoverflow.com/questions/19587701/what-is-awdl-apple-wireless-direct-link-and-how-does-it-work
 * http://www.macobserver.com/tmo/article/os_x_lion_tweak_airdrop_to_work_on_ethernet/

 * http://stackoverflow.com/questions/10693411/implementing-the-airdrop-protocol
 * http://wifinetnews.com/archives/2011/02/apple_to_include_wi-fi_direct_in_next_os_release.html
 * https://istumbler.net/
 * http://osxdaily.com/2011/09/16/enable-airdrop-ethernet-and-unsupported-macs/


 * https://www.quora.com/Is-it-possible-to-sniff-an-AirDrop-connection
 * http://aircrack-ng.org/doku.php?id=airodump-ng
 * http://www.aircrack-ng.org/doku.php?id=aireplay-ng
 * http://www.aircrack-ng.org/
 * https://en.wikipedia.org/wiki/Aircrack-ng
 * https://www.corelan.be/index.php/2009/02/20/cheatsheet-cracking-wep-with-backtrack-4-and-aircrack-ng/
 * http://www.slideshare.net/nazrinzaidi/airodump-ng-aircrackng
 * http://www.pentesteracademy.com/course?id=18

Dictation
---------

Using OSX voice recognition to transcribe audio.  Depends mainly
on the SoundFlower kernel extension and Audacity.

 * <http://apple.stackexchange.com/questions/92613/use-mac-os-x-dictation-on-a-file>
 * <https://github.com/mattingalls/Soundflower>
 * <https://github.com/mattingalls/Soundflower/releases/tag/2.0b2>
 * <https://github.com/RogueAmoeba/Soundflower-Original>

### SoundFlower

https://github.com/mattingalls/Soundflower
https://github.com/RogueAmoeba/Soundflower-Original


Tools
-----

https://gpgtools.org/


Apps
----

http://mac.appstorm.net/roundups/video-roundups/50-essential-mac-apps-for-os-x-beginners/
http://fluidapp.com/
http://www.coconut-flavour.com/coconutbattery/

Perian is dead - look at this instead.
https://github.com/jbtule/niceplayer

### App Store Cmd line

 * [Mac App Store command line interface](https://github.com/mas-cli/mas)

launchd
-------

http://launchd.info/
https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html
https://en.wikipedia.org/wiki/Launchd

Hidden Files
------------

http://www.westwind.com/reference/OS-X/invisibles.html

### volfs

https://developer.apple.com/legacy/library/qa/qa2001/qa1113.html#//apple_ref/doc/uid/DTS10001661

NetInfo - Directory Services - Open Directory
---------------------------------------------

https://en.wikipedia.org/wiki/Apple_Open_Directory
https://en.wikipedia.org/wiki/NetInfo
https://en.wikipedia.org/wiki/Directory_Utility

 * dscl
 * ds...

https://developer.apple.com/library/mac/documentation/Networking/Conceptual/Open_Directory/Introduction/Introduction.html#//apple_ref/doc/uid/TP40000917

For more information about writing plug-ins for Open Directory, read:
Open Directory Plug-in Programming Guide

https://developer.apple.com/library/mac/documentation/Networking/Reference/Open_Directory_Ref/index.html#//apple_ref/doc/uid/TP40003532-DontLinkChapterID_1-DontLinkElementID_1
https://developer.apple.com/library/mac/documentation/Networking/Reference/Open_Directory_Ref/index.html#//apple_ref/doc/uid/TP40003532

List of documents:
https://developer.apple.com/library/mac/navigation/#section=Topics&topic=Networking%2C%20Internet%2C%20%26amp%3B%20Web

search: apple Open Directory Plug-in Programming Guide
https://developer.apple.com/library/mac/releasenotes/NetworkingInternetWeb/RN_OpenDirectory/chapters/chapter-1.xhtml.html#//apple_ref/doc/uid/TP40013398

http://www.computerworld.com/article/2544581/infrastructure-management/how-to--understanding-mac-os-x-open-directory.html

TaskGate
--------

Tried to run gdb on OSX - got error on taskgate

 * search: gdb won't run taskgate
 * http://stackoverflow.com/questions/8336433/gdb-on-macosx-lion

Code signing etc in this doc

 * <http://sourceware.org/gdb/wiki/BuildingOnDarwin>

Power Management
----------------

https://en.wikipedia.org/wiki/Pmset
http://osxdaily.com/2010/10/11/sleepimage-mac/
https://www.cnet.com/news/troubleshooting-sleep-in-os-x/

Log Parsing
-----------

http://pondini.org/OSX/Logs.html
https://www.cclgroupltd.com/parsing-apple-system-log-files-osx-ios/

XHyve
-----

See Virtualization.md

Filesystems
-----------

FUSE

 * https://github.com/fuse4x/fuse
 * https://github.com/osxfuse/fuse
 * [FUSE in Go](https://github.com/bazil/fuse)

Bluetooth
----------

```
+defaults write "$(find /Library/Preferences -iname 'bluetooth'|sed -Ene's/\.plist//p')" ControllerPowerState -int 0+
but feel free to use this one ;p :
*defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0*
```

```
sudo mv /System/Library/Extensions/IOBluetooth* /somedir
```

```
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 1

sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist
sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist
```

Filesystem Monitor
------------------

spy - A compact file system watcher for Mac OS X, Linux and Windows

 * https://hackage.haskell.org/package/spy
 * https://bitbucket.org/ssaasen/spy

### Suspicious Package

An Application for Inspecting OS X Installer Packages

Do you know what files that OS X Installer package actually installs?

Do you know what scripts it runs during installation, and what they do?

Do you know who the package really came from?

With Suspicious Package, you can answer these questions and more.
Maybe you're quite literally suspicious of a package you have downloaded.
Or perhaps you're just curious about what some package does. Or
maybe you want to find out after the fact exactly what files a
package scattered across your computer. Whatever the reason,
Suspicious Package allows you to see inside an installer package.
(And it's completely free.)

 * http://www.mothersruin.com/software/SuspiciousPackage/

Shared Libraries
----------------

http://stackoverflow.com/questions/21907504/how-to-compile-shared-lib-with-clang-on-osx
http://stackoverflow.com/questions/31988594/create-dynamic-library-from-cpp-files-and-static-library-with-clang

From - https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/CreatingDynamicLibraries.html

```
clang -dynamiclib \
    SortingAbsAlgorithm.cpp SortingTestCase.cpp SortingTestSetIterator.cpp \
    -stdlib=libc++ -current_version 1.0 -compatibility_version 1.0 \
    -fvisibility=hidden -L. -lAlgatorc -o libProject.dylib
```

Memory Devices
--------------

According to Accessing Kernel Memory on the x86 Version of Mac OS X, /dev/mem and /dev/kmem were removed when Apple released OS X for Intel processors.

The (excellent) article also explains how to reenable the memory devices, namely using the kmem=1 kernel boot argument.

To set it, open Terminal, type:

sudo nvram boot-args="kmem=1"
and reboot.

http://apple.stackexchange.com/questions/114319/how-to-access-dev-mem-in-osx#122672

Accessing Kernel Memory on the x86 Version of Mac OS X
http://www.osxbook.com/book/bonus/chapter8/kma/

Read and write physical memory on OS X
https://github.com/osresearch/rwmem

http://forensicswiki.org/wiki/Tools:Memory_Imaging
http://forensicswiki.org/wiki/Rekall

This is related page for Windows:
http://stackoverflow.com/questions/8403610/how-do-you-read-directly-from-physical-memory


```
tell application "QuickTime Player"
activate
start (new movie recording)
end tell
```

```
tell application "QuickTime Player"
    --activate
    new screen recording
    start document 1
    delay 5
    stop document 1
    save document 1 in file "/tmp/test.mov"
    quit
end tell
```

I'm using SOX and VLC for capture, crontab for scheduling, XLD to create m4a and MP4Box for multiplexing. It is quite flexible, but requires knowledge of Bash scripting (perhaps also Apple script) I found my inspiration in Diego Massanti's mkmp4 script.

core processes to launch:

rec -q -c $C -r 48000 -b 16 $AFILE trim 0 $HH:$MM:00 &

VLC -I dummy screen:// --screen-fps=25 --quiet --sout "#transcode{vcodec=h264,vb=3072}:standard{access=file,mux=mp4,dst=$FILE}" --run-time $TIME vlc://quit
Scheduling recording:

crontab -l
0       8       *       *       1-5     ~/capture.sh 3 0 recording-name 1
you can get an idea what the script is doing: record 3h capture, mono sound, every working day at 8AM

I did not find nor compile SOX enabled for MPEG audio streams, hence using FLAC to save some space; I'm using XLD to convert it to AAC-HE 16kbps, which is enough for voice.

Next step: multiplex audio and video to create mp4. If you don't mind to use GUI, then MPEG StreamClip (or QuickTime) serves also well.

MP4Box -add $1.m4a -sbr -add $1.m4v -fps $2.0 -inter 500 $1.mp4
I'm using this daily to create archive of GoToWebinar, but when next release of FFmpeg supports G2M4 codec, I won't bother anymore. Yes, there's also OSAscript to launch the webinar which also required getting rid of com.apple.quarantine flag to disable warning (Are you sure you want to open it?).

links:

http://blog.massanti.com/2008/09/26/mkmp4-automated-h264-aacplus-encoder-script-mac-linux/

You can use the software ffmpeg. To install it on a Mac, follow the instructions here. Then use the command:

$ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | grep 'geometry' | awk '{print $2;}') -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv
shareimprove

https://github.com/vorgos/QuickGrab
http://sox.sourceforge.net/
http://www.eca.cx/ecasound/

???
https://github.com/libretro/RetroArch

```
```

OS X users can use the avfoundation and qtkit input devices for grabbing integrated iSight cameras as well as cameras connected via USB or FireWire:

AVFoundation is available on Mac OS X 10.7 (Lion) and later. Since then, Apple recommends AVFoundation for stream grabbing on OS X and iOS devices.
QTKit is available on Mac OS X 10.4 (Tiger) and later. QTKit has been marked deprecated since OS X 10.7 (Lion) and may not be available on future releases.
AVFoundation

To list the supported, connected capture devices:

ffmpeg -f avfoundation -list_devices true -i ""
To use the default device which is usually the first device in the listing the user can either use an empty name string or default:

ffmpeg -f avfoundation -i "" out.mpg
or

ffmpeg -f avfoundation -i "default" out.mpg
To use one of these devices for capturing the user has to specify either the name of the device or the index shown in the device listing. Abbreviations using just the beginning of the device name are possible. Thus, to capture from a device named Integrated iSight-camera:

ffmpeg -f avfoundation -i "Integrated" out.mpg
To use the device's index provide the index either as the input or use the -video_device_index option that will override any given input name:

ffmpeg -f avfoundation -i "2" out.mpg
and

ffmpeg -f avfoundation -video_device_index 2 -i "default" out.mpg
will use the device with the index 2 ignoring the default device in the second case.

QTKit

To list the supported, connected capture devices:

ffmpeg -f qtkit -list_devices true -i ""
To use the default device which is usually the first device in the listing the user can either use an empty name string or default:

ffmpeg -f qtkit -i "" out.mpg
or

ffmpeg -f qtkit -i "default" out.mpg
To use one of these devices for capturing the user has to specify either the name of the device or the index shown in the device listing. Abbreviations using just the beginning of the device name are possible. Thus, to capture from a device named Integrated iSight-camera:

ffmpeg -f qtkit -i "Integrated" out.mpg
To use the device's index provide the index either as the input or use the -video_device_index option that will override any given input name:

ffmpeg -f qtkit -i "2" out.mpg
and

ffmpeg -f qtkit -video_device_index 2 -i "default" out.mpg
will use the device with the index 2 ignoring the default device in the second case.


https://trac.ffmpeg.org/wiki/Capture/Webcam#Adjustingcamerafunctions

http://techslaves.org/isight-disabler/

https://github.com/rthomson/isight-disabler


Global,
 
I do this by issuing the following command as root when I want it to be 'unplugged' and unavailable:
 
chmod -R 000 /System/Library/Frameworks/CoreMediaIO.framework/Resources/VDC.plugin/Contents/ Resources/VDCAssistant
 
I issue this command when I want to turn it on:
chmod -R 000 /System/Library/Frameworks/CoreMediaIO.framework/Resources/VDC.plugin/Contents/ Resources/VDCAssistant
 
Or...copy and paste the below script into a document and save it.
From a terminal, type chmod 755 [Document Name].
type: bash [Document Name]
It will ask you for the sysadmin [password to make these changes.
 
Run it once, it kills any cams and disables the device (shows as unplugged) and says so to you. Run it again, it plugs it back in.
 
In the interest of full disclosure it is possible for something else to do the same thing (as root), it's just less likely since your addressing it at the file system layer instead of up at the application layer. This is slightly less secure than physically disconnecting it.
 
#!/bin/bash
#               WRITTEN BY MJVona        
#               PURPOSE:
#
#               TO 'UNPLUG' THE iSITE CAMERA ON A MAC
#               FROM THE FILE SYSTEM
#               IT WILL ASK YOU FOR THE ROOT PASSWORD
#               USE:
#               type bash disable_camera.sh, the camera will be disabled.
#               type it again, the camera is enabled.
#
#########################April 2/2014#########################
 
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
#This script written by Matthew Vona
#Disables and re-enables the apple I-Sight Camera.
state=`stat /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDeco derXPCService.xpc | awk '{ print $3}'`
exec=`grep -o "x" <<<"$state" | wc -l `
#echo "my state is $state"
if [ "$exec" -gt 0 ]; then
        {
                unset -v enabled
        }
                else
        {
                enabled="1"
        }
fi
#.
VDC_PATH="/System/Library/PrivateFrameworks/CoreMediaIOServicesPrivate.framework /Versions/A/Resources/AVC.plugin"
QT_PATH="/System/Library/QuickTime/QuickTimeUSBVDCDigitizer.component"
if [ -z $enabled ]; then
{
        chmod -R 444 $VDC_PATH
        chmod -R 444 $QT_PATH
        chmod -R 444 /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDeco derXPCService.xpc
        chmod -R 000 /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDeco derXPCService.xpc
        user_prc=`ps -ef | grep VDCAssistant | grep -v grep | awk '{print $2}'`
        kill -9 $user_prc
        chmod -R 000 /System/Library/Frameworks/CoreMediaIO.framework/Resources/VDC.plugin/Contents/ Resources/VDCAssistant
        say "camera has been disabled"
}
else
{
        chmod -R 755 $VDC_PATH
        chmod -R 755 $QT_PATH
        chmod -R 755 /System/Library/Frameworks/VideoToolbox.framework/Versions/A/XPCServices/VTDeco derXPCService.xpc
        chmod -R 755 /System/Library/Frameworks/CoreMediaIO.framework/Resources/VDC.plugin/Contents/ Resources/VDCAssistant
        say "Camera has been enabled"
}
fi

http://en.wikipedia.org/wiki/Robbins_v._Lower_Merion_School_District

http://apple.stackexchange.com/questions/18160/how-do-i-take-a-steathy-picture-with-my-isight-camera-from-the-command-line
http://iharder.sourceforge.net/current/macosx/imagesnap/
https://www.preyproject.com/
https://www.preyproject.com/download
https://github.com/prey

Use imagesnap. It can be installed with brew install imagesnap or by downloading the binary from the website.

One use for it is to take series of snapshots:

while :; do
    imagesnap ~/Desktop/$(date +%y%m%d%H%M%S).png
        sleep ${1-1}
        done
        It doesn't crop images horizontally either. (Photo Booth changes the aspect ratio to 3:2.)



sudo Dialog
-----------

The following AppleScript will run `/bin/ls -la` with root privileges
by prompting the user in a standard Authorization Services dialog:

```
do shell script "/bin/ls -la" with administrator privileges
```


(Note: you do not need to use sudo in there anywhere, that's handled
for you automatically; simply list the process you want to run and
the options).

If you knew the user's password prior to running this command, you
could do the following:

```
do shell script "/bin/ls -la" with administrator privileges password "myPlainTextPassword"
```

Note that this isn't as secure as letting `AuthorizationServices`
handle the password prompt.

You may want to play around in Script Editor (`/Applications/AppleScript/`)
until you get the command syntax down right. Then, you can use the
`osascript -e` shell command to execute the script from your widget.

For example, the following shell command would have basically the
same effect as executing the above-mentioned AppleScript:

```
osascript -e "do shell script "/bin/ls -la" with administrator privileges"
```

XPC
----

https://github.com/sandeepmistry/node-xpc-connection
https://qnalist.com/questions/5535586/c-binding-for-xpc-on-os-x

 * https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingXPCServices.html
 * https://github.com/brenwell/EvenBetterAuthorizationSample
 * https://gist.github.com/xiao99xiao/0509091001bdd6259249
 * https://github.com/atnan/SMJobBlessXPC
 * http://stackoverflow.com/questions/21623565/how-to-send-a-message-from-xpc-helper-app-to-main-application

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
