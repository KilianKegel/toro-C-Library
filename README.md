# Toro C Library (formerly known as Torito C Library)
* [Use cases](https://github.com/KilianKegel/toro-C-Library#use-cases)<br>
* [Source Code](https://github.com/KilianKegel/toro-C-Library#source-code)<br>
* [Goal](https://github.com/KilianKegel/toro-C-Library#goal)<br>
* [Approach](https://github.com/KilianKegel/toro-C-Library#approach)<br>
* [Riding the UEFI Shell](https://github.com/KilianKegel/toro-C-Library#riding-the-uefi-shell--enabling-the-platform-for-developers)<br>
* [HELLO is now WELCOME: ](https://github.com/KilianKegel/toro-C-Library#hello-is-now-welcome) Howto build **hello.c** using **commandline** and **Visual Studio 2022**<br>
* [Status](https://github.com/KilianKegel/toro-C-Library#status)<br>
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

## Status
The **toro C Library** is still in state of EVALUATION

Field tests are urgently required.

Feedback is very WELCOME.

The functions below are already implemented and carefully tested, every single one of them, except otherwise noted.

<https://github.com/KilianKegel/torito-C-Library/blob/master/implemented.md>

## Known bugs
* printf()-family's format specifiers e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md) not yet implemented
* scanf()-family's format specifiers <del>[],p</del>,e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md),C,S not yet implemented
* 20181129: <del>file operations does not yet support drive mappings and path</del>
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters a–z or A–Z representing digits in the range [10, 36] are not (yet) supported.</del>
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
* add Memory Discovered (https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf#page=111) handling for PEIM (Pre-EFI Initialization Module)
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
      
* improve `CDEABI` (*C Development Environment Application Binary Interface*), used as collision avoidance with EDK2 `StdLibC` and relatives<br>
  NOTE: In real-world UEFI implementations various components provide [*reduced*](https://github.com/tianocore/edk2/blob/master/CryptoPkg/Library/BaseCryptLib/SysCall/CrtWrapper.c#L603)
  Standard C Interface just fitting the requirements of that particular package (`CryptoPkg`, `RedfishPkg`).<br>
  To avoid symbol double definitions at link time or link order failures , `CDEABI`:<br>
    * provides Standard C Functions in their `__declspec(dllimport)` incarnation only
    * except for Microsoft compiler intrinsics `__cdecl memset()` and `__cdecl memcmp()` that are paired with the its `__declsspec(dllimport)` counterpart in the same COMDAT (same .OBJ module)
### 20230304
* fixed `strtok()`, `wcstok()`
### 20230212
* introduce `CDEABI`, an additional application binary interface ABI to ease coexistance of `CdePkg` based BIOS 
    drivers with incomplete [tianocore EDK2](https://github.com/tianocore/edk2) `C Library` 
    [fragments](https://github.com/tianocore/edk2/blob/master/CryptoPkg/Library/BaseCryptLib/SysCall/CrtWrapper.c#L603)

    NOTE: `CDEABI` uses the Microsoft DLL interface [`__declspec(dllimport)`](https://learn.microsoft.com/en-us/cpp/build/importing-into-an-application-using-declspec-dllimport?view=msvc-170) for EDK2-built drivers .
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
