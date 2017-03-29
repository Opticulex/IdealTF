#SingleInstance Force
Active = 0
FileAppend,
(
temp
), C:\OpticTradeBot\prgon.txt
FileDelete, C:\OpticTradeBot\prgaupd.txt
FileDelete, C:\OpticTradeBot\aupd.bat
FileDelete, C:\OpticTradeBot\prgexit.txt
FileDelete, C:\OpticTradeBot\itemprices.bat
FileDelete, C:\OpticTradeBot\Var.bat
FileDelete, C:\OpticTradeBot\hold.bat
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
Gui, Settings:Add, Text,, Optic Trade Bot Settings
Gui, Settings:Add, Text, x10 y35, TradeBot SteamID64:
Gui, Settings:Add, Edit, x119 y31 r1 t21 vBotID,
Gui, Settings:Add, Text, x10 y66, Admin SteamID64:
Gui, Settings:Add, Edit, x119 y62 r1 t21 vAdminID,
Gui, Settings:Add, Text, x10 y100, Log Window Color:
Gui, Settings:Add, Edit, x119 y97 r1 t21 vLogWindowCol,
Gui, Settings:Add, Button, x140 y130 Checked vViewConfig, View config
Gui, Settings:Add, Button, x140 y160 Checked vViewLogs, View Logs
IfExist C:\OpticTradeBot\config\DebugMode.txt
	Gui, Settings:Add, Checkbox, x10 y130 Checked vDebugMode, Enable Debug
IfNotExist C:\OpticTradeBot\config\DebugMode.txt
	Gui, Settings:Add, Checkbox, x10 y130 vDebugMode, Enable Debug
IfExist C:\OpticTradeBot\config\DebugModeSkip1.txt
	Gui, Settings:Add, Checkbox, x10 y150 Checked vDebugModeSkip1, Skip Refresh
IfNotExist C:\OpticTradeBot\config\DebugModeSkip1.txt
	Gui, Settings:Add, Checkbox, x10 y150 vDebugModeSkip1, Skip Refresh
IfExist C:\OpticTradeBot\config\DebugModeSkip2.txt
	Gui, Settings:Add, Checkbox, x10 y170 Checked vDebugModeSkip2, Skip Confirmation
IfNotExist C:\OpticTradeBot\config\DebugModeSkip2.txt
	Gui, Settings:Add, Checkbox, x10 y170 vDebugModeSkip2, Skip Confirmation
IfExist C:\OpticTradeBot\config\DebugModeSkip3.txt
	Gui, Settings:Add, Checkbox, x10 y190 Checked vDebugModeSkip3, Skip Auth
IfNotExist C:\OpticTradeBot\config\DebugModeSkip3.txt
	Gui, Settings:Add, Checkbox, x10 y190 vDebugModeSkip3, Skip Auth
IfExist C:\OpticTradeBot\config\DebugModeSkip4.txt
	Gui, Settings:Add, Checkbox, x10 y210 Checked vDebugModeSkip4, Auth Mode
IfNotExist C:\OpticTradeBot\config\DebugModeSkip4.txt
	Gui, Settings:Add, Checkbox, x10 y210 vDebugModeSkip4, Auth Mode
IfExist C:\OpticTradeBot\config\AditionalSettings1.txt
	Gui, Settings:Add, Checkbox, x10 y240 Checked vAditionalSettings1, Custom config
IfNotExist C:\OpticTradeBot\config\AditionalSettings1.txt
	Gui, Settings:Add, Checkbox, x10 y240 vAditionalSettings1, Custom config
IfExist C:\OpticTradeBot\config\AditionalSettings2.txt
	Gui, Settings:Add, Checkbox, x10 y260 Checked vAditionalSettings2, Custom database
IfNotExist C:\OpticTradeBot\config\AditionalSettings2.txt
	Gui, Settings:Add, Checkbox, x10 y260 vAditionalSettings2, Custom database
IfExist C:\OpticTradeBot\config\AditionalSettings3.txt
	Gui, Settings:Add, Checkbox, x120 y240 Checked vAditionalSettings3, Disable Updates
IfNotExist C:\OpticTradeBot\config\AditionalSettings3.txt
	Gui, Settings:Add, Checkbox, x120 y240 vAditionalSettings3, Disable Updates

Gui, Settings:Add, Checkbox, x120 y260 vAditionalSettings4, BatchedEngine
Gui, Settings:Add, Button, x10 y285, Reset 
Gui, Settings:Add, Button, x58 y285, Save
Gui, Settings:Add, Button, x200 y285, Close
Gui, Settings:Show
Gui, Settings:Show,, Settings
GuiControl Settings:Disable, BatchedEngine
Gui, Submit, NoHide
return





