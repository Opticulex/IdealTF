@echo off
:: Sets directory and file title.
cd C:\OpticTradeBot
title Optic Trade Bot
echo Optic Trade bot started.
echo You are running v1.0.0 and build 230217

:: Sets "x", the value use to count how many cycles the bot has done to 0.
set x=0

:: Checks to see if autohotkey and bluestacks is installed.
if not exist "C:\Program Files\AutoHotkey" goto err_AHK
if not exist "C:\Program Files (x86)\Bluestacks" goto err_BSK


:LOOP
:: Starting point of file and where the file refreshes to.

:: Increments the "x" value by +1.
set /a x+=1

:: Sets to root directory.
cd C:\OpticTradeBot

echo.
echo.
echo [%time%] Cycle #%x% began at %time% %date%

:: Sets the unique trade identifier and adds 4 empty lines to log file as a spacer.
set TRADEID=%random%%random%%random%
echo. >> Log.txt
echo. >> Log.txt
echo. >> Log.txt
echo. >> Log.txt
echo [%time% %date%] [%x%] [%TRADEID%] Cycle Began... >> Log.txt

:LOOP1
:: Checks config files and resets all temorary information that may cause issues.
echo.
:: Deletes Trade Status Variable file and resets it empty.
del Var.bat && echo. > Var.bat
del hold.bat && echo. > hold.bat
echo [%time%] Resetting cached data...

:: Sets config values to "Null".
set Trade_Bot=Null
set Trade_Bot_S64=Null
set Trade_Admin=Null
set Trade_Admin_S64=Null
set Trade_Mod=Null
set Trade_Mod_S64=Null
set DebugMode=Null
set DebugMode1=Null
set PriceRef=Null
set PriceRec=Null
set PriceScr=Null
set KeyPrice=Null
set CraftHatHi1=Null
set CraftHatHi2=Null
set CraftHatLo1=Null
set CraftHatLo2=Null
set CraftHat=Null

:: Resets File location for good measure
cd C:\OpticTradeBot

:: Resets itemPrices
echo [%time%] Reloading database..
if exist itemPrices.bat del itemPrices.bat
start databaseDL.vbs
echo [%time%] Please wait..
set y=0
:databaseloop
set /a y+=1
if exist itemPrices.bat call itemPrices.bat
if %y% GEQ 2000 goto CONFIG_ERR
if not exist itemPrices.bat goto databaseloop
::Checks that itemPrices.bat contains crucial variables
if not %PriceRef%==100 goto CONFIG_ERR
if not %PriceRec%==33 goto CONFIG_ERR
if not %PriceScr%==11 goto CONFIG_ERR
if %KeyPrice%==Null goto CONFIG_ERR
if %CraftHat%==Null goto CONFIG_ERR
if %CraftHatHi1%==Null goto CONFIG_ERR
if %CraftHatHi2%==Null goto CONFIG_ERR
if %CraftHatLo1%==Null goto CONFIG_ERR
if %CraftHatLo2%==Null goto CONFIG_ERR

echo [%time%] Took %y% tries to get database.
echo.
echo PriceRef: %PriceRef%, PriceRec: %PriceRec%, PriceScr: %PriceScr%, KeyPrice: %KeyPrice%
echo CraftHat: %CraftHat%, CraftHatHi1: %CraftHatHi1%, CraftHatHi2: %CraftHatHi2%, CraftHatLo1: %CraftHatLo1%, CraftHatLo2: %CraftHatLo2%
echo.

:: Config is read and null vaules replaced with ones inside config.
call config.bat
echo [%time%] Reading config...

:: Prints out config values.
echo.
echo Bot Linked to: %Trade_Bot% (%Trade_Bot_S64%)
echo Bot Admin: %Trade_Admin% (%Trade_Admin_S64%)
echo Bot Moderator: %Trade_Mod% (%Trade_Mod_S64%)
echo DebugMode: %DebugMode% (%DebugMode1%), DebugAuthMode: %DebugAuthMode%, ColorValue: %ColorValue%
echo DebugSkipRefresh: %DebugSkipRefresh%, DebugSkipTrade: %DebugSkipTrade%, DebugSkipAuth: %DebugSkipAuth%
echo.
if %DebugMode%==Null goto CONFIG_ERR



:: Sets Color Value if it exists
set ColorValue=0f
call config.bat
color %ColorValues%

:: Checks whether DebugMode was enabled in config and whether the program has alredy initiated it.
if "%DebugMode1%"=="1" goto LOOP_DEBUG
if "%DebugMode%"=="1" goto DEBUG
if "%DebugMode%"=="0" set DebugSkipRefresh=Null && set DebugSkipTrade=Null && set DebugSkipAuth=Null && set DebugAuthMode=Null



:LOOP_DEBUG
:: LOOP_DEBUG is used to bypass the checking of DebugMode which may cause an infinate loop.
if "%DebugAuthMode%"=="1" goto AUTHMODE
:: Waits 5 seconds.
echo [%time%] Began bot wait cycle
echo [%time%] Waiting 2,000ms(2s) until next command...
ping 1.1.1.1 -n 1 -w 2000 > nul

