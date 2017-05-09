CoordMode Pixel
ImageSearch, FoundX, FoundY, 0, 0, 1024, 768, C:\IdealTF\Data\Incoming.bmp
if ErrorLevel
    FileAppend,
(
set Trade_Status_Var=0

), C:\IdealTF\Var.bat
else
    FileAppend,
(
set Trade_Status_Var=1

), C:\IdealTF\Var.bat