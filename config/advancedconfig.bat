:: =================================================================================
::                          IdealTF Advanced Configuration
:: =================================================================================


:: This config is great for changing advanced settings but please make sure you know what you are doing!


:: =================================================================================
::                                                               TIMEOUTS AND DELAYS


:: Tries the bot should do when checking for an item in a trade before timing out.
:: Default 200. Increase if the bot does not detect items in trade.
set ic_timeout=100

:: Tries the bot should do when checking for a trade offer.
:: Default 250. Increase if the bot does not detect offers.
set tc_timeout=250

:: =================================================================================
::                                                                    ERROR HANDLING


:: Exit when launcher status is set to stopped or launcher is closed down.
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

:: Maximim and minimum prices that bot can lose in a trade. If you are a single craft 
:: hat in your trade it is reccomended to set this to the price you are selling the hat 
:: for (e.g. 133). Leave the minimum at zero.
:: This feature is designed to stop people scamming the bot with overflows of items.
set price_maxbot=9999
set price_minbot=0

:: Maximum and minimum prices the user can place in the trade. It is reccomended you
:: set the maximum value to a high value (e.g 9999999) and a minimum value of either
:: the cheapest item you are selling or 0. (0 reccomended).
set price_maxuser=9999999
set price_minuser=0


:: =================================================================================
::                                                                       IMAGE SETUP

:: Name for the image used for offer detection. Default itf_cfg_incoming.
:: Do not change as there's literally no need to. 
set incomingimg=itf_cfg_incoming

:: Name for the image used for item hold detection. Default itf_cfg_hold.
:: Hold checking is by deault disabled so this doesn't need to be changed.
set holdimg=itf_cfg_hold