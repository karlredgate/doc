
> quote: Small deeds done are better than great deeds planned

> “The best performance improvement is the transition from the nonworking state to the working state.” Ousterhout

powershell profiles are at

```
C:\Users\kenmyer\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

Where is cmdlet stored?

```
$ (Get-Command Command-Name).dll
C:\Windows\assembly\GAC_MSIL\System.Management.Automation\1.0.0.0__XXXXX\System.Management.Automation.dll
```

## Functions

Function names take a `Verb-Noun` form.
There are standardized names that PowerShell recognizes as Verbs
and these cause additional semantic understanding.

> Is this only for users of the functions?
> I think there is some additional knowledge by powershell and windows also.

## Modules

## Module install

```
C> \Windows\System32\WindowsPowerShell\v1.0\Modules\
```

## Cmdlets

Cmdlets are installed in a subdirectory of the Windows modules folder.

> Is this correct??? This is in my notes - but I think
> this is for modules, not for cmdlets.

```
C> \Windows\System32\WindowsPowerShell\v1.0\Modules\
```

## AWS

An EC2 instance can be created with a `cloud-init` script that contains
PowerShell commands to be executed at the first boot after the VM is installed.
It is run by the ??? service, which is installed in all AWS supplied Windows
AMI images.
This service can also be installed in an imported Windows image.

> Must describe how to install service in imported image
> * also add this to a user story in pivotal tracker

The `cloud-init` script is a special name for data present in the
`user-data` area for an EC2 instance that is in a set of specific formats.
The `cloud-init` data can be a PowerShell script wrapped in XML.

```
<powershell>
...
<powershell>
<persist>true</persis>
```

----

## Recipes

The following are snippets I have found on the net.
They need to be explained and organized with the other examples.

```
$ sc queryex type= service state= all
$ Get-Service | Where-Object {$_.displayName.StartsWith("NATION-")} | Select name
$ Get-Service | Where-Object {$_.displayName.StartsWith("NATION-")} | Stop-Service
$ Get-Service | Where-Object {$_.displayName.StartsWith("NATION-")} | Start-Service
$ Get-Service | Where-Object {$_.displayName.StartsWith("NATION-")} | Restart-Service
```

This is supposed to eject a USB - not sure what it is doing yet.

```
$driveEject = New-Object -comObject Shell.Application
$driveEject.Namespace(17).ParseName("E:").InvokeVerb("Eject")
```

------
# Ignore the rest of this for now
<!-- ======================================================
     ======================================================
     The following are notes extracted from my journal and
     and need to be organized.  In the meantime, just ignore them.
     ======================================================
     ====================================================== -->

trying to "New-VM" getting message that it "is not recognized as the name of a cmdlet"
 * evidently this is not enabled by default when installing core description of what I need to do is
   <http://technet.microsoft.com/en-us/magazine/jj933287.aspx>
 * need to run this in powershell
  PS> Enable-WindowsOptionalFeature –Online –FeatureName Microsoft-Hyper-V
 * and then reboot
 * does not seem to enable it -- the new-vm command did not show up and it does not show in the list of available modules
  PS> Get-Module -ListAvailable
 * there is also a suggestion to use DISM (Deployment Image Servicing and Mgmt)
  (http://msdn.microsoft.com/en-us/library/jj980032(v=winembedded.81).aspx)
  $ DISM /Online /Enable-Feature /FeatureName:Microsoft-Hyper-V /All
 * excuting this claimed success - still no joy
 * seems to require data execution prevention (DEP) - check in powershell
  <http://social.technet.microsoft.com/Forums/en-US/c1bc889f-78d5-4425-a40d-72ed328d21c4/script-to-show-data-execution-prevention-setting?forum=ITCG>
  PS> gwmi Win32_OperatingSystem | fl DataExecutionPrevention*
  PS> Get-WmiObject Win32_OperatingSystem | fl DataExecutionPrevention*
 * I ran this:
  PS> gwmi Win32_OperatingSystem | fl DataExecution*
  DataExecutionPrevention_32BitApplications     : True
  DataExecutionPrevention_Available             : True
  DataExecutionPrevention_Drivers               : True
  DataExecutionPrevention_SupportPolicy         : 3
 * So I think it is ok -- so WHY is it not working?
 * This is a better description of DEP and its impact from MS
  <http://technet.microsoft.com/en-us/library/cc738483(v=ws.10).aspx>
 * all junk -- this appears to work:
      PS> Import-Module ServerManager   --- didn't really need to do this one
  *** PS> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
 * now I can do:
  PS> Import-Module Hyper-V
  PS> Get-Command -Module Hyper-V
 * solution came from <http://kickthatcomputer.wordpress.com/2013/04/02/hyper-v-powershell-command-are-missing/>
   which also references <http://blogs.msdn.com/b/robertvi/archive/2012/11/28/hyper-v-powershell-module-not-installed-during-bare-metal-deployment.aspx>
 * check to see if it is installed:
   PS> Get-WindowsFeature  -- lists all features with [x] for enabled
   [x] Hyper-V         Hyper-V
   [ ] Hyper-V Tools   Hyper-V-Tools
Create a VM using:
  PS> New-VM -Name moya -Path C:\moya -MemoryStartupBytes 2GB
  PS> New-VHD -Path C:\moya\boot.vhdx -SizeBytes 10GB -Dynamic
  PS> Add-VMHardDiskDrive -VMName moya -Path C:\moya\boot.vhdx
  PS> Set-VMDvdDrive -VMName moya -ControllerNumber 1 -Path C:\ISO\win7.iso
  PS> Start-VM -Name moya
  ## After you can do these
  PS> Stop-VM -Name moya
  PS> Get-VM moya

try to get to console of moya
 * some stuff says to use vmconnect.exe
 * not present on hyper-v server or 2012 server core
 * Get-VM moya | Select-Object Id      --- returns a uuid
 * supposedly I can use freerdp to connect
   * turns out I have freerdp package installed on wilhelm
   * also grabbed freerdp for windows installer
   * freerdp implements some extensions that M$ uses
 * also seems a problem is remote desktop seems disabled
  PS> Set-VMHost -EnableEnhancedSessionMode $true -Passthru
 * xfreerdp not working - try windows version -- copy wfreerdp to server
  $ wfreerdp.exe /cert-ignore -nego /pcb:UUID /t:2179 /v:10.191.7.84
 * this doesn't work either -- perhaps wrong version -- got another from
  <http://vmconnect.codeplex.com/releases/view/108284>
   which also has powershell script to emulate vmconnect -- but didn't work


try to connect to VM console again with wfreerdp - failed
get source to xfreerdp and build on wilhelm - test command:
  $ ./client/X11/xfreerdp /cert-ignore
                          -nego
                          /u:Administrator
                          /vmconnect:e65c7a86-f885-4152-a941-a81bb7a345b2
                          /v:10.80.250.1:2179
tried those same args with wfreerdp and it worked


the remctl tool also drew me to the invirt tool for VM management at SIPB
  <https://launchpad.net/invirt>
  <http://invirt.mit.edu/cluedump.pdf>


look for xslt on windows command line - use powershell
    param ($xml, $xsl, $output)
    if (-not $xml -or -not $xsl -or -not $output) {
        Write-Host "& .\xslt.ps1 [-xml] xml-input [-xsl] xsl-input [-output] transform-output"
        exit;
    }
    trap [Exception] { Write-Host $_.Exception; }
    $xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
    $xslt.Load($xsl);
    $xslt.Transform($xml, $output);
    Write-Host "generated" $output;
powershell profiles are at C:\Users\kenmyer\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1


 * PowerShell CmdLet notes
  [Writing CMDLETs in PowerShell]( http://rkeithhill.wordpress.com/2006/07/24/writing-cmdlets-in-powershell/ )
  ( http://stackoverflow.com/questions/1344519/how-do-i-add-a-powershell-cmdlet-or-function-to-my-machine-so-that-it-is-always )
  [The Windows PowerShell Profile]( http://technet.microsoft.com/library/ee692764.aspx )
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2012/10/01/build-your-own-powershell-cmdlet-part-3-of-9.aspx )
  ( http://www.hanselman.com/blog/XSLTWithPowershell.aspx )


 * check the Get-VMSwitch command


  [extend windows powershell with custom commands]( http://msdn.microsoft.com/en-us/magazine/cc163293.aspx )
  ( http://powershell.org/wp/forums/topic/executing-powershell-scripts-from-linux-servers/ )
  ( http://www.howtogeek.com/117192/how-to-run-powershell-commands-on-remote-computers/ )
  ( http://www.dell.com/downloads/global/power/ps1q10-20090457-Zhang.pdf )
  ( http://clintboessen.blogspot.com/2010/01/what-is-winrm.html )
  [WS Mgmt 1.1 download]( http://www.microsoft.com/en-us/download/details.aspx?id=21900 )
  [Google Search](  linux execute remote powershell )
  [Google Search](  WS-Management access to powershell remote  )
  [Google Search](  WinRM service  )


 * client certs are what I want - but how do I generate them on linux?
  ( http://powershell.org/wp/forums/topic/winrm-with-non-domain-joined-machine-using-certs/ )
  ( http://blogs.msdn.com/b/wmi/archive/2009/03/23/how-to-use-wsman-config-provider-for-certificate-authentication.aspx )
 * description so far has been how to click a bunch of dialogs on windows
 * found some other related info on powershell scripting and remote access
  ( http://powershell.org/wp/ebooks )
  ( http://1drv.ms/1eaLKiu )
 * which becomes:
  ( https://onedrive.live.com/?cid=7F868AA697B937FE&id=7F868AA697B937FE%21107 )


remember where powershell cmdlets are stored
  C> \Windows\System32\WindowsPowerShell\v1.0\
 * modules are in %PSModulePath%
  C> \Windows\System32\WindowsPowerShell\v1.0\Modules\
 * for example
  C> \Windows\System32\WindowsPowerShell\v1.0\Modules\PSDiagnostics\


looks like the xml is simple
  <powershell>
  ...
  <powershell>
  <persist>true</persis>
 * search for winrm - several places - but at least in 8/5/2014
  PS> Enable-PSRemoting -force
  PS> winrm s winrm/config/client '@{TrustedHosts="orchetration-hostname"}'
 * also check config info at 2/26/2014 starting at this line:
  $ Enable-NetFirewallRule -DisplayName "Remote Management"


also enabled remote powershell on instance using
```
PS> Enable-PSRemoting -force
PS> winrm s winrm/config/client '@{TrustedHosts="orchetration-hostname"}'
$ cd /etc/yum.repos.d/
$ wget http://download.opensuse.org/repositories/Openwsman/RedHat_RHEL-6/Openwsman.repo
$ yum install openwsman
$ yum install wsmancli
```
 * this is broken - see Tuesday 2/11/2014 - the rpm does not work - had to rebuild from scratch
 * so this is going to be us creating an rpm and installing it in a yum repo for the orchestration VM

**2/11 notes**

browse for info on wsman on AMT
 * supports DSP026, DSP027, DSP030, and some DASH
 * wsmancli rpm has problems
   $ wsman identify -h 10.80.0.101 -P 16992 -u admin -p 'XanBoo2!'
   Connection failed. response code = 0
   $ strace -s 9000 wsman identify -h 10.80.0.101 -P 16992 -u admin -p 'kidsbang' 2> /tmp/wsman.log
   # shows that there is no network connection
 * google search yields:
   https://bugzilla.redhat.com/show_bug.cgi?id=1052397
   - which says that the library in fedora is out of date and local build will fix
```
   $ git clone git@github.com:Openwsman/openwsman.git
   # instructions say: ( mkdir build ; cd build ; cmake .. ; make )
   # cmake errors because it needs the following
   $ yum install -y libcurl-devel
   $ yum install -y swig
   $ yum install -y pam-devel
   # additional cmake error about: SFCC_LIBRARIES linked by target "wsman_cim_plugin"
   # seems to mean sblim-sfcc - which is: Small Footprint CIM Client Library Runtime Libraries
   $ yum install -y sblib-sfcc sblib-sfcc-devel
   # compile errors about PAM_* here - turns out cmake does not handle incremental
   # runs - once all these were installed - the build directory had to be cleaned
   # and regenerated
