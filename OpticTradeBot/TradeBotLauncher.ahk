#SingleInstance Force
Active = 0
FileAppend,
(
temp
), C:\OpticTradeBot\prgon.txt
FileDelete, C:\OpticTradeBot\prgaupd.txt
FileDelete, C:\OpticTradeBot\aupd.bat

Menu, RunMenu, Add, &Skip Update, RunSD
Menu, RunMenu, Add, &Run Update, RunUpdates
Menu, RunMenu, Add, &Exit, RunExit
Menu, FileMenu, Add  ; Separator line.
Menu, HelpMenu, Add, &About, HelpAbout
Menu, MyMenuBar, Add, &Run, :RunMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu
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

RunUpdates:
GuiControl Disable, Start
GuiControl Disable, Stop
GuiControl Disable, Reload

GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Downloading updates..
Run, C:\OpticTradeBot\updateDL.vbs

Sleep, 5000
IfExist, C:\OpticTradeBot\prgsd.txt
	return
IfExist, C:\OpticTradeBot\aupd.bat
	Gosub Aupd
IfNotExist, C:\OpticTradeBot\aupd.bat
	GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Download failed. Press 'Reload' to enable offline.
	GuiControl Enable, Reload
	Run C:\OpticTradeBot\wscriptkiller.bat	
	return
	
Aupd:
Run C:\OpticTradeBot\aupd.bat	
	
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Loading...
Sleep, 5000
IfExist, C:\OpticTradeBot\prgsd.txt
	return
IfExist, C:\OpticTradeBot\prgaupd.txt
	Gosub Begin
IfNotExist, C:\OpticTradeBot\prgaupd.txt
	GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Update failed. Trade Bot Disabled.
	return
Begin:
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
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Skipped Download!
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
GuiControl,, MyListBox, [%A_Hour%:%A_Min%:%A_Sec%] Trade bot stopped.
GuiControl,, MyProgress, 0
return

ButtonReload:
RunReload:
FileAppend,
(
temp
), C:\OpticTradeBot\prgrun.txt
Sleep, 200
GuiControl Enable, Start
GuiControl Enable, Stop
GuiControl Enable, Reload
return

HelpAbout:
Gui, About:+owner1  ; Make the main window (Gui #1) the owner of the "about box".
Gui +Disabled  ; Disable main window.
Gui, About:Add, Text,, Optic Trade Bot v1.1.0
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