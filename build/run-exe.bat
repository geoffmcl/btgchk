@setlocal
@set BN=%~nx0
@set TMP3RD=D:\Projects\3rdParty.x64\bin
@if NOT EXIST %TMP3RD%\nul (
    echo %BN%: No such path '%TMP3RD% - *** FIX ME ***
    exit /b 1
)

@set TMPEXE=Release\btgchk.exe
@if NOT EXIST %TMPEXE% (
    echo %BN%: Can NOT locate '%TMPEXE%` - *** FIX ME ***
    exit /b 1
)

@set PATH=%TMP3RD%;%PATH%

%TMPEXE% %*
