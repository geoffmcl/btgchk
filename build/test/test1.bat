@setlocal
@REM #< test1.sh - 20190216 - btgchk project
@set BN=%~nx0
@set TMPLOG=tempcyyr-2.txt
@REM set TMPLOG=tempindex.txt
@set TMPOUT=temp
@set TMPEXE=..\RelWithDebInfo\btgchk.exe
@REM # seems really just the 'base' path
@REM TMPTER="/media/geoff/backup/next/scenery2"
@REM # TMPTER="/media/geoff/backup/next/scenery2/Terrain"
@set TMPTER1=F:\data\Scenery-1.0.1\Terrain
@set TMPTER=g:\S
@set TMPBUCK=w070n50\w061n53

@set TMPTPATH=%TMPTER%\Terrain\%TMPBUCK%
@set TMPAIR=CYYR
@set TMPIND=1958866
@set TMPBTG=%TMPTPATH%\%TMPAIR%.btg
@set TMPBTG2=%TMPTPATH%\%TMPIND%.btg
@set TMPBTGGZ=%TMPTPATH%\%TMPAIR%.btg.gz
@set TMPBTGGZ2=%TMPTPATH%\%TMPIND%.btg.gz
@set TMPBTG1n=%TMPTPATH%\%TMPAIR%-new.btg
@set TMPBTG2n=%TMPTPATH%\%TMPIND%-new.btg

@if NOT EXIST %TMPTER%\nul (
    echo %BN%: No such path '%TMPTER%
    exit /b 1
)

@if NOT EXIST %TMPBTG% (
    echo "%BN%: No such file '%TMPBTG%'
    exit /b 1
)
@if NOT EXIST %TMPBTG2% (
    echo "%BN%: No such file '%TMPBTG2%'
    exit /b 1
)

@if EXIST %TMPBTG1n% (
    echo "%BN%: file '%TMPBTG1n%' EXISTS! Move, delete, rename...
    exit /b 1
)
@if EXIST %TMPBTG2n% (
    echo "%BN%: file '%TMPBTG2n%' EXISTS! Move, delete, rename...
    exit /b 1
)

@REM if [ -f "%TMPLOG%" ]; then
@REM     rm -f "%TMPLOG%"
@REM fi
@set TMPOPT=-a %TMPAIR%
@REM TMPOPT="-i $TMPIND"

echo %BN%: Doing `%TMPEXE% -p %TMPTER% %TMPOPT%` out to %TMPLOG%
echo %BN%: Doing `%TMPEXE% -p %TMPTER% %TMPOPT%` > %TMPLOG%
echo "" >> %TMPLOG%

%TMPEXE% -p %TMPTER% %TMPOPT% >> %TMPLOG% 2>&1
@if ERRORLEVEL 1 (
    @echo %BN%: Done exit(0)
) else (
    @echo %BN%: non-zero exit(%ERRORLEVEL%)
)

@REM #eof
