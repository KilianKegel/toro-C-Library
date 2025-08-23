# <!--<img src="https://github.com/KilianKegel/pictures/blob/master/refresh-icon.png"  width="48" height="48">-->toro C Library binary (formerly known as Torito C Library)
### Contents

* [License](https://github.com/KilianKegel/toro-C-Library#license)<br>
* [Introduction](https://github.com/KilianKegel/toro-C-Library#introduction)<br>
* [Use cases](https://github.com/KilianKegel/toro-C-Library#use-cases)<br>
* [Implemenation Status](https://github.com/KilianKegel/toro-C-Library#implementation-status--cross-matrix)<br>
* [Source Code](https://github.com/KilianKegel/toro-C-Library#source-code)<br>
* [Goal](https://github.com/KilianKegel/toro-C-Library#goal)<br>
* [Approach](https://github.com/KilianKegel/toro-C-Library#approach)<br>
* [Riding the UEFI Shell](https://github.com/KilianKegel/toro-C-Library#riding-the-uefi-shell--enabling-the-platform-for-developers)<br>
* [HELLO is now WELCOME: ](https://github.com/KilianKegel/toro-C-Library#hello-is-now-welcome) <img src="https://github.com/KilianKegel/pictures/blob/master/New-icon.png"  width="18" height="18"> Howto build **hello.c** using **commandline** and **Visual Studio 2022**<br>
* [Known bugs](https://github.com/KilianKegel/toro-C-Library#known-bugs)<br>
    * [missing non-standard functions](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand)<br>
* [Resolved bugs](https://github.com/KilianKegel/toro-C-Library#resolved-bugs)<br>
* [Revision history](https://github.com/KilianKegel/toro-C-Library#revision-history)<br>

## LICENSE
**toro C Library binary** for IBM PC AT(tm) compatible x86-64 UEFI shell and Windows NT executables,<br>
C Development Environment for UEFI<br>
Copyright (c) 2017-2025, Kilian Kegel (kilian_kegel@hotmail.com), https://github.com/KilianKegel/toro-C-Library<br>
<br>
Permission to use **Toro C Library binary** for the sole purpose of creating
UEFI Shell, UEFI POST drivers and Windows NT console applications, which may be
distributed with or without fee, is hereby granted.

The library binary files:<br>
* [**toroC64.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC64.lib), 64bit all-in-one library for UEFI Shell/DXE/SMM and Windows NT for the Microsoft linker
* [**toroC64LLVMUefiShell.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC64LLVMUefiShell.lib), 64bit UEFI Shell library for the LLVM linker
* [**toroC64LLVMWinNT.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC64LLVMWinNT.lib), 64bit WinNT library for the LLVM linker
* [**toroC32.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC32.lib), 32bit all-in-one library for UEFI Shell/DXE/PEI and Windows NT for the Microsoft linker
* [**toroC32LLVMUefiShell.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC32LLVMUefiShell.lib), 32bit UEFI Shell library for the LLVM linker
* [**toroC32LLVMWinNT.lib**](https://github.com/KilianKegel/toro-C-Library/blob/master/toroC32LLVMWinNT.lib), 32bit WinNT library for the LLVM linker

are **explicitely excluded from the GPL license**.<br>
This is called the **toro C Library Runtime Exception**, similiar to the [GCC Runtime Library Exception](https://www.gnu.org/licenses/gcc-exception-3.1-faq.html).<br>


It is not allowed to sell **toro C Library** as a stand alone product or
to modify it's content in any way.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL,DIRECT,INDIRECT,
OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
SOFTWARE.

<img src="https://github.com/KilianKegel/pictures/blob/master/380px-C_Programming_Language.svg.png" alt="Logo" width="100" height="100">

## Introduction

The **toro C Library** is a *monolithic* Standard C Library for the UEFI x86-64 
target platform.

The **toro C Library** is implemented to target [**ANSI/ISO C Standard Library**]( https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf#page=176) compatibility,
enabling the creation of applications and drivers for UEFI systems using the design and debugging 
infrastructure provided by current **Microsoft C tool chain** in **Visual Studio 2022**.

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

## Implementation status — cross matrix
<table>
<tr> <th colspan="2">assert.h  —  Diagnostics</th>                                                                                                                       
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/assert_h/_wassert.c">_wassert()</a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/assert-macro-assert-wassert">C90, MSFT implementation for assert macro</a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">ctype.h  —  Character handling</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isalnum.c">isalnum()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalnum-iswalnum-isalnum-l-iswalnum-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isalpha.c">isalpha()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalpha-iswalpha-isalpha-l-iswalpha-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/iscntrl.c">iscntrl()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/iscntrl-iswcntrl-iscntrl-l-iswcntrl-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isdigit.c">isdigit()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isdigit-iswdigit-isdigit-l-iswdigit-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isgraph.c">isgraph()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isgraph-iswgraph-isgraph-l-iswgraph-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/islower.c">islower()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/islower-iswlower-islower-l-iswlower-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isprint.c">isprint()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isprint-iswprint-isprint-l-iswprint-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/ispunct.c">ispunct()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ispunct-iswpunct-ispunct-l-iswpunct-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isspace.c">isspace()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isspace-iswspace-isspace-l-iswspace-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isupper.c">isupper()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isupper-isupper-l-iswupper-iswupper-l?view=vs-2019">          C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/isxdigit.c">isxdigit()   </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isxdigit-iswxdigit-isxdigit-l-iswxdigit-l?view=vs-2019">      C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/tolower.c">tolower()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tolower-tolower-towlower-tolower-l-towlower-l?view=vs-2019">  C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/ctype_h/toupper.c">toupper()    </a></td>           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/toupper-toupper-towupper-toupper-l-towupper-l?view=vs-2019">  C90, is implemented</a></td>                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">errno.h  —  Errors</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/errno_h/errno.c">_errno()</a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/errno-doserrno-sys-errlist-and-sys-nerr?view=vs-2019">C90, MSFT implementation for errno macro</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">inttypes.h  —  Format conversion of integer types</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/strtoimax.c">strtoimax()</a></td>     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/strtoumax.c">strtoumax()</a></td>     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/wcstoimax.c">wcstoimax()</a></td>     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/inttypes_h/wcstoumax.c">wcstoumax()</a></td>     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoimax-strtoimax-l-wcstoimax-wcstoimax-l?view=msvc-170">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">locale.h  —  Localization</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/locale_h/localeconv.c" >localeconv()</a>          </td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/localeconv?view=vs-2019"          >C90, is implemented (C-locale)</a></td>     <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/locale_h/setlocale.c">setlocale()</a></td>        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setlocale-wsetlocale?view=vs-2019">C90, is implemented (C-locale)</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">setjmp.h  —  Nonlocal jumps</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/setjmp_h/longjmp64CDEINTRINABI.asm">longjmp()</a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/longjmp?view=vs-2019">C90, is implemented        </a></td>                                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/setjmp_h/setjmp64CDEINTRINABI.asm">setjmp()</a></td>     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setjmp?view=vs-2019"> C90, _setjmp is implemented</a></td>                                <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">signal.h  —  Signal handling</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/signal_h/raise.c"    >raise()</a></td>                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/raise?view=vs-2019"   >C90, is implemented</a></td>                            <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/signal_h/signal.c"   >signal()</a></td>                  <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/signal?view=vs-2019"  >C90, is implemented</a></td>                            <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">stdio.h  —  Input/output</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/clearerr.c   ">clearerr()                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/clearerr?view=vs-2019                                                 ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fclose.c     ">fclose()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fclose-fcloseall?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Feof.c       ">feof()                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/feof?view=vs-2019                                                     ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ferror.c     ">ferror()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ferror?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fflush.c     ">fflush()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fflush?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgetc.c      ">fgetc()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgetpos.c    ">fgetpos()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetpos?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fgets.c      ">fgets()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgets-fgetws?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fopen.c      ">fopen()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fopen-wfopen?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fprintf.c    ">fprintf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fprintf-fprintf-l-fwprintf-fwprintf-l?view=vs-2019                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fputc.c      ">fputc()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputc-fputwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fputs.c      ">fputs()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputs-fputws?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fread.c      ">fread()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fread?view=vs-2019                                                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Freopen.c    ">freopen()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/freopen-wfreopen?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fscanf.c     ">fscanf()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fscanf-fscanf-l-fwscanf-fwscanf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fseek.c      ">fseek()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/fseek-lseek-constants?view=vs-2019                                              ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fsetpos.c    ">fsetpos()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fsetpos?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ftell.c      ">ftell()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ftell-ftelli64?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Fwrite.c     ">fwrite()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fwrite?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Getc.c       ">getc()                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc?view=vs-2019                                             ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Getchar.c    ">getchar()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getchar-getwchar?view=msvc-160                                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Gets.c       ">gets()                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/gets-getws?view=vs-2019                                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Perror.c     ">perror()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/perror-wperror?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Printf.c     ">printf()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Putc.c       ">putc()                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putc-putwc?view=vs-2019                                               ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Putchar.c    ">putchar()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putchar-putwchar?view=vs-2019                                         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Puts.c       ">puts()                                                                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/puts-putws?view=vs-2019                                               ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Remove.c     ">remove()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/remove-wremove?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Rename.c     ">rename()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rename-wrename?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Rewind.c     ">rewind()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rewind?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Scanf.c      ">scanf()                                                                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l?view=vs-2019                            ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Setbuf.c     ">setbuf()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setbuf?view=vs-2019                                                   ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Setvbuf.c    ">setvbuf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/setvbuf?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Snprintf.c   ">snprintf()                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/snprintf-snprintf-snprintf-l-snwprintf-snwprintf-l?view=vs-2019       ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Sprintf.c    ">sprintf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sprintf-sprintf-l-swprintf-swprintf-l-swprintf-l?view=vs-2019         ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Sscanf.c     ">sscanf()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sscanf-sscanf-l-swscanf-swscanf-l?view=vs-2019                        ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Tmpfile.c    ">tmpfile()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tmpfile?view=vs-2019                                                  ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Tmpnam.c     ">tmpnam()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tempnam-wtempnam-tmpnam-wtmpnam?view=vs-2019                          ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Ungetc.c     ">ungetc()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ungetc-ungetwc?view=vs-2019                                           ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vfprintf.c   ">vfprintf()                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfprintf-vfprintf-l-vfwprintf-vfwprintf-l?view=vs-2019                ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vfscanf.c    ">vfscanf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfscanf-vfwscanf?view=vs-2019                                         ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vprintf.c    ">vprintf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vprintf-vprintf-l-vwprintf-vwprintf-l?view=vs-2019                    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vscanf.c     ">vscanf()                                                                  </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vscanf-vwscanf?view=vs-2019                                           ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsnprintf.c  ">vsnprintf()                                                               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsnprintf-vsnprintf-vsnprintf-l-vsnwprintf-vsnwprintf-l?view=vs-2019  ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsnwprintf.c ">_vsnwprintf()                                                             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsnprintf-vsnprintf-vsnprintf-l-vsnwprintf-vsnwprintf-l?view=vs-2019  ">MSFT specific, is implemented  </a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsprintf.c   ">vsprintf()                                                                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsprintf-vsprintf-l-vswprintf-vswprintf-l-vswprintf-l?view=vs-2019    ">C90, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdio_h/Vsscanf.c    ">vsscanf()                                                                 </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsscanf-vswscanf?view=vs-2019                                         ">C99, is implemented            </a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">string.h  —  String handling</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrDup.c           ">_strdup()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strdup-wcsdup-mbsdup?view=msvc-160                                    ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrICmp.c          ">_stricmp()              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stricmp-wcsicmp-mbsicmp-stricmp-l-wcsicmp-l-mbsicmp-l?view=msvc-160   ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/_StrNICmp.c         ">_strnicmp()             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strnicmp-wcsnicmp-mbsnicmp-strnicmp-l-wcsnicmp-l-mbsnicmp-l           ">MSFT specific, is implemented</a></td>       <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemChr.c            ">memchr()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memchr-wmemchr?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemCmpCDEINTRINABI.c">memcmp()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcmp-wmemcmp?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemCpy.c            ">memcpy()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcpy-wmemcpy?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemMove.c           ">memmove()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memmove-wmemmove?view=vs-2019                                         ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/MemSetCDEINTRINABI.c">memset()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memset-wmemset?view=vs-2019                                           ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCat.c            ">strcat()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcat-wcscat-mbscat?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrChr.c            ">strchr()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strchr-wcschr-mbschr-mbschr-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCmp.c            ">strcmp()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcmp-wcscmp-mbscmp?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrColl.c           ">strcoll()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcoll-wcscoll-mbscoll-strcoll-l-wcscoll-l-mbscoll-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCpy.c            ">strcpy()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcpy-wcscpy-mbscpy?view=vs-2019                                     ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrCSpn.c           ">strcspn()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcspn-wcscspn-mbscspn-mbscspn-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrError.c          ">strerror()              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strerror-strerror-wcserror-wcserror?view=vs-2019                      ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrLen.c            ">strlen()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strlen-wcslen-mbslen-mbslen-l-mbstrlen-mbstrlen-l?view=vs-2019        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCat.c           ">strncat()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncat-strncat-l-wcsncat-wcsncat-l-mbsncat-mbsncat-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCmp.c           ">strncmp()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncmp-wcsncmp-mbsncmp-mbsncmp-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrNCpy.c           ">strncpy()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncpy-strncpy-l-wcsncpy-wcsncpy-l-mbsncpy-mbsncpy-l?view=vs-2019    ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrPbrk.c           ">strpbrk()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strpbrk-wcspbrk-mbspbrk-mbspbrk-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrRChr.c           ">strchr()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strrchr-wcsrchr-mbsrchr-mbsrchr-l?view=vs-2019                        ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrSpn.c            ">strspn()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strspn-wcsspn-mbsspn-mbsspn-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrStr.c            ">strstr()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strstr-wcsstr-mbsstr-mbsstr-l?view=vs-2019                            ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/StrTok.c            ">strtok()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtok-strtok-l-wcstok-wcstok-l-mbstok-mbstok-l?view=vs-2019          ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/string_h/Strxfrm.c           ">strxfrm()             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strxfrm-wcsxfrm-strxfrm-l-wcsxfrm-l?view=vs-2019                      ">C90, is implemented</a></td>                 <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">time.h  —  Date and time</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/asctime.c             ">asctime()             </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/asctime-wasctime?view=vs-2019                                 ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/clock.c               ">clock()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/clock?view=vs-2019                                            ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/ctime.c               ">ctime()               </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ctime-ctime32-ctime64-wctime-wctime32-wctime64?view=vs-2019   ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/difftime.c            ">difftime()            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/difftime-difftime32-difftime64?view=vs-2019                   ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/gmtime.c              ">gmtime()              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/gmtime-gmtime32-gmtime64?view=vs-2019                         ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/localtime.c           ">localtime()           </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/localtime-localtime32-localtime64?view=vs-2019                ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/mktime.c              ">mktime()              </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mktime-mktime32-mktime64?view=vs-2019                         ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/strftime.c            ">strftime()            </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strftime-wcsftime-strftime-l-wcsftime-l?view=vs-2019          ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/time_h/time.c                ">time()                </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/time-time32-time64?view=vs-2019                               ">C90, is implemented</a></td>   <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">wchar.h  —  Extended multibyte/wide character utilities/th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/btowc.c      ">btowc(c)                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/btowc                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/cstod.c      ">wcstod()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtod-strtod-l-wcstod-wcstod-l                                      ">C95, is not yet implemented</a></td>   <td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fgetwc.c     ">fgetwc()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fgetws.c     ">fgetws()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgets-fgetws                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fputwc.c     ">fputwc()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputc-fputwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fputws.c     ">fputws()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fputs-fputws                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwide.c      ">fwide()                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fwide                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwprintf.c   ">fwprintf()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fprintf-fprintf-l-fwprintf-fwprintf-l                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Fwscanf.c    ">fwscanf()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fscanf-fscanf-l-fwscanf-fwscanf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Getwc.c      ">getwc()                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fgetc-fgetwc                                                         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Getwchar.c   ">getwchar()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getchar-getwchar                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbrlen.c     ">mbrlen()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbrlen                                                               ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbrtowc.c    ">mbrtowc()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbrtowc                                                              ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbsinit.c    ">mbsinit()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbsinit                                                              ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/mbsrtowcs.c  ">mbsrtowcs()                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbsrtowcs                                                            ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Putwc.c      ">putwc()                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putc-putwc                                                           ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Putwchar.c   ">putwchar()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/putchar-putwchar                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Swprintf.c   ">swprintf()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sprintf-sprintf-l-swprintf-swprintf-l-swprintf-l                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Swscanf.c    ">swscanf()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sscanf-sscanf-l-swscanf-swscanf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Ungetwc.c    ">ungetwc()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ungetc-ungetwc                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vfwprintf.c  ">vfwprintf()                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfprintf-vfprintf-l-vfwprintf-vfwprintf-l                            ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vfwscanf.c   ">vfwscanf()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vfscanf-vfwscanf?view=msvc-170                                       ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vswprintf.c  ">vswprintf()                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsprintf-vsprintf-l-vswprintf-vswprintf-l-vswprintf-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vswscanf.c   ">vswscanf()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vsscanf-vswscanf?view=msvc-170                                       ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Vwprintf.c   ">vwprintf()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/vprintf-vprintf-l-vwprintf-vwprintf-l                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcrtomb.c    ">wcrtomb()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcrtomb                                                              ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCat.c     ">wcscat()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcat-wcscat-mbscat                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsChr.c     ">wcschr()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strchr-wcschr-mbschr-mbschr-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCmp.c     ">wcscmp()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcmp-wcscmp-mbscmp                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsColl.c    ">wcscoll()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcoll-wcscoll-mbscoll-strcoll-l-wcscoll-l-mbscoll-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsCSpn.c    ">wcscspn()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcspn-wcscspn-mbscspn-mbscspn-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcsftime.c   ">wcsftime()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strftime-wcsftime-strftime-l-wcsftime-l                              ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsLen.c     ">wcslen()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strlen-wcslen-mbslen-mbslen-l-mbstrlen-mbstrlen-l                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCat.c    ">wcsncat()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncat-strncat-l-wcsncat-wcsncat-l-mbsncat-mbsncat-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCmp.c    ">wcsncmp()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncmp-wcsncmp-mbsncmp-mbsncmp-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsNCpy.c    ">wcsncpy()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strncpy-strncpy-l-wcsncpy-wcsncpy-l-mbsncpy-mbsncpy-l                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/_WcsNICmp.c  ">_wcsnicmp()                   </a></td><td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/strnicmp-wcsnicmp-mbsnicmp-strnicmp-l-wcsnicmp-l-mbsnicmp-l         ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsPbrk.c    ">wcspbrk()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strpbrk-wcspbrk-mbspbrk-mbspbrk-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsPpy.c     ">wcscpy()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strcpy-wcscpy-mbscpy                                                 ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsRChr.c    ">wcsrchr()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strrchr-wcsrchr-mbsrchr-mbsrchr-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wcsrtombs.c  ">wcsrtombs()                   </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcsrtombs                                                            ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsSpn.c     ">wcsspn()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strspn-wcsspn-mbsspn-mbsspn-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsStr.c     ">wcsstr()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strstr-wcsstr-mbsstr-mbsstr-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WcsTok.c     ">wcstok()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtok-strtok-l-wcstok-wcstok-l-mbstok-mbstok-l                      ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstol.c     ">wcstol()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtol-wcstol-strtol-l-wcstol-l                                      ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoll.c    ">wcstoll()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoll-strtoll-l-wcstoll-wcstoll-l?view=msvc-170                    ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoul.c    ">wcstoul()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoul-strtoul-l-wcstoul-wcstoul-l                                  ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcstoull.c   ">wcstoull()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoll-strtoll-l-wcstoll-wcstoll-l?view=msvc-170                    ">C99, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wcsxfrm.c    ">wcsxfrm()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strxfrm-wcsxfrm-strxfrm-l-wcsxfrm-l                                  ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wctob.c      ">wctob()                       </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctob                                                                ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemChr.c    ">wmemchr()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memchr-wmemchr                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemCmp.c    ">wmemcmp()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcmp-wmemcmp                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemCpy.c    ">wmemcpy()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memcpy-wmemcpy                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemMove.c   ">wmemmove()                    </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memmove-wmemmove                                                     ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/WMemSet.c    ">wmemset()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/memset-wmemset                                                       ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/Wprintf.c    ">wprintf()                     </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/printf-printf-l-wprintf-wprintf-l                                    ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wchar_h/wscanf.c     ">wscanf()                      </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/scanf-scanf-l-wscanf-wscanf-l                                        ">C95, is implemented</a></td>           <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">stdlib.h  —  General utilities</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_i64toa.c">_i64toa()                    </a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_i64tow.c">_i64tow()                    </a></td>                                                     <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_itoa.c">_itoa()                        </a></td>                                                                   <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_itow.c">_itow()                        </a></td>                                                             <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ltoa.c">_ltoa()                        </a></td>                                                                  <td><a href="https://docs.microsoft.com/en-us/previous-versions/6y51bcy2(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ltow.c">_ltow()                        </a></td>                                                            <td><a href="https://docs.microsoft.com/en-us/previous-versions/6y51bcy2(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ui64toa.c">_ui64toa()                  </a></td>                                                 <td><a href="https://docs.microsoft.com/en-us/previous-versions/yakksftt(v=vs.140)                                                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ultoa.c">_ultoa()                      </a></td>                                                        <td><a href="https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/d5t0h1wd(v=vs.110)                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_ultow.c">_ultow()                      </a></td>                                                  <td><a href="https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/d5t0h1wd(v=vs.110)                ">MSFT specific, is implemented   </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/abort.c">abort()                        </a></td>                                                                                                     <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abort                                               ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Abs.c">abs()                            </a></td>                                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abs-labs-llabs-abs64                                ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atexit.c">atexit()                      </a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atexit                                              ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atof.c">atof()                          </a></td>                                                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atof-atof-l-wtof-wtof-l                             ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atoi.c">atoi()                          </a></td>                                                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atoi-atoi-l-wtoi-wtoi-l                             ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/atol.c">atol()                          </a></td>                                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atol-atol-l-wtol-wtol-l                             ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/bsearch.c">bsearch()                    </a></td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/bsearch                                             ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Calloc.c">calloc()                      </a></td>                                                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/calloc?view=vs-2019                                 ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Div.c">div()                            </a></td>                                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/div?view=vs-2019                                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/exit.c">exit()                          </a>, <a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/_exit.c">_exit()                          </a></td>                                                                                                <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/exit-exit-exit?view=vs-2019                         ">C90/MSFT specific, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Free.c">free()                          </a></td>                                                                                                 <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/free?view=vs-2019                                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/getenv.c">getenv()                      </a></td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/getenv-wgetenv?view=vs-2019                         ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Labs.c">labs()                          </a></td>                                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/abs-labs-llabs-abs64?view=vs-2019                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Ldiv.c">ldiv()                          </a></td>                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/div?view=vs-2019                                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Malloc.c">malloc()                      </a></td>                                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/malloc?view=vs-2019                                 ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mblen.c">mblen()                        </a></td>                                                                                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbclen-mblen-mblen-l?view=vs-2019                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mbstowcs.c">mbstowcs()                  </a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbstowcs-mbstowcs-l?view=vs-2019                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/mbtowc.c">mbtowc()                      </a></td>                                                                 <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mbtowc-mbtowc-l?view=vs-2019                        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Qsort.c">qsort()                        </a></td>                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/qsort?view=vs-2019                                  ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/rand.c">rand()                          </a></td>                                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/rand?view=vs-2019                                   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/Realloc.c">realloc()                    </a></td>                                                                                <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/realloc?view=vs-2019                                ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/srand.c">srand()                        </a></td>                                                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/srand?view=vs-2019                                  ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtod.c">strtod()                      </a></td>                                                                    <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtod-strtod-l-wcstod-wcstod-l?view=vs-2019        ">C90, is not yet implemented     </a></td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtol.c">strtol()                      </a></td>                                                        <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtol-wcstol-strtol-l-wcstol-l        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtoll.c">strtoll()                    </a></td>                                                        <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoll-strtoll-l-wcstoll-wcstoll-l   ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtoul.c">strtoul()                    </a></td>                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoul-strtoul-l-wcstoul-wcstoul-l        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/strtoull.c">strtoull()                  </a></td>                                              <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/strtoull-strtoull-l-wcstoull-wcstoull-l    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/system.c">system()                      </a></td> <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/system-wsystem?view=vs-2019                         ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/wcstombs.c">wcstombs()                  </a></td>                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wcstombs-wcstombs-l?view=vs-2019                    ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/stdlib_h/wctomb.c">wctomb()                      </a></td>                                                                                   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctomb-wctomb-l?view=vs-2019                        ">C90, is implemented             </a></td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">wctype.h  —  Wide character classification and mapping utilities</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
		    <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswalnum.c  ">iswalnum()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalnum-iswalnum-isalnum-l-iswalnum-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswalpha.c  ">iswalpha()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isalpha-iswalpha-isalpha-l-iswalpha-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswblank.c  ">iswblank()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isblank-iswblank-isblank-l-iswblank-l         ">C99, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswcntrl.c  ">iswcntrl()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/iscntrl-iswcntrl-iscntrl-l-iswcntrl-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswctype.c  ">iswctype()                </a></td>                                                                           <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isctype-iswctype-isctype-l-iswctype-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswdigit.c  ">iswdigit()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isdigit-iswdigit-isdigit-l-iswdigit-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswgraph.c  ">iswgraph()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isgraph-iswgraph-isgraph-l-iswgraph-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswlower.c  ">iswlower()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/islower-iswlower-islower-l-iswlower-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswprint.c  ">iswprint()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isprint-iswprint-isprint-l-iswprint-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswpunct.c  ">iswpunct()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ispunct-iswpunct-ispunct-l-iswpunct-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswspace.c  ">iswspace()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isspace-iswspace-isspace-l-iswspace-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswupper.c  ">iswupper()                </a></td>                                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isupper-isupper-l-iswupper-iswupper-l         ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/iswxdigit.c ">iswxdigit()               </a></td>                                                                                         <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/isxdigit-iswxdigit-isxdigit-l-iswxdigit-l     ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towctrans.c ">towctrans()               </a></td>                                                                      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/towctrans                                     ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towlower.c  ">towlower()                </a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tolower-tolower-towlower-tolower-l-towlower-l ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/towupper.c  ">towupper()                </a></td>                                                                                       <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/toupper-toupper-towupper-toupper-l-towupper-l ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/wctrans.c   ">wctrans()                 </a></td>                                                                          <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctrans                                       ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/wctype_h/wctype.c    ">wctype()                  </a></td>                                                                            <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/wctype                                        ">C95, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">math.h  —  Mathematical functions</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/acos.c    ">acos()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/acos-acosf-acosl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/asin.c    ">asin()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/asin-asinf-asinl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/atan.c    ">atan()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atan-atanf-atanl-atan2-atan2f-atan2l  ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/atan2.c   ">atan2()                   </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/atan-atanf-atanl-atan2-atan2f-atan2l  ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/ceil.c    ">ceil()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ceil-ceilf-ceill                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/cos.c     ">cos()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/acos-acosf-acosl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/cosh.c    ">cosh()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/cosh-coshf-coshl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/exp.c     ">exp()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/exp-expf                              ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/fabs.c    ">fabs()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fabs-fabsf-fabsl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/floor.c   ">floor()                   </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/floor-floorf-floorl                   ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/fmod.c    ">fmod()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/fmod-fmodf                            ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/frexp.c   ">frexp()                   </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/frexp                                 ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/ldexp.c   ">ldexp()                   </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/ldexp                                 ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/log.c     ">log()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/log-logf-log10-log10f                 ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/log10.c   ">log10()                   </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/log-logf-log10-log10f                 ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/modf.c    ">modf()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/modf-modff-modfl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/pow.c     ">pow()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/pow-powf-powl                         ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sin.c     ">sin()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sin-sinf-sinl                         ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sinh.c    ">sinh()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sinh-sinhf-sinhl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/sqrt.c    ">sqrt()                    </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/sqrt-sqrtf-sqrtl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/tan.c     ">tan()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tan-tanf-tanl                         ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/math_h/tanh.c    ">tanh()                     </a></td>   <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/tanh-tanhf-tanhl                      ">C90, is implemented</a></td>         <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">direct.h  —  non-C-Standard and Microsoft specific functions</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/direct_h/_mkdir.c">_mkdir()                  </a></td>              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/mkdir-wmkdir              ">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">mbctype.h  —  non-C-Standard and Microsoft specific functions</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/mbctype_h/_getmbcp.c">_getmbcp()             </a></td>              <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/getmbcp              ">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/mbctype_h/_setmbcp.c">_setmbcp()             </a></td>     <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/setmbcp              ">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td></tr>
<tr> <th colspan="2">io.h  —  Microsoft specific / POSIX like functions</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Close.c        ">_close()                  </a></td>                                                           <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/close                ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Eof.c          ">_eof()                    </a></td>                                                             <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/eof                  ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Fdopen.c       ">_fdopen()                 </a></td>                                      <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/fdopen-wfdopen       ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Fileno.c       ">_fileno()                 </a></td>                                                    <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/fileno               ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findfirst.c    ">_findfirst()              </a></td>      <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findfirst-functions   ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findnext.c     ">_findnext()               </a></td>                  <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findnext-functions    ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_findclose.c    ">_findclose()              </a></td>                                              <td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/findclose             ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_isatty.c       ">_isatty()                 </a></td>                                                       <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/isatty               ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Lseek.c        ">_lseek()                  </a></td>                                 <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/lseek-lseeki64       ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Open.c         ">_open()                   </a></td>                      <td><a href="https://learn.microsoft.com/de-de/cpp/c-runtime-library/reference/open-wopen           ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Read.c         ">_read()                   </a></td>     <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/read                 ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
        <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/io_h/_Write.c        ">_write()                  </a></td>                   <td><a href="https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/write                ">MSFT specific, is implemented</a></td>        <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2">sys/stat.h  —  Microsoft specific / POSIX like functions</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br><br>PEI </th> </tr> 
            <tr><td><a href="https://github.com/KilianKegel/torosrc/blob/main/toroCLibrary/Library/sys/stat_h/_stat64i32.c">_stat64i32()        </a></td><td><a href="https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stat-functions">MSFT specific, is implemented</a></td>    <td>&#x2611</td><td>&#x2611</td><td>&#x2610</td><td>&#x2610</td></tr>
<tr> <th colspan="2"><i>toro C Library</i> specific extensions</th>                                                                                                                       
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/Windows11-logo.png" width="80" height="40"></th> 
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"<br>SHELL</th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"> <br>DXE/SMM </th>
    <th><img src="https://github.com/KilianKegel/pictures/blob/master/uefi-logo.png" width="40" height="40"><br>PEI</th> </tr> 
    <tr><td><a href="https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/string_h/_StrEfiError.c">_strefierror() </a></td><td></a>UEFI counterpart of strerror()</td><td>&#x2610</td><td>&#x2611</td><td>&#x2611</td><td>&#x2611</td>
</tr>
</table>

## Source Code

The source code of **toro C Library binary** is available at:

[![Repo name](https://github-readme-stats.vercel.app/api/pin/?username=KilianKegel&repo=Visual-TORO-C-LIBRARY-for-UEFI)](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI)

It builds **DEBUG/RELEASE** configurations for **x86-32** and **x86-64** platforms directly.

## Goal

The **toro C Library** is designed to enable the developer to create
Standard C programs for UEFI Shell, Windows NT and Linux (in future releases)
running in x86-64 mode. Standard C compliant source code shall be easily portable to operating systems
supported by **toro C Library**.

The **toro C Library** shall provide full library compatibility with

* [**ANSI X3.159-1989 ("ANSI C")**](https://nvlpubs.nist.gov/nistpubs/Legacy/FIPS/fipspub160.pdf)
* **ISO/IEC 9899 First edition 1990-12-15** ("**C90**")
* **ISO/IEC 9899 First edition 1990-12-15**, **Amendment 1, 1995-04-01** (often called ""**C95**")

**NOTE:** The original **C90** and **C95** standards are not available for free download. See [**ISO/IEC 9899 - Revision of the C standard**](https://www.open-std.org/JTC1/SC22/WG14/www/projects#9899) for more information.

For more information on **ANSI C**, **C90** and **C95** history read: https://en.wikipedia.org/wiki/ANSI_C

### Forwards to the roots
Extensions to these standards (**ISO 9899:1999** etc.), [**secure**](https://docs.microsoft.com/en-us/cpp/c-runtime-library/security-features-in-the-crt?view=vs-2019) / *bounds checking interface* functions `xyz_s()` from [**ISO 9899:2011, Annex K**](http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf#page=600), [**POSIX**](https://en.wikipedia.org/wiki/C_POSIX_library) functions or  Microsoft specific add-ons will be implemented [_on demand_](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand) into **toro C Library**.

Be aware, that functions like <del>[`stricmp()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/stricmp-wcsicmp?view=vs-2019) (case sensitive string handling), [`itoa()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/itoa-itow?view=vs-2019) (integer to string conversion)</del>,
a very famous [`kbhit()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/posix-kbhit?view=vs-2019) (check for keystroke at console[<sup>0</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-1.md)), 
<del>fopen()-mode-strings like `"rt"`, `"wt"` (textmode read/write, just use `"r"`, `"w"` instead)</del> and <del>[`open()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/open?view=vs-2019) (POSIX) are provided in various C-Library-implementations</del>, but not specified by **ANSI X3.159-1989** or **ISO/IEC 9899:1990**, and therefore _currently not_ available in the **toro C Library**, but will be implemented [_on demand_](https://github.com/KilianKegel/torito-C-Library#non-standard-c90c95-functions-that-will-be-implemented-on-demand).

[original **ANSI C Specification**](https://nvlpubs.nist.gov/nistpubs/Legacy/FIPS/fipspub160.pdf)

As long as the developer moves within these standards[<sup>1</sup>](http://www.torek.net/torek/c/index.html) and does not use
any OS-specific interface or platform dependent idiosyncrasy, the created
executable shall be producible merely by linking the object modules against **toro C Library**
and choosing the OS-dependent /ENTRY:_cdeCRT0`OSNAME`, e.g. `_cdeCRT0UefiShell` or `_cdeCRT0WinNT`.


## Approach

The C standards mentioned above allow some flexibility in library implementations. 
This flexibility can affect aspects such as return values, which may provide flags beyond simply being 'nonzero' as specified, 
or differences in handling text versus binary modes for file operations.

The **toro C Library** aims to be fully identical in behavior to the functions specified in
ANSI C, C90, and C95, as implemented in the **Standard C Library** (LIBCMT.LIB) provided with **Visual Studio 2022**.<br>


[Microsoft C Language Reference](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2019)

Doing so, the development of **toro C Library** itself is unburdened from the exegesis of the specifications mentioned above and the creation of the required header files — the header files delivered
with **Visual Studio 2022** are utilized instead.

The developer using **toro C Library** benefits from this approach because the experience remains unchanged using the **Visual Studio 2022** environment.

## Riding the UEFI shell / enabling the platform for developers

With the disappearance of **MSDOS** – a simple, single-threaded, unprotected operating system that provided 
full hardware access to user programs – the **UEFI shell** was envisioned as its successor for modern personal computer.

However, the absence of a compatible and stable programming interface, such as the 
[**ANSI/ISO C Standard Library**]( https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf#page=176), 
combined with a well-established and widely recognized development environment (like **Visual Studio 2022**), 
has made it challenging to get started with **UEFI Shell** programming for everyone.

## Reimplementing LIBCMT.LIB for Windows NT

The primary purpose of the **toro C Library** for WinNT is to validate C library compatibility on 
a Windows x64 platform for both **x86-32** and **x86-64** architectures.

Typically, test programs are linked first against the original LIBCMT.LIB and then against the **toro C Library** for WinNT. This allows for a direct comparison of program behavior on Windows.[<sup>4</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-4.md)

Most bugs and pitfalls can be identified, debugged, and resolved efficiently within the build and debug environment of Visual Studio 2022.

**This approach is considered the most effective way to achieve ANSI C compatibility and ensure a faultless implementation within a reasonable timeframe.** 

**The majority of function tests can be executed, debugged, and validated natively on the Windows 
development machine, with only the final tests requiring execution on the UEFI Shell target.**

This methodology is made possible by the [**OSIF**](https://github.com/KilianKegel/CdePkg/blob/master/README.md#interface-architecture) (**O**perating **S**ystem **I**nter**f**ace) architecture of the library.

![OSIF](https://github.com/KilianKegel/CdePkg/blob/master/archview.png)

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

WELCOME.c can be translated in the [VS2022 64Bit command line environment](https://github.com/tianocore/edk2-staging/blob/CdePkg/blogs/2021-11-14/README.md#starting-visual-studio-2022)
by running the [build.bat](https://github.com/KilianKegel/torito-C-Library/blob/master/build.bat) script below:

```bat
@echo off
echo Compiling the C source...
cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64.lib KERNEL32.LIB
```

With the CLANG/LLVM tool chain, the same source code can be translated by running the [buildLLVM.bat](https://github.com/KilianKegel/torito-C-Library/blob/master/buildLLVM.bat)
```bat
@echo off
title LLVM Build Script for UEFI Shell and Windows NT Console
echo Compiling the C source with the LLVM tool chain...
CLANG-cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
LLD-link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64LLVMUefiShell.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
LLD-link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64LLVMWinNT.lib KERNEL32.LIB
```
**With just one additional link-step in the above script, without re-compiling, a Windows NT executable could be created.**

If you prefer to use state-of-the-art build environment **Visual Studio 2022**, please follow
the step-by-step-configuration [HowTo-configure-VS2022-to-build-.EFI-executables](https://github.com/KilianKegel/HowTo-configure-VS2022-to-build-.EFI-executables#howto-configure-vs2022-to-build-efi-executables)

To run **Visual Studio 2022** .EFI samples, check out [Visual-ANSI-C-for-UEFI-Shell](https://github.com/KilianKegel/Visual-ANSI-C-for-UEFI-Shell#visual-ansi-c-for-uefi-shell).

## Known bugs
* printf()-family's format specifiers e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md) not yet implemented
* scanf()-family's format specifiers e,f,g[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md),C,S not yet implemented
* <time.h>: UTC-only support. No Daylightsaving, no timezones. **This is not a bug!** It conforms to the Standard C specification because<br>
  ["The local time zone and Daylight Saving Time are implementation-defined."](https://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf#page=350)
* <locale.h>: C-locale-only support. **This is not a bug!** It conforms to the Standard C specification because only the ["C" locale](https://www.open-std.org/JTC1/SC22/WG14/www/docs/n1256.pdf#page=217) is mandatory.
## Resolved bugs
* 2025-02-09: <math.h> not yet implemented[<sup>2</sup>](https://github.com/KilianKegel/torito-C-Library/blob/master/footnotes/footnote-2.md)
* 2019-10-17: CTRL-C interception not yet implemented
* 2019-10-17: **toro C Library based progams use ASCII console interface only, not UCS-2!**
    - ASCII is written to `stdout`and `stderr`
    - ASCII is read from `stdin`
    pay attention when dealing with `>`, `<`, `|` and `>a`, `<a`, `|a` shell operators
* 2018-11-29: file operations does not yet support drive mappings and path<
* 2018-01-07: strtol()'s/strtoul()'s base parameter accepts only 0d, 8d, 10d, 16d.
* scanf()-family's format specifiers `[]`,p
### non-Standard C90/C95 functions that will be implemented _on demand_
* [`kbhit()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/posix-kbhit)
* <del>[`strnlen()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/strnlen-strnlen-s)</del>
* <del>[`_ltoa()`](https://docs.microsoft.com/en-us/cpp/c-runtime-library/reference/itoa-itow?view=msvc-160)</del>

## Revision history
### 20250720, v0.9.4 Build 672
* **add LLVM/CLANG-cl-family support — the library source code itself is now buildable with LLVM/CLANG-cl:**
    * support VS2022 v17.14 with **LLVM (clang-cl)** tool chain
    * support **Intel C++ Compiler 2024** tool chain<br>
      **NOTE:** Only [**Intel oneAPI Base Toolkir ver 2024.2.1**](https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html)
      provides the 32Bit compiler.<br>In versions **2025.x.y** the 32Bit compiler isn't shipped anymore.
* Windows SDK version **10.0.26100.0**
* support Microsoft tool chain:
    * **v143(VS2022)**
    * **v142(VS2019)** 
    * **v141(VS2017)**

### 20250322, v0.9.1 Build 267
* introduce **toro C Library** for the **Microsoft VS2022 LLVM tool chain** for **Windows NT** and **UEFI Shell** targets<br>
    - toroc64LLVMUefiShell.lib
    - toroc64LLVMWinNT.lib
    - toroc32LLVMUefiShell.lib
    - toroc32LLVMWinNT.lib

  **NOTE:** The LLVM linker **lld-link** can't deal with the multi-entrypoint library **toro C Library** directly.<br>
            To remedy this, the **toro C Library** is simply split into the above separate libraries.
* fix double float representation using printf()-**%G**-format specifier used in [**libxlsxwriter**](https://github.com/KilianKegel/Visual-LIBXLSXWRITER-for-UEFI-Shell#visual-libxlsxwriter-for-uefi-shell).
* fix [`pow()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/pow.c): **+/-infinity<sup>negative number</sup>**
* add missing import library version of [`wctob()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/wctobCDEABI.c)

### 20250309, v0.9.0 Build 243
#### finalize MATH.H implementation
The architecture of this math library introduces a space optimized implementation of C's MATH.H functions,
while keeping precision and correctness as good as already known in earlier x87-based math libraries.<BR>
Since the traditional math coprocessor 80387 is still present in current x86 processors and is also not deprecated
in the [X86S specification](https://www.intel.com/content/www/us/en/developer/articles/technical/envisioning-future-simplified-architecture.html) [.PDF](https://github.com/KilianKegel/4KPages-TechDocs/blob/main/x86s-eas-external-1.1.pdf),
it can be used here.<br><br>
The 80387 processor has various improvements over its 8087 predecessor, such as<br>
  * range extension for transcendental function:

    | Instruction  | function           |
    |--------------|--------------------|
    |FPTAN         | Partial tangent            |
    |FPATAN        | Partial arctangent         |
    |F2XM1         | 2<sup>x</sup> - 1          |
    |FYL2X         | Y * log<sub>2</sub>X       |
    |FYL2XP1       | Y * log<sub>2</sub>(X + 1) |
    
* new instructions, e.g.

    | Instruction  | function                 |
    |--------------|--------------------------|
    |FXAM          |  Examine Floating-Point  |
    |FSIN          | sine                     |
    |FCOS          | cosine                   |

* That has reduced the programming effort dramatically and made algorithms very simple and easy to implement.<br>
<img src="https://upload.wikimedia.org/wikipedia/commons/1/14/Intel_C8087.jpg" width="400"/><br>
    * [`acos()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/acos.c)
    * [`asin()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/asin.c)
    * [`atan()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/atan.c)
    * [`atan2()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/atan2.c)
    * [`ceil()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/ceil.c)
    * [`cos()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/cos.c)
    * [`cosh()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/cosh.c)
    * [`exp()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/exp.c)
    * [`fabs()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/fabs.c)
    * [`floor()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/floor.c)
    * [`fmod()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/fmod.c)
    * [`frexp()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/frexp.c)
    * [`ldexp()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/ldexp.c)
    * [`log()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/log.c)
    * [`log10()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/log10.c)
    * [`modf()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/modf.c)
    * [`pow()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/pow.c)
    * [`sin()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/sin.c)
    * [`sinh()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/sinh.c)
    * [`sqrt()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/sqrt.c)
    * [`tan()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/tan.c)    
    * [`tanh()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/math_h/tanh.c)

**All these functions run also in UEFI POST stages PEI, DXE, SMM.**

### 20241222, v0.8.8 Build 227
* fix [`abort()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/stdlib_h/abort.c)
  processes [`atexit()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/stdlib_h/atexit.c)
  registered functions and closes files before exit.
* fix [`memset()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/string_h/MemSetCDEINTRINABI.c)
  to do solely 8Bit memory machine operations.
* add Microsoft C Library functions: 
    - [`_exit()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/stdlib_h/_exit.c)
* fix minor symbol naming error
### 20241013, v0.8.7 Build 200
* fixed: removed  disassembled math function wasn't replaced by extracted intrinsic 
math function from Microsoft **LIBCMT.LIB**:
    * `ftol3.obj`
    * `ullshr.obj`
    * `ullrem.obj`
    * `ulldvrm.obj`
    * `ulldiv.obj`
    * `llshr.obj`
    * `llshl.obj`
    * `llrem.obj`
    * `llmul.obj`
    * `lldvrm.obj`
    * `lldiv.obj`
    original Microsoft functions are now available in the **toro C Library** for 32Bit.
* **NEW**: Introduce **preliminary alpha** version of `MATH.H` functions<br>
### 20240908, v0.8.6 Build 187
* introduce intrinsic math function (`_allXYZ()`, `_aullXYZ()` and `__ltod3()`) extraction from Microsoft **LIBCMT.LIB**<br>
    * remove disassembled `__allXYZ()` and `__aullXYZ()` from `toroCLibrary`
* fixed `stat()` running on WINDOWS reports wrong time stamp
* fixed `stat()` running on UEFI reports from erronous time stamp by exacly one month
* fixed `stat()` running on UEFI to support MSDOS drive name (**A:**, **B:**, **C:** ...)
* fixed `system()` running on UEFI with output redirection emits additional garbage characters
### 20240804, v0.8.5 Build 122
* improve **C++** support for `CDE.H`
    * enable mixed *C/C++* applications based **toro C Library** using `CDE.H`
* fixe SMM issues:
    * fix `CdePkg`-based SMM drivers hangs on startup.
    * fix `CdeServicesSmm.c` failed to build<br>
**NOTE: The improvement above doesn't change ANSI-C related behaviour of previous library versions**
### 20240505, v0.8.4 Build 91
* fixed EDK2 `DEBUG` trace macro won't crash anymore with
  UEFI specific (non-ANSI-C) format specifiers: **%g**, **%t** and **%r**<br>
**NOTE: The improvement above doesn't change ANSI-C related behaviour of previous library versions**
### 20240414, v0.8.2 Build 73
* add timeout detection for disabled **COM1**/**UART at I/O 3F8h** used for debug traces.<br>
  NOTE: Disabled I/O devices usually do not respond to I/O cycles.  
  Internally this is done by ignoring the chipselect for that particular I/O address range, e.g. 3F8h .. 3FFh for **COM1**.  
  FFh is driven to the data bus when reading registers of those disabled devices.<br>
  On special implementations hardware designers chose a different approach to disabled devices:<br>
    1. address decoding is kept enabled
    2. internal clock line is stopped or decoupled from internal circuitry<br>
       The disadvantage of this aproach is, that status registers are still visible
       but not updated anymore.
### 20240309, v0.8.1 Build 54
* add Microsoft/POSIX C Library functions: 
    - [`_lseek()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/io_h/_Lseek.c)
    - [`_eof()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/io_h/_Eof.c)
### 20231118
* add ACPI timer based synchronization for **toro C Library** Shell programs.
  NOTE: On recent Intel platforms the previously used legacy timer's (i8254) input clock frequency is
  clocked down to an unspecified frequency with setup default `Enable 8254 Clock Gate`.
  Additionally the I/O latency to access i8254 ports is increased with setup default `Legacy IO Low Latency`
  that lowers i8254 based timing precision.<br>
  So i8254 gets unusable for UEFI Shell programs on new platforms.
* improve synchronization error correction for i8254 based POST drivers (with `Enable 8254 Clock Gate := disable`, `Legacy IO Low Latency := enable`)
### 20231014
* fixed: [**libxlsxwriter**](https://github.com/KilianKegel/Visual-LIBXLSXWRITER-for-UEFI-Shell#visual-libxlsxwriter-for-uefi-shell) based
    UEFI and Windows applications create .XLSX that can't be opened with **Microsoft Excel 2016**. 
    Office 365 online (https://www.microsoft365.com) and offline didn't fail.
### 20230926
* fixed: [`_strefieerror()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/string_h/_StrEfiError.c) to return error correct string when running in pre-memory PEI
### 20230916
* improve debug trace CDETRACE() configuration switches
    * `#define CDEDBG STDOUT` – traces directed to stdout
    * `#define CDEDBG STDERR` – traces directed to stderr
    * `#define CDEDBG STDDBG` – traces directed to CDE debug channel, normally COM1, I/O 0x3F8 115200,8,n,1
    * `CDEDBG` undefined – UEFI Shell/post DRIVERS: STDDBG, Windows NT: STDOUT
### 20230909
* add `CDE`(*C Development Environment*)-interface for native **Tianocore UEFI SHELL** [`UEFISHELLDRV`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/tree/main/toroCLibrary/OSInterface/UEFISHELLDRV).<br>
  Enable [**Toro-C-Library**–`DXE`](https://github.com/KilianKegel/toro-C-Library#implementation-status) function set at `CRT0()`
  and full [**Toro-C-Library**–`SHELL`](https://github.com/KilianKegel/toro-C-Library#implementation-status) function set with availability
  of the `EfiShellProtocol`/`EFI_SHELL_PROTOCOL_GUID`:<br>
  https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/tree/main/toroCLibrary/OSInterface/UEFISHELLDRV<br>

  This is the foundation of an **ANSI-C-API**-extended "**CDE UEFI SHELL**"

* prepare `system()` **ANSI-C-API** call for MSDOS drive name support (**A:**, **B:**, **C:** ...) coming soon for [**Visual-UEFI-SHELL**](https://github.com/KilianKegel/Visual-UEFI-SHELL#edk2-uefi-shell--visual-uefi-shell)
* update [`MdePkg`](https://github.com/KilianKegel/MdePkgInc) to version **edk2-stable202308**
* improve [`CDEABI`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/README.md#20230212) (*C Development Environment Application Binary Interface*)<br>
    * force *all* `Core` and operating system interface `osif` modules to uses exclusively **ANSI-C-API** on `CDEABI` to avoid collision with EDK2 `StdLibC` and relatives<br>
      primarily remaining `errno()`, `setjmp()`, `longjmp()`, `strlen()`, `strcpy()`, `strcmp()`, `wcslen()`, `wcscpy()`, `wcscmp()`
* improve `freopen()` to set *redirection flag* `O_CDEREDIR` to speed up character transission to file
* fix `fscanf()`: assignment suppression indicated by a "*": https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf#page=295 
* fix `raise()`
* INTERN: 
	* add:  `size_t _cdeInt2EfiStatus(int intstatus)`
	* add:  `int _cdeEfiStatus2Int(size_t Status)`
	* move selected file functions to [`CdeAppIf`](https://github.com/KilianKegel/CdePkg/blob/master/Include/CdeServices.h#L421) driver side.<br>
	This allows future/upcoming code size reduced shell application type.
	* preliminary: LINUX-OSIF buildable, ALPHA
	* preliminary: `osifCdeUefiShellAppEntryPoint()`, `osifCdeUefiShellAppCRT0Service()` for future/upcoming shell application type
        that doesn't include entire `CdeAppIf` machine code to each .EFI application, but share `CdeAppIf` provided by a **CDE UEFI SHELL**.
        This allows code size reduced applications.

### 20230625
* add Standard C95 Library functions: 
	- [`mbrlen()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/mbrlen.c)
	- [`mbrtowc()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/mbrtowc.c)
	- [`mbsinit()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/mbsinit.c)
	- [`mbsrtowcs()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/mbsrtowcs.c)
	- [`wcrtomb()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/wcrtomb.c)
	- [`wcsftime()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/wcsftime.c)
	- [`wcsrtombs()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/wcsrtombs.c)
	- [`wscanf()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/wchar_h/wscanf.c)
* add Microsoft C Library functions from `mbctype.h`: 
    - [`_getmbcp()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/mbctype_h/_getmbcp.c)
    - [`_setmbcp()`](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI/blob/main/toroCLibrary/Library/mbctype_h/_setmbcp.c)
* fixed: `printf()`/`wprintf()`-family handling of wide characters > value 255
* adjust internal `invalid_parameter_handler()` to suppress additional debug/file information
* fixed: `wcsxfrm()`/`strxfrm()` add `invalid_parameter_handler()` support as original Microsoft C Library

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
* partially implementation of the %G `fprintf()` – format specifier for [Visual-LIBXLSXWRITER-for-UEFI-Shell](https://github.com/KilianKegel/Visual-LIBXLSXWRITER-for-UEFI-Shell#visual-libxlsxwriter-for-uefi-shell)
* fixed `fread()` end-of-file indicator not set correctly when EOF is reached within a buffer instead of reading of 0 bytes from the mass storage device
* changed exit code of the `abort()` function from 3 to 0xC0000409
* fixed: reassigned (by running `freopen()`) filepointers to `stdout`/`stderr` are not flushed at exit
* `CdePkg`– SMM Driver: Erroneous message shown at startup: `FATAL ERROR : CdeServices SMM not available`

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
