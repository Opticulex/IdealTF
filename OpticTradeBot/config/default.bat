::Default config for OpticTradeBot


:: Set config defaults
if not exist C:\OpticTradeBot\config\DebugMode.txt echo. > C:\OpticTradeBot\config\DebugMode.txt
if not exist C:\OpticTradeBot\config\AdditionalSettings1.txt echo. > C:\OpticTradeBot\config\AdditionalSettings1.txt
if not exist C:\OpticTradeBot\config\AdditionalSettings2.txt echo. > C:\OpticTradeBot\config\AdditionalSettings2.txt
del C:\OpticTradeBot\config\ScreenSize.txt
echo 1366x768 >> C:\OpticTradeBot\config\ScreenSize.txt
exit