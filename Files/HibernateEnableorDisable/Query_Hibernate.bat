@Echo Off
Call :IsAdmin

Set tApp=Hibernate.exe
If Not %PROCESSOR_ARCHITECTURE% == x86 Set tApp=Hibernate_x64.exe

CD /D %~dp0\
If Not Exist "%tApp%" (
    Echo The file %tApp% was not found
	pause & exit
)

REM ~ Example 1
Start /Wait "" "%tApp%" /Q
Echo %ErrorLevel% ( 0 = Hibernate Disabled, 1 = Hibernate Enabled )

REM ~ Example 2
for /f "tokens=*" %%q in ('"%tApp%" /Q') do set tRESULT=%%q
Echo %tRESULT%

Pause & Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ...
 Pause & Exit
)
Cls
goto:eof