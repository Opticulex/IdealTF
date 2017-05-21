:: ===============================================
::           IdealTF Autoupdate file
:: ===============================================
::
:: Server Public: 94.13.103.47
:: Public: 192.168.56.1 Local: 192.168.0.102
:: Date: 18/05/2017; Time: 21:46:13
:: Mouse pos: -165, 407; Screen: 1366, 768
:: Admin: 0; Username: AUTHORFILMS/AUTHORFILMS
:: Live: True; Plugged in: True; Battery: 100%
::
:: ===============================================
::                  Patch data
:: ===============================================
::
:: Fix broken or nonexistant temp directories
if not exist C:\IdealTF\config\itemconfig\temp\ md C:\IdealTF\config\itemconfig\temp\
if not exist C:\IdealTF\config\botfiles\other\temp\ md C:\IdealTF\config\botfiles\other\temp\
::
:: Remove old formatted itemconfigs
if exist C:\IdealTF\config\itemconfig\5000.bat del C:\IdealTF\config\itemconfig\5000.bat
if exist C:\IdealTF\config\itemconfig\5001.bat del C:\IdealTF\config\itemconfig\5001.bat
if exist C:\IdealTF\config\itemconfig\5002.bat del C:\IdealTF\config\itemconfig\5002.bat
if exist C:\IdealTF\config\itemconfig\5021.bat del C:\IdealTF\config\itemconfig\5021.bat
::
:: ===============================================
del /Q C:\IdealTF\config\serverip.txt
(echo | set /p=^94.13.103.47)>>C:\IdealTF\config\serverip.txt
set down=0
set maintenance=0
if "%maintenance%"=="1" goto maintenance
if "%down%"=="1" goto down
if exist C:\IdealTF\config\prgaupd.txt del C:\IdealTF\config\prgaupd.txt
echo. > "C:\IdealTF\config\prgaupd.txt"
if exist C:\IdealTF\config\itemconfig\tf_currency_refined.bat del C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
if exist C:\IdealTF\config\itemconfig\tf_currency_refined.bat del C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
if exist C:\IdealTF\config\itemconfig\tf_currency_refined.bat del C:\IdealTF\config\itemconfig\tf_currency_refined.bat
echo :: Itemconfig for tf_currency_scrap > C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
echo. >> C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set itemid=tf_currency_scrap)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set val=11)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set img=tf_currency_scrap.bmp)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set bot=true)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set user=true)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
(echo | set /p=set enabled=true)>>C:\IdealTF\config\itemconfig\tf_currency_scrap.bat
echo :: Itemconfig for tf_currency_reclaimed > C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
echo. >> C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set itemid=tf_currency_reclaimed)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set val=33)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set img=tf_currency_reclaimed.bmp)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set bot=true)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set user=true)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
(echo | set /p=set enabled=true)>>C:\IdealTF\config\itemconfig\tf_currency_reclaimed.bat
echo :: Itemconfig for tf_currency_refined > C:\IdealTF\config\itemconfig\tf_currency_refined.bat
echo. >> C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set itemid=tf_currency_refined)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set val=100)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set img=tf_currency_refined.bmp)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set bot=true)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set user=true)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
(echo | set /p=set enabled=true)>>C:\IdealTF\config\itemconfig\tf_currency_refined.bat
exit
:maintenance
start C:\IdealTF\config\botfiles\vbs\err_MAINT1.vbs
exit
:down
start C:\IdealTF\config\botfiles\vbs\err_CON2.vbs
exit