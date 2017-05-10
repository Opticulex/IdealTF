:: =================================================================================
::                                        IdealTF
:: =================================================================================
::
:: Code by Opticulex and Shynaio. (c) 2017.
::
:: May be modified freely but only for personal use. Redistribution of any sort, 
:: editied or unedited is strictly prohibited.
::
:: Code designed for v2.0.1 build100517
::
:: =================================================================================
::
::               >>>>> FOR ITEM CONFIG SETTINGS GO TO LINE 209 <<<<<
::
:: =================================================================================
:start
@echo off
:: Sets version and build data to nulls.
set ver=null
set build=null
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
echo [%date% %time%] Launched %ver% build%build%. >> C:\IdealTF\Log.txt
:: Checks status
::call :check_status
:: Resets Config Values
set varSteamID=0
set varSteamName=0
set varScreenSize=0
set ScreenSizeX=0
set ScreenSizeY=0
:: Runs settings ITFsettingsAgent
if exist C:\IdealTF\config\ITFsettingsAgent.exe start C:\IdealTF\config\ITFsettingsAgent.exe
timeout /t 2 /nobreak > nul
:: Runs settings ITFsettingsCompiler
if exist C:\IdealTF\config\ITFsettingsCompiler.exe start C:\IdealTF\config\ITFsettingsCompiler.exe
timeout /t 2 /nobreak > nul
:: Sets config values
echo [%time%] [CONFIG] Reading Input Config values...
if exist C:\IdealTF\config\settings\SteamID.bat call C:\IdealTF\config\settings\SteamID.bat
if exist C:\IdealTF\config\settings\SteamName.bat call C:\IdealTF\config\settings\SteamName.bat
if exist C:\IdealTF\config\settings\ScreenSize.bat call C:\IdealTF\config\settings\ScreenSize.bat
if not exist C:\IdealTF\config\settings\SteamID.bat goto err_config001
if not exist C:\IdealTF\config\settings\SteamName.bat goto err_config001
if not exist C:\IdealTF\config\settings\ScreenSize.bat goto err_config001
echo [%time%] [CONFIG] Input Config values: "%varSteamID%,%varSteamName%,%varScreenSize%"
echo [%time%] [CONFIG] Loading advancedconfig.bat..
if exist C:\IdealTF\config\advancedconfig.bat call C:\IdealTF\config\advancedconfig.bat
echo [%time%] [CONFIG] Loading screenresolution.bat..
if exist C:\IdealTF\config\screenresolution.bat call C:\IdealTF\config\screenresolution.bat
:: Read Screen Resolution Settings
echo [%time%] [CONFIG] Setting Screen resolution...
if "%varScreenSize%"=="1366x768" set ScreenSizeX=1366
if "%varScreenSize%"=="1366x768" set ScreenSizeY=768
if "%varScreenSize%"=="1366x768" goto screensizeset
if "%varScreenSize%"=="1024x768" set ScreenSizeX=1024
if "%varScreenSize%"=="1024x768" set ScreenSizeY=768
if "%varScreenSize%"=="1024x768" goto screensizeset
goto err_config002
:screensizeset
:: Downloads item coord config
echo [%time%] [CONFIG] Downloading defaultcoords_%ScreenSizeX%x%ScreenSizeY%_1cfg.txt...
echo [%time%] [CONFIG] Downloading defaultcoords_%ScreenSizeX%x%ScreenSizeY%_2cfg.txt...
if exist C:\IdealTF\config\dlscreenfiles1.ahk del C:\IdealTF\config\dlscreenfiles1.ahk
if exist C:\IdealTF\config\dlscreenfiles2.ahk del C:\IdealTF\config\dlscreenfiles2.ahk
echo UrlDownloadToFile, https://idealtf.neocities.org/data/defaultcoords_%ScreenSizeX%x%ScreenSizeY%_1cfg.txt, C:\IdealTF\config\itm1config.bat > C:\IdealTF\config\dlscreenfiles1.ahk
echo UrlDownloadToFile, https://idealtf.neocities.org/data/defaultcoords_%ScreenSizeX%x%ScreenSizeY%_2cfg.txt, C:\IdealTF\config\itm2config.bat > C:\IdealTF\config\dlscreenfiles2.ahk
timeout /t 1 /nobreak >nul
if exist C:\IdealTF\config\dlscreenfiles1.ahk start C:\IdealTF\config\dlscreenfiles1.ahk
if exist C:\IdealTF\config\dlscreenfiles2.ahk start C:\IdealTF\config\dlscreenfiles2.ahk
if not exist C:\IdealTF\config\dlscreenfiles1.ahk echo [%time%] [WARNING] Could not download defaultcoords!
if not exist C:\IdealTF\config\dlscreenfiles2.ahk echo [%time%] [WARNING] Could not download defaultcoords!
if not exist C:\IdealTF\config\dlscreenfiles1.ahk goto err_config006
if not exist C:\IdealTF\config\dlscreenfiles2.ahk goto err_config006
timeout /t 3 /nobreak >nul
echo [%time%] [CONFIG] Screen Resolution x:"%ScreenSizeX%" y:"%ScreenSizeY%" raw:"%varScreenSize%"

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
:: Create TEMP shit in AHK. Messy stuff.
echo CoordMode Pixel > C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\#0100.bmp >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo if ErrorLevel = 2 >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo else if ErrorLevel = 1 >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo else >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo     FileAppend, >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo ( >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo temp >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo. >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo ), C:\IdealTF\config\itemconfig\temp\HOLD.txt >> C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
echo [%time%] [TRADECHECK] Running "SwitchToOffers.ahk"
if exist C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk start C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk
timeout /t 1 /nobreak >nul
echo [%time%] [TRADECHECK] Running "PageRefresh.ahk"
if exist C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk start C:\IdealTF\config\botfiles\ahk\PageRefresh.ahk
timeout /t 5 /nobreak >nul

