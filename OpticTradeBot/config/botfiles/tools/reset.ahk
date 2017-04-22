#SingleInstance Force
SplashTextOn, 200, 65, Optic Trade Bot, `nPlease wait..

; Checks to see if a backup actually exists to stop sad mistakes.
IfNotExist, C:\ProgramData\OTBBackup
{
	SplashTextOff
	MsgBox, 16, OpticTradeBot Reset, No valid backup exists.
	ExitApp
}

; Closes down interfering processes
Process,Close,TradeBotLauncher.exe
Process,Close,TradeBotBackground.exe
Process,Close,TradeBotLogin.exe
;Process,Close,autohotkey.exe
Process,Close,cmd.exe

; Deletes the OpticTradeBot location
FileRemoveDir, C:\OpticTradeBot\, 1

; Copies the backup file to the OpticTradeBot location
FileCopyDir, C:\ProgramData\OTBBackup, C:\OpticTradeBot\

; Checks to see if backup was successful
IfNotExist, C:\OpticTradeBot
{
	SplashTextOff
	MsgBox, 16, OpticTradeBot Reset, Reset failed.
	ExitApp
}

SplashTextOff
MsgBox, 64, OpticTradeBot Reset, Reset program to defaults!
ExitApp