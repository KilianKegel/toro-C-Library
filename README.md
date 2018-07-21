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

## Reimplementing LIBCMT.LIB for WinNT

The sole purpose of "torito C Library" for WinNT is to enable DEBUG mode in VS2017 when the RELEASE target is UEFI shell or Linux (in future releases)


## HELLO is now WELCOME / *appetite for destruction*

The C beginner's sample program introduced by Brian W. Kernighan and Dennis M. Ritchie
in "THE C PROGRAMMING LANGUAGE" ("White Book C") is adjusted to today´s need to honor
the *appetite for destruction* introduced 31 years ago in 1987, 2 years prior to the completion of ANSI C Standard.
Despite the fact that *appetite for destruction* was sold 30 Million times, and so became the 
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

## Diagnostics <assert.h>
|  functtion  | annotation|
|--------|----------|
|```void _assert (const char *,const char *,unsigned)```| C90, MSFT implementation for assert macro|
## Character handling <ctype.h>
|function|annotation|
|--------|----------|
|```int isalnum(int)```|C90, function is implemented|
|```int isalpha(int)```|C90, function is implemented|
|```int iscntrl(int)```|C90, function is implemented|
|```int isdigit(int)```|C90, function is implemented|
|```int isgraph(int)```|C90, function is implemented|
|```int islower(int)```|C90, function is implemented|
|```int isprint(int)```|C90, function is implemented|
|```int ispunct(int)```|C90, function is implemented|
|```int isspace(int)```|C90, function is implemented|
|```int isupper(int)```|C90, function is implemented|
|```int isxdigit(int)```|C90, function is implemented|
|```int tolower(int)```|C90, function is implemented|
|```int toupper(int)```|C90, function is implemented|
## Errors <errno.h>
|function|annotation|
|--------|----------|
|```int *_errno(void)```|C90, MSFT implementation for errno macro
## Localization <locale.h>
|function|annotation|
|--------|----------|
|```char *setlocale(int category, const char *locale);```|C90, function is not yetimplemented|
|```struct lconv *localeconv(void)```|C90, function is not yet implemented|
## Nonlocal jumps <setjmp.h>
|function|annotation|
|--------|----------|
|```int setjmp(jmp_buf env)```|C90,  \_setjmp function is implemented
|```void longjmp(jmp_buf env, int val)```|C90, function is implemented|
## Signal handling <signal.h>
|function|annotation|
|--------|----------|
|```void (*signal(int sig, void (*func)(int)))(int)```|C90, function is implemented|
|```int raise(int sig)```|C90, function is implemented|
## Input/output <stdio.h>
|  functtion  | annotation|
|--------|----------|
|```int remove(const char *filename)```|C90, function is implemented|
|```int rename(const char *old, const char *new)```|C90, function is implemented|
|```FILE *tmpfile(void)```|C90, function is implemented|
|```char *tmpnam(char *s)```|C90, function is implemented|
|```int fclose(FILE *stream)```|C90, function is implemented|
|```int fflush(FILE *stream)```|C90, function is implemented|
|```FILE *fopen(const char * filename,const char * mode)```|C90, function is implemented|
|```FILE *freopen(const char * filename,const char * mode,FILE * stream)```|C90, function is implemented|
|```void setbuf(FILE * stream,char * buf)```|C90, function is implemented|
|```int setvbuf(FILE * stream,char * buf,int mode, size_t size)```|C90, function is implemented|
|```int fprintf(FILE * stream,const char * format, ...)```|C90, function is implemented|
|```int fscanf(FILE * stream,const char * format, ...)```|C90, function is implemented|
|```int printf(const char * format, ...)```|C90, function is implemented|
|```int scanf(const char * format, ...)```|C90, function is implemented|
|```int snprintf(char * s, size_t n,const char * format, ...)```|C99, function is implemented|
|```int sprintf(char * s,const char * format, ...)```|C90, function is implemented|
|```int sscanf(const char * s,const char * format, ...)```|C90, function is implemented|
|```int vfprintf(FILE * stream,const char * format, va_list arg)```|C90, function is implemented|
|```int vprintf(const char * format, va_list arg)```|C90, function is implemented|
|```int vsprintf(char * s,const char * format, va_list arg)```|C90, function is implemented|
|```int vfscanf(FILE * stream,const char * format, va_list arg)```|C99, function is implemented|
|```int vscanf(const char * format, va_list arg)```|C99, function is implemented|
|```int vsnprintf(char * s, size_t n,const char * format, va_list arg)```|C99, function is implemented|
|```int vsscanf(const char * s,const char * format, va_list arg)```|C99, function is implemented|
|```int fgetc(FILE *stream)```|C90, function is implemented|
|```char *fgets(char * s, int n,FILE * stream)```|C90, function is implemented|
|```int fputc(int c, FILE *stream)```|C90, function is implemented|
|```int fputs(const char * s,FILE * stream)```|C90, function is implemented|
|```int getc(FILE *stream)```|C90, function is implemented|
|```int getchar(void)```|C90, function is implemented|
|```char *gets(char *s)```|C90, function is implemented|
|```int putc(int c, FILE *stream)```|C90, function is implemented|
|```int putchar(int c)```|C90, function is implemented|
|```int puts(const char *s)```|C90, function is implemented|
|```int ungetc(int c, FILE *stream)```|C90, function is implemented|
|```size_t fread(void * ptr,size_t size, size_t nmemb,FILE * stream)```|C90, function is implemented|
|```size_t fwrite(const void * ptr,size_t size, size_t nmemb,FILE * stream)```|C90, function is implemented|
|```int fgetpos(FILE * stream,fpos_t * pos)```|C90, function is implemented|
|```int fseek(FILE *stream, long int offset, int whence)```|C90, function is implemented|
|```int fsetpos(FILE *stream, const fpos_t *pos)```|C90, function is implemented|
|```long int ftell(FILE *stream)```|C90, function is implemented|
|```void rewind(FILE *stream)```|C90, function is implemented|
|```void clearerr(FILE *stream)```|C90, function is implemented|
|```int feof(FILE *stream)```|C90, function is implemented|
|```int ferror(FILE *stream)```|C90, function is implemented|
|```void perror(const char *s)```|C90, function is implemented|

