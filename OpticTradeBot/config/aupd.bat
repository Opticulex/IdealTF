:: Set status
:: Server IP config
set down=0
set maintenance=0
if "%maintenance%"=="1" goto maintenance
if "%down%"=="1" goto down
if exist C:\OpticTradeBot\config\serverip.txt del C:\OpticTradeBot\config\serverip.txt
(echo | set /p=^94.13.100.142)>>C:\OpticTradeBot\config\serverip.txt




::AutoUpdater for OpticTradeBot
:: Autoupdate verification
if exist C:\OpticTradeBot\config\prgaupd.txt del C:\OpticTradeBot\config\prgaupd.txt
echo. > "C:\OpticTradeBot\config\prgaupd.txt"
:: Item database setter
if exist C:\OpticTradeBot\config\itemconfig\5002.bat del C:\OpticTradeBot\config\itemconfig\5000.bat
if exist C:\OpticTradeBot\config\itemconfig\5002.bat del C:\OpticTradeBot\config\itemconfig\5001.bat
if exist C:\OpticTradeBot\config\itemconfig\5002.bat del C:\OpticTradeBot\config\itemconfig\5002.bat
echo :: Config file for Item ID "5000" > C:\OpticTradeBot\config\itemconfig\5000.bat
echo. >> C:\OpticTradeBot\config\itemconfig\5000.bat
echo set val=11 >> C:\OpticTradeBot\config\itemconfig\5000.bat
echo set img=5000.bmp >> C:\OpticTradeBot\config\itemconfig\5000.bat
echo :: Config file for Item ID "5001" > C:\OpticTradeBot\config\itemconfig\5001.bat
echo. >> C:\OpticTradeBot\config\itemconfig\5001.bat
echo set val=33 >> C:\OpticTradeBot\config\itemconfig\5001.bat
echo set img=5001.bmp >> C:\OpticTradeBot\config\itemconfig\5001.bat
echo :: Config file for Item ID "5002" > C:\OpticTradeBot\config\itemconfig\5002.bat
echo. >> C:\OpticTradeBot\config\itemconfig\5002.bat
echo set val=100 >> C:\OpticTradeBot\config\itemconfig\5002.bat
echo set img=5002.bmp >> C:\OpticTradeBot\config\itemconfig\5002.bat
echo :: Config file for Item ID "5021" > C:\OpticTradeBot\config\itemconfig\5021.bat
echo. >> C:\OpticTradeBot\config\itemconfig\5021.bat
echo set val=2655 >> C:\OpticTradeBot\config\itemconfig\5021.bat
echo set img=5021.bmp >> C:\OpticTradeBot\config\itemconfig\5021.bat
exit
:maintenance
Enable script below when maintenance is under way
taskkill /f /im AutoHotkey.exe
taskkill /f /im TradeBotLauncher.exe
taskkill /f /im TradeBotLogin.exe
taskkill /f /im TradeBotBackground.exe
taskkill /f /im wscript.exe
start C:\OpticTradeBot\config\botfiles\vbs\err_MAINT1.vbs
exit
:down
Enable script below when server is down
taskkill /f /im TradeBotBackground.exe
taskkill /f /im AutoHotkey.exe
taskkill /f /im TradeBotLauncher.exe
taskkill /f /im TradeBotLogin.exe
taskkill /f /im wscript.exe
start C:\OpticTradeBot\config\botfiles\vbs\err_CON2.vbs
exit