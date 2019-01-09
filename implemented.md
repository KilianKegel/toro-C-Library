#### Diagnostics <assert.h>
|  function  | annotation|
|--------|----------|
|```void _assert (const char *,const char *,unsigned)```| C90, MSFT implementation for assert macro|
#### Character handling <ctype.h>
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
#### Errors <errno.h>
|function|annotation|
|--------|----------|
|```int *_errno(void)```|C90, MSFT implementation for errno macro
#### Localization <locale.h>
|function|annotation|
|--------|----------|
|```char *setlocale(int category, const char *locale);```|C90, function is implemented (C-locale)|
|```struct lconv *localeconv(void)```|C90, function is implemented (C-locale)|
#### Nonlocal jumps <setjmp.h>
|function|annotation|
|--------|----------|
|```int setjmp(jmp_buf env)```|C90,  \_setjmp function is implemented
|```void longjmp(jmp_buf env, int val)```|C90, function is implemented|
#### Signal handling <signal.h>
|function|annotation|
|--------|----------|
|```void (*signal(int sig, void (*func)(int)))(int)```|C90, function is implemented|
|```int raise(int sig)```|C90, function is implemented|
#### Input/output <stdio.h>
|  function  | annotation|
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

#### General utilities <stdlib.h>
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
|```char *getenv(const char *name)```|C90, function is implemented|
|```int system(const char *string)```|C90, function is implemented|
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


#### String handling <string.h>
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
|```void *memchr(const void *s, int c, size_t n)```|C90, function is implemented|
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

#### Date and time <time.h>
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