```
 * then build new wsmancli
   $ git clone git@github.com:Openwsman/wsmancli
   $ ./bootstrap   # errors
   $ ./configure   # errors - needs env vars for wsman library
   # looks like it wants pkg-config
   $ less  /usr/local/lib/pkgconfig/wimlib.pc
   $ pkg-config --libs wsman
   Perhaps you should add the directory containing `wsman.pc'
   to the `PKG_CONFIG_PATH` environment variable
   # actually I wanted openwsman - looks like it is not installed
   # Check the openwsman src/build tree ...
```bash
$ cp build/openwsman.pc /usr/local/lib/pkgconfig/
$ PKG_CONFIG_PATH=/usr/local/lib/pkgconfig pkg-config --libs openwsman
#  Works!!
# back in wsmancli
$ PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure
$ make
$ make install
$ /usr/local/bin/wsman identify -h 10.80.0.101 -P 16992 -u admin -p 'XanBoo2!'
# cannot load libraries
$ LD_LIBRARY_PATH=/usr/local/lib64/ /usr/local/bin/wsman identify -h 10.80.0.101 -P 16992 -u admin -p 'XanBoo2!'
```
   # WIN!!

found a Ubuntu bug page that describes AMT/WSMan power usage:
 - https://bugs.launchpad.net/ubuntu/+bug/1068766
 * the following works for powering off:
   $ LD_LIBRARY_PATH=/usr/local/lib64/ /usr/local/bin/wsman
   \    -h 10.80.0.101 -P 16992 -u admin -p 'XanBoo2!'
   \    invoke -a RequestPowerStateChange
   \    -J ~/Downloads/wsman-amt-request.xml
   \    http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2/CIM_PowerManagementService?SystemCreationClassName="CIM_ComputerSystem",SystemName="Intel(r) AMT",CreationClassName="CIM_PowerManagementService",Name="Intel(r) AMT Power Management Service"



