@echo off
echo Compiling the C source...
cl /nologo /c /GS- /D_NO_CRT_STDIO_INLINE /D_CRT_SECURE_NO_WARNINGS WELCOME.c

echo Linking the .OBJ to UEFI SHELL Executable WELCOME.EFI 
link /nologo /MAP:welcome.efi.map /NODEFAULTLIB /ENTRY:_cdeCRT0UefiShell /OUT:welcome.efi /SUBSYSTEM:EFI_APPLICATION WELCOME.obj toroC64.lib

echo Linking the .OBJ to Windows NT Executable WELCOME.EXE
link /nologo /MAP:welcome.exe.map /NODEFAULTLIB /ENTRY:_cdeCRT0WinNT /OUT:welcome.exe /SUBSYSTEM:CONSOLE WELCOME.obj toroC64.lib KERNEL32.LIB