
[Instructions]( https://rebit02.atlassian.net/wiki/display/ENG/Build+System+Instructions )
are at the Rebit Confluence site.
This page said to install the
[Wix]( http://wixtoolset.org/ )
[3.5 version]( http://wix.codeplex.com/releases/view/60102 )
from the WiX
[releases]( http://wixtoolset.org/releases/ )
specifically.

> Side note
> [article]( http://www.infoq.com/news/2011/04/WiX-35 )
> on using WiX.

After loading all the components, the Rebit tools VHD needed to be connected.
The description on the page was to use `imdisk` - but since I am using
VirtualBox I can just attach the VHD.
the VHD needs to be present as drive `T:` - so Windows disk manager is used
to force the actual drive to use that drive letter.
This
[article]( http://windows.microsoft.com/en-us/windows/change-add-remove-drive-letter#1TC=windows-7 )
describes how to force drive letter assignment.

Could load argparse

```
(Invoke-WebRequest https://bootstrap.pypa.io/ez_setup.py).Content | python -
C:\Python31\Scripts\easy_install.exe argparse
```

Then ran into TAB and spaces in build.py

then ran into `print "xxx"` syntax error - no spaces allowed

Using the above recommendations, building the entire suite (release & debug for 32/64bit) would look like this:

```
%SRCDIR%\build.py -b %BUILDS%\rebit5 -p rebit5
```

To build just the release binaries use the -r command option:

```
%SRCDIR%\build.py -r -b %BUILDS%\rebit5 -p rebit5
```

To build just the debug binaries use the -d command option:

```
%SRCDIR%\build.py -d -b %BUILDS%\rebit5 -p rebit5
```

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
