
<!--
-->

 * search: windows change administrator password from command line
 * ( http://allusefulinfo.com/how-to-change-administrator-password-in-windows-7-using-cmd/ )

### WSMan WinRM

 * ( https://openwsman.github.io/ )
 * search: winrm
 * search: winrm vs wsman
 * ( https://en.wikipedia.org/wiki/WS-Management )
 * ( https://forge.soa4d.org/ )

 * ( https://en.wikipedia.org/wiki/Microsoft_Windows_library_files )
 *
 * ( https://en.wikipedia.org/wiki/HAL_%28software%29 )
 * ( https://en.wikipedia.org/wiki/Hardware_abstraction )
 * ( https://en.wikipedia.org/wiki/Ntoskrnl.exe )
 * ( https://en.wikipedia.org/wiki/Microsoft_Windows_library_files#Hal.dll )
 * ( https://en.wikipedia.org/wiki/Client/Server_Runtime_Subsystem )
 * ( http://web.archive.org/web/20100912231625/http://technet.microsoft.com/en-us/sysinternals/bb897447.aspx )
 * ( https://en.wikipedia.org/wiki/Architecture_of_Windows_NT )
 * ( https://en.wikipedia.org/wiki/Windows_NT_startup_process )
 * ( https://en.wikipedia.org/wiki/Windows_service )
 * ( https://technet.microsoft.com/en-us/library/cc750820.aspx#XSLTsection124121120120 )
 * ( https://technet.microsoft.com/en-us/magazine/2007.03.vistakernel.aspx )
 * ( https://en.wikipedia.org/wiki/MinWin )
 * ( https://en.wikipedia.org/wiki/Windows_Vista_startup_process )

 * ( https://en.wikipedia.org/wiki/System_partition_and_boot_partition )
 * ( https://en.wikipedia.org/wiki/BIOS_boot_partition )
 * ( https://en.wikipedia.org/wiki/EFI_System_partition )
 * ( https://en.wikipedia.org/wiki/Windows_To_Go )
 * ( http://homepage.ntlworld.com./jonathan.deboynepollard/FGA/windows-nt-6-boot-process.html )
 * ( http://homepage.ntlworld.com./jonathan.deboynepollard/FGA/efi-boot-process.html )
 * ( http://www.uefi.org/sites/default/files/resources/2014_UEFI_Plugfest_04_Intel.pdf )
 * ( https://github.com/01org/luv-yocto )
 * ( https://01.org/linux-uefi-validation )
 * ( https://github.com/chipsec/chipsec )

Windows Clones
--------------

https://en.wikipedia.org/wiki/ReactOS

Shell Extension
---------------

github windows shell extension

https://github.com/dwmkerr/sharpshell
https://github.com/google/google-drive-shell-extension
https://github.com/vbaderks/msf

Shell Folders
-------------

[User Shell Folders]( https://technet.microsoft.com/en-us/library/cc962613.aspx )

Keys

```
HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer
```

The User Shell Folders subkey stores the paths to Windows Explorer
folders for the current user of the computer.

The entries in this subkey can appear in both the Shell Folders
subkey and the User Shell Folders and in both `HKEY_LOCAL_MACHINE`
and `HKEY_CURRENT_USER`. The entries that appear in user User Shell
Folders take precedence over those in Shell Folders. The entries
that appear in `HKEY_CURRENT_USER` take precedence over those in
`HKEY_LOCAL_MACHINE`.

Related Entries

 * Shell Folders in `HKEY_CURRENT_USER`
 * Shell Folders in `HKLM`
 * User Shell Folders in `HKLM`

https://en.wikipedia.org/wiki/Special_folder
https://en.wikipedia.org/wiki/File_URI_scheme

Shell Library
-------------

SHLWAPI

[UrlCreateFromPath]( https://msdn.microsoft.com/en-us/library/windows/desktop/bb773773(v=vs.85).aspx )
[Shell Path Handling Functions]( https://msdn.microsoft.com/en-us/library/windows/desktop/bb773559(v=vs.85).aspx )
[Common HRESULT Values]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa378137(v=vs.85).aspx )


Microsoft Backup Structure
--------------------------

[MS-BKUP: Microsoft NT Backup File Structure]( https://msdn.microsoft.com/en-us/library/dd305136.aspx )

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
