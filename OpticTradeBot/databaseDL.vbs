dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP") 
dim bStrm: Set bStrm = createobject("Adodb.Stream") 
xHttp.Open "GET", "https://batchedengine.neocities.org/files/OTBprices.txt", False 
xHttp.Send 
 
with bStrm 
    .type = 1 '//binary 
    .open 
    .write xHttp.responseBody 
    .savetofile "C:\OpticTradeBot\itemPrices.bat", 2 '//overwrite 
end with 