#### Extended multibyte/wide character utilities <wchar.h>
|  functtion  | annotation|
|--------|----------|
|```int fwprintf(FILE *  stream,const wchar_t *  format, ...)```|C95, function is not yet implemented|
|```int fwscanf(FILE *  stream,const wchar_t *  format, ...)```|C95, function is not yet implemented|
|```int wprintf(const wchar_t *  format, ...)```|C95, function is implemented|
|```int wscanf(const wchar_t *  format, ...)```|C95, function is not yet implemented|
|```int swprintf(wchar_t *  s, size_t n,const wchar_t *  format, ...)```|C95, function is implemented|
|```int swscanf(const wchar_t *  s,const wchar_t *  format, ...)```|C95, function is not yet implemented|
|```int vfwprintf(FILE *  stream,const wchar_t *  format, va_list arg)```|C95, function is not yet implemented|
|```int vwprintf(const wchar_t *  format,va_list arg)```|C95, function is not yet implemented|
|```int vswprintf(wchar_t *  s, size_t n,const wchar_t *  format, va_list arg)```|C95, function is implemented|
|```wint_t fgetwc(FILE *stream)```|C95, function is not yet implemented|
|```wchar_t *fgetws(wchar_t *  s, int n,FILE *  stream)```|C95, function is not yet implemented|
|```wint_t fputwc(wchar_t c, FILE *stream)```|C95, function is not yet implemented|
|```int fputws(const wchar_t *  s,FILE *  stream)```|C95, function is not yet implemented|
|```wint_t getwc(FILE *stream)```|C95, function is not yet implemented|
|```wint_t getwchar(void)```|C95, function is not yet implemented|
|```wint_t putwc(wchar_t c, FILE *stream)```|C95, function is not yet implemented|
|```wint_t putwchar(wchar_t c)```|C95, function is not yet implemented|
|```wint_t ungetwc(wint_t c, FILE *stream)```|C95, function is not yet implemented|
|```int fwide(FILE *stream, int mode)```|C95, function is not yet implemented|
|```double wcstod(const wchar_t *  nptr,wchar_t **  endptr)```|C95, function is not yet implemented|
|```long int wcstol(const wchar_t *  nptr,wchar_t **  endptr, int base)```|C95, function is not yet implemented|
|```unsigned long int wcstoul(const wchar_t *  nptr,wchar_t **  endptr, int base)```|C95, function is not yet implemented|
|```wchar_t *wcscpy(wchar_t *  s1,const wchar_t *  s2)```|C95, function is implemented|
|```wchar_t *wcsncpy(wchar_t *  s1,const wchar_t *  s2, size_t n)```|C95, function is implemented|
|```wchar_t *wcscat(wchar_t *  s1,const wchar_t *  s2)```|C95, function is implemented|
|```wchar_t *wcsncat(wchar_t *  s1,const wchar_t *  s2, size_t n)```|C95, function is implemented|
|```int wcscmp(const wchar_t *s1, const wchar_t *s2)```|C95, function is implemented|
|```int wcscoll(const wchar_t *s1, const wchar_t *s2)```|C95, function is not yet implemented|
|```int wcsncmp(const wchar_t *s1, const wchar_t *s2,size_t n)```|C95, function is implemented|
|```size_t wcsxfrm(wchar_t *  s1,const wchar_t *  s2, size_t n)```|C95, function is not yet implemented|
|```wchar_t *wcschr(const wchar_t *s, wchar_t c)```|C95, function is implemented|
|```size_t wcscspn(const wchar_t *s1, const wchar_t *s2)```|C95, function is implemented|
|```wchar_t *wcspbrk(const wchar_t *s1, const wchar_t *s2)```|C95, function is implemented|
|```wchar_t *wcsrchr(const wchar_t *s, wchar_t c)```|C95, function is implemented|
|```size_t wcsspn(const wchar_t *s1, const wchar_t *s2)```|C95, function is implemented|
|```wchar_t *wcsstr(const wchar_t *s1, const wchar_t *s2)```|C95, function is implemented|
|```wchar_t *wcstok(wchar_t *  s1,const wchar_t *  s2,wchar_t **  ptr)```|C95, function is implemented|
|```size_t wcslen(const wchar_t *s)```|C95, function is implemented|
|```wchar_t *wmemchr(const wchar_t *s, wchar_t c, size_t n)```|C95, function is not yet implemented|
|```int wmemcmp(const wchar_t *s1, const wchar_t *s2,size_t n)```|C95, function is implemented|
|```wchar_t *wmemcpy(wchar_t *  s1,const wchar_t *  s2, size_t n)```|C95, function is implemented|
|```wchar_t *wmemmove(wchar_t *s1, const wchar_t *s2,size_t n)```|C95, function is implemented|
|```wchar_t *wmemset(wchar_t *s, wchar_t c, size_t n)```|C95, function is implemented|
|```size_t wcsftime(wchar_t *  s, size_t maxsize,const wchar_t *  format,const struct tm *  timeptr)```|C95, function is not yet implemented|
|```wint_t btowc(int c)```|C95, function is not yet implemented|
|```int wctob(wint_t c)```|C95, function is not yet implemented|
|```int mbsinit(const mbstate_t *ps)```|C95, function is not yet implemented|
|```size_t mbrlen(const char *  s, size_t n,mbstate_t *  ps)```|C95, function is not yet implemented|
|```size_t mbrtowc(wchar_t *  pwc,const char *  s, size_t n,mbstate_t *  ps)```|C95, function is not yet implemented|
|```size_t wcrtomb(char *  s, wchar_t wc,mbstate_t *  ps)```|C95, function is not yet implemented|
|```size_t mbsrtowcs(wchar_t *  dst,const char **  src, size_t len,mbstate_t *  ps)```|C95, function is not yet implemented|
|```size_t wcsrtombs(char *  dst,const wchar_t **  src, size_t len,mbstate_t *  ps)```|C95, function is not yet implemented|

#### Wide character classification and mapping utilities <wctype.h>
|  functtion  | annotation|
|--------|----------|
|```int iswalnum(wint_t wc)```|C95, function is implemented|
|```int iswalpha(wint_t wc)```|C95, function is implemented|
|```int iswblank(wint_t wc)```|C99, function is implemented|
|```int iswcntrl(wint_t wc)```|C95, function is implemented|
|```int iswdigit(wint_t wc)```|C95, function is implemented|
|```int iswgraph(wint_t wc)```|C95, function is implemented|
|```int iswlower(wint_t wc)```|C95, function is implemented|
|```int iswprint(wint_t wc)```|C95, function is implemented|
|```int iswpunct(wint_t wc)```|C95, function is implemented|
|```int iswspace(wint_t wc)```|C95, function is implemented|
|```int iswupper(wint_t wc)```|C95, function is implemented|
|```int iswxdigit(wint_t wc)```|C95, function is implemented|
|```int iswctype(wint_t wc, wctype_t desc)```|C95, function is implemented|
|```wctype_t wctype(const char *property)```|C95, function is implemented|
|```wint_t towlower(wint_t wc)```|C95, function is implemented|
|```wint_t towupper(wint_t wc)```|C95, function is implemented|
|```wint_t towctrans(wint_t wc, wctrans_t desc)```|C95, function is implemented|
|```wctrans_t wctrans(const char *property)```|C95, function is implemented|

