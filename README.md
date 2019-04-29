# Torito C Library

The "torito C Library" is a Standard C Library for UEFI x86-64 target platform
for Microsoft Visual Studio 2017.

"torito C Library" is an implementation targeting the ANSI/ISO C Standard Library compatibility
to create applications for different operating systems using
design --and debug-- infrastructure provided by Microsoft Visual Studio 2017 VS2017.

## Goal

The "torito C Library" is designed to enable the developer to create
Standard C programs for UEFI Shell, Windows NT and Linux (in future releases)
running in x86-64 mode. Standard C compliant source code shall be easily portable to operating systems
supported by "torito C Library".

The "torito C Library" shall provide full library compatibility with

* ANSI X3.159-1989 ("ANSI C")
* ISO/IEC 9899 First edition 1990-12-15 ("C90")
* ISO/IEC 9899 First edition 1990-12-15, Amendment 1, 1995-04-01 ("C95")

### Forwards to the roots
Extentions to these standards (ISO 9899:1999 etc.), "secure" functions xxxx_s or Microsoft specific add-ons will not be implemented into "torito C Library".

Be aware, that functions like stricmp() (case sensitive string handling), itoa() (integer to string conversion)
and fopen()-mode-strings like ``` "rt"```, ``` "wt"``` (textmode read/write, just use ``` "r"```, ``` "w"``` instead)
are provided in various C-Library-implementations, but not specified by ANSI/ISO/IEC 9899:199x, and there for _not_ available in the "torito C Library".

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

The "torito C Library" is intended to be identical in all aspects to functions specified in ANSI C, C90 and C95 provided in LIBCMT.LIB that comes with VS2017.
(It is assumed, that LIBCMT.LIB of VS2017 is compliant to aforementioned standards.)

[Microsoft C Language Reference](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2019)

Doing so, the development of "torito C Library" itself is unburdened from the exegesis of the specifications mentioned above and the creation of the required header files -- the header files delivered
with VS2017 are utilized instead.

The developer using "torito C Library" benefits from this approach because the experience remains unchanged using the VS2017 environment.


## Riding the UEFI shell / enabling the platform for developers

With the disappearance of MSDOS as a simple, single threaded, unprotected operating system with full hardware access to user programs on upcoming personal computer models the UEFI shell was intended to be the successor of MSDOS.

But the lack of an established, well known programming interface (as is the Standard C library)
makes it cumbersome to get started on UEFI Shell programming.

## Reimplementing LIBCMT.LIB for WinNT

The sole purpose of "torito C Library" for WinNT is to enable DEBUG mode in VS2017 when the RELEASE target is UEFI shell or Linux (in future releases)


## HELLO is now WELCOME / *appetite for destruction*

The C beginner's sample program introduced by Brian W. Kernighan and Dennis M. Ritchie
in "THE C PROGRAMMING LANGUAGE" ("White Book C") is adjusted to today´s need to honor
the [*appetite for destruction*](https://en.wikipedia.org/wiki/Appetite_for_Destruction "") introduced 32 years ago in 1987, 2 years prior to the completion of ANSI C Standard.
Despite the fact that *appetite for destruction* was sold 30 Million times, and so became the
most successful debut album of all times, the X3J11 comittee was obviously not influenced by it, since ``` "hello, world"``` is referenced
in the Standard C specification, but ```"Welcome, to the jungle"``` is not.

Check out out what they've withheld from us: ;-) https://www.youtube.com/watch?v=o1tj2zJ2Wvg

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

WELCOME.c can be translated in the VS2017 64Bit command line environment by running the build.bat script below:

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

<https://github.com/JoaquinConoBolillo/torito-C-Library/blob/master/implemented.md>

## Known bugs

* printf()-family's format specifiers e,f,g not yet implemented
* scanf()-family's format specifiers <del>[],p</del>,e,f,g,C,S not yet implemented
* 20181129: <del>file operations does not yet support drive mappings and path</del>
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters a–z or A–Z representing digits in the range [10, 36] are not (yet) supported.</del>
* functions missing e.g. <del>system(), rename(), remove()</del>, settime(), <del>vsscanf()</del>
atof(),strtof(),strtod(),<del>getenv()</del>,bsearch(),<del>qsort()</del>,mblen(),mbtowc(),wctomb(),mbstowcs(),wcstombs(),strxfrm(),strcoll() various wide-functions introduced in C95.
* <time.h>: UTC-only support. No Daylightsaving, no timezones.
* <math.h> not yet implemented
* <locale.h>: C-locale-only support

# Revision history
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
* add signal(), raise() and abort() functions
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

