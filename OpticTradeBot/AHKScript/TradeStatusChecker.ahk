CoordMode Pixel
PixelSearch, Px, Py, 957, 449, 1026, 429, 0xffffff, 9, Fast RGB
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