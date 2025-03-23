@echo off
title LLVM Build Script for UEFI Shell and Windows NT Console
echo Compiling the C source with the LLVM tool chain...
CLANG-cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
LLD-link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64LLVMUefiShell.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
LLD-link /nologo /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64LLVMWinNT.lib KERNEL32.LIB