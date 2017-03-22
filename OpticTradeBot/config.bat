:: ===========================================================================
:: Keep in C:\OpticTradeBot only. Do not move to a custom location.
::
:: This config file is run and refreshed every time the bot cycles.
:: Only use this config file for variable commands (set commands).
::
:: ===========================================================================
:: SETTING UP THE CONFIG
:: All supported variables are pre-implemented and wrote below. All you have
:: to do is change the value/add your own data. There are several different
:: variable groups. 
::
:: The "Def =" value displays the default value of the variable. (Usually 0)
::
::
:: Variables that you CAN include:
::
:: TRADE ACCOUNT COMMANDS
:: Trade_Bot - Enter the Steam Name of the account using the bot.
:: Trade_Bot_S64 - Enter the SteamId64 of the account using the bot.
:: Trade_Admin - Enter the Steam Name of the Admin/Owner of the bot.
:: Trade_Admin_S64 - Enter the SteamId64 of the Admin/Owner of the bot.
:: Trade_Mod - Enter the Steam Name of the Moderator of the bot.
:: Trade_Mod_S64 - Enter the SteamId64 of the Moderator of the bot.
::
::
:: DEBUG COMMANDS
:: DebugMode - Enable Debug Mode during use. Activated by 1. Deaf = 0.
:: DebugSkipRefresh - Skips webpage refresh. DebugMode must be 1. Def = 0
:: DebugSkipTrade - Skips trade checker. DebugMode must be 1. Def = 0
:: DebugAuthMode - Disables all funct except auth. DebugMode must be 1. Def = 0
:: DebugSkipAuth - Skips mobile authentication. DebugMode must be 1. Def = 0
::
:: VISUAL COMMANDS
:: ColorValue - Set with default 2-bit HEX color. Deafult is 0f.
::
:: ===========================================================================
::                      --- EDIT VARIABLES BELOW HERE ---
:: ===========================================================================

set Trade_Bot=Opticulex [?] BOT
set Trade_Bot_S64=76561198176232947
set Trade_Admin=Opticulex
set Trade_Admin_S64=76561198305950404
set DebugMode=1
set DebugSkipRefresh=0
set DebugSkipTrade=0
set DebugAuthMode=0
set DebugSkipAuth=0

set ColorValue=0f