CoordMode Pixel 
ImageSearch, FoundX, FoundY, 668, 204, 831, 354, C:\OpticTradeBot\config\itemconfig\img_1366x768\.bmp 
if ErrorLevel = 2 
    exit 
else if ErrorLevel = 1 
    exit 
else 
    FileAppend, 
( 
temp 
 
), C:\OpticTradeBot\config\itemconfig\temp\.bat 
