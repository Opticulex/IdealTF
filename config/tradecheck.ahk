CoordMode Pixel 
ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, C:\IdealTF\config\itemconfig\img_1366x768\itf_cfg_incoming.bmp 
if ErrorLevel = 2 
    exit 
else if ErrorLevel = 1 
    exit 
else 
    FileAppend, temp, C:\IdealTF\config\itemconfig\temp\TRADE.txt 
exit  
