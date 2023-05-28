# <img src="https://github.com/KilianKegel/pictures/blob/master/refresh-icon.png"  width="48" height="48">Toro C Library (formerly known as Torito C Library)
* <img src="https://github.com/KilianKegel/pictures/blob/master/New-icon.png"  width="18" height="18">[Use cases](https://github.com/KilianKegel/toro-C-Library#use-cases)<br>
* <img src="https://github.com/KilianKegel/pictures/blob/master/New-icon.png"  width="18" height="18">[Source Code](https://github.com/KilianKegel/toro-C-Library#source-code)<br>
* [Goal](https://github.com/KilianKegel/toro-C-Library#goal)<br>
* [Approach](https://github.com/KilianKegel/toro-C-Library#approach)<br>
* [Riding the UEFI Shell](https://github.com/KilianKegel/toro-C-Library#riding-the-uefi-shell--enabling-the-platform-for-developers)<br>
* [HELLO is now WELCOME: ](https://github.com/KilianKegel/toro-C-Library#hello-is-now-welcome) <img src="https://github.com/KilianKegel/pictures/blob/master/New-icon.png"  width="18" height="18"> Howto build **hello.c** using **commandline** and **Visual Studio 2022**<br>
* <img src="https://github.com/KilianKegel/pictures/blob/master/New-icon.png"  width="18" height="18">[Implemenation Status](https://github.com/KilianKegel/toro-C-Library#implementation-status)<br>
* [Known bugs](https://github.com/KilianKegel/toro-C-Library#known-bugs)<br>
    * [missing non-standard functions](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand)<br>
* [Revision history](https://github.com/KilianKegel/toro-C-Library#revision-history)<br>

![C](https://github.com/KilianKegel/pictures/blob/master/C.png)

The **toro C Library** is a *monolithic* Standard C Library for UEFI x86-64 target platform
for Microsoft Visual Studio 2022.

**toro C Library** is the successor of "torito C Library". "torito C Library" is discontinued with version 20210820/R166. 
The main difference is, that **toro C Library** is build using the Visual Studio 2022 build environment, while "torito C Library"
uses an UEFI EDK2 2016 build environment. 

Additions of a C Library function set won't be done for "torito C Library" but for its grownup version **toro C Library** only.

**toro C Library** is an implementation targeting the ANSI/ISO C Standard Library compatibility
to create applications for different operating systems using
design --and debug-- infrastructure provided by Microsoft Visual Studio 2022 VS2022.

## Use cases
1.  create menu driven applications for the UEFI shell execution environment
    * VIDEO:    https://www.youtube.com/watch?v=gMwCKA6SQrk
    * SOURCE:   https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell
2.  easily port existing Standard C programs to the UEFI shell execution environment, e.g. the [ACPI reference implementation](https://acpica.org)
    * INTRODUCTION: https://github.com/tianocore/edk2-staging/tree/CdePkg/blogs/2022-01-16#cdepkgblog-2022-01-16
    * VIDEO:    https://www.youtube.com/watch?v=POfSJQXi2aM
    * SOURCE:   https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell
3.  easily reimplement MSDOS programs for the UEFI shell execution environment
    * INTRODUCTION: https://github.com/tianocore/edk2-staging/tree/CdePkg/blogs/2021-11-28#cdepkgblog-2021-11-28
4.  quickly implement simple CLI tools for the UEFI shell execution environment
    * INTRODUCTION: https://github.com/tianocore/edk2-staging/tree/CdePkg/blogs/2021-11-14#cdepkgblog-2021-11-14

## Source Code
https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI

## Goal

The **toro C Library** is designed to enable the developer to create
Standard C programs for UEFI Shell, Windows NT and Linux (in future releases)
running in x86-64 mode. Standard C compliant source code shall be easily portable to operating systems
supported by **toro C Library**.

The **toro C Library** shall provide full library compatibility with

* [ANSI X3.159-1989 ("ANSI C")](https://1drv.ms/b/s!AmMwYrfjYfPyhmLlWx7oT5rO6UDg?e=Am2R2v)
* ISO/IEC 9899 First edition 1990-12-15 ("C90")
* ISO/IEC 9899 First edition 1990-12-15, Amendment 1, 1995-04-01 ("C95")

### Forwards to the roots
Extentions to these standards (ISO 9899:1999 etc.), [*secure*](https://docs.microsoft.com/en-us/cpp/c-runtime-library/security-features-in-the-crt?view=vs-2019) / *bounds checking interface* functions `xyz_s()` from [ISO 9899:2011, Annex K](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf#page=600), [POSIX](https://en.wikipedia.org/wiki/C_POSIX_library) functions or  Microsoft specific add-ons will be implemented [_on demand_](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand) into **toro C Library**.

Be aware, that functions like <del>[`stricmp()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stricmp-wcsicmp?view=vs-2019) (case sensitive string handling), [`itoa()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/itoa-itow?view=vs-2019) (integer to string conversion)</del>,
a very famous [`kbhit()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/posix-kbhit?view=vs-2019) (check for keystroke at console[<sup>0</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-1.md)), 
<del>fopen()-mode-strings like `"rt"`, `"wt"` (textmode read/write, just use `"r"`, `"w"` instead)</del> and <del>[`open()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/open?view=vs-2019) (POSIX) are provided in various C-Library-implementations</del>, but not specified by ANSI X3.159-1989 or ISO/IEC 9899:1990, and therefore _currently not_ available in the **toro C Library**, but will be implemented [_on demand_](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand).

These functions are required to fulfill be ANSI C/C90/C95 standard:<br>
https://github.com/KilianKegel/torito-C-Library/blob/master/implemented.md

[ANSI C Specification](https://1drv.ms/b/s!AmMwYrfjYfPyhmLlWx7oT5rO6UDg?e=Am2R2v)

As long as the developer moves within these standards[<sup>1</sup>](http://www.torek.net/torek/c/index.html) and does not use
any OS-specific interface or platform dependent idiosyncrasy, the created
executable shall be producible merely by linking the object modules against **toro C Library**
and choosing the OS-dependent /ENTRY:_cdeCRT0`OSNAME`, e.g. `_cdeCRT0UefiShell` or `_cdeCRT0WinNT`.


## Approach

The C-Standards mentioned above leave some freedom for a particular library implementation;
this affects return values that provide flags beside beeing only 'nonzero' as specified
or different handling of text vs. binary mode for file operations.

C-Library vendors usually describe their own specific details, but not the Standard C requirements.
Using and relying on such implementation-specific details makes the source code non-portable
to other C-Libraries, e.g. GLIBC.

The **toro C Library** is intended to be identical in all aspects to functions specified in ANSI C, C90 and C95 provided in LIBCMT.LIB that comes with VS2022.
(It is assumed, that LIBCMT.LIB of VS2022 is compliant to aforementioned standards.)

[Microsoft C Language Reference](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2019)

Doing so, the development of **toro C Library** itself is unburdened from the exegesis of the specifications mentioned above and the creation of the required header files -- the header files delivered
with VS2022 are utilized instead.

The developer using **toro C Library** benefits from this approach because the experience remains unchanged using the VS2022 environment.

## Riding the UEFI shell / enabling the platform for developers

With the disappearance of MSDOS as a simple, single threaded, unprotected operating system with full hardware access to user programs on upcoming personal computer models the UEFI shell was intended to be the successor of MSDOS.

But the lack of an established, well known programming interface (as is the Standard C library)
makes it cumbersome to get started on UEFI Shell programming.

## Reimplementing LIBCMT.LIB for WinNT

The sole purpose of **toro C Library** for WinNT is to validate the C library compatibility
on a Windows-x64-Platform. Usually testprograms are linked once against the original LIBCMT.LIB
and then against **toro C Library** for WinNT to be able to compare program behavior in Windows.[<sup>4</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-4.md)
Most of all bugs and pitfalls can be found quickly, debugged easily and fixed soon, in the
build and debug environment of Visual Studio.

**It is considered the only effective way to reach the ANSI C compatibility and strive for a *faultless implementation*
within a reasonable amount of time, because by far most parts of each single function test can be run through, 
debugged and tested natively on the (Windows) development machine. Only final tests need to be run on the UEFI Shell target.**
This proceeding can be reached only by the [OSIF](https://github.com/KilianKegel/CdePkg/blob/master/README.md#interface-architecture) (Operating System Interface) architecture of the library.

## HELLO is now WELCOME

```c
//
// WELCOME.c
//
#include <stdio.h>

int main(int argc, char **argv){

    printf("WELCOME, to ANSI C\n");

    return 0;
}
```

WELCOME.c can be translated in the VS2022 64Bit command line environment by running the [build.bat](https://github.com/KilianKegel/torito-C-Library/blob/master/build.bat) script below:

```bat
@echo off
echo Compiling the C source...
cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64.lib KERNEL32.LIB
```

With just one additional link-step in the above script, without re-compiling, a Windows NT executable could be created.

If you prefer to use state-of-the-art build environment **Visual Studio 2022**, please follow
the step-by-step-configuration [HowTo-configure-VS2022-to-build-.EFI-executables](https://github.com/KilianKegel/HowTo-configure-VS2022-to-build-.EFI-executables#howto-configure-vs2022-to-build-efi-executables)

To run **Visual Studio 2022** .EFI samples, check out [Visual-ANSI-C-for-UEFI-Shell](https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell#visual-ansi-c-for-uefi-shell).

## Implementation Status
<table>
<tr> <th colspan="2">Diagnostics < assert.h ></th>                                                                                                                       
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/assert_h/_wassert.c">void _wassert (const wchar_t *,const wchar_t *,unsigned)</a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/assert-macro-assert-wassert">C90, MSFT implementation for assert macro</a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Character handling < ctype.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isalnum.c">  int isalnum(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalnum-iswalnum-isalnum-l-iswalnum-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isalpha.c">  int isalpha(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalpha-iswalpha-isalpha-l-iswalpha-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/iscntrl.c">  int iscntrl(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/iscntrl-iswcntrl-iscntrl-l-iswcntrl-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isdigit.c">  int isdigit(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isdigit-iswdigit-isdigit-l-iswdigit-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isgraph.c">  int isgraph(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isgraph-iswgraph-isgraph-l-iswgraph-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/islower.c">  int islower(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/islower-iswlower-islower-l-iswlower-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isprint.c">  int isprint(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isprint-iswprint-isprint-l-iswprint-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/ispunct.c">  int ispunct(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ispunct-iswpunct-ispunct-l-iswpunct-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isspace.c">  int isspace(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isspace-iswspace-isspace-l-iswspace-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isupper.c">  int isupper(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isupper-isupper-l-iswupper-iswupper-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isxdigit.c"> int isxdigit(int)   </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isxdigit-iswxdigit-isxdigit-l-iswxdigit-l?view=vs-2019">      C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/tolower.c">  int tolower(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tolower-tolower-towlower-tolower-l-towlower-l?view=vs-2019">  C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/toupper.c">  int toupper(int)    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/toupper-toupper-towupper-toupper-l-towupper-l?view=vs-2019">  C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Errors < errno.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/errno_h/errno.c">int *_errno(void)</a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/errno-doserrno-sys-errlist-and-sys-nerr?view=vs-2019">C90, MSFT implementation for errno macro</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">Format conversion of integer types < inttypes.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/strtoimax.c">intmax_t strtoimax(const char* strSource,char** endptr,int base)</a></td>          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/strtoumax.c">uintmax_t strtoumax(const char* strSource, char** endptr, int base)</a></td>       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/wcstoimax.c">intmax_t wcstoimax(const wchar_t* strSource,wchar_t** endptr,int base)</a></td>    <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/wcstoumax.c">uintmax_t wcstoumax(const wchar_t* strSource, wchar_t** endptr, int base)</a></td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Localization < locale.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/locale_h/localeconv.c" >struct lconv *localeconv(void)                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/localeconv?view=vs-2019"          >C90, is implemented (C-locale)</a></td>     <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/locale_h/setlocale.c">char *setlocale(int category, const char *locale)  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setlocale-wsetlocale?view=vs-2019">C90, is implemented (C-locale)</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Nonlocal jumps < setjmp.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/setjmp_h/longjmp64CDEINTRINABI.asm">void longjmp(jmp_buf env, int val)  </a></td>    <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/longjmp?view=vs-2019">C90, is implemented        </a></td>                                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/setjmp_h/setjmp64CDEINTRINABI.asm"> int setjmp(jmp_buf env)             </a></td>    <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setjmp?view=vs-2019"> C90, _setjmp is implemented</a></td>                                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Signal handling < signal.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/signal_h/raise.c"    >int raise(int sig)                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/raise?view=vs-2019"   >C90, is implemented</a></td>                            <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/signal_h/signal.c"   >void (*signal(int sig, void (*func)(int)))(int)      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/signal?view=vs-2019"  >C90, is implemented</a></td>                            <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">Input/output < stdio.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/clearerr.c   ">void clearerr(FILE *stream)                                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/clearerr?view=vs-2019                                                 ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fclose.c     ">int fclose(FILE *stream)                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fclose-fcloseall?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Feof.c       ">int feof(FILE *stream)                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/feof?view=vs-2019                                                     ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ferror.c     ">int ferror(FILE *stream)                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ferror?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fflush.c     ">int fflush(FILE *stream)                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fflush?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgetc.c      ">int fgetc(FILE *stream)                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgetpos.c    ">int fgetpos(FILE * stream,fpos_t * pos)                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetpos?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgets.c      ">char *fgets(char * s, int n,FILE * stream)                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgets-fgetws?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fopen.c      ">FILE *fopen(const char * filename,const char * mode)                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fopen-wfopen?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fprintf.c    ">int fprintf(FILE * stream,const char * format, ...)                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fprintf-fprintf-l-fwprintf-fwprintf-l?view=vs-2019                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fputc.c      ">int fputc(int c, FILE *stream)                                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputc-fputwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fputs.c      ">int fputs(const char * s,FILE * stream)                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputs-fputws?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fread.c      ">size_t fread(void * ptr,size_t size, size_t nmemb,FILE * stream)                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fread?view=vs-2019                                                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Freopen.c    ">FILE *freopen(const char * filename,const char * mode,FILE * stream)                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/freopen-wfreopen?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fscanf.c     ">int fscanf(FILE * stream,const char * format, ...)                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fscanf-fscanf-l-fwscanf-fwscanf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fseek.c      ">int fseek(FILE *stream, long int offset, int whence)                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/fseek-lseek-constants?view=vs-2019                                              ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fsetpos.c    ">int fsetpos(FILE *stream, const fpos_t *pos)                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fsetpos?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ftell.c      ">long int ftell(FILE *stream)                                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ftell-ftelli64?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fwrite.c     ">size_t fwrite(const void * ptr,size_t size, size_t nmemb,FILE * stream)                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fwrite?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Getc.c       ">int getc(FILE *stream)                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Getchar.c    ">int getchar(void)                                                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getchar-getwchar?view=msvc-160                                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Gets.c       ">char *gets(char *s)                                                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/gets-getws?view=vs-2019                                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Perror.c     ">void perror(const char *s)                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/perror-wperror?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Printf.c     ">int printf(const char * format, ...)                                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Putc.c       ">int putc(int c, FILE *stream)                                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putc-putwc?view=vs-2019                                               ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Putchar.c    ">int putchar(int c)                                                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putchar-putwchar?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Puts.c       ">int puts(const char *s)                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/puts-putws?view=vs-2019                                               ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Remove.c     ">int remove(const char *filename)                                                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/remove-wremove?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Rename.c     ">int rename(const char *old, const char *new)                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rename-wrename?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Rewind.c     ">void rewind(FILE *stream)                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rewind?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Scanf.c      ">int scanf(const char * format, ...)                                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l?view=vs-2019                            ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Setbuf.c     ">void setbuf(FILE * stream,char * buf)                                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setbuf?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Setvbuf.c    ">int setvbuf(FILE * stream,char * buf,int mode, size_t size)                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setvbuf?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Snprintf.c   ">int snprintf(char * s, size_t n,const char * format, ...)                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/snprintf-snprintf-snprintf-l-snwprintf-snwprintf-l?view=vs-2019       ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Sprintf.c    ">int sprintf(char * s,const char * format, ...)                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sprintf-sprintf-l-swprintf-swprintf-l-swprintf-l?view=vs-2019         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Sscanf.c     ">int sscanf(const char * s,const char * format, ...)                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sscanf-sscanf-l-swscanf-swscanf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Tmpfile.c    ">FILE *tmpfile(void)                                                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tmpfile?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Tmpnam.c     ">char *tmpnam(char *s)                                                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tempnam-wtempnam-tmpnam-wtmpnam?view=vs-2019                          ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ungetc.c     ">int ungetc(int c, FILE *stream)                                                           </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ungetc-ungetwc?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vfprintf.c   ">int vfprintf(FILE * stream,const char * format, va_list arg)                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfprintf-vfprintf-l-vfwprintf-vfwprintf-l?view=vs-2019                ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vfscanf.c    ">int vfscanf(FILE * stream,const char * format, va_list arg)                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfscanf-vfwscanf?view=vs-2019                                         ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vprintf.c    ">int vprintf(const char * format, va_list arg)                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vprintf-vprintf-l-vwprintf-vwprintf-l?view=vs-2019                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vscanf.c     ">int vscanf(const char * format, va_list arg)                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vscanf-vwscanf?view=vs-2019                                           ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsnprintf.c  ">int vsnprintf(char * s, size_t n,const char * format, va_list arg)                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsnprintf-vsnprintf-vsnprintf-l-vsnwprintf-vsnwprintf-l?view=vs-2019  ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsnwprintf.c">int _vsnwprintf(wchar_t* pszDest, size_t dwCount, const wchar_t* pszFormat, va_list ap)   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsnprintf-vsnprintf-vsnprintf-l-vsnwprintf-vsnwprintf-l?view=vs-2019  ">MSFT specific, is implemented  </a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsprintf.c   ">int vsprintf(char * s,const char * format, va_list arg)                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsprintf-vsprintf-l-vswprintf-vswprintf-l-vswprintf-l?view=vs-2019    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsscanf.c    ">int vsscanf(const char * s,const char * format, va_list arg)                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsscanf-vswscanf?view=vs-2019                                         ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">String handling < string.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrDup.c           ">char *_strdup(const char *strSource)                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strdup-wcsdup-mbsdup?view=msvc-160                                    ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrICmp.c          ">int _stricmp(const char *string1, const char *string2)                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stricmp-wcsicmp-mbsicmp-stricmp-l-wcsicmp-l-mbsicmp-l?view=msvc-160   ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrNICmp.c         ">int _strnicmp(const char* pszDst, const char* pszSrc, size_t count)               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strnicmp-wcsnicmp-mbsnicmp-strnicmp-l-wcsnicmp-l-mbsnicmp-l           ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemChr.c            ">void *memchr(const void *s, int c, size_t n)                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memchr-wmemchr?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemCmp.c            ">int memcmp(const void *s1, const void *s2, size_t n)                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcmp-wmemcmp?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemCpy.c            ">void *memcpy(void *  s1,const void *  s2, size_t n)                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcpy-wmemcpy?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemMove.c           ">void *memmove(void *s1, const void *s2, size_t n)                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memmove-wmemmove?view=vs-2019                                         ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemSet.c            ">void *memset(void *s, int c, size_t n)                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memset-wmemset?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCat.c            ">char *strcat(char *  s1,const char *  s2)                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcat-wcscat-mbscat?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrChr.c            ">char *strchr(const char *s, int c)                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strchr-wcschr-mbschr-mbschr-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCmp.c            ">int strcmp(const char *s1, const char *s2)                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcmp-wcscmp-mbscmp?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrColl.c           ">int strcoll(const char *s1, const char *s2)                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcoll-wcscoll-mbscoll-strcoll-l-wcscoll-l-mbscoll-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCpy.c            ">char *strcpy(char *  s1,const char *  s2)                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcpy-wcscpy-mbscpy?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCSpn.c           ">size_t strcspn(const char *s1, const char *s2)                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcspn-wcscspn-mbscspn-mbscspn-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrError.c          ">char *strerror(int errnum)                                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strerror-strerror-wcserror-wcserror?view=vs-2019                      ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrLen.c            ">size_t strlen(const char *s)                                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strlen-wcslen-mbslen-mbslen-l-mbstrlen-mbstrlen-l?view=vs-2019        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCat.c           ">char *strncat(char *  s1,const char *  s2, size_t n)                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncat-strncat-l-wcsncat-wcsncat-l-mbsncat-mbsncat-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCmp.c           ">int strncmp(const char *s1, const char *s2, size_t n)                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncmp-wcsncmp-mbsncmp-mbsncmp-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCpy.c           ">char *strncpy(char *  s1,const char *  s2, size_t n)                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncpy-strncpy-l-wcsncpy-wcsncpy-l-mbsncpy-mbsncpy-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrPbrk.c           ">char *strpbrk(const char *s1, const char *s2)                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strpbrk-wcspbrk-mbspbrk-mbspbrk-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrRChr.c           ">char *strchr(const char *s, int c)                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strrchr-wcsrchr-mbsrchr-mbsrchr-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrSpn.c            ">size_t strspn(const char *s1, const char *s2)                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strspn-wcsspn-mbsspn-mbsspn-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrStr.c            ">char *strstr(const char *s1, const char *s2)                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strstr-wcsstr-mbsstr-mbsstr-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrTok.c            ">char *strtok(char *  s1,const char *  s2)                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtok-strtok-l-wcstok-wcstok-l-mbstok-mbstok-l?view=vs-2019          ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/Strxfrm.c           ">size_t strxfrm(char *  s1,const char *  s2, size_t n)                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strxfrm-wcsxfrm-strxfrm-l-wcsxfrm-l?view=vs-2019                      ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Date and time < time.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/asctime.c             ">char *asctime(const struct tm *timeptr)                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/asctime-wasctime?view=vs-2019                                 ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/clock.c               ">clock_t clock(void)                                                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/clock?view=vs-2019                                            ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/ctime.c               ">char *ctime(const time_t *timer)                                                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ctime-ctime32-ctime64-wctime-wctime32-wctime64?view=vs-2019   ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/difftime.c            ">double difftime(time_t time1, time_t time0)                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/difftime-difftime32-difftime64?view=vs-2019                   ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/gmtime.c              ">struct tm *gmtime(const time_t *timer)                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/gmtime-gmtime32-gmtime64?view=vs-2019                         ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/localtime.c           ">struct tm *localtime(const time_t *timer)                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/localtime-localtime32-localtime64?view=vs-2019                ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/mktime.c              ">time_t mktime(struct tm *timeptr)                                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mktime-mktime32-mktime64?view=vs-2019                         ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/strftime.c            ">size_t strftime(char *  s,size_t maxsize,const char *  format,const struct tm *  timeptr) </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strftime-wcsftime-strftime-l-wcsftime-l?view=vs-2019          ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/time.c                ">time_t time(time_t *timer)                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/time-time32-time64?view=vs-2019                               ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Extended multibyte/wide character utilities < wchar.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/btowc.c      ">wint_t btowc(int c)                                                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/btowc                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/cstod.c      ">double wcstod(const wchar_t *  nptr,wchar_t **  endptr)                                           </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtod-strtod-l-wcstod-wcstod-l                                      ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fgetwc.c     ">wint_t fgetwc(FILE *stream)                                                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fgetws.c     ">wchar_t *fgetws(wchar_t *  s, int n,FILE *  stream)                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgets-fgetws                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fputwc.c     ">wint_t fputwc(wchar_t c, FILE *stream)                                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputc-fputwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fputws.c     ">int fputws(const wchar_t *  s,FILE *  stream)                                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputs-fputws                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwide.c      ">int fwide(FILE *stream, int mode)                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fwide                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwprintf.c   ">int fwprintf(FILE *  stream,const wchar_t *  format, ...)                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fprintf-fprintf-l-fwprintf-fwprintf-l                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwscanf.c    ">int fwscanf(FILE *  stream,const wchar_t *  format, ...)                                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fscanf-fscanf-l-fwscanf-fwscanf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Getwc.c      ">wint_t getwc(FILE *stream)                                                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Getwchar.c   ">wint_t getwchar(void)                                                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getchar-getwchar                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbrlen.c     ">size_t mbrlen(const char *  s, size_t n,mbstate_t *  ps)                                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbrlen                                                               ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbrtowc.c    ">size_t mbrtowc(wchar_t *  pwc,const char *  s, size_t n,mbstate_t *  ps)                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbrtowc                                                              ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbsinit.c    ">int mbsinit(const mbstate_t *ps)                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbsinit                                                              ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbsrtowcs.c  ">size_t mbsrtowcs(wchar_t *  dst,const char **  src, size_t len,mbstate_t *  ps)                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbsrtowcs                                                            ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Putwc.c      ">wint_t putwc(wchar_t c, FILE *stream)                                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putc-putwc                                                           ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Putwchar.c   ">wint_t putwchar(wchar_t c)                                                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putchar-putwchar                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Swprintf.c   ">int swprintf(wchar_t *  s, size_t n,const wchar_t *  format, ...)                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sprintf-sprintf-l-swprintf-swprintf-l-swprintf-l                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Swscanf.c    ">int swscanf(const wchar_t *  s,const wchar_t *  format, ...)                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sscanf-sscanf-l-swscanf-swscanf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Ungetwc.c    ">wint_t ungetwc(wint_t c, FILE *stream)                                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ungetc-ungetwc                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vfwprintf.c  ">int vfwprintf(FILE *  stream,const wchar_t *  format, va_list arg)                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfprintf-vfprintf-l-vfwprintf-vfwprintf-l                            ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vfwscanf.c   ">int vfwscanf(FILE *stream, const wchar_t *format, va_list argptr)                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfscanf-vfwscanf?view=msvc-170                                       ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vswprintf.c  ">int vswprintf(wchar_t *  s, size_t n,const wchar_t *  format, va_list arg)                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsprintf-vsprintf-l-vswprintf-vswprintf-l-vswprintf-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vswscanf.c   ">int vswscanf(const wchar_t *buffer, const wchar_t *format, va_list arglist)                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsscanf-vswscanf?view=msvc-170                                       ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vwprintf.c   ">int vwprintf(const wchar_t *  format,va_list arg)                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vprintf-vprintf-l-vwprintf-vwprintf-l                                ">C95, is implemented</a></td>           <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcrtomb.c    ">size_t wcrtomb(char *  s, wchar_t wc,mbstate_t *  ps)                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcrtomb                                                              ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCat.c     ">wchar_t *wcscat(wchar_t *  s1,const wchar_t *  s2)                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcat-wcscat-mbscat                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsChr.c     ">wchar_t *wcschr(const wchar_t *s, wchar_t c)                                                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strchr-wcschr-mbschr-mbschr-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCmp.c     ">int wcscmp(const wchar_t *s1, const wchar_t *s2)                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcmp-wcscmp-mbscmp                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsColl.c    ">int wcscoll(const wchar_t *s1, const wchar_t *s2)                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcoll-wcscoll-mbscoll-strcoll-l-wcscoll-l-mbscoll-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCSpn.c    ">size_t wcscspn(const wchar_t *s1, const wchar_t *s2)                                              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcspn-wcscspn-mbscspn-mbscspn-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcsftime.c   ">size_t wcsftime(wchar_t *  s, size_t maxsize,const wchar_t *  format,const struct tm *  timeptr)  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strftime-wcsftime-strftime-l-wcsftime-l                              ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsLen.c     ">size_t wcslen(const wchar_t *s)                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strlen-wcslen-mbslen-mbslen-l-mbstrlen-mbstrlen-l                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCat.c    ">wchar_t *wcsncat(wchar_t *  s1,const wchar_t *  s2, size_t n)                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncat-strncat-l-wcsncat-wcsncat-l-mbsncat-mbsncat-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCmp.c    ">int wcsncmp(const wchar_t *s1, const wchar_t *s2,size_t n)                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncmp-wcsncmp-mbsncmp-mbsncmp-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCpy.c    ">wchar_t *wcsncpy(wchar_t *  s1,const wchar_t *  s2, size_t n)                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncpy-strncpy-l-wcsncpy-wcsncpy-l-mbsncpy-mbsncpy-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNICmp.c   ">int wcsnicmp(const wchar_t *s1, const wchar_t *s2,size_t n)                                       </a></td><td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/strnicmp-wcsnicmp-mbsnicmp-strnicmp-l-wcsnicmp-l-mbsnicmp-l         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsPbrk.c    ">wchar_t *wcspbrk(const wchar_t *s1, const wchar_t *s2)                                            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strpbrk-wcspbrk-mbspbrk-mbspbrk-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsPpy.c     ">wchar_t *wcscpy(wchar_t *  s1,const wchar_t *  s2)                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcpy-wcscpy-mbscpy                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsRChr.c    ">wchar_t *wcsrchr(const wchar_t *s, wchar_t c)                                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strrchr-wcsrchr-mbsrchr-mbsrchr-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcsrtombs.c  ">size_t wcsrtombs(char *  dst,const wchar_t **  src, size_t len,mbstate_t *  ps)                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcsrtombs                                                            ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsSpn.c     ">size_t wcsspn(const wchar_t *s1, const wchar_t *s2)                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strspn-wcsspn-mbsspn-mbsspn-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsStr.c     ">wchar_t *wcsstr(const wchar_t *s1, const wchar_t *s2)                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strstr-wcsstr-mbsstr-mbsstr-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsTok.c     ">wchar_t *wcstok(wchar_t *  s1,const wchar_t *  s2,wchar_t **  ptr)                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtok-strtok-l-wcstok-wcstok-l-mbstok-mbstok-l                      ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstol.c     ">long int wcstol(const wchar_t *  nptr,wchar_t **  endptr, int base)                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtol-wcstol-strtol-l-wcstol-l                                      ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoll.c    ">long long wcstoll(const wchar_t* strSource,wchar_t** endptr,int base)                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoll-strtoll-l-wcstoll-wcstoll-l?view=msvc-170                    ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoul.c    ">unsigned long int wcstoul(const wchar_t *  nptr,wchar_t **  endptr, int base)                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoul-strtoul-l-wcstoul-wcstoul-l                                  ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoull.c   ">unsigned long long wcstoull(const wchar_t* s, wchar_t** endptr, int base)                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoll-strtoll-l-wcstoll-wcstoll-l?view=msvc-170                    ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcsxfrm.c    ">size_t wcsxfrm(wchar_t *  s1,const wchar_t *  s2, size_t n)                                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strxfrm-wcsxfrm-strxfrm-l-wcsxfrm-l                                  ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wctob.c      ">int wctob(wint_t c)                                                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctob                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemChr.c    ">wchar_t *wmemchr(const wchar_t *s, wchar_t c, size_t n)                                           </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memchr-wmemchr                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemCmp.c    ">int wmemcmp(const wchar_t *s1, const wchar_t *s2,size_t n)                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcmp-wmemcmp                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemCpy.c    ">wchar_t *wmemcpy(wchar_t *  s1,const wchar_t *  s2, size_t n)                                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcpy-wmemcpy                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemMove.c   ">wchar_t *wmemmove(wchar_t *s1, const wchar_t *s2,size_t n)                                        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memmove-wmemmove                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemSet.c    ">wchar_t *wmemset(wchar_t *s, wchar_t c, size_t n)                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memset-wmemset                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wprintf.c    ">int wprintf(const wchar_t *  format, ...)                                                         </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wscanf.c     ">int wscanf(const wchar_t *  format, ...)                                                          </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l                                        ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">General utilities < stdlib.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_i64toa.c"> char* _i64toa(long long _Value, char* _Buffer, int _Radix)</a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_i64tow.c"> wchar_t* _i64tow(long long _Value, wchar_t* _Buffer, int _Radix)</a></td>                                                     <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_itoa.c">   char* _itoa(int _Value, char* _Buffer, int _Radix)</a></td>                                                                   <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_itow.c">   wchar_t* _itow(int _Value, wchar_t* _Buffer, int _Radix)</a></td>                                                             <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ltoa.c">   char* _ltoa(long _Value, char* _Buffer, int _Radix)</a></td>                                                                  <td><a href="https://docs.microsoft.com/en-us/previous-versions/6y51bcy2(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ltow.c">   wchar_t* _ltow(long _Value, wchar_t* _Buffer, int _Radix)</a></td>                                                            <td><a href="https://docs.microsoft.com/en-us/previous-versions/6y51bcy2(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ui64toa.c">char* _ui64toa(unsigned long long _Value, char* _Buffer, int _Radix)</a></td>                                                 <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ultoa.c">  char* _ultoa(unsigned long _Value, char* _Buffer, int _Radix)</a></td>                                                        <td><a href="https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/d5t0h1wd(v=vs.110)                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ultow.c">  wchar_t* _ultow(unsigned long _Value, wchar_t* _Buffer, int _Radix)</a></td>                                                  <td><a href="https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/d5t0h1wd(v=vs.110)                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/abort.c">   void abort(void)</a></td>                                                                                                     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abort                                               ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Abs.c">     int abs(int j)</a></td>                                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abs-labs-llabs-abs64                                ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atexit.c">  int atexit(void (*func)(void))</a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atexit                                              ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atof.c">    double atof(const char *nptr)</a></td>                                                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atof-atof-l-wtof-wtof-l                             ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atoi.c">    int atoi(const char *nptr)</a></td>                                                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atoi-atoi-l-wtoi-wtoi-l                             ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atol.c">    long int atol(const char *nptr)</a></td>                                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atol-atol-l-wtol-wtol-l                             ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/bsearch.c"> void *bsearch(const void *key, const void *base,size_t nmemb, size_t size,int (*compar)(const void *, const void *))</a></td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/bsearch                                             ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Calloc.c">  void *calloc(size_t nmemb, size_t size)</a></td>                                                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/calloc?view=vs-2019                                 ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Div.c">     div_t div(int numer, int denom)</a></td>                                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/div?view=vs-2019                                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/exit.c">    void exit(int status)</a></td>                                                                                                <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/exit-exit-exit?view=vs-2019                         ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Free.c">    void free(void *ptr)</a></td>                                                                                                 <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/free?view=vs-2019                                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/getenv.c">  char *getenv(const char *name)</a>                                                                                      </td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getenv-wgetenv?view=vs-2019                         ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Labs.c">    long int labs(long int j)</a></td>                                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abs-labs-llabs-abs64?view=vs-2019                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Ldiv.c">    ldiv_t ldiv(long int numer, long int denom)</a></td>                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/div?view=vs-2019                                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Malloc.c">  void *malloc(size_t size)</a></td>                                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/malloc?view=vs-2019                                 ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mblen.c">   int mblen(const char *s, size_t n)</a></td>                                                                                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbclen-mblen-mblen-l?view=vs-2019                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mbstowcs.c">size_t mbstowcs(wchar_t *  pwcs,const char *  s, size_t n)</a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbstowcs-mbstowcs-l?view=vs-2019                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mbtowc.c">  int mbtowc(wchar_t *  pwc,const char *  s, size_t n)</a></td>                                                                 <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbtowc-mbtowc-l?view=vs-2019                        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Qsort.c">   void qsort(void *base, size_t nmemb, size_t size,int (*compar)(const void *, const void *))</a></td>                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/qsort?view=vs-2019                                  ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/rand.c">    int rand(void)</a></td>                                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rand?view=vs-2019                                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Realloc.c"> void *realloc(void *ptr, size_t size)</a></td>                                                                                <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/realloc?view=vs-2019                                ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/srand.c">   void srand(unsigned int seed)</a></td>                                                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/srand?view=vs-2019                                  ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtod.c">  double strtod(const char *  nptr,char **  endptr)</a></td>                                                                    <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtod-strtod-l-wcstod-wcstod-l?view=vs-2019        ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtol.c">  long int strtol(const char *  nptr,char **  endptr, int base)</a></td>                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtol-wcstol-strtol-l-wcstol-l?view=vs-2019        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtoul.c"> unsigned long int strtoul(const char *  nptr,char **  endptr, int base)</a></td>                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoul-strtoul-l-wcstoul-wcstoul-l?view=vs-2019    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/system.c">  int system(const char *string)</a>                                                                                      </td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/system-wsystem?view=vs-2019                         ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/wcstombs.c">size_t wcstombs(char *  s,const wchar_t *  pwcs, size_t n)</a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcstombs-wcstombs-l?view=vs-2019                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/wctomb.c">  int wctomb(char *s, wchar_t wchar)</a></td>                                                                                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctomb-wctomb-l?view=vs-2019                        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">Wide character classification and mapping utilities < wctype.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
		    <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswalnum.c  ">int iswalnum(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalnum-iswalnum-isalnum-l-iswalnum-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswalpha.c  ">int iswalpha(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalpha-iswalpha-isalpha-l-iswalpha-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswblank.c  ">int iswblank(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isblank-iswblank-isblank-l-iswblank-l         ">C99, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswcntrl.c  ">int iswcntrl(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/iscntrl-iswcntrl-iscntrl-l-iswcntrl-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswctype.c  ">int iswctype(wint_t wc, wctype_t desc)</a></td>                                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isctype-iswctype-isctype-l-iswctype-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswdigit.c  ">int iswdigit(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isdigit-iswdigit-isdigit-l-iswdigit-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswgraph.c  ">int iswgraph(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isgraph-iswgraph-isgraph-l-iswgraph-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswlower.c  ">int iswlower(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/islower-iswlower-islower-l-iswlower-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswprint.c  ">int iswprint(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isprint-iswprint-isprint-l-iswprint-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswpunct.c  ">int iswpunct(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ispunct-iswpunct-ispunct-l-iswpunct-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswspace.c  ">int iswspace(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isspace-iswspace-isspace-l-iswspace-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswupper.c  ">int iswupper(wint_t wc)</a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isupper-isupper-l-iswupper-iswupper-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswxdigit.c ">int iswxdigit(wint_t wc)</a></td>                                                                                         <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isxdigit-iswxdigit-isxdigit-l-iswxdigit-l     ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towctrans.c ">wint_t towctrans(wint_t wc, wctrans_t desc)</a></td>                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/towctrans                                     ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towlower.c  ">wint_t towlower(wint_t wc)</a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tolower-tolower-towlower-tolower-l-towlower-l ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towupper.c  ">wint_t towupper(wint_t wc)</a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/toupper-toupper-towupper-toupper-l-towupper-l ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/wctrans.c   ">wctrans_t wctrans(const char *property)</a></td>                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctrans                                       ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/wctype.c    ">wctype_t wctype(const char *property)</a></td>                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctype                                        ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">mathematical functions< math.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/acos.c    ">double acos(double x)</a>                         </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/acos-acosf-acosl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/asin.c    ">double asin(double x)</a>                         </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/asin-asinf-asinl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/atan.c    ">double atan(double x)</a>                         </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atan-atanf-atanl-atan2-atan2f-atan2l  ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/atan2.c   ">double atan2(double x, double y)</a>              </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atan-atanf-atanl-atan2-atan2f-atan2l  ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/ceil.c    ">double ceil(double x)</a></td>                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ceil-ceilf-ceill                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/cos.c     ">double cos(double x)</a>                          </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/acos-acosf-acosl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/cosh.c    ">double cosh(double x)</a>                         </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/cosh-coshf-coshl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/exp.c     ">double exp(double x)</a>                          </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/exp-expf                              ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/fabs.c    ">double fabs(double x)</a></td>                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fabs-fabsf-fabsl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/floor.c   ">double floor(double x)</a></td>                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/floor-floorf-floorl                   ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/fmod.c    ">double fmod(double x, double y)</a></td>                  <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fmod-fmodf                            ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/frexp.c   ">double frexp(double value, int *exp)</a></td>             <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/frexp                                 ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/ldexp.c   ">double ldexp(double value, int exp)</a></td>              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ldexp                                 ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/log.c     ">double log(double value)</a></td>                         <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/log-logf-log10-log10f                 ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/log10.c   ">double log10(double value)</a></td>                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/log-logf-log10-log10f                 ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/modf.c    ">double modf(double value, double *iptr)</a></td>          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/modf-modff-modfl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/pow.c     ">double pow(double x, double y)</a></td>                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/pow-powf-powl                         ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sin.c     ">double sin(double x)</a>                          </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sin-sinf-sinl                         ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sinh.c    ">double sinh(double x)</a>                         </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sinh-sinhf-sinhl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sqrt.c    ">double sqrt(double x)</a></td>                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sqrt-sqrtf-sqrtl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/tan.c     ">double tan(double x)</a>                          </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tan-tanf-tanl                         ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/tan.c     ">double tan(double x)</a>                          </td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tanh-tanhf-tanhl                      ">C90, is not yet implemented</a></td>         <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">non-C-Standard and Microsoft specific functions< io.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_isatty.c       ">int _isatty( int fd );</a></td>                                                       <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/isatty               ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findfirst.c    ">intptr_t _findfirst(const char *filespec, struct _finddata_t *fileinfo)</a></td>      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findfirst-functions   ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findnext.c     ">int _findnext(intptr_t handle,struct _finddata_t *fileinfo)</a></td>                  <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findnext-functions    ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findclose.c    ">int _findclose(intptr_t handle)</a></td>                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findclose             ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">non-C-Standard and Microsoft specific functions< direct.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/direct_h/_mkdir.c">int _mkdir(const char *dirname)</a></td>              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mkdir-wmkdir              ">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">non-C-Standard and Microsoft specific / POSIX functions< sys/stat.h ></th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40">SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> DXE </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/sys/stat_h/_stat64i32.c">int _stat64i32(const char *path, struct _stat64i32 *buffer)</a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stat-functions">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
</table>

## Known bugs
* printf()-family's format specifiers e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md) not yet implemented
* scanf()-family's format specifiers <del>[],p</del>,e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md),C,S not yet implemented
* 20181129: <del>file operations does not yet support drive mappings and path</del>
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters aâz or AâZ representing digits in the range [10, 36] are not (yet) supported.</del>
* <time.h>: UTC-only support. No Daylightsaving, no timezones.
* <locale.h>: C-locale-only support
* <math.h> not yet implemented[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md)
* 20191017: <del>CTRL-C interception not yet implemented</del>
* 20191017: <del>**toro C Library based progams use ASCII console interface only, not UCS-2!**</del>
    - <del>ASCII is written to `stdout`and `stderr`</del>
    - <del>ASCII is read from `stdin`</del>
    <del>pay attention when dealing with `>`, `<`, `|` and `>a`, `<a`, `|a` shell operators</del>

### non-Standard C90/C95 functions that will be implemented _on demand_
* [`kbhit()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/posix-kbhit)
* <del>[`strnlen()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strnlen-strnlen-s)</del>
* <del>[`_ltoa()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/itoa-itow?view=msvc-160)</del>

## Revision history
### 20230415
* fixed: in the pre-Memory-Discovered PEI (Pre Efi Initialization) POST x86-32
  Standard C function `localeconv()` crashed the platform.<br>
  NOTE: All x86-64 operation modes (UEFI Shell, UEFI SMM, UEFI DXE, Windows NT)
  and post-Memory-Discovered PEI (Pre Efi Initialization) x86-32 was not affected by that bug.
### 20230409
NOTE: This release **20230409** doesn't change UEFI Shell programs behavior<br>
The improvements provided here only affects PEI drivers, based on **toro C Library**/[**CdePkg**](https://github.com/KilianKegel/CdePkg#cdepkg) listed below:
* add [Memory Discovered](https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf#page=111) handling for PEIM (Pre-EFI Initialization Module)
    * restart memory management when switching from CAR (Cash As RAM) to permanent memory
    * reassign `CDE_SERVICES` pointer when switching from CAR (Cash As RAM) to permanent memory
* support of multi-invocation of `CdePkg`-based PEIM
    * NOTE: Each `CdePkg`-based PEIM needs a small, read-/writeable, dedicated static duration to provide
      Standard C Library compliance (e.g. to hold `atexit()`-registered function pointers, the internal `strtok()`pointer, the `rand()` next, the jump buffer,
      the I/O buffer for `stdin`, `stdout` and `stderr` ...).
      
      Internally this is provided in the HOB storage area and holds a `CDE_APP_IF` protocol registered with the driver specific `gEfiCallerIdGuid`.
      HOB storage is available early in POST in PEI (Pre-EFI Initialization).

      Once a PEIM is started multiple times, only the first instance static duration will be reinitialized with current `EFI_PEI_FILE_HANDLE`,
      `EFI_PEI_SERVICES` and the current `CDE_SERVICES` pointer.

      This proceeding prevents `LocatePpi()` to return an invalid pointer to the first instance, while a second instance is currently active.
      
* improve **`CDEABI`** (*C Development Environment Application Binary Interface*), used as **collision avoidance** with EDK2 `StdLibC` and relatives<br>
  **NOTE: In real-world UEFI implementations various components provide [*"reduced"*](https://github.com/tianocore/edk2/blob/master/CryptoPkg/Library/BaseCryptLib/SysCall/CrtWrapper.c#L603)(*mildly put*)
  Standard C Interface just fitting the requirements of that particular package (`CryptoPkg`, `RedfishPkg`).**<br>
   
  To avoid symbol double definitions at link time or link order failures with EDK2 `StdLibC`, **`CDEABI`**:<br>
    * provides Standard C Functions in their `__declspec(dllimport)` incarnation only
    * except for Microsoft compiler intrinsics `__cdecl memset()` and `__cdecl memcmp()` that are paired with the its `__declsspec(dllimport)` counterpart in the same COMDAT (same .OBJ module)
### 20230304
* fixed `strtok()`, `wcstok()`
### 20230212
* introduce **`CDEABI`**, an additional application binary interface ABI to ease coexistance of `CdePkg` based BIOS 
    drivers with incomplete [tianocore EDK2](https://github.com/tianocore/edk2) `C Library` 
    [fragments](https://github.com/tianocore/edk2/blob/master/CryptoPkg/Library/BaseCryptLib/SysCall/CrtWrapper.c#L603)

    NOTE: **`CDEABI`** uses the Microsoft DLL interface [`__declspec(dllimport)`](https://learn.microsoft.com/en-us/cpp/build/importing-into-an-application-using-declspec-dllimport?view=msvc-170) for EDK2-built drivers .
    Technically this uses *indirect function calls* on machine code level.
* promote `CDETRACE()`, remove former, alternate trace method (`CDEMOFINE()`) completely
### 20230104
* fixed `strftime()` parameter: `%I`, `%m`, `%x`
### 20230103
* add Microsoft/POSIX C Library functions: 
    - `_isatty()`
* imitate funny/buggy Microsoft behaviour for `fopen()` with `fmode` parameter `w+` or `a`:<br>
  function terminates successfully with `errno` set to 22, `Invalid argument`
* imitate funny/buggy Microsoft behaviour for `_fileno()` with invalid filepointer:<br>
  MSFT: `_fileno(-1)` just crashes by an invalid memory access<br>
  This behaviour is imitated by an `exit(3)` invocation
* fixed application crash at termination when a redirected I/O stream `STDERR` is reopened with `reopen()`
* improve existing invalidate parameter handling; enable file name string, function name string, line number string and expression string
  at RELEASE runtime  
  NOTE: Microsoft enables this feature only when using DEBUG version of LIBCMT.LIB.
### 20221022
* add O_TEMPORARY support to Microsoft/POSIX _open()
* fixed "fall time bug" (autumn). Broken time calculation on 
  two digit month number (Oct, Nov, Dec).
### 20220731
* add Standard C90 Library functions: 
    - `wcstoul()`
    - `wcstol()`
* add Standard C99 Library functions: 
    - `strtoull()`
    - `strtoll()`
    - `strtoimax()`
    - `strtoumax()`
    - `wcstoull()`
    - `wcstoll()`
    - `wcstoimax()`
    - `wcstoumax()`
* add Microsoft/POSIX C Library functions: 
    - `_ultow()`
    - `_ultoa()`
    - `_ui64tow()`
    - `_ui64toa()`
    - `_ltow()`
    - `_ltoa()`
    - `_itow()`
    - `_itoa()`
    - `_i64tow()`
    - `_i64toa()`
* implement full `__chkstk()` for Windows 32Bit: https://docs.microsoft.com/en-us/windows/win32/devnotes/-win32-chkstk
* fixed stdout/stderr redirection `>` and `>>` didn't work anymore (since `20220501`)
* fixed `"a"`/`O_APPEND` append file open attribute didn't work anymore (since `20220501`)
* fixed `ftell()`/`fgetpos()` reports wrong offset after writing to `"a"`/`O_APPEND` opened files

### 20220529
* fixed: `free()` and C++ operator `delete()`  crash to free `NULL` pointer

### 20220522
* add  C++ minimum support
    - `void* operator new(size_t size)`
    - `void* operator new[](size_t size)`
    - `void operator delete[](void* ptr)`
    - `void operator delete(void* ptr, unsigned __int64 size)`

### 20220501
* add Microsoft/POSIX C Library functions: 
    - `_open()`
    - `_close()`
    - `_read()`
    - `_write()`
    - `_fdopen()`
    - `_fileno()`
    - `_wfopen()`
    - `_fseeki64()`
    - `_ftelli64()`
* fixed `errno` values for file position functions with negative offsets (`fsetpos()`, `fseek()`)
* fixed UEFI BUG: gap of non-initialized disk space<br>
  File positioning bug, if data written behind EOF, data range between old EOF and new data contains medium data / garbage, instead of 0
* simplify `CDETRACE()` implemantation, improve portability of that `CdePkg` specific debug macro
* add `_strefierror()`: rename Toro-C-Library UEFI-specific function `strefierror()` to ANSI C naming convention compatible `_strefierror()`
* implement full `__chkstk()` for Windows 64Bit: https://docs.microsoft.com/en-us/windows/win32/devnotes/-win32-chkstk
* partially implementation of the %G `fprintf()`-- format specifier for [Visual-LIBXLSXWRITER-for-UEFI-Shell](https://github.com/KilianKegel/Visual-LIBXLSXWRITER-for-UEFI-Shell#visual-libxlsxwriter-for-uefi-shell)
* fixed `fread()` end-of-file indicator not set correctly when EOF is reached within a buffer instead of reading of 0 bytes from the mass storage device
* changed exit code of the `abort()` function from 3 to 0xC0000409
* fixed: reassigned (by running `freopen()`) filepointers to `stdout`/`stderr` are not flushed at exit
* `CdePkg`--SMM Driver: Erroneous message shown at startup: `FATAL ERROR : CdeServices SMM not available`

### 20220109
* add Standard C Library functions: 
    - `strcoll()`
    - `strxfrm()`
    - `fgetwc()`
    - `fputwc()`
    - `fputws()`
    - `fwide()`
    - `fwprintf()`
    - `fwscanf()`
    - `getwc()`
    - `getwchar()`
    - `putwc()`
    - `putwchar()`
    - `swscanf()`
    - `ungetwc()`
    - `vfwscanf()`
    - `vswscanf()`
    - `wcscoll()`
    - `wcsxfrm()`
    - `btowc()`
* fix "BINARY MODE" for wide printf()/scanf() family functions
* imitate funny Microsoft behaviour when replacing and pushing back  -ungetc()- a character by CTRL-Z to a stream (in that case the stream *is not terminated*)
* fix fscanf() family return value for "event of an early matching failure" http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf#page=299

### 20211218
* introduce `CDETRACE()` debug/trace macro that is parameter checked at build time
* improve `wmain()` support; now selected at build time by choosing the CRT0 entry point name
    * `_cdeCRT0UefiShellW()`
    * `_cdeCRT0WinNTW()`
    NOTE: The `*env` pointer is not passed to `wmain()`

### 20211128
* fixed: UEFI Shell overwrites the last line of text of a previously terminated application with its prompt
* add: fgetws()

### 20211107
* add `wmain()` support<br>
    ATTENTION: The presence of `main()` is not detected at build time anymore, but at runtime.

### 20211031
* add Microsoft specific `fopen()` mode string modifier `"t"` for text mode
   * NOTE: `"t"` modifier is not defined by ANSI/ISO C, because binary/text mode differentiation is done by `"w"` modifier only. 
* fix `fclose()` bug in UEFI shell returns an error, when closing a read only file

### 20211010
* add Microsoft C Library functions for UEFIShell 64Bit applications only
  - `_mkdir()`
  - `_stat64i32()` that is the Microsoft version of POSIX `stat()`

  add POSIX C Library functions
  - `strnlen()`, `wcsnlen()`

### 20210912
* initial version of *TORO C LIBRARY* (`toroC64.lib` and `toroC32.lib`)
* *TORITO C LIBRARY* is _discontinued_ from now on
* add Microsoft C Library functions for UEFIShell applications only
  - `getc()`
  - `_findfirst()`
  - `_findnext()`
  - `_findclose()`

### 20210820/R166
* add Standard C Library functions 
  - `mblen()`
  - `mbstowcs()`
  - `mbtowc()`
  - `wcstombs()`
  - `wctomb()`
  - `wctob()`
  - `wmemchr()`
  - `vfwprintf()`
### 20210815/R165
* fixed time calibration issue on AMD (Ryzen7, A6)
  - on AMD systems the RTC device sporadically loses the PF (periodic interrupt)
    flag from RTC register 0x0C
  - instead PIT 8254 timer seems to be reliable on AMD and Intel platforms
### 20210808/R164
* fixed bugs related to length modifiers for string format specifiers
    - `wprintf()` with `%ls`,  `%hs` and Microsoft specific  `%S`
    - `printf()` with `%ls`,  `%hs` and Microsoft specific  `%S`
    - the string `(null)` was reported wrongly in wide format on `NULL` pointer (e.g. `wprintf()`or `%ls` modifier)
### 20200416/R159
* fixed "" at end of commandline not detected by command line parser
* fixed improved stability of TSC based TIME.H functions, improved TSC calibration
* force minimum ShellProtocol version to v2.2
* fixed Torito C Library for NT redirects STDOUT to file always beginning to file begin, instead of file end
  That overwrites a logfile used for multiple redirected traces
### 20200204/R154
* add VS2019/16.4.4 support
* update copyright
### 20191216/R152
* improve C++ global object initialization (introduced in 20181129/R116) to have full
  ANSI C library function set available during invocation of global constructors before main()
  https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/initterm-initterm-e?view=vs-2017<br>
  https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell/blob/master/welcome10/welcome10.cpp
* increase number of possible ATEXIT() registrations to 32 + 4 to allow 4 additional C++ destructor registrations
### 20191126/R149
* fixed Torito C library CRT0 for Windows NT data corruption may crash the application
* fixed functions snprintf() and vsnprintf() return value: ```number of characters that would have been written had n been sufficiently large```
### 20191111/R146
* add missing intrinsic functions _difftime64() and _gmtime64() required by Microsoft Compiler
* fixed mktime() to crash with invalid time/date before 01/01/1970 00:00:00
### 20191017/R141
* add CTRL-C support<br>
  NOTE: CTRL-C is implemented on Signal handling `<signal.h>` interface and can be catched and supressed
        by the application. https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell/blob/master/welcome9/welcome9.c
* fixed system() library function does not workaround completely fully the EfiShellProtocol->Execute() bug
  to display the drive mappings, when multipartition ("BLK10") mass storage device is attached
* implement UEFI Shell compatibility mode for STDOUT and STDERR to allow I/O redirection `>a` for ASCII and `>` for UCS-2/UTF16
* add build switch `char _gSTDOUTMode = 1;   /* 0 == UEFI Shell default, 1 == ASCII only */` to force TORITO C backward compatibility ( ASCII mode only )
* autodetect I/O redirection UTF16 vs. ASCII
### 20190918/R137
* update copyright
### 20190621/R133
* add VS2019 compatibility, remove library dependancy from compiler version
### 20190410/R126
* fixed: scanf() related functions fails to terminate tokens, e.g. sscanf("123:456","%d:%d",&n1,&n2)
* fixed: qsort() fails if number of elements (nmemb) is 0
* add _wassert() required by newer assert-macro implementations
### 20190116/R124
* fixed single '\r', ASCII 0x0D, carriage return, that appears w/o '\n', ASCII 0x0A, line feed
  in a file, opened in text mode, is handled wrongly.
  
  NOTE: ftell(), fgetpos(), fsetpos() in textmode is implemented differently.
        Unable to reimplement LIBCMT.lib bugs, when '\n' or Ctrl-Z is present in the text file<br>
        [fposbug.c](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/fposbug.c)
### 20190109/R123
* add getenv()
* add rename()
### 20181221/R122
* add <locale.h> related: setlocale(), localeconv() - supporting C-locale only
### 20181216/R119
* add missing memchr() from string.h
* add <wctype.h> related functions:
    iswalnum(), iswalpha(), iswblank(), iswcntrl(), iswctype(), 
    iswdigit(), iswgraph(), iswlower(), iswprint(), iswpunct(), 
    iswspace(), iswupper(), iswxdigit(), towctrans(), towlower(),
    towupper(), wctrans(), wctype()
### 20181129/R116
* add _initterm support, methods called internally during the initialization of a C++ program, according to 
  https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/initterm-initterm-e?view=vs-2017
* add drive and path support to fopen()
### 20181112/R110
* add %[] scanset format specifier to scanf-family
* add %p pointer format specifier to scanf-family
* fixed token count bug in scanf-family
### 20180921/R107
* add VS2017/15.8 support (Just My Code)
### 20180830/R102
* add system() library function
* improved stability of memory management
### 20180717/R101
* add qsort(), vsscanf()
* fixed calloc()
### 20180508
* added WELCOME.c sample
* added BUILD.BAT sample
### 20180411/R95
* add signal(), raise() and abort() functions[<sup>3</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-3.md)
* fixed argc/argv handling according to
  https://msdn.microsoft.com/en-us/library/a1y7w461.aspx
### 20180130/R86
* added getchar(), remove(), tmpfile(), tmpnam()
### 20180108/R85
* fixed: strol() and stroul() doesn't support base 2..36 required by the Standard C Library
* fixed: time() function N/A in Windows build
* fixed: time base in Windows build is QPC now, not TSC.
* fixed: gets() functions fails with lines starting with '\n'
### 20171105/R78
* initial revision
