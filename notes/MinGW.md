
<!--
-->

WinSock
-------

Windows sockets versus Unix sockets

The official MSDN documentation has some information about porting
socket applications:

http://msdn.microsoft.com/library/en-us/winsock/winsock/porting_socket_applications_to_winsock.asp

 1. The first difference to be aware of when porting networking programs to Windows
    is that you must call `WSAStartup()` before using any sockets functions.
    If you forget to do this, all Winsock functions will fail when called.
 2. The `select()` function differs from Unix in that it can only be used for handles
    returned by `socket()` and similar functions, not on other handles like
    those returned by `_open()`. The *Win32 API* provides various functions
    for waiting on other handles, such as `WaitForMultipleObjects()`.
 3. Similarly, the handles returned by `socket()` cannot be used with
    non-socket system calls like `read()`, `fdopen()`, etc.
 4. The names of the header files are also different, e.g. `winsock.h` or
    `winsock2.h` is used instead of `socket.h`
 5. Errors in socket functions do not set errno: instead you must call
    `WSAGetLastError()` to find what error occurred
 6. There is no support for `SIGIO`, but this can be emulated with win32 functions,
    such as `WSAWaitForMultipleEvents` and the
    help of an additonal thread
    (see for example http://home.versatel.nl/fred.van.lieshout/win32/sig_io.html )
 7. When compiling socket applications, you must add "`-lws2_32`" to the makefile.

Because of all these differences, many projects use toolkits (like Qt)
or cross-platform wrapper libraries instead of the native socket APIs.


DLLs
----

http://www.mingw.org/wiki/DLL
http://www.mingw.org/wiki/sampleDLL
http://www.mingw.org/category/wiki/dll
https://www.reddit.com/r/cpp/comments/kr3f6/using_mingw_loadlibrary_returns_null_for_every/
http://www.transmissionzero.co.uk/computing/advanced-mingw-dll-topics/

[DllMain entry point]( https://msdn.microsoft.com/en-us/library/ms682583.aspx )

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