:: Changes directory and runs PageRefresh script.
:: The PageRefresh script moves the mouse to the refresh button and clicks.
cd C:\OpticTradeBot\AHKScript
if "%DebugSkipRefresh%"=="%DebugMode%" goto REFRESH_SKIP
echo [%time%] Running "PageRefresh.ahk"
start PageRefresh.ahk

:: Waits 5 seconds for page to refresh.
echo [%time%] Waiting 5,000ms(5s) until next command...
ping 1.1.1.1 -n 1 -w 5000 > nul

:REFRESH_SKIP_1

:: Runs HoldChecker.ahk
cd C:\OpticTradBot\AHKScript
echo [%time%] Running "HoldChecker.ahk"
start HoldChecker.ahk
ping 1.1.1.1 -n 1 -w 1000 > nul
cd C:\OpticTradeBot\
call hold.bat
:: Checks for trade holds.
if "%Trade_Hold%"=="1" goto err_HOLD
cd C:\OpticTradeBot\AHKScript

:: Runs TradeStatusChecker script.
echo [%time%] Running "TradeStatusChecker.ahk"
echo.
echo [%time%] (Checking for incoming trade offers)
start TradeStatusChecker.ahk

:: Waits 1 second for the script to run/load.
ping 1.1.1.1 -n 1 -w 1000 > nul
echo [%time%] Checking trade status...

:: Changes directory and calls Var.bat to see what the "Trade_Status_Var" is now set to.
cd C:\OpticTradeBot
call Var.bat
:: If "Trade_Status_Var" is at 0, no change has happened and it resumes cycle.
if "%Trade_Status_Var%" == "0" goto TRADE_0
:: If "Trade_Status_Var" is at 1, there is a change detected and it goes to TRADE_1 to search for a trade offer.
if "%Trade_Status_Var%" == "1" goto TRADE_1
:: If "Trade_Status_Var" is at 2, it has been set by the program to skip to Mobile Authentication.
:: Under normal operating conditions, it should never get set to 2.
if "%Trade_Status_Var%" == "2" goto TRADE_2
:: If "Trade_Status_Var" is at 3, it has been set by the/a program to signal a fatal error.
if "%Trade_Status_Var%" == "3" goto TRADE_3
:: If "Trade_Status_Var" is not set to one of these values or doesn't exist, it goes to LOOP_FAIL to signifiy this.
goto LOOP_FAIL

:: Skips the Trade Status protocol if DebugMode is Active and DebugSkipRefresh = 1
:REFRESH_SKIP
echo.
echo [%time%] [WARNING] Program Refresh Skipped.
echo.
goto REFRESH_SKIP_1

:: Used to update log file if Trade_Status_Var=0. Follows on to LOOP_RESTART
:TRADE_0
echo. >> Log.txt
echo [%time% %date%] [%x%] [%TRADEID%] No Trade offer found. (Trade_Status_Var=0) >> Log.txt

:LOOP_RESTART
:: Prints notification showing "Trade_Status_Var" is now set to zero and the cycle is about to restart.
echo.
echo [%time%] Trade status returned to normal. Resuming cycle.
echo [%time%] (Trade_Status_Var=0)

:: Returns to beginning of file.
goto LOOP



:: Trade_Status_Var=1
:TRADE_1
:: Check if DebugSkipTrade is active to skip offer confirmation.
pause
if "%DebugSkipTrade%"=="%DebugMode%" goto TRADE_1_SKIP
:: Updates log file.
echo. >> Log.txt
echo [%time% %date%] [%x%] [%TRADEID%] Trade offer found. (Trade_Status_Var=1) >> Log.txt

echo.
:: Prints offer detected
echo [%time%] Offer detected.
echo [%time%] (Trade_Status_Var=1)
echo [%time%] Opening trade.

:: Starts "ScrollDown.ahk" (opens trade offer) and *cough* begins the CHECKFOR process.
cd C:\OpticTradeBot\AHKScript
start ScrollDown.ahk
echo [%time%] Waiting for page to load..
:: Waits for page and page assets/images to load.
:: IF YOUR BOT ISN'T DETECTING TRADE ITEMS, INCREASE THE DELAY AND SEE IF IT HELPS.
ping 1.1.1.1 -n 1 -w 9000 > nul
MaximiseWindow.ahk
pause

:CHECKFOR_BEGIN
cd C:\OpticTradeBot\
:: Deletes all old data again

:VERIFIY
echo [%time%] Bot Item Value: %value1%
echo [%time%] User Item Value: %value2%

if "%value2%"=="0" goto REJECT
if "%value1%">"%value2%" goto REJECT
if "%value1%"=="%value2%" goto CONFIRM
goto REJECT