## General utilities <stdlib.h>
|  functtion  | annotation|
|--------|----------|
|```double atof(const char *nptr)```|C90, function is not yet implemented|
|```int atoi(const char *nptr)```|C90, function is implemented|
|```long int atol(const char *nptr)```|C90, function is implemented|
|```double strtod(const char *  nptr,char **  endptr)```|C90, function is not yet implemented|
|```long int strtol(const char *  nptr,char **  endptr, int base)```|C90, function is implemented|
|```unsigned long int strtoul(const char *  nptr,char **  endptr, int base)```|C90, function is implemented|
|```int rand(void)```|C90, function is implemented|
|```void srand(unsigned int seed)```|C90, function is implemented|
|```void *calloc(size_t nmemb, size_t size)```|C90, function is implemented|
|```void free(void *ptr)```|C90, function is implemented|
|```void *malloc(size_t size)```|C90, function is implemented|
|```void *realloc(void *ptr, size_t size)```|C90, function is implemented|
|```void abort(void)```|C90, function is implemented|
|```int atexit(void (*func)(void))```|C90, function is implemented|
|```void exit(int status)```|C90, function is implemented|
|```char *getenv(const char *name)```|C90, function is not yet implemented|
|```int system(const char *string)```|C90, function is under construction|
|```void *bsearch(const void *key, const void *base,size_t nmemb, size_t size,int (*compar)(const void *, const void *))```|C90, function is not yet implemented|
|```void qsort(void *base, size_t nmemb, size_t size,int (*compar)(const void *, const void *))```|C90, function is implemented|
|```int abs(int j)```|C90, function is implemented|
|```long int labs(long int j)```|C90, function is implemented|
|```div_t div(int numer, int denom)```|C90, function is implemented|
|```ldiv_t ldiv(long int numer, long int denom)```|C90, function is implemented|
|```int mblen(const char *s, size_t n)```|C90, function is not yet implemented|
|```int mbtowc(wchar_t *  pwc,const char *  s, size_t n)```|C90, function is not yet implemented|
|```int wctomb(char *s, wchar_t wchar)```|C90, function is not yet implemented|
|```size_t mbstowcs(wchar_t *  pwcs,const char *  s, size_t n)```|C90, function is not yet implemented|
|```size_t wcstombs(char *  s,const wchar_t *  pwcs, size_t n)```|C90, function is not yet implemented|


