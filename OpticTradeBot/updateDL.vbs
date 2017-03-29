dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP") 
dim bStrm: Set bStrm = createobject("Adodb.Stream")
On Error Resume Next
xHttp.Open "GET", "https://batchedengine.neocities.org/files/OTBautoupdate.txt", False 
xHttp.Send 
 
with bStrm 
    .type = 1 '//binary 
    .open 
    .write xHttp.responseBody 
    .savetofile "C:\OpticTradeBot\aupd.bat", 2 '//overwrite 
end with