:start
@echo off
:: Sets directory and file title.
cd C:\OpticTradeBot
title Optic Trade Bot
echo Optic Trade bot started.
call :check_status
call C:\OpticTradeBot\config\botfiles\other\login.bat
echo [%time%] [LOGIN] Logged in as %recentlogin_user% 
echo [%time%] [LOGIN] Uid: %recentlogin_uid% 
:: CYCLE
:: Sets cycle value to 0, cycle lable and increments cycle value by 1.
set cycle=0
:cycle
echo.
set /a cycle+=1
set cycleid=%random%%random%%random%
:: Prints cycle details
echo [%time%] Cycle #%cycle% began at %time% %date%; cycleid %cycleid%
:: Checks status
call :check_status
:: Resets Config Values
set DebugMode=0
set DebugModeSkip1=0
set DebugModeSkip2=0
set DebugModeSkip3=0
set DebugModeSkip4=0
set AdditionalSettings1=0
set AdditionalSettings2=0
set AdditionalSettings3=0
set varBotID=0
set varBotName=0
set varScreenSize=0
set ScreenSizeX=0
set ScreenSizeY=0
echo [%time%] [CONFIG] Set all Config Values to value "0" 
echo [%time%] [CONFIG] Reading Config values...
:: Calls all config values
if exist C:\OpticTradeBot\config\DebugMode.txt set DebugMode=1
if exist C:\OpticTradeBot\config\DebugModeSkip1.txt set DebugModeSkip1=1
if exist C:\OpticTradeBot\config\DebugModeSkip2.txt set DebugModeSkip2=1
if exist C:\OpticTradeBot\config\DebugModeSkip3.txt set DebugModeSkip3=1
if exist C:\OpticTradeBot\config\DebugModeSkip4.txt set DebugModeSkip4=1
if exist C:\OpticTradeBot\config\AdditionalSettings1.txt set AdditionalSettings1=1
if exist C:\OpticTradeBot\config\AdditionalSettings2.txt set AdditionalSettings2=1
if exist C:\OpticTradeBot\config\AdditionalSettings3.txt set AdditionalSettings3=1
echo [%time%] [CONFIG] Config values: "%DebugMode%,%DebugModeSkip1%,%DebugModeSkip2%,%DebugModeSkip3%,%DebugModeSkip4%,%AdditionalSettings1%,%AdditionalSettings2%,%AdditionalSettings3%"
echo [%time%] [CONFIG] Reading Input Config values...
if exist C:\OpticTradeBot\config\BotID.bat call C:\OpticTradeBot\config\BotID.bat
if exist C:\OpticTradeBot\config\BotName.bat call C:\OpticTradeBot\config\BotName.bat
if exist C:\OpticTradeBot\config\ScreenSize.bat call C:\OpticTradeBot\config\ScreenSize.bat
if not exist C:\OpticTradeBot\config\BotID.bat goto err_config001
if not exist C:\OpticTradeBot\config\BotName.bat goto err_config001
if not exist C:\OpticTradeBot\config\ScreenSize.bat goto err_config001
echo [%time%] [CONFIG] Input Config values: "%varBotID%,%varBotName%,%varScreenSize%"
echo [%time%] [CONFIG] Loading advancedconfig.bat..
call C:\OpticTradeBot\config\advancedconfig.bat
:: Read Screen Resolution Settings
if "%varScreenSize%"=="1366x768" set ScreenSizeX=1366
if "%varScreenSize%"=="1366x768" set ScreenSizeY=768
if "%varScreenSize%"=="1366x768" goto screensizeset
if "%varScreenSize%"=="1366x768 " set ScreenSizeX=1366
if "%varScreenSize%"=="1366x768 " set ScreenSizeY=768
if "%varScreenSize%"=="1366x768 " goto screensizeset
if "%varScreenSize%"=="1024x768" set ScreenSizeX=1024
if "%varScreenSize%"=="1024x768" set ScreenSizeY=768
if "%varScreenSize%"=="1024x768" goto screensizeset
if "%varScreenSize%"=="1024x768 " set ScreenSizeX=1024
if "%varScreenSize%"=="1024x768 " set ScreenSizeY=768
if "%varScreenSize%"=="1024x768 " goto screensizeset
goto err_config002
:screensizeset
echo [%time%] [CONFIG] Screen Resolution x:"%ScreenSizeX%" y:"%ScreenSizeY%" raw:"%varScreenSize%"
:: Checks status again
call :check_status
:: Create TEMP shit in AHK. Messy stuff.
echo CoordMode Pixel > C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\OpticTradeBot\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\#0100.bmp >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo if ErrorLevel = 2 >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo else if ErrorLevel = 1 >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo else >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo     FileAppend, >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo ( >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo temp >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo. >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo ), C:\OpticTradeBot\config\itemconfig\temp\HOLD.txt >> C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
echo [%time%] [TRADECHECK] Running "SwitchToOffers.ahk"
start C:\OpticTradeBot\config\botfiles\ahk\SwitchToOffers.ahk
timeout /t 1 /nobreak >nul
echo [%time%] [TRADECHECK] Running "PageRefresh.ahk"
start C:\OpticTradeBot\config\botfiles\ahk\PageRefresh.ahk
timeout /t 5 /nobreak >nul
echo [%time%] [TRADECHECK] Running "holdcheck.ahk"
start C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
:tc_waitforhc_pre
set tc_waitforhc=0
:tc_waitforhc
set /a tc_waitforhc+=1
if %tc_waitforhc% GEQ %tc_timeout% goto tc_waitforhc_2
if exist C:\OpticTradeBot\config\itemconfig\temp\HOLD.txt goto tc_waitforhc_1
if not exist C:\OpticTradeBot\config\itemconfig\temp\HOLD.txt goto tc_waitforhc
goto tc_waitforhc
:tc_waitforhc_1
echo [%time%] [TRADECHECK] Item Hold Detected.
start C:\OpticTradeBot\config\botfiles\vbs\err_HOLD.vbs
goto err_hold001
:tc_waitforhc_2
echo [%time%] [TRADECHECK] Holdcheck timed out after %tc_waitforhc% tries. (timed out)
if exist C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk del C:\OpticTradeBot\config\itemconfig\temp\holdcheck.ahk
if exist C:\OpticTradeBot\config\itemconfig\temp\HOLD.txt del C:\OpticTradeBot\config\itemconfig\temp\HOLD.txt
echo CoordMode Pixel > C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\OpticTradeBot\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\#0010.bmp >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo if ErrorLevel = 2 >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo else if ErrorLevel = 1 >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo else >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo     FileAppend, temp, C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
echo exit  >> C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
start C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
:tc_waitforto_pre
set tc_waitforto=0
:tc_waitforto
set /a tc_waitforto+=1
if %tc_waitforto% GEQ %tc_timeout% goto tc_waitforto_1
if exist C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt goto tc_waitforto_2
if not exist C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt goto tc_waitforto
goto tc_waitforto
:tc_waitforto_1
echo [%time%] [TRADECHECK] Trade offer not found after %tc_waitforto% tries. (timed out)
if exist C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk del C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
if exist C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt del C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt
goto cycle_return
:tc_waitforto_2
echo [%time%] [TRADECHECK] Trade Offer Detected.
if exist C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk del C:\OpticTradeBot\config\itemconfig\temp\tradecheck.ahk
if exist C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt del C:\OpticTradeBot\config\itemconfig\temp\TRADE.txt
echo [%time%] [TRADECHECK] Running "OpenOffer.ahk"
start C:\OpticTradeBot\config\botfiles\ahk\OpenOffer.ahk
timeout /t 10 /nobreak >nul
echo [%time%] [TRADECHECK] Running "MaximiseWindow.ahk"
start C:\OpticTradeBot\config\botfiles\ahk\MaximiseWindow.ahk
timeout /t 2 /nobreak >nul
:ic_pre
:: Sets amount of times the bot has looped to 0
set loopcount=0
:ic
set /a loopcount+=1
set price_bot=0
set price_user=0