:: DO NOT UNCOMMENT THIS. Useless and broken code.

:: Checks for trade holds
::echo [%time%] [TRADECHECK] Running "holdcheck.ahk"
::if exist C:\IdealTF\config\itemconfig\temp\holdcheck.ahk start C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
:::tc_waitforhc_pre
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
echo [%time%] [TRADECHECK] Holdcheck timed out after %tc_waitforhc% tries. (timed out)
if exist C:\IdealTF\config\itemconfig\temp\holdcheck.ahk del C:\IdealTF\config\itemconfig\temp\holdcheck.ahk
if exist C:\IdealTF\config\itemconfig\temp\HOLD.txt del C:\IdealTF\config\itemconfig\temp\HOLD.txt

:: Checks for trade
:: Creates tradecheck File
echo CoordMode Pixel > C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo ImageSearch, FoundX, FoundY, 0, 0, %ScreenSizeX%, %ScreenSizeY%, C:\IdealTF\config\itemconfig\img_%ScreenSizeX%x%ScreenSizeY%\#0010.bmp >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo if ErrorLevel = 2 >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo else if ErrorLevel = 1 >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo     exit >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo else >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo     FileAppend, temp, C:\IdealTF\config\itemconfig\temp\TRADE.txt >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
echo exit  >> C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
:: Starts tradecheck
start C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
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
if exist C:\IdealTF\config\itemconfig\temp\tradecheck.ahk del C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
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
if exist C:\IdealTF\config\itemconfig\temp\tradecheck.ahk del C:\IdealTF\config\itemconfig\temp\tradecheck.ahk
if exist C:\IdealTF\config\itemconfig\temp\TRADE.txt del C:\IdealTF\config\itemconfig\temp\TRADE.txt
:: Opens offer
echo [%time%] [TRADECHECK] Running "OpenOffer.ahk"
if exist C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk start C:\IdealTF\config\botfiles\ahk\OpenOffer.ahk
timeout /t 10 /nobreak >nul
:: Maximises offer window
echo [%time%] [TRADECHECK] Running "MaximiseWindow.ahk"
if exist C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk start C:\IdealTF\config\botfiles\ahk\MaximiseWindow.ahk
timeout /t 2 /nobreak >nul
:: Begins itemchecker
:ic_pre
echo.
echo echo [%time%] [ITEMCHECK] Began ItemCheck.
:ic
set price_bot=0
set price_user=0
:: =================================================================================================================================================================
:: PLACE ALL ITEM CONFIGS BELOW THIS LINE (find_item_config)
::
:: The higher up the item's code the higher its priority. Keep currency at the top.
:: =================================================================================================================================================================


