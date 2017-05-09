Sleep, 5000
; confirm trade contents
Click 792, 464
Sleep, 2000
Send {enter}
Sleep, 300
Run, C:\IdealTF\config\botfiles\ahk\OfferDown.ahk
Sleep, 500
; accept trade button
Click 870, 609
Sleep, 7000
Send {enter}
Sleep, 300
; closes trade window (top right corner X)
Click 1339, 6
Sleep, 300
Run, C:\IdealTF\config\botfiles\ahk\SwitchToOffers.ahk
ExitApp