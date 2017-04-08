:: Advanced config for OpticTradeBot
:: DO NOT change these values unless you have a specific reason

:: Which itemid should the bot start its checks from. Leave at 0. For advanced dev/debug use only.
set lc_begin=4990

:: Tries the bot should do when checking for an item in a trade before timing out.
:: 200 (ms) is a good value but increase if the bot does not detect items (will slow down bot).
set ic_timeout=100

:: Tries the bot should do when checking for a trade hold and trade offer check.
:: 250 (ms) is a good value but increase if the bot does not detect offers or holds (will slow down bot).
set tc_timeout=250

:: X1,Y1,X2,Y2 Values for item detection
::  slots
set slot1X1=668
set slot1Y1=204
set slot1X2=831
set slot1Y2=354

set slot=2
set slot2X1=759
set slot2Y1=201
set slot2X2=914
set slot2Y2=343

set slot=3
set slot3X1=855
set slot3Y1=199
set slot3X2=1002
set slot3Y2=339

set slot=4
set slot4X1=936
set slot4Y1=188
set slot4X2=1090
set slot4Y2=346

set slot=5
set slot5X1=668
set slot5Y1=298
set slot5X2=819
set slot5Y2=420

set slot=6
set slot6X1=750
set slot6Y1=274
set slot6X2=893
set slot6Y2=419

set slot=7
set slot7X1=839
set slot7Y1=274
set slot7X2=986
set slot7Y2=413

set slot=8
set slot8X1=924
set slot8Y1=281
set slot8X2=1069
set slot8Y2=419