check powershell scripts on USB stick - some utf16 - fix
  $ iconv -f UTF-16LE -t UTF-8 vmconnect.ps1 > vmconnect-utf8.ps1
  $ iconv -f UTF-16BE -t UTF-8 InsertISO.ps1 > InsertISO-utf8.ps1


where does powershell listen
 * looks like it used to be port 80 and 443 but now
  ( http://blogs.msdn.com/b/wmi/archive/2009/07/22/new-default-ports-for-ws-management-and-powershell-remoting.aspx )
 * it is 5985 (http) and 5986 (https)
want to see what port is listening for powershell on the VM - search google
  ( http://stackoverflow.com/questions/48198/how-can-you-find-out-which-process-is-listening-on-a-port-on-windows )
  [TCPView]( http://technet.microsoft.com/en-us/sysinternals/bb897437.aspx )
  C> netstat -a -b -n
 * or
  C> netstat -aon | find /i "listening"
add port 5985 and 5986 to DRaaS security group to allow access to windows PowerShell remote
 * test connection from within EC2 - not working - just hanging
  $ telnet ec2-54-191-144-84.us-west-2.compute.amazonaws.com 5985
  Trying 172.31.5.64...
the web page says the listening port can also be found using
  c> winrm e winrm/config/listener


save links for wsman from yesterday
  ( http://sourceforge.net/projects/openwsman/files/wsmancli/ )
  ( https://github.com/Openwsman )
  ( https://github.com/Openwsman/openwsman )
  ( https://github.com/Openwsman/wsmancli )
  ( http://openwsman.github.io/ )
  ( http://stackoverflow.com/questions/18230913/winrm-scripting-from-linux )
  ( http://blogs.msdn.com/b/wmi/archive/2009/07/22/new-default-ports-for-ws-management-and-powershell-remoting.aspx )
  ( http://en.community.dell.com/techcenter/systems-management/w/wiki/4375.wsman-windows-linux-command-conversion.aspx )


check on hyper-v server
 * look for vms - search for page how to list them from powershell
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2013/05/10/get-a-list-of-virtual-machines-by-using-powershell.aspx )
  [Get-VM]( http://technet.microsoft.com/en-us/library/hh848479.aspx )
  PS> Get-VM
 * how to connect to console - suggests vmconnect - not sure if this is one I created or came with windows
  ( http://powertoe.wordpress.com/2012/03/13/powerbits-8-opening-a-hyper-v-console-from-powershell/ )
  PS> vmconnect.ps1 localhost moya   ## didn't work
  PS> vmconnect.bat localhost moya   ## also didn't work
 * both are pointing at wfreerdp.exe -- which I believe I downloaded or built
 * refer back to notes on wfreerfp on - Thursday 2/27/2014
   * last command line in those notes worked on moya vm - administrator/E..D..2!
   * then had to login to vm console as barconite/barconite
 * try to fix screen resolution from powershell
  PS> Set-DisplayResolution -Width 1280 -Height 1024
 * that last required that I type "Y" after setting, in another window (add -Force to avoid)
  ( http://stackoverflow.com/questions/7967699/get-screen-resolution-using-wmi-powershell-in-windows-7 )
 * WMI stuff will be useful
  ( http://www.computerperformance.co.uk/powershell/powershell_wmi.htm )
  PS> Get-WmiObject Win32_ComputerSystem    # print computer info
  PS> Get-WmiObject -List                   # lists all objs and methods (abbreviated)
  PS> Get-WmiObject -?                      # lists all arguments
 * This link had a bunch of useful VM management commands
  ( http://windowsitpro.com/hyper-v/manage-hyperv-powershell )
 * another article about vm creation powershell+autounattend
  ( http://3sharp.com/blog/creating-windows-server-2012-hyper-v-vms-with-unattend-xml/ )
 * is this hyper-v library useful?   ( http://pshyperv.codeplex.com/ )
 * downloaded a couple zips - need to move to green USB
 * extract the zips and reformat some of the ps1 scripts
 * then look for more info on PowerShell - found I had downloaded some books earlier - put on tablet
 * kind of small - look for epub generation from docx - sigil?
  $ yum install sigil
 * sigil required xerces and FlightCrew - FlightCrew is a C++, cross-platform, native code epub validator.
 * and it didn't work - try write2epub plugin - it worked
 * check the download - it uses StarBasic ( http://en.wikipedia.org/wiki/OpenOffice_Basic )
 * try regenerating the zip of the epub - easy - just modify the html/css/... and reload



look for more info on ps remoting
  ( http://gallery.technet.microsoft.com/scriptcenter/Enable-PSRemoting-Remotely-6cedfcb0 )
  ( http://jasonspowershellblog.wordpress.com/2013/06/02/enable-psremoting-remotely/ )
testing ps remote setup
  PS> Stop-VM moya
  PS> Start-VM moya
  PS> xfreerdp /cert-ignore -nego
               /u:Administrator
               /vmconnect:e65c7a86-f885-4152-a941-a81bb7a345b2
               /v:10.80.250.1:2179



attempting remote from W7 VM on desktop to EC2:
  PS> Invoke-Command -ComputerName ec2-54-191-144-84.us-west-2.compute.amazonaws.com
                     -scriptBlock  { Get-WmiObject Win32_ComputerSystem }
 * results in:
  [ec2-54-191-144-84.us-west-2.compute.amazonaws.com] Connecting to remote server
   failed with the following error message : The WinRM client cannot process the
  request. If the authentication scheme is different from Kerberos, or if the cli
  ent computer is not joined to a domain, then HTTPS transport must be used or th
  e destination machine must be added to the TrustedHosts configuration setting.
  Use winrm.cmd to configure TrustedHosts. Note that computers in the TrustedHost
  s list might not be authenticated. You can get more information about that by r
  unning the following command: winrm help config. For more information, see the
  about_Remote_Troubleshooting Help topic.
      + CategoryInfo          : OpenError: (:) [], PSRemotingTransportException
      + FullyQualifiedErrorId : PSSessionStateBroken


Attempt some powershell commands
 * powershell interactive does not accept { blocks } with intervening newlines
 * but does within scripts
 * and must use .\foo.ps1 to execute them
   Get-WmiObject Win32_NetworkAdapter | foreach {
       $index = $_.index
       Get-WmiObject Win32_NetworkAdapterConfiguration -filter "Index=$index"
   }
 * command to get a list of all wmi objects
  PS> Get-WMIObject -List | Where { $_.name -match "^Win32_" } | Sort Name | Format-Table Name
 * To list all available classes in WMI  you will need to run elevated and execute this command.
  PS> Get-WmiObject -list * -NameSpace root -Recurse -EA 0
 * The class 'META" Boolean helps to determine if a class is useable along with other class qualifiers
  ( http://msdn.microsoft.com/en-us/library/aa394571(v=vs.85).aspx )
looking for the powershell "profile"
  PS> $profile
  C:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
 * could not find that directory under Documents - see if there is a hidden file/dir
 * not found at all - but I did find <JUNCTION> - what the hell is that
  ( http://en.wikipedia.org/wiki/NTFS_junction_point )
  [Hard Links and Junctions]( http://msdn.microsoft.com/en-us/library/windows/desktop/aa365006(v=vs.85).aspx )
  [Creating Symbolic Links]( http://msdn.microsoft.com/en-us/library/windows/desktop/aa363878(v=vs.85).aspx )
 * Junctions are implemented through reparse points
  [Reparse Points]( http://msdn.microsoft.com/en-us/library/windows/desktop/aa365503(v=vs.85).aspx )
  ( http://en.wikipedia.org/wiki/NTFS_reparse_point )
  [Junction tool]( http://technet.microsoft.com/en-us/sysinternals/bb896768.aspx )
 * wikipedia page suggests tools: linkd (missing), junction (missing), fsutil, and mklink
 * there is also some method with reparse points to track movement of files ???
  [Distributed Link Tracking Client]( http://technet.microsoft.com/en-us/library/cc736811(WS.10).aspx )
 * The Stuxnet as part of its series of Win32 exploits does use NTFS junction points as part of its overall mode of operation
 * found hidden files use "/a" to dir command -- add "/h" for only hidden files
  C> dir/a
  ( http://blogs.msdn.com/b/powershell/archive/2014/01/03/using-event-logs-to-diagnose-errors-in-desired-state-configuration.aspx )
  ( http://michaelwasham.com/2011/09/16/getting-started-with-windows-azure-powershell-cmdlets-2-0-for-diagnostics/ )
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2011/01/24/use-powershell-cmdlet-to-filter-event-log-for-easy-parsing.aspx )
 * test profile setup - create dir and file - add Write-Output "hello"
  PS> Write-Host -backgroundcolor yellow -foregroundcolor red "warning"
powershell functions
  PS> function name { param ($foo) Write-Output $foo }
 * to change the scope of the function prefix with a scope name
  PS> function global:foo { Write-Output "what would be global?" }
 * extended functions act like cmdlets (are cmdlets?)
  PS> function ext {
          param ($first, $second)
          Begin   { Write-Output "The begin block is optional" }
          Process { Write-Output "The process block is required" $first $second }
          End     { Write-Output "The end block is optional" }
      }
 * no clear description of what makes a "filter" different
  PS> filter foo { ... }



where are powershell modules stored
 * check %PSModulePath%
  C> echo %PSModulePath%
  C:\Users\Administrator\Documents\WindowsPowerShell\Modules;
  C:\Program Files\WindowsPowerShell\Modules;
  C:\Windows\system32\WindowsPowerShell\v1.0\Modules
 * copy modules from my VM to upload ro review
  C> cd \Windows\System32\WindowsPowerShell
  C> xcopy v1.0 \\wilhelm\upload\ /s /e /H /y
  C> cd %HOMEPATH%
read some of the modules - see add-type @" big pile of C# shit "@
 * look for what the hell this is
  [Add-Type]( http://technet.microsoft.com/en-us/library/hh849914.aspx )
  ( http://www.madwithpowershell.com/2013/10/add-type-vs-reflectionassembly-in.html )
 * skype ben with ousterhout joke


powershell dynamically scopes: global > script/local > private
 * private is private to the current scope and not nested
 * also noticed in the examples  &{ do-something }
 * use of script blocks is:
  PS> invoke-command -scriptblock  { get-process }
 * You can run a script block that is assigned to a variable by using the call operator (&),
   as shown in the following example:
  PS> $a = {param ($uu = "Parameter"); "$uu assigned."}
  PS> &$a
  Parameter assigned.
 * For more information about the call operator, see `about_Operators`
 * you will see scripts with: $script:varname = "ssomething"
powershell parameters within a function, can have attributes
  PS> function foo { param ( [attr1][attr2]$var ) }
 * attributes include type (int,long,string,...)
 * ValidateSet("a","b","c")
 * Parameter(Mandatory=$true,Position=0)
 * Switch (???)



more powershell - traps
  PS> function bar { trap { "error <$_>" } ; badStringCommand }
  [about_Trap]( http://technet.microsoft.com/en-us/library/hh847742.aspx )
  ( http://windowsitpro.com/scripting/error-trapping-and-handling-powershell )
  ( http://powershell.org/wp/2013/06/11/powershell-great-debate-error-trapping/ )
powershell function attribute - CmdletBinding()
  [about_Functions_CmdletBindingAttribute]( http://technet.microsoft.com/en-us/library/hh847872.aspx )
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2012/07/07/weekend-scripter-cmdletbinding-attribute-simplifies-powershell-functions.aspx )
  PS> function foo { [CmdletBinding()] param ($a) }
  ( http://windowsitpro.com/blog/my-12-powershell-best-practices )
  [The Many Ways to a Custom Object]( http://technet.microsoft.com/en-us/magazine/hh750381.aspx )
 * not sure what this is ( http://windowsitpro.com/powershell/powershell-basics-custom-objects )
 * XML in powershell ( http://michlstechblog.info/blog/powershell-some-basic-xml-handling-with-powershell-and-net/ )
 * interesting powershell notes in here too - "here strings"
  ( http://www.altaro.com/hyper-v/creating-generation-2-disk-powershell/ )
  PS> $path = "D:\VHD\Gen2Demo.vhdx"
  PS> $disk = New-VHD -Path $path -Dynamic -SizeBytes 25GB
  PS> @"
  select disk $disknumber
  select partition $partitionNumber
  gpt attributes=0x8000000000000001
  exit
  "@ | diskpart
WinRM links -- need to read                                                             <== TODO
  ( http://blogs.technet.com/b/jonjor/archive/2009/01/09/winrm-windows-remote-management-troubleshooting.aspx )
 * 1 pager  [Windows Remote Management Architecture]( http://msdn.microsoft.com/en-us/library/aa384464(v=vs.85).aspx )
  ( http://en.wikipedia.org/wiki/WS-Management )
  ( https://www.myotherpcisacloud.com/post/2012/01/26/Monitoring-with-Windows-Remote-Management-(WinRM)-and-Powershell-Part-I.aspx )
  ( https://community.rapid7.com/community/metasploit/blog/2012/11/08/abusing-windows-remote-management-winrm-with-metasploit )
  ( http://blog.hernanjlarrea.com.ar/index.php/introducing-windows-remote-shell/ )
 * see a comment to use:
  PS> winrm quickconfig -transport:HTTPS   # but it errors
    winrm.cmd : WSManFault
    At line:1 char:6
    + winrm <<<<  quickconfig -transport:HTTPS 2> \\wilhelm\upload\winrm.log
        + CategoryInfo          : NotSpecified: (WSManFault:String) [], RemoteExce
       ption
        + FullyQualifiedErrorId : NativeCommandError
        Message
            ProviderFault
                WSManFault
                    Message = Cannot create a WinRM listener on HTTPS because this machine
    does not have an appropriate certificate. To be used for SSL, a certificate must have a
    CN matching the hostname, be appropriate for Server Authentication, and not be expired,
    revoked, or self-signed.
    Error number:  -2144108267 0x80338115
    Cannot create a WinRM listener on HTTPS because this machine does not have an appropriate




  PS> winrm s winrm/config/client '@{TrustedHosts="172.31.42.249"}'


BR read powershell book
check for PowerShell XSLT
  PS> $xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
  PS> $xslt.Load($xsl);
  PS> $xslt.Transform($xml, $output);
  PS> function process-XSLT { param([string]$a)
      $xsl = "C:\path_to_xslt\CleanUp.xslt"
      $inputstream = new-object System.IO.MemoryStream
      $xmlvar = new-object System.IO.StreamWriter($inputstream)
      $xmlvar.Write("$a") ; $xmlvar.Flush()
      $inputstream.position = 0
      $xml = new-object System.Xml.XmlTextReader($inputstream)
      $output = New-Object System.IO.MemoryStream
      $xslt = New-Object System.Xml.Xsl.XslCompiledTransform
      $arglist = new-object System.Xml.Xsl.XsltArgumentList
      $reader = new-object System.IO.StreamReader($output)
      $xslt.Load($xsl)
      $xslt.Transform($xml, $arglist, $output)
      $output.position = 0
      $transformed = [string]$reader.ReadToEnd()
      $reader.Close()
      return $transformed
      }
 * this article is not complete - but it has some interesting info
  ( http://rkeithhill.wordpress.com/2006/07/24/writing-cmdlets-in-powershell/ )



look for registry powershell commands
 * want get-itemproperty - but what are its args
  [Using the Get-Command Cmdlet]( http://technet.microsoft.com/en-us/library/ee176842.aspx )
  PS> Get-Command Get-ItemProperty | Format-List *
      HelpUri             : http://go.microsoft.com/fwlink/?LinkID=113320
      DLL                 : C:\Windows\assembly\GAC_MSIL\Microsoft.PowerShell.Command
                            s.Management\1.0.0.0__31bf3856ad364e35\Microsoft.PowerShe
                            ll.Commands.Management.dll
      Verb                : Get
      Noun                : ItemProperty
      HelpFile            : Microsoft.PowerShell.Commands.Management.dll-Help.xml
      PSSnapIn            : Microsoft.PowerShell.Management
      ImplementingType    : Microsoft.PowerShell.Commands.GetItemPropertyCommand
      Definition          : Get-ItemProperty [-Path] <String[]> [[-Name] <String[]>]  ....
      DefaultParameterSet : Path
      OutputType          : {}
      Name                : Get-ItemProperty
      CommandType         : Cmdlet
      Visibility          : Public
      ModuleName          : Microsoft.PowerShell.Management
      Module              :
      Parameters          : {[Path, System.Management.Automation.ParameterMetadata],  ....
      ParameterSets       : {[-Path] <String[]> [[-Name] <String[]>] [-Filter <String ....
  PS> Get-Help Get-ItemProperty
      NAME      Get-ItemProperty
      SYNOPSIS  Gets the properties of a specified item.
      SYNTAX    Get-ItemProperty [-LiteralPath] <string[]> [[-Name] <string[]>]
                                 [-Credential <PSCredential>] [-Exclude <string[]>]
                                 [-Filter <string>] [-Include <string[]>]
                                 [-UseTransaction] [<CommonParameters>]
                Get-ItemProperty [-Path] <string[]> [[-Name] <string[]>]
                                 [-Credential <PSCredential>] [-Exclude <string[]>]
                                 [-Filter <string>] [-Include <string[]>]
                                 [-UseTransaction] [<CommonParameters>]
      DESCRIPTION The Get-ItemProperty cmdlet gets the properties of the specified items. For example,
          you can use Get-ItemProperty to get the value of the LastAccessTime property of a file object.
          You can also use Get-ItemProperty to view registry entries and their values.
      RELATED LINKS Online version: http://go.microsoft.com/fwlink/?LinkID=113320
          about_Providers, Set-ItemProperty, Clear-ItemProperty, Copy-ItemProperty,
          Move-ItemProperty, New-ItemProperty, Remove-ItemProperty, Rename-ItemProperty
      REMARKS To see the examples, type: "get-help Get-ItemProperty -examples".
              For more information, type: "get-help Get-ItemProperty -detailed".
              For technical information, type: "get-help Get-ItemProperty -full".
 * examples commands for getting at registry information
  $ ./test-path $(./get-public-ip zhaan) $(./get-windows-password zhaan) 'HKLM:Software\Zmanda\ZWC\1.0\Install'
  $ ./Get-ItemProperty $(./get-public-ip zhaan) $(./get-windows-password zhaan) 'HKLM:Software\Zmanda\ZWC\1.0\Install' 'InstallPath'
 * had to call member method name same as key name -- ??weird
  $ ./Get-ItemProperty $(./get-public-ip zhaan) $(./get-windows-password zhaan) 'HKLM:Software\Zmanda\ZWC\1.0\Install' 'InstallPath'
   C:\Program Files\barConite\barConite Server Backup(x64)\


looking for base64 in powershell
  PS> [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String("YmxhaGJsYWg="))


save some PowerShell links - because they are eating CPU
  [WMI]( http://www.computerperformance.co.uk/powershell/powershell_wmi.htm )

  ( http://windowsitpro.com/hyper-v/manage-hyperv-powershell )
 * windows and ruby?
  ( http://distributed-frostbite.blogspot.com/2010/08/managing-windows-with-ruby-part-1-or.html )
 * WinRM repo
  ( https://github.com/WinRb/WinRM )
WinRM ruby powershell
  ( http://stackoverflow.com/questions/18129015/winrm-listener-is-not-all-ears )


look up stuff about powershell and base64 - found "sight" mis-use
  ( http://stackoverflow.com/questions/15414678/how-to-decode-a-base64-string )
  ( http://vstepic.blogspot.com/2013/02/how-to-convert-string-to-base64-and.html )
  [Base64 Encode/Decode a string]( http://blogs.msdn.com/b/powershell/archive/2006/04/25/583265.aspx )
  ( http://www.getautomationmachine.com/en/about-us/news/item/embedding-files-in-powershell-scripts )

tested another method of base64 in power shell that worked
  PS> $content = [System.Convert]::FromBase64String(\"#{cert}\")
  PS> Set-Content -Path \"cloud.cert\" -Value $content -Encoding Byte

checking on my mac for browser windows - then got back to powershell and "chocolatey"
 * chocolatey appears to be apt like and NuGet like for powershell ???
 * then there is Posh-Git - PowerShell git which uses msysgit ( http://msysgit.github.io/ )
 * one of these pages references PsGet (like wget for windows sort of)
  PS> (New-Object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
  PS> install-module posh-git
 * "iex" is an alias for Invoke-Expression


 * google: powershell git
  ( https://github.com/dahlbyk/posh-git )
  ( http://haacked.com/archive/2011/12/13/better-git-with-powershell.aspx/ )
  ( http://haacked.com/archive/2011/12/19/get-git-for-windows.aspx/ )
 * google: powershell remote ruby
  ( http://stackoverflow.com/questions/10220927/using-ruby-to-execute-powershell-command-in-git-hooks )
  ( http://www.infoq.com/news/2013/05/windows-azure-point-to-site-ruby )
  ( http://blogs.msdn.com/b/silverlining/archive/2012/06/26/windows-azure-powershell-and-ruby-cloud-services.aspx )
  ( http://www.powershellmagazine.com/2012/02/15/chocolatey-and-powershell-revolutionize-windows-part-i/ )
  ( http://chocolatey.org/ )
 * google: ws management protocol powershell
  [Enable and Use Remote Commands in Windows PowerShell]( http://technet.microsoft.com/en-us/magazine/ff700227.aspx )
  ( http://blogs.msdn.com/b/wmi/archive/2011/01/25/using-ws-man-to-invoke-a-powershell-cmdlet.aspx )
 * google: PSRP powershell remoting protocol
  [Machine to Machine Remoting. ScriptCS over PSRP ]( https://github.com/scriptcs/scriptcs/issues/283 )
  [PSRP (PowerShell remoting protocol client)]( https://github.com/Pash-Project/Pash/issues/117 )
  ( http://www.virtualizationpractice.com/data-protection-next-generation-28046/ )
  ( http://blogs.msdn.com/b/wmi/archive/2009/03/23/how-to-use-wsman-config-provider-for-certificate-authentication.aspx )
  ( http://powershell.com/cs/default.aspx )
  [Remoting Guide - draft]( http://powershell.com/cs/cfs-filesystemfile.ashx/__key/CommunityServer.Components.PostAttachments/00.00.00.72.57/Remoting-Guide_5F00_Draft.html )

check for error handling in powershell
  ( http://blogs.msdn.com/b/kebab/archive/2013/06/09/an-introduction-to-error-handling-in-powershell.aspx )
 * in this page (which has nice details) there is a reference to "ROBOCOPY"
 * search for robocopy - a secondary install that is now included in newer version of windows (?which)
  ( http://en.wikipedia.org/wiki/Robocopy )
 * references other VSS tools that might be useful
 * google: diskshadow
  [diskshadow]( http://technet.microsoft.com/en-us/library/cc772172.aspx )
  [Using DiskShadow to Determine Issues with VSS]( https://kb.acronis.com/content/45472 )
  ( http://ss64.com/nt/diskshadow.html )
 * ss64.com has a bunch of command line help - like a list of powershell commands

  ( https://www.simple-talk.com/sysadmin/powershell/an-introduction-to-powershell-modules/ )
  ( http://mikefrobbins.com/2013/07/04/how-to-create-powershell-script-modules-and-module-manifests/ )
  [Approved Verbs for Windows PowerShell Commands]( http://msdn.microsoft.com/en-us/library/windows/desktop/ms714428(v=vs.85).aspx )
  [How to Write a Module Manifest]( http://msdn.microsoft.com/en-us/library/dd878297(v=vs.85).aspx )
  ( http://get-powershell.com/post/2011/04/04/How-to-Package-and-Distribute-PowerShell-Cmdlets-Functions-and-Scripts.aspx )


lookup powershell module description files
 * generate one
 * rename ps1 to psm1 - add some example commands
  [string]    Fixed-length string of Unicode characters
  [char]      A Unicode 16-bit character
  [byte]      An 8-bit unsigned character
  [int]       32-bit signed integer
  [long]      64-bit signed integer
  [bool]      Boolean True/False value
  [decimal]   A 128-bit decimal value
  [single]    Single-precision 32-bit floating point number
  [double]    Double-precision 64-bit floating point number
  [DateTime]  Date and Time
  [xml]       Xml object
  [array]     An array of values
  [hashtable] Hashtable object

look for permissions solution on powershell modules
 * pages 16 to 19 in the PowerShell admin pocket consultant book
  PS> Set-ExecutionPolicy unrestricted

try to fix powershell module
 * user Start-Process not Invoke-Expression
  ( http://stackoverflow.com/questions/6338015/in-powershell-how-do-you-execute-an-arbitrary-native-command-from-a-string )
 * test a bunch of changes - fill out install commands
administrator account is not present by default in windows 7
 * look for way to enable
  ( http://www.howtogeek.com/howto/windows-vista/enable-the-hidden-administrator-account-on-windows-vista/ )
  C> net user administrator /active:yes
 * now it shows up on the log in screen
want to add default environment that loads DRaaS
 * how to list imported modules
  PS> Get-Module
 * check profile information on 8/22/2014
```
C:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```
 * create profile file and add it to the installer - test on local vm
 * have the profile import DRaaS
  PS> Import-Module DRaaS
  [Import-Module]( http://technet.microsoft.com/en-us/library/hh849725.aspx )


add some help comments to powershell module
 * some notes about more complicated help
  [Writing Help for Windows PowerShell Modules]( http://msdn.microsoft.com/en-us/library/dd878343(v=vs.85).aspx )
  [Writing Help for Windows PowerShell Cmdlets]( http://msdn.microsoft.com/en-us/library/dn622032(v=vs.85).aspx )
  [How to Create the Cmdlet Help File]( http://msdn.microsoft.com/en-us/library/bb525433(v=vs.85).aspx )
 * also check export member behavior
  ( http://stackoverflow.com/questions/22205103/powershell-module-design-export-modulemember )
  PS> Export-ModuleMember -Function Get-Something


create new vm - jool - with new winrm script
 * didn't initialize correctly - seems to be syntax error in script
 * add the "(" to fix that
 * checked the advfirewall settings - they did not get set
 * noticed that netsh will get deprecated at some point - comment from command help was
  Get-Command -Module NetSecurity
  lists commands for windows firewall with advanced security
  also visit ( http://go.microsoft.com/fwlink/?LinkId=217627 )
 * check the get-command output -- need to grab it and add it here
  ...
 [Set-NetFirewallProfile]( http://technet.microsoft.com/en-us/library/jj554896.aspx )
 * try the new command - uses "GpoBoolean" not notmal boolean of $false ?!?!
  PS> Set-NetFirewallProfile -All -Enabled False
 * checked it in a cmd window
  C> netsh advfirewall show allprofiles state
 * the powershell command does not appear to be present in windows 7??
 * look for more info on GpoBoolean -- found unrelated page about windows "Desired State Configuration"
 * huddle.com github project on same ( https://github.com/Huddle/DSC )
 * microsoft page on DSC
  [Windows PowerShell Desired State Configuration Overview]( http://technet.microsoft.com/en-us/library/dn249912.aspx )
 * it looks like the firewall management commands are in powershell 3 (not windows 7)
  ( http://letitknow.wordpress.com/2012/09/13/manage-windows-firewall-with-powershell-3/ )


test cert install powershell cmdlet - gettting errors
  $ ./icc $(./get-public-ip moya) $(./get-windows-password moya) $(cat kribra.b64 ) | grep -v '#<.*CLIXML' | xmllint --format -
  <?xml version="1.0"?>
  <Objs xmlns="http://schemas.microsoft.com/powershell/2004/04" Version="1.1.0.1">
    <S S="Error">Set-Content : The filename, directory name, or volume label syntax is _x000D__x000A_</S>
    <S S="Error">incorrect._x000D__x000A_</S>
    <S S="Error">At C:\Windows\system32\WindowsPowerShell\v1.0\Modules\DRaaS\DRaaS.psm1:86 _x000D__x000A_</S>
    <S S="Error">char:9_x000D__x000A_</S>
    <S S="Error">+         Set-Content -Path "$path\cloud.zmanda\" -Value $content -Encoding _x000D__x000A_</S>
    <S S="Error">Byte_x000D__x000A_</S>
    <S S="Error">+         _x000D__x000A_</S>
    <S S="Error">~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~_x000D__x000A_</S>
    <S S="Error">    + CategoryInfo          : WriteError: (C:\ProgramData\...t\cloud.zmanda\:S _x000D__x000A_</S>
    <S S="Error">   tring) [Set-Content], IOException_x000D__x000A_</S>
    <S S="Error">    + FullyQualifiedErrorId : GetContentWriterIOError,Microsoft.PowerShell.Com _x000D__x000A_</S>
    <S S="Error">   mands.SetContentCommand_x000D__x000A_</S>
    <S S="Error"> _x000D__x000A_</S>
  </Objs>



a little sidetrack - how to add try notifications with powershell
 [Displaying a Message in the Notification Area]( http://technet.microsoft.com/en-us/library/ff730952.aspx )
 * first need an ico file - grab some jpeg from net
  $ jpegtopnm megaphone-red.jpg > megaphone-red.pnm
  $ pnmtopng megaphone-red.ppm > megaphone-red.png
   ( https://www.perturb.org/display/632_ImageMagick_resize_images.html )
  $ convert -resize 32x32 -quality 80 megaphone-red.png megared.png
  $ icotool --create -o megared.ico megared.png
 * powershell example
   [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
   $objNotifyIcon = New-Object System.Windows.Forms.NotifyIcon
   $objNotifyIcon.Icon = "C:\Scripts\Forms\Folder.ico"
   $objNotifyIcon.BalloonTipIcon = "Error"
   $objNotifyIcon.BalloonTipText = "A file needed to complete the operation could not be found."
   $objNotifyIcon.BalloonTipTitle = "File Not Found"
   $objNotifyIcon.Visible = $True
   $objNotifyIcon.ShowBalloonTip(10000)
 * try to add this to the module and test it - with C:\foo.ico it works
 * put it in the install dir and test - no go - wrong programfiles
 * try to use registry write - nope - it is writing to WOW64 part of the registry!!!
  ( http://stackoverflow.com/questions/12619522/installer-is-ignoring-writeregstr-trying-to-add-application-to-win-startup )
  [SetRegView blog post]( http://nsis-dev.github.io/NSIS-Forums/html/t-356394.html )
 * fix nsis script to put in correct part of registry
  NSIS: SetRegView 64
 * powershell uses "$env:XXX" for env vars
  PS> push-location -path "$env:programfiles"
  PS> pop-location
 * To see all the environment variables, do this:
  PS> dir env:
 * To see all the ones containing "Program", do this:
  PS> dir env: | ? { $_.Value -match 'Program' }
 * In PowerShell 3 it is cleaner:
  PS> dir env: | ? Value -match 'Program'
 * get the correct ProgFiles - one will be $null
  PS> $dir = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]


look for more info on exceptions in powershell
   PS > (dir HKLM:\SOFTWARE\wow6432node\Microsoft\Windows\CurrentVersion\Uninstall | measure).count
   PS > (dir hklm:\software\microsoft\windows\currentversion\uninstall | measure).count
   PS > [Environment]::Is64BitProcess
   False
 * Also, HKEY_CLASSES_ROOT\Installer\Products is another location that lists programs installed with the Windows Installer.
   # Is this a Wow64 powershell host
   function Test-Wow64() { return (Test-Win32) -and (test-path env:\PROCESSOR_ARCHITEW6432) }
   # Is this a 64 bit process
   function Test-Win64() { return [IntPtr]::size -eq 8 }
   # Is this a 32 bit process
   function Test-Win32() { return [IntPtr]::size -eq 4 }
 * Note, it is worth noting that the locations of the 32-bit and 64-bit versions of Powershell are somewhat misleading.
 * The 32-bit PowerShell is found at C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe
 *  and the 64-bit PowerShell is at C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
   $Arch = (Get-Process -Id $PID).StartInfo.EnvironmentVariables["PROCESSOR_ARCHITECTURE"];
   if     ($Arch -eq 'x86'  ) { Write-Host -Object 'Running 32-bit PowerShell'; }
   elseif ($Arch -eq 'amd64') { Write-Host -Object 'Running 64-bit PowerShell'; }
 * Access 64bit registry values from 32bit powershell
  ( http://gallery.technet.microsoft.com/scriptcenter/6062bbfc-53bf-4f92-994d-08f18c8324c0 )


 * search path
  PS> echo $env:PSModulePath
  C:\Users\Administrator\Documents\WindowsPowerShell\Modules;
  C:\Windows\system32\WindowsPowerShell\v1.0\Modules\;
  C:\Program Files (x86)\AWS Tools\PowerShell\

 * google: powershell SQL server request
  ( http://msdn.microsoft.com/en-us/library/cc281720.aspx
  ( http://stackoverflow.com/questions/8423541/how-do-you-run-a-sql-server-query-from-powershell
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2013/05/06/10-tips-for-the-sql-server-powershell-scripter.aspx


 * PowerShell
  ( http://rkeithhill.wordpress.com/2006/07/24/writing-cmdlets-in-powershell/ )
  [ The Windows PowerShell Profile]( http://technet.microsoft.com/library/ee692764.aspx )
  ( http://blogs.msdn.com/b/powershell/archive/2012/06/21/running-show-command-to-discover-cmdlets.aspx )
  ( http://www.darkoperator.com/blog/2013/2/19/powershell-basics-extending-the-shell-with-modules-and-snapi.html )
  ( http://stackoverflow.com/questions/4356758/how-to-handle-null-in-the-pipeline )
  ( http://stackoverflow.com/questions/10286164/powershell-function-return-value )
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2011/05/22/use-powershell-to-make-mandatory-parameters.aspx )
  ( http://blogs.technet.com/b/heyscriptingguy/archive/2012/05/12/weekend-scripter-use-powershell-to-easily-modify-registry-property-values.aspx )
  ( http://social.technet.microsoft.com/Forums/windowsserver/en-US/e8ad7037-2b91-4ce8-a767-485189fb66c9/powershell-check-for-registry-value-and-change-if-not-correct )
  ( http://blogs.technet.com/b/askds/archive/2008/05/14/troubleshooting-kerberos-authentication-problems-name-resolution-issues.aspx )
  ( http://stackoverflow.com/questions/16460163/ps1-cannot-be-loaded-because-the-execution-of-scripts-is-disabled-on-this-syste )
  ( https://github.com/psake/psake )
  [Search and install PowerShell modules easy.]( http://psget.net/ )
  ( http://www.vexasoft.com/blogs/powershell/7255220-powershell-tutorial-try-catch-finally-and-error-handling-in-powershell )
  ( http://social.technet.microsoft.com/Forums/scriptcenter/en-US/f9551e49-fe32-47f6-b4d0-f3e7e5858925/powershell-exceptions-trycatchthrow-how-to-use-them-with-conditionals?forum=ITCG )
  ( http://stackoverflow.com/questions/2022326/terminating-a-script-in-powershell )
  ( http://stackoverflow.com/questions/7199357/powershell-trap-exception-is-not-catching-my-error )
  [Approved Verbs for Windows PowerShell Commands]( http://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx )
  [WTFM: Writing the Fabulous Manual]( http://technet.microsoft.com/en-us/magazine/ff458353.aspx )
  [Windows PowerShell: Comment your way to help]( http://technet.microsoft.com/en-us/magazine/hh500719.aspx )
  [Script Modules]( http://msdn.microsoft.com/en-us/library/dd878340(v=vs.85).aspx )
  [Export-ModuleMember]( http://technet.microsoft.com/en-us/library/hh849736.aspx )
  ( http://stackoverflow.com/questions/22205103/powershell-module-design-export-modulemember )


 * WinRM WinRb ...
  ( https://github.com/WinRb/WinRM )
  ( https://github.com/WinRb )
  ( https://github.com/WinRb/winrm-cli )
  ( https://github.com/WinRb/rubyntlm )


was looking for powershell -- what -- and found UI page
  ( http://www.drdobbs.com/windows/building-gui-applications-in-powershell/240049898 )
  ( http://showui.codeplex.com/ )
 * download showui and check it out a bit -- follow up and read the ShowUI source       <== TODO
 * noticed "#region" comments - powershell editor collapses functions within this
 * look for vim plugin
  ( https://github.com/vim-scripts/Windows-PowerShell-Syntax-Plugin )
  ( http://blogs.msdn.com/b/powershell/archive/2009/10/15/introducing-the-windows-7-resource-kit-powershell-pack.aspx )


save some powershell links
  [Enable PS Remoting using GPO’s]( http://damianflynn.com/2011/01/28/xx/ )
  ( http://blogs.msdn.com/b/avkashchauhan/archive/2011/03/17/enabling-ps-remoting-enable-psremoting-in-windows-azure-role-using-startup-task.aspx )
  [Administrator's Guide to Powershell Remoting]( http://powershell.com/cs/media/p/7257.aspx )
  ( http://distributed-frostbite.blogspot.com/2010/08/managing-windows-with-ruby-part-1-or.html )
  ( http://stackoverflow.com/questions/18129015/winrm-listener-is-not-all-ears )
  [about_Automatic_Variables]( http://technet.microsoft.com/en-us/library/hh847768.aspx )
 * google: powershell system tray notification
  [Windows PowerShell Tip: Displaying a Message in the Notification Area]( http://technet.microsoft.com/en-us/library/ff730952.aspx )
  ( http://bytecookie.wordpress.com/2011/12/28/gui-creation-with-powershell-part-2-the-notify-icon-or-how-to-make-your-own-hdd-health-monitor/ )
  [Windows PowerShell Modules]( http://msdn.microsoft.com/en-us/library/dd878324(v=vs.85).aspx )
  [Installing Modules]( http://msdn.microsoft.com/en-us/library/dd878350(v=vs.85).aspx )



 * PowerShell
  [Windows Powershell, The Power of Variables]( http://technet.microsoft.com/en-us/magazine/2007.03.powershell.aspx )
  [Windows PowerShell: Scripting Crash Course]( http://technet.microsoft.com/en-us/magazine/hh551144.aspx )
  [Resolving WinRM errors]( http://blogs.technet.com/b/exchange/archive/2010/12/07/3411644.aspx )
 * this following one has robocopy information also
  [An Introduction to Error Handling in PowerShell]( http://blogs.msdn.com/b/kebab/archive/2013/06/09/an-introduction-to-error-handling-in-powershell.aspx )



 * google: how to change administrator password hyper-v 2012 powershell
  [Installing Windows Server 2012 and Server Core]( http://www.informit.com/articles/article.aspx?p=1947698&seqNum=5 )
  > net user administrator *
 * set it to gr##nd0ts
 * ip is currently 172.30.6.237
 * send info to Win about access
 * was able to connect on my mac
 * found old reference to connecting on wilhelm - at the end of Thursday 2/27/2014
  $ ~/ws/FreeRDP/client/X11/xfreerdp /cert-ignore -nego /u:Administrator /v:172.30.6.237
  connected to 172.30.6.237:3389
  Password:
 * source for "wfreerdp" is /home/karred/ws/FreeRDP/client/Windows/cli/wfreerdp.c (et al)
  ( http://www.cloudbase.it/using-freerdp-to-connect-to-the-hyper-v-console/ )
 * spec for RDP is in MSDN tech docs
  [Technical Documents]( http://msdn.microsoft.com/library/jj712081 )
  ( http://www.cloudbase.it/freerdp-for-windows-nightly-builds/ )
  ( http://www.freerdp.com/ )
  ( https://github.com/FreeRDP/FreeRDP )


 * google: how to sign powershell scripts
 * google: signing powershell script with openssl
  ( http://thecuriousgeek.org/?p=200 )
  ( http://s3rgem.blogspot.com/2010/02/powershell-code-signing.html )
  ( http://ss64.com/ps/set-authenticodesignature.html )
  ( http://javascript.crockford.com/tdop/tdop.html )


  ( http://www.powershellmagazine.com/2014/07/03/posh-ssh-open-source-ssh-powershell-module/ )

 * google: signed powershell example
  ( https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/ )
  ( http://www.darkoperator.com/blog/2013/3/5/powershell-basics-execution-policy-part-1.html )
 * google: pfx file
  ( http://security.stackexchange.com/questions/29425/difference-between-pfx-and-cert-certificates )
  ( http://stackoverflow.com/questions/403174/convert-pfx-to-cer )




<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