## String handling <string.h>
|  functtion  | annotation|
|--------|----------|
|```void *memcpy(void *  s1,const void *  s2, size_t n)```|C90, function is implemented|
|```void *memmove(void *s1, const void *s2, size_t n)```|C90, function is implemented|
|```char *strcpy(char *  s1,const char *  s2)```|C90, function is implemented|
|```char *strncpy(char *  s1,const char *  s2, size_t n)```|C90, function is implemented|
|```char *strcat(char *  s1,const char *  s2)```|C90, function is implemented|
|```char *strncat(char *  s1,const char *  s2, size_t n)```|C90, function is implemented|
|```int memcmp(const void *s1, const void *s2, size_t n)```|C90, function is implemented|
|```int strcmp(const char *s1, const char *s2)```|C90, function is implemented|
|```int strcoll(const char *s1, const char *s2)```|C90, function is not yet implemented|
|```int strncmp(const char *s1, const char *s2, size_t n)```|C90, function is implemented|
|```size_t strxfrm(char *  s1,const char *  s2, size_t n)```|C90, function is not yet implemented|
|```void *memchr(const void *s, int c, size_t n)```|C90, function is not yet implemented|
|```char *strchr(const char *s, int c)```|C90, function is implemented|
|```size_t strcspn(const char *s1, const char *s2)```|C90, function is implemented|
|```char *strpbrk(const char *s1, const char *s2)```|C90, function is implemented|
|```char *strrchr(const char *s, int c)```|C90, function is implemented|
|```size_t strspn(const char *s1, const char *s2)```|C90, function is implemented|
|```char *strstr(const char *s1, const char *s2)```|C90, function is implemented|
|```char *strtok(char *  s1,const char *  s2)```|C90, function is implemented|
|```void *memset(void *s, int c, size_t n)```|C90, function is implemented|
|```char *strerror(int errnum)```|C90, function is implemented|
|```size_t strlen(const char *s)```|C90, function is implemented|

## Date and time <time.h>
|  functtion  | annotation|
|--------|----------|
|```clock_t clock(void)```|C90, function is implemented|
|```double difftime(time_t time1, time_t time0)```|C90, function is implemented|
|```time_t mktime(struct tm *timeptr)```|C90, function is implemented|
|```time_t time(time_t *timer)```|C90, function is implemented|
|```char *asctime(const struct tm *timeptr)```|C90, function is implemented|
|```char *ctime(const time_t *timer)```|C90, function is implemented|
|```struct tm *gmtime(const time_t *timer)```|C90, function is implemented|
|```struct tm *localtime(const time_t *timer)```|C90, function supports UTC only|
|```size_t strftime(char *  s,size_t maxsize,const char *  format,const struct tm *  timeptr)```|C90, function is implemented|


## Known bugs

* printf()-family's format specifiers a,e,f,g not yet implemented
* scanf()-family's format specifiers [],p,a,e,f,g  not yet implemented
* 20180107: <del>strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
   Letters a–z or A–Z representing digits in the range [10, 36] are not (yet) supported.</del>
* functions missing e.g. system(), rename(), <del>remove()</del>, settime(), <del>vsscanf()</del>
atof(),strtof(),strtod(),getenv(),bsearch(),<del>qsort()</del>,mblen(),mbtowc(),wctomb(),mbstowcs(),wcstombs(),strxfrm(),strcoll() various wide-functions introduced in C95.
* <time.h>: UTC-only support. No Daylightsaving, no timezones. 
* <math.h> related functions will not be implemented, the original Microsoft .OBJ modules
   have to be used instead.
* <locale.h>: support still missing

# Revision history
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
* fixed: strol() and stroul() dosn't support base 2..36 required by the Standard C Library
* fixed: time() function N/A in Windows build
* fixed: time base in Windows build is QPC now, not TSC.
* fixed: gets() functions fails with lines starting with '\n'
### 20171105/R78
* initial revision

