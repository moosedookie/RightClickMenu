'www.sordum.org - Velociraptor & BlueLife - 03.03.2018

Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")
Set WshShell = WScript.CreateObject("Shell.Application")

For Each objOperatingSystem in colOperatingSystems
	if instr(objOperatingSystem.Caption, "Windows 10") Then
		WshShell.ShellExecute "shell:Appsfolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App"
	Else
		StikyNotPath = WScript.CreateObject("Wscript.Shell").ExpandEnvironmentStrings("%SystemRoot%\system32\StikyNot.exe")
		WshShell.ShellExecute StikyNotPath
	End If
Next
