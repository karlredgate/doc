
<!--
-->

Spec
----

rpm verify script
http://www.rpm.org/max-rpm/s1-rpm-verify-what-to-verify.html
http://www.rpm.org/max-rpm/ch-rpm-verify.html
https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch10s03.html
https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch-advanced-packaging.html

### Writing Verification Scripts

RPM automatically handles package verification, checking to see
that the proper files are installed, and testing the files themselves
for the proper size and other attributes. You may need to do more
in your package, though, to ensure everything is properly set up.
With RPM, you can:

 * Control the tests used to verify each file, as described in Chapter 9, Working with Spec Files
 * Create a verify script that performs other tests

If you need to perform some other test to verify your package, such
as check that a configuration file has a particular setting (and
that the setting is valid), you can fill in the %verifyscript in
the spec file. The %verifyscript acts much like the %pre or %post
scripts, except that the %verifyscript gets executed during package
verification. Fill in a %verifyscript as follows:

```
%verifyscript
your script commands ....
```

Common `%verifyscript` actions are to check for an entry in a system
configuration file, such as an init-time startup script or `/etc/shells`
(which lists the available shells). These are files owned by other
packages that may need to be properly modified for a package to be
properly installed. If your package has a similar circumstance,
write a `%verifyscript`. In your script, send all error output to
stderr.

Cross Reference
---------------

See Chapter 4, Using the RPM Database for more on package verification.

### Marking files as documentation or configuration files

RPM keeps special track of files within a package that hold
documentation or configuration data. You need to identify these
files with special directives.

The `%doc` directive marks a file as a documentation file. For example:

```
%files

/usr/X11R6/bin/xtoolwait

%doc /usr/X11R6/man/man1/xtoolwait.*
```

This example lists all the included files in `/usr/X11R6/man/man1`
as documentation files.

If you don’t include the full path to a documentation file or files,
the RPM system will create a special documentation directory for
the package, and place those files into that directory. For example:

```
%doc README NEWS
```

This example places the files README and NEWS into a newly created
package-specific directory, typically a subdirectory under
`/usr/share/doc` or `/usr/doc`.

The `%docdir` directive names a directory that holds documentation.
All files under that directory in the package will get automatically
marked as documentation files. For example:

```
%files
/usr/X11R6/bin/xtoolwait
%docdir /usr/X11R6/man/man1
/usr/X11R6/man/man1/xtoolwait.*
```

### Note

> In addition to the marked directories, the standard Linux documentation
> directories, such as /usr/share/man, are automatically assumed to
> be documentation directories.

Similar to the %doc directive, the %config directive marks a file
as configuration. For example:

```
%files
/sbin/ypbind
%config /etc/rc.d/init.d/*
%config /etc/yp.conf
%doc README NEWS
```

A special option to the %config directive, noreplace, tells RPM not
to overwrite, or replace a configuration file. For example:

```
%files
/sbin/ypbind
%config /etc/rc.d/init.d/*
%config(noreplace) /etc/yp.conf
%doc README NEWS
```

Use this option to help protect local modifications. If you use
%config(noreplace), the file will not overwrite an existing file
that has been modified. If the file has not been modified on disk,
the rpm command will overwrite the file. But, if the file has been
modified on disk, the rpm command will copy the new file with an
extra file-name extension of .rpmnew.

Similarly, %config(missingok) means that the file does not have to
exist on disk. You can use this modifier for files or links that
are created during the %post scripts but will need to be removed
if the package is removed.

Another special modifier, %ghost, tells the rpm command that the
file should not be included in the package. You can use this to
name the needed attributes for a file that the program, when
installed, will create. For example, you may want to ensure that a
program’s log file has certain attributes.

Setting file attributes
-----------------------

When your package is installed, you can control the file attributes as well as the files that get included into the package. This is very useful since most packages are installed by the root user and you don’t always want the root user owning the files.

The %attr directive allows you to control the permissions for a particular file. The format is:

```
%attr(mode, user, group) filename
```

For example:

```
%attr(0644, root, root) /etc/yp.conf
```

