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

The "torito C Library" is intended to be identical in all aspects to functions specified in ANSI C,C90 and C95 provided in LIBCMT.LIB that comes with VS2017.
(It is assumed, that LIBCMT.LIB of VS2017 is compliant to aforementioned standards.)

Doing so, the development of "torito C Library" itself is unburdened from the exegesis of the specifications mentioned above and the creation of the required header files -- the header files delivered
with VS2017 are utilized instead.

The developer using "torito C Library" benefits from this approach because the experience remains unchanged using the VS2017 environment.


## Riding the UEFI shell / enabling the platform for developers

With the disappearance of MSDOS as a simple, single threaded, unprotected operating system with full hardware access to user programs on upcoming personal computer models the UEFI shell was intended to be the successor of MSDOS.

But the lack of an established, well known programming interface (as is the Standard C library) 
makes it cumbersome to get started on UEFI Shell programming.

(The developer is forced to use the EDK (EFI Developer Kit). In that environment
different tool chains can be used. The source code and compiler-intrinsic support functions
are kept on the lowest common denominator to fit all compilers.

EDK's main objective is to provide a build environment to support all aspects of
BIOS development, including silicon initialization, power on self test (POST) including BIOS setup, OS start from massstorage or network, placing of BIOS modules in a BIOS flash part, fulfill security requirements...

The concepts introduced with EDK are good for BIOS implementation:
* (interactive) dynamic/runtime linking -- heavily used "protocol" concept, to
  keep the program loader simple
* easy-to-use build environment to support exchangeability of BIOS components and adjustment to different hardware assembly 
* an "emulation" of the entire BIOS POST in the NT32Pkg, that was used to test "torito C Library" in BIOS POST and shell

But this is far too much for simple shell applications!

It overstrains the shell application developer by far.)


## Reimplementing LIBCMT.LIB for WinNT

The sole purpose of "torito C Library" for WinNT is to enable DEBUG mode in VS2017 when the RELEASE target is UEFI shell or Linux (in future releases)


## HELLO is now WELCOME / appetite for destruction

The C beginner's sample program introduced by Brian W. Kernighan and Dennis M. Ritchie
in "THE C PROGRAMMING LANGUAGE" ("White Book C") is adjusted to today´s need to honor
the appetite for destruction introduced 30 years ago in 1987, 2 years prior to the completion of ANSI C Standard.
Despite the fact that appetite for destruction was sold 30 Million times, and so became the 
most successful debut album of all times, the X3J11 comittee was obviously not influenced by it, since ``` "hello, world"``` is referenced
in the Standard C specification, but ```"Welcome, to the jungle"``` is not.

Check out out what they've witheld from us: ;-) https://www.youtube.com/watch?v=o1tj2zJ2Wvg

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

WELCOME.c can be translated in the VS2017 64Bit command line environment by running the build script below:

```bat
cl /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c
link /NODEFAULTLIB /ENTRY:_MainEntryPointShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toritoC64R.lib
```


## Status
The "torito C Library" is still in state of EVALUATION

Field tests are urgently required.

Feedback is very WELCOME.

A non-EVALUATION-library will be provided for helpful supporters for free.

The functions below are already implemented and carefully tested, every single one of them.

_ModuleEntryPoint, _iob, _setjmp, _snprintf, _vsnprintf, abs, asctime, atexit, atoi, atol, calloc, clearerr, clock, ctime, difftime, div, exit, 
fclose, feof, ferror, fflush, fgetc, fgetpos, fgets, fopen, fprintf, fputc, fputs, fread, free, freopen, fscanf, fseek, fsetpos, ftell, fwrite, gets, 
gmtime, isalnum, isalpha, iscntrl, isdigit, isgraph, islower, isprint, ispunct, isspace, isupper, isxdigit, labs, ldiv, localtime, longjmp, 
main(argc, argv), malloc, memcmp, memcpy, memmove, memset, mktime, nprintf, perror, printf, putc, putchar, puts, rand, realloc, rewind, scanf, 
setbuf, setvbuf, snprintf, sprintf, srand, sscanf, strcat, strchr, strcmp, strcpy, strcspn, strefierror, strerror, strftime, strlen, strncat, 
strncmp, strncpy, strpbrk, strspn, strstr, strtok, strtol, strtoul, swprintf, time, tolower, toupper, ungetc, vfprintf, vfscanf, vprintf, vscanf, 
vsnprintf, vsprintf, vswprintf, wcscat, wcschr, wcscmp, wcscpy, wcscspn, wcslen, wcsncat, wcsncmp, wcsncpy, wcspbrk, wcsrchr, wcsspn, wcsstr, 
wcstok, wmemcmp, wmemcpy, wmemmove, wprintf.



## Known bugs

* printf()-family's format specifiers a,e,f,g not yet implemented
* scanf()-family's format specifiers [],p,a,e,f,g  not yet implemented
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters a–z or A–Z representing digits in the range [10, 36] are not (yet) supported.</del>
* functions missing e.g. system(), rename(), delete(), settime(), various wide-functions introduced in C95.
* <time.h>: UTC-only support. No Daylightsaving, no timezones. 
* <math.h> related functions will not be implemented, the original Microsoft .OBJ modules
   have to be used instead.
* <locale.h>: support still missing

# Revision histrory
### 20180107/R85
* added: base 2..36 support to Standard C strol() and stroul()
* fixed: time() function N/A in Windows build
* fixed: time base in Windows build is QPC now, not TSC.
* fixed: gets() functions fails with lines starting with '\n'
### 20171105/R78
* initial revision

