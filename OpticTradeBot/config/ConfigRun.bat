@echo off
mode 70,10
color 0f
title OpticTradeBot - Config Viewer
set cfgBotID=not set
set cfgAdminID=not set
set cfgLogWindowCol=not set
if exist C:\OpticTradeBot\config\BotID.bat call C:\OpticTradeBot\config\BotID.bat
if exist C:\OpticTradeBot\config\AdminID.bat call C:\OpticTradeBot\config\AdminID.bat
if exist C:\OpticTradeBot\config\LogWindowCol.bat call C:\OpticTradeBot\config\LogWindowCol.bat
if "%cfgBotID%"=="" set cfgBotID=not set
if "%cfgAdminID%"=="" set cfgAdminID=not set
if "%cfgLogWindowCol%"=="" set cfgLogWindowCol=not set
cls
echo Optic Trade Bot - Config Entry Viewer
echo.
echo Bot ID: %cfgBotID%
echo Admin ID: %cfgAdminID%
echo Log Window Color: %cfgLogWindowCol%
echo.
echo.
echo.
echo Press ANY KEY to exit..
pause>nul