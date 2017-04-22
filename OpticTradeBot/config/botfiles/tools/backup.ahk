#SingleInstance Force
SplashTextOn, 200, 65, Optic Trade Bot, `nPlease wait..

; Deletes previous backup
FileRemoveDir, C:\ProgramData\OTBBackup\, 1

; Closes down interfering processes
Process,Close,TradeBotLauncher.exe
Process,Close,TradeBotBackground.exe
Process,Close,TradeBotLogin.exe
;Process,Close,autohotkey.exe
Process,Close,cmd.exe

; Checks to see if deletion was successful
IfExist, C:\ProgramData\OTBBackup\
{
	SplashTextOff
	Gosub fail
	return
}

; Copies OpticTradeBot location to the backup location
FileCopyDir, C:\OpticTradeBot, C:\ProgramData\OTBBackup

; Checks to see if backup was successful
IfNotExist, C:\ProgramData\OTBBackup
{
	SplashTextOff
	Gosub fail
	return
}
done:
SplashTextOff
MsgBox, 64, OpticTradeBot Backup, Backup complete!
ExitApp
fail:
MsgBox, 16, OpticTradeBot Backup - Error, Backup encountered an error.
ExitApp