:: Offer is eligble for confirmation.
:CONFIRM
:: Updates log file
echo. >> Log.txt
echo [%time% %date%] [%x%] [%TRADEID%] Offer eligble for acceptance. >> Log.txt
:: Sets directory.
cd C:\OpticTradeBot\AHKScript
:: Starts OfferUp.ahk (scrolls page back up to top)
start OfferUp.ahk
:: Waits 1.5 seconds.
ping 1.1.1.1 -n 1 -w 1500 > nul
:: Starts OfferConfirm.ahk (confirms offer in trade window)
start OfferConfirm.ahk
echo [%time%] Confirming offer..
:: Waits 30 seconds.
echo [%time%] This will take around 30 seconds.
ping 1.1.1.1 -n 1 -w 30000 > nul
:: Sets directory.
cd C:\OpticTradeBot
:: Begins mobile authentication.
echo [%time%] Offer confirmed in Steam Client.
echo [%time%] Pending confirmation in Mobile Authenticator.
echo [%time%] (Setting Trade_Status_Var to 2)
goto TRADE_2

:: Skips the Trade protocol if DebugMode is Active and DebugSkipTrade = 1
:TRADE_1_SKIP
echo.
echo [%time%] DebugSkipTrade=1, skipping Trade protocol..
echo.

:: Mobile authentication.
:TRADE_2
:: Skips mobile authentication if DebugMode is Active and DebugSkipAuth = 1
if "%DebugSkipAuth%"=="%DebugMode%" goto TRADE_2_SKIP
:: Sets directory.
cd C:\OpticTradeBot\AHKScript
:: Starts SwitchToAuth.ahk (switches over to BlueStacks window)
start SwitchToAuth.ahk
echo.
echo [%time%] Opening Mobile Auth..
:: Waits 1 second.
ping 1.1.1.1 -n 1 -w 1000 > nul
:: Starts OfferAuth.ahk (confirms offer in auth)
start OfferAuth.ahk
echo [%time%] Confirming offer inside auth...
echo [%time%] This will take around 30 sec.
:: Waits 30 seconds.
ping 1.1.1.1 -n 1 -w 30000 > nul
echo [%time%] Offer confirmed in Mobile Authenticator.
echo [%time%] Resuming trade cycle..
:: Starts SwitchToOffers.ahk (switches over to Firefox window)
start SwitchToOffers.ahk
echo [%time%] (Setting Trade_Status_Var to 0)
goto LOOP_RESTART

:: Skips the Auth protocol if DebugMode is Active and DebugSkipAuth = 1
:TRADE_2_SKIP
echo.
echo [%time%] DebugSkipAuth=1, skipping Authentication protocol
echo.
goto LOOP_RESTART

:REJECT
echo. >> Log.txt
echo [%time% %date%] [%x%] [%TRADEID%] Offer declined due to incorrect items. >> Log.txt
:: Declining offer
cd C:\OpticTradeBot\AHKScript
echo [%time%] Offer Declined due to invalid trade contents.
echo [%time%] Bot offered %value1% while user offered %value2%
start OfferDecline.ahk
goto LOOP_RESTART

:TRADE_3
set errtime=%time%
set errdate=%date%
:TRADE_3_I
echo.
echo [%time%] Fatal error in program at %errtime% %errdate%! Cycle hatled until restart/fix.
goto TRADE_3_I

:DEBUG
cd C:\OpticTradeBot\
start TBDebug.bat
set DebugMode1=1
echo [%time%] Debug Mode Enabled.
goto LOOP_DEBUG

:LOOP_FAIL
echo.
echo [%time%] Failed to detect Trade_Status_Var. No trade offer was detected.
echo [%time%] If Debug Mode is active, more information will be shown.
echo.
if "%DebugMode%1"=="1" echo [%time%] [DEBUG] Trade_Status_Var was not defined.
cd C:\OpticTradeBot
goto LOOP_RESTART

:CONFIG_ERR
echo.
echo [%time%] Failed to read crucial config values as they are incorrect or do not exist.
echo [%time%] Retrying..
goto LOOP1

:AUTHMODE
echo.
echo [%time%] DebugAuthMode=1
echo [%time%] Skipping Page Refresh and Trade Verification
echo [%time%] [WARNING] In Mobile Auth Mode!
echo.
:: Waits 5 seconds.
echo [%time%] Waiting 5,000ms(5s) until next command...
ping 1.1.1.1 -n 1 -w 5000 > nul
goto TRADE_2

:NETFAIL
echo [%time%] Network Connection not establised. Checking again..
call :NETTASK
if NetStatus=1 goto LOOP

:::NETTASK
::cd C:\OpticTradeBot
::call NetStatus.bat
::if %NetStatus%==0 goto NETFAIL

:err_AHK
cd C:\OpticTradeBot\VBSScript
start err_AHK.vbs
echo.
echo [%time%] [WARNING] Autohotkey does not seem to be installed.
echo [%time%] [WARNING] Please install.
exit
:err_PRG_LOOP
pause>nul
goto err_PRG_LOOP

:err_BSK
cd C:\OpticTradeBot\VBSScript
start err_BSK.vbs
echo.
echo [%time%] [WARNING] BlueStacks does not seem to be installed.
echo [%time%] [WARNING] Please install.
exit

:err_HOLD
cd C:\OpticTradeBot\VBSScript
start err_HOLD.vbs
echo.
echo [%time%] [WARNING] A trade hold was detected! The bot can not function.
exit