This example sets the file permissions to 644, the user and the group to root. If you don’t need to specify a value, use a dash, -, to leave the setting as is for the file. For example:

```
%attr(-, root, -) /etc/yp.conf
```

Note that you can combine directives, one after another. For example:

```
%config %attr(-, root, -) /etc/yp.conf
```

You can also use spaces instead of commas as delimiters. For example:

```
%attr(0700 root root) %dir /var/tux
```

In addition to using %attr to set the attributes for a file, you should use the %defattr directive to set the default attributes for all files in the package. For example:

```
%files
%defattr(-,root,root)
/usr/X11R6/bin/xtoolwait
/usr/X11R6/man/man1/xtoolwait.*
```

Just about every spec file uses the %defattr directive as this directive eliminates a lot of work you need to do to set file attributes individually. In addition, using the %defattr directive is considered a best practice when creating packages.
You can also mark files for a particular language. For example, from the tcsh shell package:

```
%files
%defattr(-,root,root)
%doc FAQ Fixes NewThings complete.tcsh eight-bit.txt tcsh.html
%{_bindir}/tcsh
%{_bindir}/csh
%{_mandir}/*/*
%lang(de) %{_datadir}/locale/de/LC_MESSAGES/tcsh*
%lang(el) %{_datadir}/locale/el/LC_MESSAGES/tcsh*
%lang(en) %{_datadir}/locale/en/LC_MESSAGES/tcsh*
%lang(es) %{_datadir}/locale/es/LC_MESSAGES/tcsh*
%lang(et) %{_datadir}/locale/et/LC_MESSAGES/tcsh*
%lang(fi) %{_datadir}/locale/fi/LC_MESSAGES/tcsh*
%lang(fr) %{_datadir}/locale/fr/LC_MESSAGES/tcsh*
%lang(it) %{_datadir}/locale/it/LC_MESSAGES/tcsh*
%lang(ja) %{_datadir}/locale/ja/LC_MESSAGES/tcsh*
%lang(pl) %{_datadir}/locale/pl/LC_MESSAGES/tcsh*
%lang(ru) %{_datadir}/locale/ru/LC_MESSAGES/tcsh*
%lang(uk) %{_datadir}/locale/uk/LC_MESSAGES/tcsh*
```

This example marks certain files as only being of use with particular languages, such as ja for the Japanese text and fr for the French text.

Verifying the %files section
----------------------------

You can use the %verify directive to control which tests RPM uses when verifying a package.

Cross Reference
---------------

See Chapter 4, Using the RPM Database for more on package verification.

The %verify directive names the tests to include or not include. Table 10-4 lists the tests.

Table 10-4 Package verification tests

| Test    |Usage                                       |
| group   |Verifies the group of the file              |
| maj     |Verifies the file's major device number     |
| md5     |Verifies the file's MD5 checksum            |
| min     |Verifies the file's minor device number     |
| mode    |Verifies the file mode, or permissions      |
| mtime   |Verifies the file's last modification time  |
| owner   |Verifies the owner of the file              |
| size    |Verifies the file's size                    |
| symlink |Verifies a symbolic link                    |

With the %verify directive, you can name test, such as shown following:

```
%verify(owner group size) /etc/yp.conf
```

This example limits the tests to owner, group, and size. (The default is to perform all the tests.) You can also use the word not to specify that RPM should not run one or more tests. For example:

```
%verify(not owner) /etc/yp.conf
```

This example turns off just the owner test.

Filling the list of files automatically

The -f option to the %files section allows you to read in a list of file names from a file. This file is assumed to look like the contents of the %files section, holding one file name per line. You can also include the various directives for files such as %attr or %doc. For example:

```
%files -f list_of_filenames.txt
```

You can combine this list with filename entries, such as the following:

```
%files -f xconfig_files.txt
%defattr(-,root,root)
/usr/X11R6/bin/xtoolwait
/usr/X11R6/man/man1/xtoolwait.1
```

