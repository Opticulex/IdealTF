set path=%path%; C:\IdealTF\config\botfiles\tools
set mde=null
set pth=null
if exist C:\IdealTF\config\botfiles\tools\ziptool-mode.bat call C:\IdealTF\config\botfiles\tools\ziptool-mode.bat
if exist C:\IdealTF\config\botfiles\tools\ziptool-path.bat call C:\IdealTF\config\botfiles\tools\ziptool-path.bat
if exist C:\IdealTF\config\botfiles\tools\ziptool-name.bat call C:\IdealTF\config\botfiles\tools\ziptool-name.bat
if "%mde%"=="null" exit
if "%pth%"=="null" exit
if "%nme%"=="null" exit
if "%mde%"=="zip" goto zip
if "%mde%"=="unzip" goto unzip
exit
zip:
zip -r %nme% %pth%
exit
unzip:
unzip %pth%
exit