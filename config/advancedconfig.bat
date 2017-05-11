:: =================================================================================
::                          IdealTF Advanced Configuration
:: =================================================================================


:: This config is great for changing advanced settings but please make sure you know what you are doing!


:: =================================================================================
::                                                               TIMEOUTS AND DELAYS

:: Time (in seconds) the bot should wait when the incoming offer page refreshes.
:: Default 5. Increase if page takes longer to load.
set refresh_time=5

:: Time (in seconds) the bot should wait when the trade offer page loads.
:: Default 10. Increase if page takes longer to load.
set load_time=10

:: Tries the bot should do when checking for an item in a trade before timing out.
:: Default 200. Increase if the bot does not detect items in trade.
set ic_timeout=100

:: Tries the bot should do when checking for a trade offer.
:: Default 250. Increase if the bot does not detect offers.
set tc_timeout=250

:: Time (in seconds) the bot should wait when performing light operations.
:: Default 2, 1, 3, 5, 8 and 11. Usually no need to change for any reason.
set execution_wait=2
set execution_wait_short=1
set execution_wait_long=3
set execution_wait_medium=8
set execution_wait_verylong=11


:: =================================================================================
::                                                                    ERROR HANDLING

:: Time (in seconds) for errors to return. Default 3. Do not change.
set error_wait=3

:: Exit when launchr status is set to stopped or launcher is closed down.
:: Default false but change to true if you want to.
set exit_on_stop=false

:: Exit on fatal error automatically. Default is false but set to true if you want.
set exit_on_fatal=false

:: Supress fatal errors automatically to stop the program from pausing or exiting.
:: Default false. Enable if you encounter many minor fatal errors.
set continue_on_fatal=false


:: =================================================================================
::                                                     TRADING, ITEMS AND ITEMCONFIG

:: When true allows AcceptAll and DeclineAll to be activated. Default true.
set allow_all=true

:: Price margins (high and low) for a margin of error for prices. Default 9.
:: Do not set this above 11 in normal conditions as it may trigger losses.
set price_margin_hi=9
set price_margin_lo=9


:: =================================================================================
::                                                                       IMAGE SETUP

:: Name for the image used for offer detection. Default itf_cfg_incoming.
:: Do not change as there's literally no need to. 
set incomingimg=itf_cfg_incoming

:: Name for the image used for item hold detection. Default itf_cfg_hold.
:: Hold checking is by deault disabled so this doesn't need to be changed.
set holdimg=itf_cfg_hold