SettingsButtonSave:
Gui, Settings:Submit, NoHide
FileDelete, C:\OpticTradeBot\config\BotID.bat
FileDelete, C:\OpticTradeBot\config\AdminID.bat
FileDelete, C:\OpticTradeBot\config\LogWindowCol.bat
FileAppend, 
(
set cfgBotID=%BotID%
), C:\OpticTradeBot\config\BotID.bat
FileAppend, 
(
set cfgAdminID=%AdminID%
), C:\OpticTradeBot\config\AdminID.bat
FileAppend, 
(
set cfgLogWindowCol=%LogWindowCol%
), C:\OpticTradeBot\config\LogWindowCol.bat
if DebugMode = 1
	FileAppend, temp, C:\OpticTradeBot\config\DebugMode.txt
if DebugMode = 0
	FileDelete, C:\OpticTradeBot\config\DebugMode.txt
if DebugModeSkip1 = 1
	FileAppend, temp, C:\OpticTradeBot\config\DebugModeSkip1.txt
if DebugModeSkip1 = 0
	FileDelete, C:\OpticTradeBot\config\DebugModeSkip1.txt
if DebugModeSkip2 = 1
	FileAppend, temp, C:\OpticTradeBot\config\DebugModeSkip2.txt
if DebugModeSkip2 = 0
	FileDelete, C:\OpticTradeBot\config\DebugModeSkip2.txt
if DebugModeSkip3 = 1
	FileAppend, temp, C:\OpticTradeBot\config\DebugModeSkip3.txt
if DebugModeSkip3 = 0
	FileDelete, C:\OpticTradeBot\config\DebugModeSkip3.txt
if DebugModeSkip4 = 1
	FileAppend, temp, C:\OpticTradeBot\config\DebugModeSkip4.txt
if DebugModeSkip4 = 0
	FileDelete, C:\OpticTradeBot\config\DebugModeSkip4.txt
if AditionalSettings1 = 1
	FileAppend, temp, C:\OpticTradeBot\config\AditionalSettings1.txt
if AditionalSettings1 = 0
	FileDelete, C:\OpticTradeBot\config\AditionalSettings1.txt
if AditionalSettings2 = 1
	FileAppend, temp, C:\OpticTradeBot\config\AditionalSettings2.txt
if AditionalSettings2 = 0
	FileDelete, C:\OpticTradeBot\config\AditionalSettings2.txt
if AditionalSettings3 = 1
	FileAppend, temp, C:\OpticTradeBot\config\AditionalSettings3.txt
if AditionalSettings3 = 0
	FileDelete, C:\OpticTradeBot\config\AditionalSettings3.txt
SplashTextOn, 200, 65, Optic Trade Bot, `nSaving settings..
Sleep, 700
SplashTextOff
MsgBox, 64, Optic Trade Bot, Changes succesfully saved.
return


SettingsButtonViewConfig:
Run C:\OpticTradeBot\config\ConfigRun.bat
return
SettingsButtonViewLogs:
Run C:\OpticTradeBot\Log.txt
return


SettingsButtonReset:
SplashTextOn, 200, 65, Optic Trade Bot, `nResetting...
Sleep, 700
SplashTextOff
FileDelete, C:\OpticTradeBot\config\BotID.bat
FileDelete, C:\OpticTradeBot\config\AdminID.bat
FileDelete, C:\OpticTradeBot\config\LogWindowCol.bat
FileDelete, C:\OpticTradeBot\config\DebugMode.txt
FileDelete, C:\OpticTradeBot\config\DebugModeSkip1.txt
FileDelete, C:\OpticTradeBot\config\DebugModeSkip2.txt
FileDelete, C:\OpticTradeBot\config\DebugModeSkip3.txt
FileDelete, C:\OpticTradeBot\config\DebugModeSkip4.txt
FileDelete, C:\OpticTradeBot\config\AditionalSettings1.txt
FileDelete, C:\OpticTradeBot\config\AditionalSettings2.txt
FileDelete, C:\OpticTradeBot\config\AditionalSettings3.txt
MsgBox, 64, Optic Trade Bot, All preferences and settings have been reset to their defaults. A launcher restart is required in order for changes to take effect.
return

SettingsButtonClose:
SettingsGuiClose:
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
FileDelete, C:\OpticTradeBot\prgrun.txt
FileDelete, C:\OpticTradeBot\prgrl.txt
FileDelete, C:\OpticTradeBot\prgon.txt
FileDelete, C:\OpticTradeBot\prgsd.txt
FileDelete, C:\OpticTradeBot\prgaupd.txt
FileDelete, C:\OpticTradeBot\aupd.bat
Sleep, 200
ExitApp