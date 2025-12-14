@echo off
title LLVM Build Script for UEFI Shell and Windows NT Console
echo Compiling the C source with the LLVM tool chain...
CLANG-cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS /D_STATIC_INLINE_UCRT_FUNCTIONS=1 WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
LLD-link /nologo /MAP:welcomeLLVM.efi.map /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64LLVMUefiShell.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
LLD-link /nologo /MAP:welcomeLLVM.exe.map /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64LLVMWinNT.lib KERNEL32.LIB