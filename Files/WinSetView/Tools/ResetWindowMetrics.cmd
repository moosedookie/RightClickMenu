@Echo Off
Cls
Echo.
Echo This tool resets the WindowMetrics registry key and then logs you off.
Echo When you log back on, Windows completes the reset by adjusting the
Echo settings for your curent screen scaling.
Echo.
choice /m "Proceed (y/n)?" /c YN /n
if errorlevel 2 (goto end)
"%~dp0..\AppParts\CSReg.exe" Import "%~dp0WindowMetrics.reg"
shutdown /l
:end
