<table>
            <tr> <th colspan="2">Diagnostics < assert.h ></th></tr>
            <tr><td>void _assert (const char *,const char *,unsigned)</td><td>C90, MSFT implementation for assert macro</td></tr>
            <tr><td>void _wassert (const wchar_t *,const wchar_t *,unsigned)</td><td>C90, MSFT implementation for assert macro</td></tr>
            <tr> <th colspan="2">Character handling < ctype.h ></th></tr>
            <tr><td>int [isalnum(int)](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalnum-iswalnum-isalnum-l-iswalnum-l?view=vs-2019)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isalpha(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int iscntrl(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isdigit(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isgraph(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int islower(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isprint(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int ispunct(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isspace(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isupper(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int isxdigit(int)</td><td>C90, is implemented</td>  </tr>
            <tr><td>int tolower(int)</td><td>C90, is implemented</td>   </tr>
            <tr><td>int toupper(int)</td><td>C90, is implemented</td>   </tr>
            <tr> <th colspan="2">Errors < errno.h ></th></tr>
            <tr><td>int *_errno(void)</td><td>C90, MSFT implementation for errno macro</td>   </tr>
            <tr> <th colspan="2">Localization < locale.h ></th></tr>
            <tr><td>struct lconv *localeconv(void)                      </td><td>C90, is implemented (C-locale)</td></tr>
            <tr><td>char *setlocale(int category, const char *locale)   </td><td>C90, is implemented (C-locale)</td></tr>
            <tr> <th colspan="2">Nonlocal jumps < setjmp.h ></th></tr>
            <tr><td>int setjmp(jmp_buf env)             </td><td>C90, _setjmp is implemented</td></tr>
            <tr><td>void longjmp(jmp_buf env, int val)  </td><td>C90, is implemented        </td></tr>
            <tr> <th colspan="2">Signal handling < signal.h ></th></tr>
            <tr><td>void (*signal(int sig, void (*func)(int)))(int) </td><td>C90, is implemented</td></tr>
            <tr><td>int raise(int sig)                              </td><td>C90, is implemented</td></tr>
            <tr> <th colspan="2">Input/output < stdio.h ></th></tr>
            <tr><td>int remove(const char *filename)                                        </td><td>C90, is implemented</td></tr>
            <tr><td>int rename(const char *old, const char *new)                            </td><td>C90, is implemented</td></tr>
            <tr><td>FILE *tmpfile(void)                                                     </td><td>C90, is implemented</td></tr>
            <tr><td>char *tmpnam(char *s)                                                   </td><td>C90, is implemented</td></tr>
            <tr><td>int fclose(FILE *stream)                                                </td><td>C90, is implemented</td></tr>
            <tr><td>int fflush(FILE *stream)                                                </td><td>C90, is implemented</td></tr>
            <tr><td>FILE *fopen(const char * filename,const char * mode)                    </td><td>C90, is implemented</td></tr>
            <tr><td>FILE *freopen(const char * filename,const char * mode,FILE * stream)    </td><td>C90, is implemented</td></tr>
            <tr><td>void setbuf(FILE * stream,char * buf)                                   </td><td>C90, is implemented</td></tr>
            <tr><td>int setvbuf(FILE * stream,char * buf,int mode, size_t size)             </td><td>C90, is implemented</td></tr>
            <tr><td>int fprintf(FILE * stream,const char * format, ...)                     </td><td>C90, is implemented</td></tr>
            <tr><td>int fscanf(FILE * stream,const char * format, ...)                      </td><td>C90, is implemented</td></tr>
            <tr><td>int printf(const char * format, ...)                                    </td><td>C90, is implemented</td></tr>
            <tr><td>int scanf(const char * format, ...)                                     </td><td>C90, is implemented</td></tr>
            <tr><td>int snprintf(char * s, size_t n,const char * format, ...)               </td><td>C99, is implemented</td></tr>
            <tr><td>int sprintf(char * s,const char * format, ...)                          </td><td>C90, is implemented</td></tr>
            <tr><td>int sscanf(const char * s,const char * format, ...)                     </td><td>C90, is implemented</td></tr>
            <tr><td>int vfprintf(FILE * stream,const char * format, va_list arg)            </td><td>C90, is implemented</td></tr>
            <tr><td>int vprintf(const char * format, va_list arg)                           </td><td>C90, is implemented</td></tr>
            <tr><td>int vsprintf(char * s,const char * format, va_list arg)                 </td><td>C90, is implemented</td></tr>
            <tr><td>int vfscanf(FILE * stream,const char * format, va_list arg)             </td><td>C99, is implemented</td></tr>
            <tr><td>int vscanf(const char * format, va_list arg)                            </td><td>C99, is implemented</td></tr>
            <tr><td>int vsnprintf(char * s, size_t n,const char * format, va_list arg)      </td><td>C99, is implemented</td></tr>
            <tr><td>int vsscanf(const char * s,const char * format, va_list arg)            </td><td>C99, is implemented</td></tr>
            <tr><td>int fgetc(FILE *stream)                                                 </td><td>C90, is implemented</td></tr>
            <tr><td>char *fgets(char * s, int n,FILE * stream)                              </td><td>C90, is implemented</td></tr>
            <tr><td>int fputc(int c, FILE *stream)                                          </td><td>C90, is implemented</td></tr>
            <tr><td>int fputs(const char * s,FILE * stream)                                 </td><td>C90, is implemented</td></tr>
            <tr><td>int getc(FILE *stream)                                                  </td><td>C90, is implemented</td></tr>
            <tr><td>int getchar(void)                                                       </td><td>C90, is implemented</td></tr>
            <tr><td>char *gets(char *s)                                                     </td><td>C90, is implemented</td></tr>
            <tr><td>int putc(int c, FILE *stream)                                           </td><td>C90, is implemented</td></tr>
            <tr><td>int putchar(int c)                                                      </td><td>C90, is implemented</td></tr>
            <tr><td>int puts(const char *s)                                                 </td><td>C90, is implemented</td></tr>
            <tr><td>int ungetc(int c, FILE *stream)                                         </td><td>C90, is implemented</td></tr>
            <tr><td>size_t fread(void * ptr,size_t size, size_t nmemb,FILE * stream)        </td><td>C90, is implemented</td></tr>
            <tr><td>size_t fwrite(const void * ptr,size_t size, size_t nmemb,FILE * stream) </td><td>C90, is implemented</td></tr>
            <tr><td>int fgetpos(FILE * stream,fpos_t * pos)                                 </td><td>C90, is implemented</td></tr>
            <tr><td>int fseek(FILE *stream, long int offset, int whence)                    </td><td>C90, is implemented</td></tr>
            <tr><td>int fsetpos(FILE *stream, const fpos_t *pos)                            </td><td>C90, is implemented</td></tr>
            <tr><td>long int ftell(FILE *stream)                                            </td><td>C90, is implemented</td></tr>
            <tr><td>void rewind(FILE *stream)                                               </td><td>C90, is implemented</td></tr>
            <tr><td>void clearerr(FILE *stream)                                             </td><td>C90, is implemented</td></tr>
            <tr><td>int feof(FILE *stream)                                                  </td><td>C90, is implemented</td></tr>
            <tr><td>int ferror(FILE *stream)                                                </td><td>C90, is implemented</td></tr>
            <tr><td>void perror(const char *s)                                              </td><td>C90, is implemented</td></tr>
            <tr> <th colspan="2">General utilities < stdlib.h ></th></tr>
            <tr><td>double atof(const char *nptr)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>int atoi(const char *nptr)</td><td>C90, is implemented</td></tr>
            <tr><td>long int atol(const char *nptr)</td><td>C90, is implemented</td></tr>
            <tr><td>double strtod(const char *  nptr,char **  endptr)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>long int strtol(const char *  nptr,char **  endptr, int base)</td><td>C90, is implemented</td></tr>
            <tr><td>unsigned long int strtoul(const char *  nptr,char **  endptr, int base)</td><td>C90, is implemented</td></tr>
            <tr><td>int rand(void)</td><td>C90, is implemented</td></tr>
            <tr><td>void srand(unsigned int seed)</td><td>C90, is implemented</td></tr>
            <tr><td>void *calloc(size_t nmemb, size_t size)</td><td>C90, is implemented</td></tr>
            <tr><td>void free(void *ptr)</td><td>C90, is implemented</td></tr>
            <tr><td>void *malloc(size_t size)</td><td>C90, is implemented</td></tr>
            <tr><td>void *realloc(void *ptr, size_t size)</td><td>C90, is implemented</td></tr>
            <tr><td>void abort(void)</td><td>C90, is implemented</td></tr>
            <tr><td>int atexit(void (*func)(void))</td><td>C90, is implemented</td></tr>
            <tr><td>void exit(int status)</td><td>C90, is implemented</td></tr>
            <tr><td>char *getenv(const char *name)</td><td>C90, is implemented</td></tr>
            <tr><td>int system(const char *string)</td><td>C90, is implemented</td></tr>
            <tr><td>void *bsearch(const void *key, const void *base,size_t nmemb, size_t size,int (*compar)(const void *, const void *))</td><td>C90, is not yet implemented</td></tr>
            <tr><td>void qsort(void *base, size_t nmemb, size_t size,int (*compar)(const void *, const void *))</td><td>C90, is implemented</td></tr>
            <tr><td>int abs(int j)</td><td>C90, is implemented</td></tr>
            <tr><td>long int labs(long int j)</td><td>C90, is implemented</td></tr>
            <tr><td>div_t div(int numer, int denom)</td><td>C90, is implemented</td></tr>
            <tr><td>ldiv_t ldiv(long int numer, long int denom)</td><td>C90, is implemented</td></tr>
            <tr><td>int mblen(const char *s, size_t n)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>int mbtowc(wchar_t *  pwc,const char *  s, size_t n)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>int wctomb(char *s, wchar_t wchar)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>size_t mbstowcs(wchar_t *  pwcs,const char *  s, size_t n)</td><td>C90, is not yet implemented</td></tr>
            <tr><td>size_t wcstombs(char *  s,const wchar_t *  pwcs, size_t n)</td><td>C90, is not yet implemented</td></tr>
    <tr> <th colspan="2">String handling < string.h ></th></tr>
    <tr><td>void *memcpy(void *  s1,const void *  s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>void *memmove(void *s1, const void *s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strcpy(char *  s1,const char *  s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strncpy(char *  s1,const char *  s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strcat(char *  s1,const char *  s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strncat(char *  s1,const char *  s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>int memcmp(const void *s1, const void *s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>int strcmp(const char *s1, const char *s2)</td><td>C90, is implemented</td></tr>
    <tr><td>int strcoll(const char *s1, const char *s2)</td><td>C90, is not yet implemented</td></tr>
    <tr><td>int strncmp(const char *s1, const char *s2, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>size_t strxfrm(char *  s1,const char *  s2, size_t n)</td><td>C90, is not yet implemented</td></tr>
    <tr><td>void *memchr(const void *s, int c, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strchr(const char *s, int c)</td><td>C90, is implemented</td></tr>
    <tr><td>size_t strcspn(const char *s1, const char *s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strpbrk(const char *s1, const char *s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strrchr(const char *s, int c)</td><td>C90, is implemented</td></tr>
    <tr><td>size_t strspn(const char *s1, const char *s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strstr(const char *s1, const char *s2)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strtok(char *  s1,const char *  s2)</td><td>C90, is implemented</td></tr>
    <tr><td>void *memset(void *s, int c, size_t n)</td><td>C90, is implemented</td></tr>
    <tr><td>char *strerror(int errnum)</td><td>C90, is implemented</td></tr>
    <tr><td>size_t strlen(const char *s)</td><td>C90, is implemented</td></tr>
    <tr> <th colspan="2">Date and time < time.h ></th></tr>
    <tr><td>clock_t clock(void)</td><td>C90, is implemented</td></tr>
    <tr><td>double difftime(time_t time1, time_t time0)</td><td>C90, is implemented</td></tr>
    <tr><td>time_t mktime(struct tm *timeptr)</td><td>C90, is implemented</td></tr>
    <tr><td>time_t time(time_t *timer)</td><td>C90, is implemented</td></tr>
    <tr><td>char *asctime(const struct tm *timeptr)</td><td>C90, is implemented</td></tr>
    <tr><td>char *ctime(const time_t *timer)</td><td>C90, is implemented</td></tr>
    <tr><td>struct tm *gmtime(const time_t *timer)</td><td>C90, is implemented</td></tr>
    <tr><td>struct tm *localtime(const time_t *timer)</td><td>C90, function supports UTC only</td></tr>
    <tr><td>size_t strftime(char *  s,size_t maxsize,const char *  format,const struct tm *  timeptr)</td><td>C90, is implemented</td></tr>
    <tr> <th colspan="2">Extended multibyte/wide character utilities < wchar.h ></th></tr>
    <tr><td>int fwprintf(FILE *  stream,const wchar_t *  format, ...)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int fwscanf(FILE *  stream,const wchar_t *  format, ...)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int wprintf(const wchar_t *  format, ...)</td><td>C95, is implemented</td></tr>
    <tr><td>int wscanf(const wchar_t *  format, ...)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int swprintf(wchar_t *  s, size_t n,const wchar_t *  format, ...)</td><td>C95, is implemented</td></tr>
    <tr><td>int swscanf(const wchar_t *  s,const wchar_t *  format, ...)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int vfwprintf(FILE *  stream,const wchar_t *  format, va_list arg)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int vwprintf(const wchar_t *  format,va_list arg)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int vswprintf(wchar_t *  s, size_t n,const wchar_t *  format, va_list arg)</td><td>C95, is implemented</td></tr>
    <tr><td>wint_t fgetwc(FILE *stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wchar_t *fgetws(wchar_t *  s, int n,FILE *  stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t fputwc(wchar_t c, FILE *stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int fputws(const wchar_t *  s,FILE *  stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t getwc(FILE *stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t getwchar(void)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t putwc(wchar_t c, FILE *stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t putwchar(wchar_t c)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t ungetwc(wint_t c, FILE *stream)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int fwide(FILE *stream, int mode)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>double wcstod(const wchar_t *  nptr,wchar_t **  endptr)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>long int wcstol(const wchar_t *  nptr,wchar_t **  endptr, int base)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>unsigned long int wcstoul(const wchar_t *  nptr,wchar_t **  endptr, int base)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wchar_t *wcscpy(wchar_t *  s1,const wchar_t *  s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcsncpy(wchar_t *  s1,const wchar_t *  s2, size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcscat(wchar_t *  s1,const wchar_t *  s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcsncat(wchar_t *  s1,const wchar_t *  s2, size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>int wcscmp(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is implemented</td></tr>
    <tr><td>int wcscoll(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int wcsncmp(const wchar_t *s1, const wchar_t *s2,size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>size_t wcsxfrm(wchar_t *  s1,const wchar_t *  s2, size_t n)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wchar_t *wcschr(const wchar_t *s, wchar_t c)</td><td>C95, is implemented</td></tr>
    <tr><td>size_t wcscspn(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcspbrk(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcsrchr(const wchar_t *s, wchar_t c)</td><td>C95, is implemented</td></tr>
    <tr><td>size_t wcsspn(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcsstr(const wchar_t *s1, const wchar_t *s2)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wcstok(wchar_t *  s1,const wchar_t *  s2,wchar_t **  ptr)</td><td>C95, is implemented</td></tr>
    <tr><td>size_t wcslen(const wchar_t *s)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wmemchr(const wchar_t *s, wchar_t c, size_t n)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int wmemcmp(const wchar_t *s1, const wchar_t *s2,size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wmemcpy(wchar_t *  s1,const wchar_t *  s2, size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wmemmove(wchar_t *s1, const wchar_t *s2,size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>wchar_t *wmemset(wchar_t *s, wchar_t c, size_t n)</td><td>C95, is implemented</td></tr>
    <tr><td>size_t wcsftime(wchar_t *  s, size_t maxsize,const wchar_t *  format,const struct tm *  timeptr)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>wint_t btowc(int c)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int wctob(wint_t c)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>int mbsinit(const mbstate_t *ps)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>size_t mbrlen(const char *  s, size_t n,mbstate_t *  ps)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>size_t mbrtowc(wchar_t *  pwc,const char *  s, size_t n,mbstate_t *  ps)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>size_t wcrtomb(char *  s, wchar_t wc,mbstate_t *  ps)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>size_t mbsrtowcs(wchar_t *  dst,const char **  src, size_t len,mbstate_t *  ps)</td><td>C95, is not yet implemented</td></tr>
    <tr><td>size_t wcsrtombs(char *  dst,const wchar_t **  src, size_t len,mbstate_t *  ps)</td><td>C95, is not yet implemented</td></tr>
    <tr> <th colspan="2">Wide character classification and mapping utilities < wctype.h ></th></tr>
		<tr><td>int iswalnum(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswalpha(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswblank(wint_t wc)</td><td>C99, is implemented</td></tr>
        <tr><td>int iswcntrl(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswdigit(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswgraph(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswlower(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswprint(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswpunct(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswspace(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswupper(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswxdigit(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>int iswctype(wint_t wc, wctype_t desc)</td><td>C95, is implemented</td></tr>
        <tr><td>wctype_t wctype(const char *property)</td><td>C95, is implemented</td></tr>
        <tr><td>wint_t towlower(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>wint_t towupper(wint_t wc)</td><td>C95, is implemented</td></tr>
        <tr><td>wint_t towctrans(wint_t wc, wctrans_t desc)</td><td>C95, is implemented</td></tr>
        <tr><td>wctrans_t wctrans(const char *property)</td><td>C95, is implemented</td></tr>
</table>