:: Scrap metal check (only checks user)
:ic_id_5000
set itemid=5000
call C:\IdealTF\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price - bot:%price_bot%, user:%price_user%

:: Reclaimed metal check (only checks user)
:ic_id_5001
set itemid=5001
call C:\IdealTF\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price - bot:%price_bot%, user:%price_user%

:: Refined metal check (only checks user)
:ic_id_5002
set itemid=5001
call C:\IdealTF\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price - bot:%price_bot%, user:%price_user%

:: Key check (only checks user)
:ic_id_5021
set itemid=5001
call C:\IdealTF\config\itemconfig\%itemid%.bat
echo [%time%] [ITEMCHECK] Item Id: %itemid% Item Value: %val% Image: %img%
if "%bot%"=="true" call :itemchecker_bot
if "%user%"=="true" call :itemchecker_user
echo [%time%] [ITEMCHECK] Final price - bot:%price_bot%, user:%price_user%


:: =================================================================================================================================================================
:: DONT PLACE ITEM CONFIGS BELOW THIS LINE
:: =================================================================================================================================================================
echo.
echo [%time%] [OFFERCONFIRM] Running "OfferUp.ahk"
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
echo [%time%] [ITEMCHECK] Itemcheck is complete!
echo [%time%] [ITEMCHECK] Bot price: %price_bot% User price: %price_user%
set /a price_userl=%price_user%+5
set /a price_useru=%price_user%-5
if "%price_user%"=="0" goto ic_noaccept

if %price_bot% lss %price_userl% goto ic_noaccept
if %price_bot% gtr %price_useru% goto ic_noaccept
if %price_userl% lss %price_bot% goto ic_noaccept
if %price_useru% gtr %price_bot% goto ic_noaccept

if %price_user% lss %price_bot% goto ic_noaccept
if %price_user% gtr %price_bot% goto ic_accept

