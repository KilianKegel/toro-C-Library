In the current implementation the interrupt descriptor table is not yet used for
hooking processor exceptions. So physical `SIGILL` and `SIGFPE` can not be catched by the
signal handling mechanism.
