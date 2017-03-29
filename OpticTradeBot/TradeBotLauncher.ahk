#SingleInstance Force
Active = 0
FileAppend,
(
temp
), C:\OpticTradeBot\prgon.txt
FileDelete, C:\OpticTradeBot\prgaupd.txt
FileDelete, C:\OpticTradeBot\aupd.bat
FileDelete, C:\OpticTradeBot\prgexit.txt
SplashTextOn, 200, 100, Optic Trade Bot, `n`nPlease wait
Sleep, 500
SplashTextOff
Menu, RunMenu, Add, &Skip Update, RunSD
Menu, RunMenu, Add, &Run Update, RunUpdates
Menu, RunMenu, Add, &Exit, RunExit
Menu, FileMenu, Add  ; Separator line.
Menu, SettingsMenu, Add, &Settings, Settings
Menu, SettingsMenu, Add, &Clear Log, ClearLog
Menu, FileMenu, Add  ; Separator line.
Menu, HelpMenu, Add, &About, HelpAbout
Menu, FileMenu, Add  ; Separator line.
Menu, UpgradeMenu, Add, &Upgrade to PRO!, RunUprgrades
Menu, UpgradeMenu, Add, &Activate, RunActivate
Menu, MyMenuBar, Add, &Run, :RunMenu
Menu, MyMenuBar, Add, &Settings, :SettingsMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu
Menu, MyMenuBar, Add, &Upgrade, :UpgradeMenu
Gui, Menu, MyMenuBar
Gui, Add, Text,, Welcome to the Optic Trade Bot. `nPlease select an option from the buttons.
Gui, Add, ListBox, vMyListBox gMyListBox w300 r10
Gui, Add, Progress, w300 h20 cGreen vMyProgress
Gui, Add, Button, x10 y204, Start
Gui, Add, Button, x50 y204, Stop
Gui, Add, Button, x90 y204, Reload
Gui, Add, Button, x143 y204, Settings
Gui, Add, Text, x280 y215, v1.1.0
GuiControl,, MyListBox, Trade Bot Launched.
Gui, Show,, Optic Trade Bot
GuiControl Enable, Reload

RunUpdates:
GuiControl Disable, Start
GuiControl Disable, Stop
GuiControl Disable, Reload

GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Downloading updates..
Run, C:\OpticTradeBot\updateDL.vbs
GuiControl, +cGreen, MyProgress
GuiControl,, MyProgress, 0
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
IfExist, C:\OpticTradeBot\prgsd.txt
	return
	

IfExist, C:\OpticTradeBot\aupd.bat
	Gosub Aupd
IfNotExist, C:\OpticTradeBot\aupd.bat
	GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Download failed. Press 'Reload' to enable offline.
    GuiControl, +cRed, MyProgress
	GuiControl Enable, Reload
	return
	
Aupd:
FileGetSize, aupdz, C:\OpticTradeBot\aupd.bat, K
Run C:\OpticTradeBot\aupd.bat
	
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Installing updates..
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
Sleep, 500
GuiControl,, MyProgress, +5
IfExist, C:\OpticTradeBot\prgsd.txt
	return
IfExist, C:\OpticTradeBot\prgaupd.txt
	Gosub Begin
IfNotExist, C:\OpticTradeBot\prgaupd.txt
    GuiControl, +cRed, MyProgress
	return

	Begin:
GuiControl,, MyProgress, 0
GuiControl Enable, Start
GuiControl Enable, Stop
GuiControl Enable, Reload
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Trade Bot Loaded!
MyListBox:
return


GuiEscape:
ExitApp
Gui, Show,, Optic Trade Bot
return

RunSD:
FileAppend,
(
temp
), C:\OpticTradeBot\prgsd.txt
GuiControl Enable, Start
GuiControl Enable, Stop
GuiControl Enable, Reload
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Skipped update!
GuiControl,, MyProgress, 0
Gosub RunReload
return

ButtonStart:
RunStart:
Active = 1
FileAppend,
(
temp
), C:\OpticTradeBot\prgrun.txt


GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Trade Bot started.
Run, C:\OpticTradeBot\TradeBot.bat
GuiControl, +cGreen, MyProgress
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
Sleep, 50
GuiControl,, MyProgress, +5
GuiControl,, MyProgress, +5
return

RunStartN:
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Update failed.
return

ButtonStop:
RunStop:
Active = 0
FileDelete, C:\OpticTradeBot\prgrun.txt
GuiControl, +cRed, MyProgress
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Trade bot stopped.
return

ButtonReload:
RunReload:
FileAppend,
(
temp
), C:\OpticTradeBot\prgrun.txt
Sleep, 200
GuiControl,, MyProgress, 0
GuiControl Enable, Start
GuiControl Enable, Stop
GuiControl Enable, Reload
Gosub Begin
return

ButtonSettings:
Gosub Settings
return

HelpAbout:
Gui, About:+owner1  ; Make the main window (Gui #1) the owner of the "about box".
Gui +Disabled  ; Disable main window.
Gui, About:Add, Text,, Optic Trade Bot v1.1.0 (Lite)
Gui, About:Add, Link,, Developed by <a href="http://steamcommunity.com/id/opticulex">Opticulex</a> and <a href="http://steamcommunity.com/profiles/76561198109307607/">Shynaio</a> 2017.
Gui, About:Show
Gui, About:Add, Button, Default, OK
Gui, About:Show,, About
return

AboutButtonOK:  ; This section is used by the "about box" above.
AboutGuiClose:
AboutGuiEscape:
Gui, 1:-Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui Destroy  ; Destroy the about box.
return






Settings:
Gui, Settings:+owner1
Gui +Disabled
Gui, Settings:Add, Text,, Optic Trade Bot Settings                `n`n`n`n`n`n`n`n`n`n`n`n
Gui, Settings:Show
Gui, Settings:Add, Button, x10 y30, Disable Updates
Gui, Settings:Add, Button, x10 y55, Enable Updates
Gui, Settings:Add, Button, x10 y80, Add/Edit password
Gui, Settings:Add, Button, x10 y105, Remove password
Gui, Settings:Add, Button, x10 y150, Reset settings
Gui, Settings:Add, Button, x130 y150, Close
Gui, Settings:Show,, Settings
GuiControl Settings:Disable, Disable Updates
GuiControl Settings:Disable, Enable Updates
GuiControl Settings:Disable, Reset Settings
GuiControl Settings:Disable, Add/Edit password
GuiControl Settings:Disable, Remove password
GuiControl Settings:Disable, Reset settings
return

SettingsButtonDisableUpdates:
FileAppend,
(
temp
), C:\OpticTradeBot\prgud.txt
return


SettingsButtonEnableUpdates:
FileDelete, C:\OpticTradeBot\prgud.txt
return

SettingsButtonResetSettings:
FileDelete, C:\OpticTradeBot\prgud.txt
return

SettingsButtonClose:
SettingsGuiClose:
SettingsGuiEscape:
Gui, 1:-Disabled
Gui Destroy
return

ClearLog:
guicontrol,, MyListBox, |
return

UpgradeMenu:
RunUprgrades:
return

RunActivate:
InputBox, text, Activation, Please enter your product key:,
MsgBox Product activation is disabled in this version due to its unimpementation. v1.2.0 will have this feature.
return

ButtonExit:
RunExit:
GuiClose:
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Exiting..
FileAppend,
(
temp
), C:\OpticTradeBot\prgexit.txt
FileDelete, C:\OpticTradeBot\prgrun.txt
FileDelete, C:\OpticTradeBot\prgrl.txt
FileDelete, C:\OpticTradeBot\prgon.txt
FileDelete, C:\OpticTradeBot\prgsd.txt
FileDelete, C:\OpticTradeBot\prgaupd.txt
FileDelete, C:\OpticTradeBot\aupd.bat
Sleep, 200
ExitApp