:ic_id_5000
set itemid=5000
call C:\OpticTradeBot\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
call :itemchecker_bot
call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price: %price_bot% %price_user%


:ic_id_5001
set itemid=5001
call C:\OpticTradeBot\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
call :itemchecker_bot
call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price: %price_bot% %price_user%




echo.
echo [%time%] [ITEMCHECK] Itemcheck is complete!
echo [%time%] [ITEMCHECK] Bot price: %price_bot% User price: %price_user%
set /a price_userl=%price_user%+5
set /a price_useru=%price_user%-5
if %price_bot% lss %price_userl% goto ic_noaccept
if %price_bot% gtr %price_useru% goto ic_noaccept
if %price_userl% lss %price_bot% goto ic_noaccept
if %price_useru% gtr %price_bot% goto ic_noaccept
:ic_accept
echo accept

:ic_noaccept
echo noaccept
pause






:itemchecker_bot
set icloop=0
:itemchecker_bot1
set /a icloop+=1
echo [%time%] [ITEMCHECK] Checking item slot: "%icloop%" for itemid "%itemid%" for bot
start C:\OpticTradeBot\config\botfiles\ahk\OfferUp.ahk
call C:\OpticTradeBot\config\itm1config.bat
if exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk del C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
if exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat del C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat
if "%icloop%"=="1" set coord1x=%slot1X1%
if "%icloop%"=="1" set coord1y=%slot1Y1%
if "%icloop%"=="1" set coord2x=%slot1X2%
if "%icloop%"=="1" set coord2y=%slot1Y2%
if "%icloop%"=="2" set coord1x=%slot2X1%
if "%icloop%"=="2" set coord1y=%slot2Y1%
if "%icloop%"=="2" set coord2x=%slot2X2%
if "%icloop%"=="2" set coord2y=%slot2Y2%
if "%icloop%"=="3" set coord1x=%slot3X1%
if "%icloop%"=="3" set coord1y=%slot3Y1%
if "%icloop%"=="3" set coord2x=%slot3X2%
if "%icloop%"=="3" set coord2y=%slot3Y2%
if "%icloop%"=="4" set coord1x=%slot4X1%
if "%icloop%"=="4" set coord1y=%slot4Y1%
if "%icloop%"=="4" set coord2x=%slot4X2%
if "%icloop%"=="4" set coord2y=%slot4Y2%
if "%icloop%"=="5" set coord1x=%slot5X1%
if "%icloop%"=="5" set coord1y=%slot5Y1%
if "%icloop%"=="5" set coord2x=%slot5X2%
if "%icloop%"=="5" set coord2y=%slot5Y2%
if "%icloop%"=="6" set coord1x=%slot6X1%
if "%icloop%"=="6" set coord1y=%slot6Y1%
if "%icloop%"=="6" set coord2x=%slot6X2%
if "%icloop%"=="6" set coord2y=%slot6Y2%
if "%icloop%"=="7" set coord1x=%slot7X1%
if "%icloop%"=="7" set coord1y=%slot7Y1%
if "%icloop%"=="7" set coord2x=%slot7X2%
if "%icloop%"=="7" set coord2y=%slot7Y2%
if "%icloop%"=="8" set coord1x=%slot8X1%
if "%icloop%"=="8" set coord1y=%slot8Y1%
if "%icloop%"=="8" set coord2x=%slot8X2%
if "%icloop%"=="8" set coord2y=%slot8Y2%
if %icloop% GEQ echo [%time%] [ITEMCHECK] [WARNING] slot9 is NOT valid. Exiting call.
if %icloop% GEQ 9 GOTO:eof
echo CoordMode Pixel > C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo ImageSearch, FoundX, FoundY, %coord1x%, %coord1y%, %coord2x%, %coord2y%, C:\OpticTradeBot\config\itemconfig\img_1366x768\%itemid%.bmp >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo if ErrorLevel >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo else >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo     FileAppend, temp, C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
:: Start the AHK checker and sees its output.
start C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
ping 1.1.1.1 -n 1 -w 1000 > nul
if not exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat echo [%time%] [ITEMCHECK] Item not found in trade.
if not exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat goto itemchecker_bot1
set /a price_bot+=%val%
echo [%time%] [ITEMCHECK] Found item in trade. Increased bot value by "%val%". Total: "%price_bot%"
goto itemchecker_bot1
:itemchecker_user
set icloop=0
start C:\OpticTradeBot\config\botfiles\ahk\OfferUp.ahk
start C:\OpticTradeBot\config\botfiles\ahk\OfferDown.ahk
timeout /t 1 /nobreak > nul
:itemchecker_user1
set /a icloop+=1
echo [%time%] [ITEMCHECK] Checking item slot: "%icloop%" for itemid "%itemid%" for user
call C:\OpticTradeBot\config\itm2config.bat
if exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk del C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
if exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat del C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat
if "%icloop%"=="1" set coord1x=%slot1X1%
if "%icloop%"=="1" set coord1y=%slot1Y1%
if "%icloop%"=="1" set coord2x=%slot1X2%
if "%icloop%"=="1" set coord2y=%slot1Y2%
if "%icloop%"=="2" set coord1x=%slot2X1%
if "%icloop%"=="2" set coord1y=%slot2Y1%
if "%icloop%"=="2" set coord2x=%slot2X2%
if "%icloop%"=="2" set coord2y=%slot2Y2%
if "%icloop%"=="3" set coord1x=%slot3X1%
if "%icloop%"=="3" set coord1y=%slot3Y1%
if "%icloop%"=="3" set coord2x=%slot3X2%
if "%icloop%"=="3" set coord2y=%slot3Y2%
if "%icloop%"=="4" set coord1x=%slot4X1%
if "%icloop%"=="4" set coord1y=%slot4Y1%
if "%icloop%"=="4" set coord2x=%slot4X2%
if "%icloop%"=="4" set coord2y=%slot4Y2%
if "%icloop%"=="5" set coord1x=%slot5X1%
if "%icloop%"=="5" set coord1y=%slot5Y1%
if "%icloop%"=="5" set coord2x=%slot5X2%
if "%icloop%"=="5" set coord2y=%slot5Y2%
if "%icloop%"=="6" set coord1x=%slot6X1%
if "%icloop%"=="6" set coord1y=%slot6Y1%
if "%icloop%"=="6" set coord2x=%slot6X2%
if "%icloop%"=="6" set coord2y=%slot6Y2%
if "%icloop%"=="7" set coord1x=%slot7X1%
if "%icloop%"=="7" set coord1y=%slot7Y1%
if "%icloop%"=="7" set coord2x=%slot7X2%
if "%icloop%"=="7" set coord2y=%slot7Y2%
if "%icloop%"=="8" set coord1x=%slot8X1%
if "%icloop%"=="8" set coord1y=%slot8Y1%
if "%icloop%"=="8" set coord2x=%slot8X2%
if "%icloop%"=="8" set coord2y=%slot8Y2%
if %icloop% GEQ echo [%time%] [ITEMCHECK] [WARNING] slot9 is NOT valid. Exiting call.
if %icloop% GEQ 9 GOTO:eof
echo CoordMode Pixel > C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo ImageSearch, FoundX, FoundY, %coord1x%, %coord1y%, %coord2x%, %coord2y%, C:\OpticTradeBot\config\itemconfig\img_1366x768\%itemid%.bmp >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo if ErrorLevel >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo     exit >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo else >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
echo     FileAppend, temp, C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat >> C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
:: Start the AHK checker and sees its output.
start C:\OpticTradeBot\config\itemconfig\temp\%itemid%.ahk
ping 1.1.1.1 -n 1 -w 1000 > nul
if not exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat echo [%time%] [ITEMCHECK] Item not found in trade.
if not exist C:\OpticTradeBot\config\itemconfig\temp\%itemid%.bat goto itemchecker_user1
set /a price_user+=%val%
echo [%time%] [ITEMCHECK] Found item in trade. Increased bot value by "%val%". Total: "%price_user%"
goto itemchecker_user1
:cycle_return
echo.
echo [%time%] Cycle #%cycle% (%time% %date%; %cycleid%) finished.
echo [%time%] Returning to start.
goto cycle
:err_launcher001
echo [%time%] [WARNING] C:\OpticTradeBot\config\prgon.txt does not exist.
echo.
echo [%time%] [WARNING] Please start the launcher.
echo [%time%] [WARNING] Please wait..
timeout /t 5 /nobreak >nul
goto cycle
:err_launcher002
echo [%time%] [WARNING] C:\OpticTradeBot\config\prgrun.txt does not exist.
echo.
echo [%time%] [WARNING] Please launch the program from the launcher "Start" button.
echo [%time%] [WARNING] Please wait..
timeout /t 5 /nobreak >nul
goto cycle
:err_config001
echo [%time%] [WARNING] Config does not exist. Please log into the bot if you havent already.
echo.
timeout /t 4 /nobreak >nul
exit
:err_config002
echo [%time%] [WARNING] Screen Size Config is corrupt.
echo.
timeout /t 2 /nobreak >nul
exit
:err_hold001
echo [%time%] [WARNING] Trade Hold present. Fatal error.
echo.
timeout /t 2 /nobreak >nul
exit
:check_status
echo [%time%] [STATUS] Checking status of TradeBotLauncher..
if not exist C:\OpticTradeBot\config\prgon.txt goto err_launcher001
echo [%time%] [STATUS] C:\OpticTradeBot\config\prgon.txt does exist.
if not exist C:\OpticTradeBot\config\prgrun.txt goto err_launcher002
echo [%time%] [STATUS] C:\OpticTradeBot\config\prgrun.txt does exist.
echo [%time%] [STATUS] Launcher is Open and TradeBot is Started
GOTO:eof