This example reads in a list of file names from the file named
`xconfig_files.txt` and also includes two additional files.  This list of
files works best if you cannot determine the file names in advance. The
build may create different files based on various macro values. In
addition, you may not know the final paths for the files until build time.

Handling RPM build errors for unpackaged files
-----------------------------------------------

Starting with RPM 4.1, rpmbuild will exit if all files in the
`$RPM_BUILD_ROOT` directory are not found in the `%files` section (or in a
file that lists file names used with the `-f` option). This is officially
known as a Fascist build policy and you can turn it off with the
following macros.

The `%_unpackaged_files_terminate_build` macro,
if set to 1, tells rpmbuild to exit if it finds files that are in the
`$RPM_BUILD_ROOT` directory but not listed as part of the package.
Set this macro to 0 to turn off the Fascist build policy. For example:

```
%define _unpackaged_files_terminate_build 0
```

You can also control the flag that specifies whether
missing documentation files cause rpmbuild to exit.
Set the `%_missing_doc_files_terminate_build` macro to 0
to turn off this feature:

```
%define _missing_doc_files_terminate_build 0
```

See the "Defining Spec File Macros" section later in the chapter for more on using macros.

Cross Reference

You can also store this setting in a macro file so that it applies for all packages you build. See Chapter 20, Customizing RPM Behavior for more on macro files.

While the Fascist build policy may be an annoyance, it can prove very
useful. Chances are your spec file has an error if you have files in the
`$RPM_BUILD_ROOT` directory that are not listed in the %files section. The
Fascist build policy helps catch these errors. In addition, since the
error outputs a list of files in the `$RPM_BUILD_ROOT` directory that
are not listed in the `%files` section, you can often paste this list
into your `%files` section.


Defining Spec File Macros

The RPM system defines a lot of handy macros so that your spec files
can work regardless of where system directories are located. You simply
use the macro, such as `%_bindir`, in place of hard-coded paths. The
`%_bindir` macro, for example, identifies the default directory for
binary executables, `/usr/bin`.

Use these macros wherever possible to avoid hard-coded paths and settings.


Built-in macros

RPM includes a host of built-in macros, including the following useful directories:

```
%_prefix /usr
%_exec_prefix %{_prefix}
%_bindir %{_exec_prefix}/bin
%_sbindir %{_exec_prefix}/sbin
%_libexecdir %{_exec_prefix}/libexec
%_datadir %{_prefix}/share
%_sysconfdir %{_prefix}/etc
%_sharedstatedir %{_prefix}/com
%_localstatedir %{_prefix}/var
%_libdir %{_exec_prefix}/lib
%_includedir %{_prefix}/include
%_oldincludedir /usr/include
%_infodir %{_prefix}/info
%_mandir %{_prefix}/man
```

The example directories shown above come from the standard RPM macro
file, `/usr/lib/rpm/macros`, instead of the Red Hat-specific file,
`/usr/lib/rpm/redhat/macros`, which holds:

```
%_prefix /usr
%_sysconfdir /etc
%_localstatedir /var
%_infodir /usr/share/info
%_mandir /usr/share/man
%_initrddir %{_sysconfdir}/rc.d/init.d
%_defaultdocdir %{_usr}/share/doc
```

Spec file-specific macros

Most of the pre-defined RPM macros hold directory paths or architecture information. RPM also includes a set of useful macros that you can use to help debug problematic spec files and well as perform common tasks in spec files. Table 10-5 lists these debugging and special spec file macros.

Table 10-5 Special spec-file macros

Macro   Usage
%dump   Prints out macro values
%{echo:message} Prints message to stderr
%{error:message}        Prints message to stderr and returns BADSPEC
%{expand:expression}    Like eval, expands expression
%{F:file_exp}   Expands file_exp to a file name
%global name value      Defines a global macro
%{P:patch_exp}  Expands patch_exp to a patch file name
%{S:source_exp} Expands source_exp to a source file name
%trace  Toggles the printing of debugging information
%{uncompress:filename}  Tests if file filename is compressed. If so, uncompresses and includes in the given context. If not compressed, calls cat to include file in given context.
%undefine macro Undefines the given macro
%{warn:message} Prints message to stderr

