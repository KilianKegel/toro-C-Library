# Torito C Library
* [Torito C Library](https://github.com/KilianKegel/torito-C-Library#torito-c-library)<br>
* [Goal](https://github.com/KilianKegel/torito-C-Library#goal)<br>
* [Approach](https://github.com/KilianKegel/torito-C-Library#approach)<br>
* [Riding the UEFI Shell](https://github.com/KilianKegel/torito-C-Library#riding-the-uefi-shell--enabling-the-platform-for-developers)<br>
* [HELLO is now WELCOME](https://github.com/KilianKegel/torito-C-Library#hello-is-now-welcome)<br>
* [Status](https://github.com/KilianKegel/torito-C-Library#status)<br>
* [Known bugs](https://github.com/KilianKegel/torito-C-Library#known-bugs)<br>
* [Revision history](https://github.com/KilianKegel/torito-C-Library#revision-history)<br>

![C](https://github.com/KilianKegel/pictures/blob/master/C.png)

The "torito C Library" is a Standard C Library for UEFI x86-64 target platform
for Microsoft Visual Studio 2019.

"torito C Library" is an implementation targeting the ANSI/ISO C Standard Library compatibility
to create applications for different operating systems using
design --and debug-- infrastructure provided by Microsoft Visual Studio 2019 VS2019.

## Goal

The "torito C Library" is designed to enable the developer to create
Standard C programs for UEFI Shell, Windows NT and Linux (in future releases)
running in x86-64 mode. Standard C compliant source code shall be easily portable to operating systems
supported by "torito C Library".

The "torito C Library" shall provide full library compatibility with

* [ANSI X3.159-1989 ("ANSI C")](https://www.pdf-archive.com/2014/10/02/ansi-iso-9899-1990-1/ansi-iso-9899-1990-1.pdf)
* ISO/IEC 9899 First edition 1990-12-15 ("C90")
* ISO/IEC 9899 First edition 1990-12-15, Amendment 1, 1995-04-01 ("C95")

### Forwards to the roots
Extentions to these standards (ISO 9899:1999 etc.), [*secure*](https://docs.microsoft.com/en-us/cpp/c-runtime-library/security-features-in-the-crt?view=vs-2019) / *bounds checking interface* functions `xyz_s()` from [ISO 9899:2011, Annex K](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf), [POSIX](https://en.wikipedia.org/wiki/C_POSIX_library) functions or  Microsoft specific add-ons will _not_ be implemented into "torito C Library".

Be aware, that functions like [`stricmp()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stricmp-wcsicmp?view=vs-2019) (case sensitive string handling), [`itoa()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/itoa-itow?view=vs-2019) (integer to string conversion),
a very famous [`kbhit()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/posix-kbhit?view=vs-2019) (check for keystroke at console[<sup>1</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-1.md)), fopen()-mode-strings like `"rt"`, `"wt"` (textmode read/write, just use `"r"`, `"w"` instead) and [`open()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/open?view=vs-2019) (POSIX) are provided in various C-Library-implementations, but not specified by ANSI X3.159-1989 or ISO/IEC 9899:1990, and there for _not_ available in the "torito C Library".

These functions are required to be ANSI C/C90/C95 standard compatible when the Microsoft C compiler:<br>
https://github.com/KilianKegel/torito-C-Library/blob/master/implemented.md

[ANSI C Specification](https://www.pdf-archive.com/2014/10/02/ansi-iso-9899-1990-1/ansi-iso-9899-1990-1.pdf)

As long as the developer moves within these standards and does not use
any OS-specific interface or platform dependent idiosyncrasy, the created
executable shall be producible merely by linking the object modules against "torito C Library"
and choosing the OS-dependent /ENTRY:_ModuleEntryPoint.


## Approach

The C-Standards mentioned above leave some freedom for a particular library implementation;
this affects return values that provide flags beside beeing only 'nonzero' as specified
or different handling of text vs. binary mode for file operations.

C-Library vendors usually describe their own specific details, but not the Standard C requirements.
Using and relying on such implementation-specific details makes the source code non-portable
to other C-Libraries, e.g. GLIBC.

The "torito C Library" is intended to be identical in all aspects to functions specified in ANSI C, C90 and C95 provided in LIBCMT.LIB that comes with VS2019.
(It is assumed, that LIBCMT.LIB of VS2019 is compliant to aforementioned standards.)

[Microsoft C Language Reference](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2019)

Doing so, the development of "torito C Library" itself is unburdened from the exegesis of the specifications mentioned above and the creation of the required header files -- the header files delivered
with VS2019 are utilized instead.

The developer using "torito C Library" benefits from this approach because the experience remains unchanged using the VS2019 environment.

## Riding the UEFI shell / enabling the platform for developers

With the disappearance of MSDOS as a simple, single threaded, unprotected operating system with full hardware access to user programs on upcoming personal computer models the UEFI shell was intended to be the successor of MSDOS.

But the lack of an established, well known programming interface (as is the Standard C library)
makes it cumbersome to get started on UEFI Shell programming.

## Reimplementing LIBCMT.LIB for WinNT

The sole purpose of "torito C Library" for WinNT is to validate the C library compatibility
on a Windows-x64-Platform. Usually testprograms are linked once against the original LIBCMT.LIB
and then against "torito C Library" for WinNT to be able to compare program behavior in Windows.[<sup>4</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-4.md)
Most of all bugs and pitfalls can be found quickly, debugged easily and fixed soon, in the
build and debug environment of Visual Studio.

## HELLO is now WELCOME

```c
//
// WELCOME.c
//
#include <stdio.h>

int main(int argc, char **argv){

    printf("WELCOME, to the jungle\n");

    return 0;
}
```

WELCOME.c can be translated in the VS2019 64Bit command line environment by running the build.bat script below:

```bat
rem ### build.bat ####################################
cl /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c
link /NODEFAULTLIB /ENTRY:_MainEntryPointShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toritoC64R.lib
```


## Status
The "torito C Library" is still in state of EVALUATION

Field tests are urgently required.

Feedback is very WELCOME.

A non-EVALUATION-library will be provided for helpful supporters for free.

The functions below are already implemented and carefully tested, every single one of them, except otherwise noted.

<https://github.com/KilianKegel/torito-C-Library/blob/master/implemented.md>

## Known bugs

* printf()-family's format specifiers e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md) not yet implemented
* scanf()-family's format specifiers <del>[],p</del>,e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md),C,S not yet implemented
* 20181129: <del>file operations does not yet support drive mappings and path</del>
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters a–z or A–Z representing digits in the range [10, 36] are not (yet) supported.</del>
* functions missing e.g. <del>system(), rename(), remove()</del>, settime(), <del>vsscanf()</del>
atof(),strtof(),strtod(),<del>getenv()</del>,bsearch(),<del>qsort()</del>,mblen(),mbtowc(),wctomb(),mbstowcs(),wcstombs(),strxfrm(),strcoll() various wide-functions introduced in C95.
* <time.h>: UTC-only support. No Daylightsaving, no timezones.
* <locale.h>: C-locale-only support
* <math.h> not yet implemented[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md)
* 20191017: <del>CTRL-C interception not yet implemented</del>
* 20191017: <del>**Torito C Library based progams use ASCII console interface only, not UCS-2!**
    - ASCII is written to `stdout`and `stderr`
    - ASCII is read from `stdin`
    pay attention when dealing with `>`, `<`, `|` and `>a`, `<a`, `|a` shell operators</del>


## Revision history
### 20191017/R141
* add CTRL-C support<br>
  NOTE: CTRL-C is implemented on Signal handling `<signal.h>` interface and can be catched and supressed
        by the application. https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell/blob/master/welcome9/welcome9.c
* fixed system() library function does not workaround completely fully the EfiShellProtocol->Execute() bug
  to display the drive mappings, when multipartition ("BLK10") mass storage device is attached
* implement UEFI Shell compatibility mode for STDOUT and STDERR to allow I/O redirection `>a` for ASCII and `>` for UCS-2/UTF16
* add build switch `char _gSTDOUTMode;   /* 0 == UEFI Shell default, 1 == ASCII only */` to force TORITO C backward compatibility ( ASCII mode only )
### 20190621/R138
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
        Unable to reimplement LIBCMT.lib bugs, when '\n' or Ctrl-Z is present in the text file
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
