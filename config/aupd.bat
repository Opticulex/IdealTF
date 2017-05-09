del /Q C:\IdealTF\config\serverip.txt
(echo | set /p=^90.202.135.141)>>C:\IdealTF\config\serverip.txt
set down=0
set maintenance=0
if "%maintenance%"=="1" goto maintenance
if "%down%"=="1" goto down
:: Autoupdate verification
if exist C:\IdealTF\config\prgaupd.txt del C:\IdealTF\config\prgaupd.txt
echo. > "C:\IdealTF\config\prgaupd.txt"
:: Item database setter
if exist C:\IdealTF\config\itemconfig\5002.bat del C:\IdealTF\config\itemconfig\5000.bat
if exist C:\IdealTF\config\itemconfig\5002.bat del C:\IdealTF\config\itemconfig\5001.bat
if exist C:\IdealTF\config\itemconfig\5002.bat del C:\IdealTF\config\itemconfig\5002.bat
echo :: Config file for Item ID "5000" > C:\IdealTF\config\itemconfig\5000.bat
echo. >> C:\IdealTF\config\itemconfig\5000.bat
echo set val=11 >> C:\IdealTF\config\itemconfig\5000.bat
echo set img=5000.bmp >> C:\IdealTF\config\itemconfig\5000.bat
echo :: Config file for Item ID "5001" > C:\IdealTF\config\itemconfig\5001.bat
echo. >> C:\IdealTF\config\itemconfig\5001.bat
echo set val=33 >> C:\IdealTF\config\itemconfig\5001.bat
echo set img=5001.bmp >> C:\IdealTF\config\itemconfig\5001.bat
echo :: Config file for Item ID "5002" > C:\IdealTF\config\itemconfig\5002.bat
echo. >> C:\IdealTF\config\itemconfig\5002.bat
echo set val=100 >> C:\IdealTF\config\itemconfig\5002.bat
echo set img=5002.bmp >> C:\IdealTF\config\itemconfig\5002.bat
echo :: Config file for Item ID "5021" > C:\IdealTF\config\itemconfig\5021.bat
echo. >> C:\IdealTF\config\itemconfig\5021.bat
echo set val=2655 >> C:\IdealTF\config\itemconfig\5021.bat
echo set img=5021.bmp >> C:\IdealTF\config\itemconfig\5021.bat
exit
:maintenance
start C:\IdealTF\config\botfiles\vbs\err_MAINT1.vbs
exit
:down
start C:\IdealTF\config\botfiles\vbs\err_CON2.vbs
exit