Note

To see the current list of macros, put a %dump at the start of your spec file.

Defining new macros

In addition to the built-in macros, you can define your own to make it easier to manage your packages. Define a new spec file macro with the following syntax:

%define macro_name value

For example:

%define major 2
%define minor 2
%define patchlevel 7

You can then use a macro with the %macro_name or %{macro_name} syntax. For example:

Version: %{major}.%{minor}.%{patchlevel}

You can also expand the results of running shell commands using a %(command) syntax with parenthesis instead of curly braces. For example:

%define today %(date)

Specifying parameters to macros

Most macros perform simple text substitution. You can also pass parameters to macros, and access those parameters within your macros, similarly to how shell scripts get command-line parameters.

Cross Reference

Chapter 14, Automating RPM with Scripts covers shell scripting with RPM.

With parameters, you can expand the normal definition of a macro to the following:

%define macro_name(options) value

Any text within the parenthesis is passed to getopt(3), and acts as parameters to the macro. This is performed when the macro is expanded. You can also pass options to the macro using the %macro_name syntax (without curly braces). For example:

%foo 1 2 3

This example passes the parameters 1, 2, and 3 to the macro foo. Inside the macro, you can use a shell script-like syntax to access the parameters through special macros. Table 10-6 lists these macros.

Table 10-6 Parameter macros inside a macro expansion

Macro   Holds
%0      The name of the macro
%*      All the parameters to the macro, except for any processed options
%#      The number of parameters
%1      The first parameter
%2      The second parameter
%3      The third parameter, and so on with %4, %5 and beyond
%{-p}   Holds -p if the -p parameter was passed to the macro; otherwise holds nothing
%{-p*}  Holds the value passed with the -p parameter, if the -p parameter was passed to the macro; otherwise holds nothing
%{-p:text}      Holds text if the -p parameter was passed to the macro; otherwise holds nothing

Note that all parameters listed in Table 10-6 hold the remaining parameters after getopt(3) processing. You can use these macros within the definition of your own macros. You can also nest macros, such as the following:

%define mypatch() patch %{-p:-p%{-p*}}

This macro expands to the patch command if no -p parameter was passed. If you pass a -p parameter, such as -p 1, then the macro expands to -p with the value of the -p parameter:

patch -p1

Note

This type of syntax is used heavily with the patch command.





Ghost files
------------

http://sourceforge.net/p/rpmrebuild/mailman/message/591987/

 * %ghost files should be present during rpm building.
   Their size and contents doesn't matter - only perm, owner and group
 * during rpm install they don't installed
   (but may be created in the pre/post install scripts)
 * %ghost files may be also created/changed by the applications
   installed with this package (or by any other application)
 * %ghost files we'll be erased durung rpm remove (because they are package's files)
   ( I think it's what is %ghost was invented for)


### Repair

rpm how to repair install
https://www.suse.com/communities/blog/rpm-package-verification-and-repair/

rpm trigger on all packages
http://rpm.org/api/4.4.2.2/triggers.html


rpmbuild do not make debuginfo
https://fedoraproject.org/wiki/Packaging:Debuginfo
http://www.redhat.com/archives/shrike-list/2003-April/msg00069.html
http://www.redhat.com/promo/summit/2008/downloads/pdf/Wednesday_130pm_Tom_Callaway_OSS.pdf
http://stackoverflow.com/questions/27862771/how-to-produce-platform-specific-and-platform-inde
http://www.redhat.com/f/pdf/summit07/RPMBestPractices2007.pdf


rpm spec requires version
http://www.rpm.org/max-rpm/s1-rpm-depend-manual-dependencies.html
http://rpm5.org/docs/api/dependencies.html

DNF
----

http://dnf.baseurl.org/
https://github.com/rpm-software-management/libhif
https://github.com/rpm-software-management/hawkey
https://github.com/openSUSE/libsolv
https://github.com/rpm-software-management/librepo
https://github.com/rpm-software-management/libcomps


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
