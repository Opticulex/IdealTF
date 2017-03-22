CoordMode Pixel
ImageSearch, FoundX, FoundY, 0, 0, 1350, 740, C:\OpticTradeBot\Data\Incoming.bmp
if ErrorLevel
    FileAppend,
(
set Trade_Status_Var=0

), C:\OpticTradeBot\Var.bat
else
    FileAppend,
(
set Trade_Status_Var=1

), C:\OpticTradeBot\Var.bat