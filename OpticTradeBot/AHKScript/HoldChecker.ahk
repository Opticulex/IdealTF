CoordMode Pixel
ImageSearch, FoundX, FoundY, 0, 0, 1350, 740, C:\OpticTradeBot\Data\TradeHold.bmp
if ErrorLevel
    FileAppend,
(
set Trade_Hold=0

), C:\OpticTradeBot\hold.bat
else
    FileAppend,
(
set Trade_Hold=1

), C:\OpticTradeBot\hold.bat