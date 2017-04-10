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