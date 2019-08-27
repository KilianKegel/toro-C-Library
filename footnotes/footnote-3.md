In the current implementation the interrupt descriptor table is not yet used for
hooking processor exceptions. So physical `SIGILL` and `SIGFPE` can not be catched by the
signal handling mechanism.

C99 Specification 7.14 Signal handling <signal.h> says:

*An implementation need not generate any of these signals, except as a result of explicit
calls to the raise function. Additional signals and pointers to undeclarable functions,
with macro definitions beginning, respectively, with the letters SIG and an uppercase
letter or with SIG_ and an uppercase letter may also be specified by the
implementation. The complete set of signals, their semantics, and their default handling
is implementation-defined; all signal numbers shall be positive.*