:ic_accept
echo [%date% %time%] Offer accepted (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
if exist C:\IdealTF\config\temp\data_02_004.txt del C:\IdealTF\config\temp\data_02_004.txt
echo Accepted >> C:\IdealTF\config\temp\data_02_004.txt
echo [%time%] [ITEMPRICE] Values correct. Accepting trade.
echo [%time%] [OFFERCONFIRM] Running "OfferConfirm.ahk"
start C:\IdealTF\config\botfiles\ahk\OfferConfirm.ahk
echo [%time%] [OFFERCONFIRM] Confirming offer...
timeout /t 11 /nobreak >nul
echo [%time%] [OFFERCONFIRM] Confirmed offer.
goto cycle_return
:ic_noaccept
echo [%date% %time%] Offer declined (#%cycle% %tradeid%). >> C:\IdealTF\Log.txt
if exist C:\IdealTF\config\temp\data_02_004.txt del C:\IdealTF\config\temp\data_02_004.txt
echo Declined >> C:\IdealTF\config\temp\data_02_004.txt
echo [%time%] [ITEMPRICE] Not accepting trade. Incrrect values.
echo [%time%] [OFFERDECLINE] Running "OfferDecline.ahk"
start C:\IdealTF\config\botfiles\ahk\OfferDecline.ahk
echo [%time%] [OFFERDECLINE] Declining offer...
timeout /t 8 /nobreak >nul
echo [%time%] [OFFERDECLINE] Declined offer.
goto cycle_return
:itemchecker_bot
set icloop=0
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
del /Q C:\IdealTF\config\itemconfig\temp\*.*
:itemchecker_bot1
set /a icloop+=1
echo [%time%] [ITEMCHECK] Checking item slot: "%icloop%" for itemid "%itemid%" for "bot"
start C:\IdealTF\config\botfiles\ahk\OfferUp.ahk
call C:\IdealTF\config\itm1config.bat
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
if %icloop% GEQ 9 echo [%time%] [ITEMCHECK] [WARNING] slot9 is NOT valid. Exiting call.
if %icloop% GEQ 9 goto itemchecker_bot_done
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
goto itemchecker_bot1
:itemchecker_bot_done
ping 1.1.1.1 -n 1 -w 1000 > nul
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
call C:\IdealTF\config\itm2config.bat
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
ping 1.1.1.1 -n 1 -w 1000 > nul
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
echo [%time%] [WARNING] Please start the launcher and run the bot from there.
echo [%time%] [WARNING] Please wait..
timeout /t 5 /nobreak >nul
goto cycle
:: Launcher error.
:err_launcher002
echo.
echo [%date% %time%] Program not started (err_launcher002). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Please launch the program from the launcher 'Start' button.
echo [%time%] [WARNING] Please wait..
timeout /t 5 /nobreak >nul
goto cycle

:err_launch001
:err_launch002
echo [%date% %time%] Install error (err_launch001/2). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] IdealTF or IdealTF config is not installed.
echo.
echo Press any key to exit.
pause>nul
exit
:: Config is corrupt.
:err_config001
echo [%date% %time%] Config does not exist (err_config001). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Config does not exist. Please log into the bot if you haven't already.
echo.
echo Press any key to exit.
pause>nul
exit
:: Invalid screen size.
:err_config002
echo [%date% %time%] Screen size config is corrupt (err_config002). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Screen Size Config is corrupt.
echo.
echo Press any key to exit.
pause>nul
exit
:: Invalid screen size.
:err_config003
echo [%date% %time%] Screen size config is invalid (err_config003). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Screen Size Config doesn't match current screen size!
echo.
echo Press any key to exit.
pause>nul
exit
:: Invalid version
:err_config004
echo [%date% %time%] Version error (err_config004). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Version config error.
echo.
echo Press any key to exit.
pause>nul
exit
:: Invalid build id
:err_config005
echo [%date% %time%] Build error (err_config005). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Build ID config error.
echo.
echo Press any key to exit.
pause>nul
exit
:err_config005
echo [%date% %time%] Screen config error (err_config005). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Couldn't download screen data!
echo.
goto cycle
:: Trade hold is present.
:err_hold001
echo [%date% %time%] Trade hold present (err_hold001). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Trade Hold present. Fatal error.
echo.
echo Press any key to exit.
pause>nul
exit
:: There was an error with an itemids config
:ic_invalidcfg
echo [%date% %time%] Inavlid or corrupt itemconfig (err_invalidcfg). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Config for %itemid% is invalid or does not exist.
echo.
timeout /t 2 /nobreak >nul
GOTO:eof
:: Could not find image of itemid in config
:ic_invalidimage
echo [%date% %time%] Itemconfig image is corrupt or does not exist (err_invalidimage). >> C:\IdealTF\Log.txt
echo [%time%] [WARNING] Config image for %itemid% is invalid or does not exist.
echo.
timeout /t 2 /nobreak >nul
GOTO:eof
:: Checks status of launcher.
:check_status
if not exist C:\IdealTF\config\prgon.txt goto err_launcher001
if not exist C:\IdealTF\config\prgrun.txt goto err_launcher002
echo [%time%] [STATUS] Checked status.
GOTO:eof
