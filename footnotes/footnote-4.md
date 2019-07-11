All testprograms are designed to report there results to STDOUT.

In case of formated I/O and string processing functions this is mostly a dump of raw memory data
around the destination address, to verify, that 8-, 16-, 32- and 64-Bit accesses 
(hh, h,  (none), l and ll prefixes) does not accidentally overwrite wrong memory locations.

Furthermore, for number conversation octal, decimal, hexadecimal and 2..26 based (`strtol()`)
processing brute force strategies are used to test critical bit pattern 

In case of file access and memory allocation functions elaborated tests are created
to guarantee conformance in respect of fileposition, correctness of data read and written,
EOF and error reporting/handling, text mode translation, boundary safety...
