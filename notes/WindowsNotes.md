
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

Authenticode
------------

[Windows Authenticode Portable Executable Signature Format]( https://msdn.microsoft.com/en-us/windows/hardware/gg463180.aspx )
[How To Get Information from Authenticode Signed Executables]( https://support.microsoft.com/en-us/kb/323809 )
http://stackoverflow.com/questions/301024/validate-authenticode-signature-on-exe-c-without-capicom

MinGW
-----

Things that build for Visual C do not work for GNU.

### Wide strings

Microsoft C compilers will handle `L##x` in macros and translate it
to a long string like `L"test"` - GNU C does not (perhaps clang also does not).
This will be seen in error messages like:

```
identifier "L__FUNCTION__" is undefined.
```

partially due to a recommendation to generate long string 
identifiers for MS code.
Example from
[this stackoverflow page]( http://stackoverflow.com/questions/4773941/wide-version-of-function-on-linux ):

```
#define WIDE2(x) L##x
#define WIDECHAR(x) WIDE2(x)
#define WIDE_FUNCTION WIDECHAR(__FUNCTION__)

int main( int args, char **argv ) {
    wchar_t *foo = L"This is a test";
    const char *f = __FUNCTION__;
    wchar_t *wf = WIDE_FUNCTION;
}
```

Another example from
[this stackoverflow page]( http://stackoverflow.com/questions/3291047/how-do-i-print-the-string-which-file-expands-to-correctly/3291315#3291315 )

```
#define WIDEN2(x) L ## x
#define WIDEN(x) WIDEN2(x)
#define WFILE WIDEN(__FILE__)

int main() {
    wprintf("%s\n", WFILE);
    return 0;
}
```

### XML Library

The older MinGW did not have `msxml.h` and the associated
DLL at least on OSX.  It is not clear if it was just old or it
was just that it is only present in the 64 bit environment.
Update to the latest using brew to get the current 64 bit
version that has the library.

https://sourceforge.net/p/mingw-w64/mailman/message/34335349/
https://sourceforge.net/p/mingw-w64/mingw-w64/ci/23ef19a4cc067b1871351c272f773267e9852e64/

### ATL

Windows provides a proprietary library for Objects called ATL.

[CTime]( https://msdn.microsoft.com/en-us/library/b6989cds.aspx )

### Windows APIs

It appears that the `ULONG` and related types are defined in `windef.h`
ndows Data Types]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa383751(v=vs.85).aspx )

One of the problems showed as an issue with `auto_ptr`
[documented here]( https://en.wikipedia.org/wiki/Auto_ptr ).
This really was a problem with the base type - and I just needed an include.

String conversions appeared to be a problem - but it really was just
the rebit folks not using the correct interfaces

```
ADD EXAMPLE OF THE CODE CHANGE
```

http://stackoverflow.com/questions/347949/how-to-convert-a-stdstring-to-const-char-or-char

This was related to calls to the `MoveFileEx()` function.  This appeared
to be due to the MS compilers defaulting to the W version.  For MinGW
I needed to be explicit - since the arguments were wide.

[MoveFileEx function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa365240(v=vs.85).aspx )

"std::wstring" to "wchar_t"
http://stackoverflow.com/questions/246806/i-want-to-convert-stdstring-into-a-const-wchar-t

AFX / ATL
---------

Application Framework eXtensions are part of the
[Microsoft Foundation Class Library]( https://en.wikipedia.org/wiki/Microsoft_Foundation_Class_Library )

https://en.wikipedia.org/wiki/Active_Template_Library

### FormatString

[AfxFormatString1]( https://msdn.microsoft.com/en-us/library/19d0ss8w.aspx )
[AfxFormatString2]( https://msdn.microsoft.com/en-us/library/f1w5d2h2.aspx )
[AfxMessageBox]( https://msdn.microsoft.com/en-us/library/as6se7cb.aspx )

### Tracing

https://en.wikipedia.org/wiki/Windows_software_trace_preprocessor
[Event Tracing Functions]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa363795(v=vs.85).aspx )

[TRACE]( https://msdn.microsoft.com/en-us/library/6w95a4ha.aspx )
[AFX Messages]( https://msdn.microsoft.com/en-us/library/bb982948.aspx )

Rootkits
--------

https://en.wikipedia.org/wiki/AFX_Windows_Rootkit_2003

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
