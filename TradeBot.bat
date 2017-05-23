@echo off
:: =================================================================================
::                                        IdealTF
:: =================================================================================
::
:: Code by Opticulex and Shynaio. (c) 2017.
::
:: May be modified freely but only for personal use. Redistribution of any sort, 
:: editied or unedited is strictly prohibited.
::
:: Code designed for v2.1.1 build220517
::
:: =================================================================================
::
::               >>>>> FOR ITEM CONFIG SETTINGS GO TO LINE 209 <<<<<
::
:: =================================================================================
:start
@echo off
:: Sets version and build data to null values.
set ver=null
set build=null
set launchid=%random%%random%
set launchtime=%date% %time%
:: Verifies program exists
if not exist C:\IdealTF\ goto err_launch001
if not exist C:\IdealTF\config\ goto err_launch002
:: Sets working directory to C:\IdealTF
cd C:\IdealTF
:: Sets title
title IdealTF
:: Sets version and build to latest
if exist C:\IdealTF\config\version.bat call C:\IdealTF\config\version.bat
if exist C:\IdealTF\config\build.bat call C:\IdealTF\config\build.bat
:: Makes sure versions were actually set
if "%ver%"=="null" goto err_config004
if "%build%"=="null" goto err_config005
:: Outputs start data
echo IdealTF started. You are running %ver% and build%build%.
echo.
echo [%date% %time%] Launched %ver% build%build%. >> C:\IdealTF\Log.txt
:: Checks status (Commented out to stop conflicts with advancedconfig)
::call :check_status
:: Resets Config Values
set varSteamID=0
set varSteamName=0
set varScreenSize=0
set ScreenSizeX=0
set ScreenSizeY=0
:: Runs settings ITFsettingsAgent
echo [%time%] [LAUNCH] Running 'C:\IdealTF\config\ITFsettingsAgent.exe'
if exist C:\IdealTF\config\ITFsettingsAgent.exe start C:\IdealTF\config\ITFsettingsAgent.exe
if not exist C:\IdealTF\config\ITFsettingsAgent.exe goto err_file001
timeout /t 2 /nobreak > nul
:: Runs settings ITFsettingsCompiler
echo [%time%] [LAUNCH] Running 'C:\IdealTF\config\ITFsettingsCompiler.exe'
if exist C:\IdealTF\config\ITFsettingsCompiler.exe start C:\IdealTF\config\ITFsettingsCompiler.exe
if not exist C:\IdealTF\config\ITFsettingsCompiler.exe goto err_file002
timeout /t 2 /nobreak > nul
:: Sets config values
echo [%time%] [LAUNCH] Reading 'C:\IdealTF\config\settings\SteamID.bat'
if exist C:\IdealTF\config\settings\SteamID.bat call C:\IdealTF\config\settings\SteamID.bat
echo [%time%] [LAUNCH] Reading 'C:\IdealTF\config\settings\SteamName.bat'
if exist C:\IdealTF\config\settings\SteamName.bat call C:\IdealTF\config\settings\SteamName.bat
echo [%time%] [LAUNCH] Reading 'C:\IdealTF\config\settings\ScreenSize.bat'
if exist C:\IdealTF\config\settings\ScreenSize.bat call C:\IdealTF\config\settings\ScreenSize.bat
if not exist C:\IdealTF\config\settings\SteamID.bat goto err_config001
if not exist C:\IdealTF\config\settings\SteamName.bat goto err_config001
if not exist C:\IdealTF\config\settings\ScreenSize.bat goto err_config001
echo [%time%] [LAUNCH] Reading 'C:\IdealTF\config\advancedconfig.bat'
if exist C:\IdealTF\config\advancedconfig.bat call C:\IdealTF\config\advancedconfig.bat
if not exist C:\IdealTF\config\advancedconfig.bat goto err_file003
echo [%time%] [LAUNCH] Reading 'C:\IdealTF\config\screenresolution.bat'
if exist C:\IdealTF\config\screenresolution.bat call C:\IdealTF\config\screenresolution.bat
:: Leave the below line commented out as the screenresolution file is not actually created
:: any more.
::if not exist C:\IdealTF\config\screenresolution.bat goto err_file004
:: Read Screen Resolution Settings
if "%varScreenSize%"=="1366x768" set ScreenSizeX=1366
if "%varScreenSize%"=="1366x768" set ScreenSizeY=768
if "%varScreenSize%"=="1366x768" set ScreenSize=1366x768
if "%varScreenSize%"=="1366x768" goto screensizeset
if "%varScreenSize%"=="1024x768" set ScreenSizeX=1024
if "%varScreenSize%"=="1024x768" set ScreenSizeY=768
if "%varScreenSize%"=="1024x768" set ScreenSize=1024x768
if "%varScreenSize%"=="1024x768" goto screensizeset
goto err_config002
:screensizeset
if not exist C:\IdealTF\config\%ScreenSize%_1cfg.bat goto err_config007
if not exist C:\IdealTF\config\%ScreenSize%_2cfg.bat goto err_config007
if not exist C:\IdealTF\config\%ScreenSize%_3cfg.bat goto err_config007
if exist C:\IdealTF\config\%ScreenSize%_3cfg.bat call C:\IdealTF\config\%ScreenSize%_3cfg.bat
:: CODE BELOW DOWNLOADS OUTDATED COORDINATES. DO NOT UNCOMMENT
:: Downloads item coord config
::echo [%time%] [CONFIG] Downloading defaultcoords_%ScreenSizeX%x%ScreenSizeY%_1cfg.txt...
::echo [%time%] [CONFIG] Downloading defaultcoords_%ScreenSizeX%x%ScreenSizeY%_2cfg.txt...
::if exist C:\IdealTF\config\dlscreenfiles1.ahk del C:\IdealTF\config\dlscreenfiles1.ahk
::if exist C:\IdealTF\config\dlscreenfiles2.ahk del C:\IdealTF\config\dlscreenfiles2.ahk
::echo UrlDownloadToFile, https://idealtf.neocities.org/data/defaultcoords_%ScreenSizeX%x%ScreenSizeY%_1cfg.txt, C:\IdealTF\config\%ScreenSize%_1cfg.bat > C:\IdealTF\config\dlscreenfiles1.ahk
::echo UrlDownloadToFile, https://idealtf.neocities.org/data/defaultcoords_%ScreenSizeX%x%ScreenSizeY%_2cfg.txt, C:\IdealTF\config\%ScreenSize%_2cfg.bat > C:\IdealTF\config\dlscreenfiles2.ahk
::timeout /t 1 /nobreak >nul
::if exist C:\IdealTF\config\dlscreenfiles1.ahk start C:\IdealTF\config\dlscreenfiles1.ahk
::if exist C:\IdealTF\config\dlscreenfiles2.ahk start C:\IdealTF\config\dlscreenfiles2.ahk
::if not exist C:\IdealTF\config\dlscreenfiles1.ahk echo [%time%] [WARNING] Could not download defaultcoords!
::if not exist C:\IdealTF\config\dlscreenfiles2.ahk echo [%time%] [WARNING] Could not download defaultcoords!
::if not exist C:\IdealTF\config\dlscreenfiles1.ahk goto err_config006
::if not exist C:\IdealTF\config\dlscreenfiles2.ahk goto err_config006
timeout /t 8 /nobreak >nul
:: Creates tradecheck file
echo [%time%] [LAUNCH] Making 'C:\IdealTF\config\tradecheck.ahk'
if exist C:\IdealTF\config\tradecheck.ahk del C:\IdealTF\config\tradecheck.ahk
echo CoordMode Pixel > C:\IdealTF\config\tradecheck.ahk
echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\itf_cfg_incoming.bmp >> C:\IdealTF\config\tradecheck.ahk
echo if ErrorLevel = 2 >> C:\IdealTF\config\tradecheck.ahk
echo     exit >> C:\IdealTF\config\tradecheck.ahk
echo else if ErrorLevel = 1 >> C:\IdealTF\config\tradecheck.ahk
echo     exit >> C:\IdealTF\config\tradecheck.ahk
echo else >> C:\IdealTF\config\tradecheck.ahk
echo     FileAppend, temp, C:\IdealTF\config\itemconfig\temp\TRADE.txt >> C:\IdealTF\config\tradecheck.ahk
echo exit  >> C:\IdealTF\config\tradecheck.ahk
:: Creates OfferConfirm.ahk
echo [%time%] [LAUNCH] Making 'C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk'
if exist C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk del C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 5000 > C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Click %Confirm_ContentsX%, %Confirm_ContentsY% >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 2000 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Send {enter} >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 300 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Run, C:\IdealTF\config\botfiles\ahk\OfferDown.ahk >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 500 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Click %Confirm_AcceptX%, %Confirm_AcceptY% >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 7000 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Send {enter} >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 300 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Click %Global_CloseWindowX%, %Global_CloseWindowY% >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Sleep, 300 >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo Run, C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo ExitApp >> C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
:: Creates OfferDecline.ahk
echo [%time%] [LAUNCH] Making 'C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk'
if exist C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk del C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Sleep, 5000 > C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Run, C:\IdealTF\config\botfiles\ahk\OfferDown.ahk >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Sleep, 500 >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Click %Decline_DeclineX%, %Decline_DeclineY% >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Sleep, 3000 >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Send {enter} >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Sleep, 3000 >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo Run, C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo ExitApp >> C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
:: Creates OpenOffer.ahk
echo [%time%] [LAUNCH] Making 'C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk'
if exist C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk del C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk
echo Click %OpenOfferX%, %OpenOfferY% > C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk
echo.
echo [%time%] [CONFIG] Launch ID: "%launchid%", Launch Time: "%launchtime%"
echo [%time%] [CONFIG] Steam Name: "%varSteamName%"
echo [%time%] [CONFIG] Steam ID: "%varSteamName%"
echo [%time%] [CONFIG] Screen Resolution: "%varScreenSize%"
:: CYCLE
:: Sets cycle value to 0, cycle lable and increments cycle value by 1.
set cycle=0
:cycle
echo.
:: Cycle value +1
set /a cycle+=1
:: Sets traei to a random numeric value
set tradeid=%random%%random%%random%
:: Prints cycle details
echo [%time%] Cycle #%cycle% began at %time% %date%; tradeid %tradeid%
echo [%date% %time%] Cycle #%cycle% %time% %date%; %tradeid%. >> C:\IdealTF\Log.txt
:: Checks status
call :check_status
echo [%time%] [TRADECHECK] Running 'C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk'
if exist C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk start C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk
if not exist C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk goto err_file005
timeout /t 2 /nobreak >nul
echo [%time%] [TRADECHECK] Running 'C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk'
if exist C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk start C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk
if not exist C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk goto err_file006
timeout /t 5 /nobreak >nul
:: DO NOT UNCOMMENT THIS. Useless and broken code.
:: Checks for trade holds
:: Create TEMP shit in AHK. Messy stuff.
::echo CoordMode Pixel > C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%holdimg%.bmp >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo if ErrorLevel = 2 >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo     exit >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo else if ErrorLevel = 1 >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo     exit >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo else >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo     FileAppend, >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo ( >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo temp >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo. >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo ), C:\IdealTF\config\itemconfig\temp\HOLD.txt >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
::echo [%time%] [TRADECHECK] Running "holdcheck.ahk"
::if exist C:\IdealTF\config\itemconfig\temp\holdcheck.ahk start C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
:::tc_waitforhc_pre
:: NOTICE: LEAVE THE BELOW LINE UNCOMMENTED. IT IS USED TO STOP A VARIABLE ERROR.
::set tc_waitforhc=0
:::tc_waitforhc
::set /a tc_waitforhc+=1
::if %tc_waitforhc% GEQ %tc_timeout% goto tc_waitforhc_2
::if exist C:\IdealTF\config\itemconfig\temp\HOLD.txt goto tc_waitforhc_1
::if not exist C:\IdealTF\config\itemconfig\temp\HOLD.txt goto tc_waitforhc
::goto tc_waitforhc
:::tc_waitforhc_1
::echo [%time%] [TRADECHECK] Item Hold Detected.
::if exist C:\IdealTF\config\botfiles\vbs\err_HOLD.vbs start C:\IdealTF\config\botfiles\vbs\err_HOLD.vbs
::goto err_hold001
:::tc_waitforhc_2
if exist C:\IdealTF\config\itemconfig\temp\holdcheck.ahk del C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
if exist C:\IdealTF\config\itemconfig\temp\HOLD.txt del C:\IdealTF\config\itemconfig\temp\HOLD.txt
:: Checks for trade
echo [%time%] [TRADECHECK] Running 'C:\IdealTF\config\tradecheck.ahk'
:: Starts tradecheck
if exist C:\IdealTF\config\tradecheck.ahk start C:\IdealTF\config\tradecheck.ahk
if not exist C:\IdealTF\config\tradecheck.ahk goto err_file007
:: Checks for trade offer
:tc_waitforto_pre
set tc_waitforto=0
:tc_waitforto
set /a tc_waitforto+=1
if %tc_waitforto% GEQ %tc_timeout% goto tc_waitforto_1
if exist C:\IdealTF\config\itemconfig\temp\TRADE.txt goto tc_waitforto_2
if not exist C:\IdealTF\config\itemconfig\temp\TRADE.txt goto tc_waitforto
goto tc_waitforto
:: Trade offer not found
:tc_waitforto_1
echo [%date% %time%] Offer not found (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
echo [%time%] [TRADECHECK] Trade offer not found after %tc_waitforto% tries. (timed out)
if exist C:\IdealTF\config\itemconfig\temp\TRADE.txt del C:\IdealTF\config\itemconfig\temp\TRADE.txt
goto cycle_return
:: Trade offer found
:tc_waitforto_2
echo [%date% %time%] Offer found (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
:: Sets data for latest trade
if exist C:\IdealTF\config\temp\data_02_001.txt del C:\IdealTF\config\temp\data_02_001.txt
echo %date% %time% >> C:\IdealTF\config\temp\data_02_001.txt
if exist C:\IdealTF\config\temp\data_02_002.txt del C:\IdealTF\config\temp\data_02_002.txt
echo %tradeid% >> C:\IdealTF\config\temp\data_02_002.txt
echo [%time%] [TRADECHECK] Trade Offer Detected.
:: Deletes temp files
if exist C:\IdealTF\config\itemconfig\temp\TRADE.txt del C:\IdealTF\config\itemconfig\temp\TRADE.txt
:: Opens offer
echo [%time%] [TRADECHECK] Running 'C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk'
if exist C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk start C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk
if not exist C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk goto err_file008
timeout /t 10 /nobreak >nul
:: Maximises offer window
echo [%time%] [TRADECHECK] Running 'C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk'
if exist C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk start C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk
if not exist C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk goto err_file009
timeout /t 2 /nobreak >nul
:: Begins itemchecker
:ic_pre
echo.
:: Checks if bot has permission to accept/decline all trades
if "%allow_all%"=="true" goto ic_all
goto ic_skip
:ic_all
if exist C:\IdealTF\config\settings\ButtonAcceptall.txt goto ic_accept
if exist C:\IdealTF\config\settings\ButtonDeclineall.txt goto ic_noaccept
goto ic_skip

:: Itemcheck Begins
:ic_skip
echo echo [%time%] [ITEMCHECK] Running 'itemchecker'
:ic
set price_bot=0
set price_user=0
:: ======================================== CURRENCY ========================================
:: Currency configs. Don't mess with these unless you change the currencies itemids (dont)
:: ==========================================================================================
set itemid=tf_currency_scrap
call C:\IdealTF\config\itemconfig\%itemid%.bat
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
set itemid=tf_currency_reclaimed
if exist C:\IdealTF\config\itemconfig\%itemid%.bat call C:\IdealTF\config\itemconfig\%itemid%.bat
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
set itemid=tf_currency_refined
call C:\IdealTF\config\itemconfig\%itemid%.bat
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
set itemid=tf_currency_key
call C:\IdealTF\config\itemconfig\%itemid%.bat
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
:: ======================================= /CURRENCY ========================================
::
:: =================================================================================================================================================================
:: PLACE ALL ITEM CONFIGS BELOW THIS LINE (find_item_config)
::
:: The higher up the item's code the higher its priority. Keep currency at the top.
:: =================================================================================================================================================================






:: =================================================================================================================================================================
:: DONT PLACE ITEM CONFIGS BELOW THIS LINE
:: =================================================================================================================================================================
echo.
echo [%time%] [OFFERCONFIRM] Running "OfferUp.ahk"
:: Pulls offer back up to top
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
echo [%time%] [ITEMCHECK] Itemcheck is complete!
echo [%time%] [ITEMCHECK] Bot price: %price_bot% User price: %price_user%
:: Sets the price margins (advancedconfig)
set /a price_userl=%price_user%+%price_margin_hi%
set /a price_useru=%price_user%-%price_margin_lo%
:: Maximum and minimum trade values (advancedconfig)
if %price_user% gtr %price_maxuser% goto ic_noaccept
if %price_user% lss %price_minuser% goto ic_noaccept
if %price_bot% gtr %price_maxbot% goto ic_noaccept
if %price_bot% lss %price_minbot% goto ic_noaccept
:: High/Low Price margins (advancedconfig)
if %price_bot% lss %price_userl% goto ic_noaccept
if %price_bot% gtr %price_useru% goto ic_noaccept
if %price_userl% lss %price_bot% goto ic_noaccept
if %price_useru% gtr %price_bot% goto ic_noaccept
:: If user has a greater value than bot
if %price_user% gtr %price_bot% goto ic_accept
:: If all checks don't match critera accept trade. Not a good principal but
:: should work. ehh.
:ic_accept
echo [%date% %time%] Offer accepted (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
if exist C:\IdealTF\config\temp\data_02_004.txt del C:\IdealTF\config\temp\data_02_004.txt
echo Accepted >> C:\IdealTF\config\temp\data_02_004.txt
echo [%time%] [ITEMPRICE] Values correct. Accepting trade.
echo [%time%] [OFFERCONFIRM] Running "OfferConfirm.ahk"
if exist C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk start C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo.
echo [%time%] [OFFERCONFIRM] Confirming offer...
timeout /t 11 /nobreak >nul
echo.
echo [%time%] [OFFERCONFIRM] Confirmed offer.
goto cycle_return
:ic_noaccept
echo [%date% %time%] Offer declined (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
if exist C:\IdealTF\config\temp\data_02_004.txt del C:\IdealTF\config\temp\data_02_004.txt
echo Declined >> C:\IdealTF\config\temp\data_02_004.txt
echo [%time%] [ITEMPRICE] Not accepting trade. Incorrect values.
echo [%time%] [OFFERDECLINE] Running "OfferDecline.ahk"
if exist C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk start C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo.
echo [%time%] [OFFERDECLINE] Declining offer...
echo.
timeout /t 8 /nobreak >nul
echo.
echo [%time%] [OFFERDECLINE] Declined offer.
echo.
goto cycle_return
:: itemchecker for bot
:itemchecker_bot
:: Set itemcheckloop to 0
set icloop=0
:: Starts offerUp.ahk and deletes all temp files
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
del /Q C:\IdealTF\config\itemconfig\temp\*.*
:itemchecker_bot1
:: Increases itemcheckloop by 1
set /a icloop+=1
echo [%time%] [ITEMCHECK] Checking item slot: "%icloop%" for itemid "%itemid%" for "bot"
:: Goes to top of offer
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
:: Sets itemconfig values
call C:\IdealTF\config\%ScreenSize%_1cfg.bat
if "%icloop%"=="1" (
    set coord1x=%slot1X1%
    set coord1y=%slot1Y1%
    set coord2x=%slot1X2%
    set coord2y=%slot1Y2%
)
if "%icloop%"=="2" (
	set coord1x=%slot2X1%
	set coord1y=%slot2Y1%
	set coord2x=%slot2X2%
	set coord2y=%slot2Y2%
)
if "%icloop%"=="3" (
	set coord1x=%slot3X1%
	set coord1y=%slot3Y1%
	set coord2x=%slot3X2%
	set coord2y=%slot3Y2%
)
if "%icloop%"=="4" (
	set coord1x=%slot4X1%
	set coord1y=%slot4Y1%
	set coord2x=%slot4X2%
	set coord2y=%slot4Y2%
)
if "%icloop%"=="5" (
	set coord1x=%slot5X1%
	set coord1y=%slot5Y1%
	set coord2x=%slot5X2%
 	set coord2y=%slot5Y2%
 )
if "%icloop%"=="6" (
	set coord1x=%slot6X1%
	set coord1y=%slot6Y1%
	set coord2x=%slot6X2%
	set coord2y=%slot6Y2%
)
if "%icloop%"=="7" (
	set coord1x=%slot7X1%
	set coord1y=%slot7Y1%
	set coord2x=%slot7X2%
	set coord2y=%slot7Y2%
)
if "%icloop%"=="8" (
	set coord1x=%slot8X1%
	set coord1y=%slot8Y1%
	set coord2x=%slot8X2%
	set coord2y=%slot8Y2%
)
if %icloop% GEQ 9 echo [%time%] [ITEMCHECK] [WARNING] slot9 is NOT valid. Exiting call.
if %icloop% GEQ 9 goto itemchecker_bot_done
if not exist C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp call :ic_invalidimage
if not exist C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp GOTO ic_noaccept
echo CoordMode Pixel > C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo ImageSearch, FoundX, FoundY, %coord1x%, %coord1y%, %coord2x%, %coord2y%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo if ErrorLevel >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo else >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo     FileAppend, temp, C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.bat >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
:: Start the AHK checker and sees its output.
start C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
goto itemchecker_bot1
:itemchecker_bot_done
timeout /t 1 /nobreak > nul
echo [%time%] [ITEMCHECK] Adding up prices...
if exist C:\IdealTF\config\itemconfig\temp\%itemid%1.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%2.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%3.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%4.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%5.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%6.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%7.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%8.bat set /a price_bot+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%1.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "1"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%2.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "2"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%3.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "3"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%4.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "4"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%5.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "5"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%6.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "6"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%7.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "7"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%8.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "8"
echo [%time%] [ITEMCHECK] Total: "%price_bot%"
del /Q C:\IdealTF\config\itemconfig\temp\*.*
GOTO:eof
:itemchecker_user
set icloop=0
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
start C:\IdealTF\config\botfiles\ahk\OfferDown.ahk
timeout /t 1 /nobreak > nul
del /Q C:\IdealTF\config\itemconfig\temp\*.*
:itemchecker_user1
set /a icloop+=1
echo [%time%] [ITEMCHECK] Checking item slot: "%icloop%" for itemid "%itemid%" for "user"
call C:\IdealTF\config\%ScreenSize%_2cfg.bat
if "%icloop%"=="1" (
    set coord1x=%slot1X1%
    set coord1y=%slot1Y1%
    set coord2x=%slot1X2%
    set coord2y=%slot1Y2%
)
if "%icloop%"=="2" (
	set coord1x=%slot2X1%
	set coord1y=%slot2Y1%
	set coord2x=%slot2X2%
	set coord2y=%slot2Y2%
)
if "%icloop%"=="3" (
	set coord1x=%slot3X1%
	set coord1y=%slot3Y1%
	set coord2x=%slot3X2%
	set coord2y=%slot3Y2%
)
if "%icloop%"=="4" (
	set coord1x=%slot4X1%
	set coord1y=%slot4Y1%
	set coord2x=%slot4X2%
	set coord2y=%slot4Y2%
)
if "%icloop%"=="5" (
	set coord1x=%slot5X1%
	set coord1y=%slot5Y1%
	set coord2x=%slot5X2%
 	set coord2y=%slot5Y2%
 )
if "%icloop%"=="6" (
	set coord1x=%slot6X1%
	set coord1y=%slot6Y1%
	set coord2x=%slot6X2%
	set coord2y=%slot6Y2%
)
if "%icloop%"=="7" (
	set coord1x=%slot7X1%
	set coord1y=%slot7Y1%
	set coord2x=%slot7X2%
	set coord2y=%slot7Y2%
)
if "%icloop%"=="8" (
	set coord1x=%slot8X1%
	set coord1y=%slot8Y1%
	set coord2x=%slot8X2%
	set coord2y=%slot8Y2%
)
if %icloop% GEQ 9 echo [%time%] [ITEMCHECK] [WARNING] slot9 is NOT valid. Exiting call.
if %icloop% GEQ 9 goto itemchecker_user_done
if not exist C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp call :ic_invalidimage
if not exist C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp GOTO:eof
echo CoordMode Pixel > C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo ImageSearch, FoundX, FoundY, %coord1x%, %coord1y%, %coord2x%, %coord2y%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\%itemid%.bmp >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo if ErrorLevel >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo else >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
echo     FileAppend, temp, C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.bat >> C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
:: Start the AHK checker and sees its output.
start C:\IdealTF\config\itemconfig\temp\%itemid%%icloop%.ahk
goto itemchecker_user1
:itemchecker_user_done
timeout /t 1 /nobreak > nul
echo [%time%] [ITEMCHECK] Adding up prices...
if exist C:\IdealTF\config\itemconfig\temp\%itemid%1.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%2.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%3.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%4.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%5.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%6.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%7.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%8.bat set /a price_user+=%val%
if exist C:\IdealTF\config\itemconfig\temp\%itemid%1.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "1"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%2.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "2"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%3.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "3"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%4.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "4"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%5.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "5"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%6.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "6"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%7.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "7"
if exist C:\IdealTF\config\itemconfig\temp\%itemid%8.bat echo [%time%] [ITEMCHECK] %itemid% found in slot "8"
echo [%time%] [ITEMCHECK] Total: "%price_user%"
del /Q C:\IdealTF\config\itemconfig\temp\*.*
GOTO:eof
:: Finishes and returns cycle.
:cycle_return
echo.
echo [%date% %time%] Cycle finished (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
echo [%time%] Cycle #%cycle% (%time% %date%; %tradeid%) finished.
echo [%time%] Returning to start.
goto cycle
:: Launcher error.
:err_launcher001
echo.
echo [%date% %time%] Launcher not started (err_launcher001). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Please start the launcher and run the bot from there.
echo.
echo [%time%] [WARNING] Please wait..
timeout /t 3 /nobreak >nul
if "%exit_on_stop%"=="true" exit
if "%exit_on_stop%"=="false" goto cycle
:: Launcher error.
:err_launcher002
echo.
echo [%date% %time%] Program not started (err_launcher002). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Please launch the program from the launcher 'Start' button.
echo.
echo [%time%] [WARNING] Please wait..
timeout /t 3 /nobreak >nul
if "%exit_on_stop%"=="true" exit
if "%exit_on_stop%"=="false" goto cycle
:err_launch001
:err_launch002
echo [%date% %time%] Install error (err_launch001/2). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] IdealTF or IdealTF config is not installed.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Config is corrupt.
:err_config001
echo [%date% %time%] Config does not exist (err_config001). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Config does not exist. Please log into the bot if you haven't already.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Invalid screen size.
:err_config002
echo [%date% %time%] Screen size config is corrupt (err_config002). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Screen Size Config is corrupt.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Invalid screen size.
:err_config003
echo [%date% %time%] Screen size config is invalid (err_config003). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Screen Size Config doesn't match current screen size!
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Invalid version
:err_config004
echo [%date% %time%] Version error (err_config004). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Version config error.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Invalid build id
:err_config005
echo [%date% %time%] Build error (err_config005). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Build ID config error.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Download error (depreciated and will be removed eventually)
:err_config006
echo [%date% %time%] Screen config error (err_config006). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Couldn't download screen data!
echo.
goto cycle
:err_config007
echo [%date% %time%] Screen config error (err_config007). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Could not find screen config for screen size!
echo.
goto cycle
:err_file001
echo [%date% %time%] ITFsettingsAgent.exe missing (err_file001). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting ITFsettingsAgent.exe. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file002
echo [%date% %time%] ITFsettingsCompiler.exe missing (err_file002). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting ITFsettingsCompiler.exe. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file003
echo [%date% %time%] advancedconfig missing (err_file003). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error reading advancedconfig. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file004
echo [%date% %time%] screenresolution settings missing (err_file004). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error reading screenresolution. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file005
echo [%date% %time%] SwitchToOffers.ahk missing (err_file005). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting SwitchToOffers.ahk. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file006
echo [%date% %time%] PageRefresh.ahk missing (err_file006). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting PageRefresh.ahk. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file007
echo [%date% %time%] tradecheck.ahk missing (err_file007). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting tradecheck.ahk. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file008
echo [%date% %time%] OpenOffer.ahk missing (err_file008). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting OpenOffer.ahk. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:err_file009
echo [%date% %time%] MaximiseWindow.ahk missing (err_file009). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Error starting MaximiseWindow.ahk. Missing or corrupt file.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: Trade hold is present.
:err_hold001
echo [%date% %time%] Trade hold present (err_hold001). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Trade Hold present. Fatal error.
echo.
echo Press any key to exit.
if "%continue_on_fatal%"=="true" goto start
if "%exit_on_fatal%"=="true" exit
pause>nul
exit
:: There was an error with an itemids config
:ic_invalidcfg
echo [%date% %time%] Inavlid or corrupt itemconfig (err_invalidcfg). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Config for %itemid% is invalid or does not exist.
echo.
timeout /t 3 /nobreak >nul
GOTO:eof
:: Could not find image of itemid in config
:ic_invalidimage
echo [%date% %time%] Itemconfig image is corrupt or does not exist (err_invalidimage). >> C:\IdealTF\Log.txt
echo.
echo [%time%] [WARNING] Config image for %itemid% is invalid or does not exist.
echo.
timeout /t 3 /nobreak >nul
GOTO:eof

:: Checks status of launcher.
:check_status
if not exist C:\IdealTF\config\prgon.txt goto err_launcher001
if not exist C:\IdealTF\config\prgrun.txt goto err_launcher002
echo.
echo [%time%] [STATUS] Passed status check.
echo.
GOTO:eof

:: OLD Color settings DO NOT MODIFY
:: Note: Code completely crashed some systems so was removed in aid of supporting them.
::
:: This code has been horribly stolen from this post: http://stackoverflow.com/a/10407642/3001831
:: All credits go to dbenham. May be super slow to print on some old systems so support for
:: AwesomeBatch will be added soon. (https://github.com/Opticulex/AwesomeBatch/)
:::c
::setlocal enableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::colorPrint Color  Str  [/n]
::setlocal
::set "s=%~2"
::call :colorPrintVar %1 s %3
::exit /b

:::colorPrintVar  Color  StrVar  [/n]
::if not defined DEL call :initColorPrint
::setlocal enableDelayedExpansion
::pushd .
::':
::cd \
::set "s=!%~2!"

::for %%n in (^"^

::^") do (
::  set "s=!s:\=%%~n\%%~n!"
::  set "s=!s:/=%%~n/%%~n!"
::  set "s=!s::=%%~n:%%~n!"
::)
::for /f delims^=^ eol^= %%s in ("!s!") do (
::  if "!" equ "" setlocal disableDelayedExpansion
::  if %%s==\ (
::    findstr /a:%~1 "." "\'" nul
::    <nul set /p "=%DEL%%DEL%%DEL%"
::  ) else if %%s==/ (
::    findstr /a:%~1 "." "/.\'" nul
::    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
::  ) else (
::    >colorPrint.txt (echo %%s\..\')
::    findstr /a:%~1 /f:colorPrint.txt "."
::    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
::  )
::)
::if /i "%~3"=="/n" echo(
::popd
::exit /b


:::initColorPrint
::for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
::<nul >"%temp%\'" set /p "=."
::subst ': "%temp%" >nul
::exit /b


:::cleanupColorPrint
::2>nul del "%temp%\'"
::2>nul del "%temp%\colorPrint.txt"
::>nul subst ': /d
::exit /b
