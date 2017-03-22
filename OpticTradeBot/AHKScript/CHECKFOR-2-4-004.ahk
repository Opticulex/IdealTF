CoordMode Pixel
ImageSearch, FoundX, FoundY, 849, 278, 962, 390, C:\OpticTradeBot\Data\004.bmp
if ErrorLevel = 2
    MsgBox Could not conduct the search.
else if ErrorLevel = 1
    exit
else
    FileAppend,
(
set Trade_Checkfor_Items=2-4-004

), C:\OpticTradeBot\2-4-004.bat
