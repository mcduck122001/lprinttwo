// Root Table
LPrintTwo = {}

// Console Printing.
local function PrintToConsole(message)

  // The reason for these checks is because the Serverside console and Clientside console print colors diffrently, at least in my experience.

  local PrefixColor = Color(200, 0, 255)

  if SERVER then

    PrefixColor = Color(200, 150, 255)

  end

  MsgC(Color(255, 255, 255), "[")
  MsgC(PrefixColor, "Livaco's Printers 2")
  MsgC(Color(255, 255, 255), "] " .. message)
  MsgC(Color(255, 255, 255), "\n")

end

// Sub-Tables
LPrintTwo.Config = LPrintTwo.Config or {}
LPrintTwo.Config.Bronze = LPrintTwo.Config.Bronze or {}
LPrintTwo.Config.Silver = LPrintTwo.Config.Silver or {}
LPrintTwo.Config.Gold = LPrintTwo.Config.Gold or {}
LPrintTwo.Config.Diamond = LPrintTwo.Config.Diamond or {}

LPrintTwo.Lang = LPrintTwo.Lang or {}
LPrintTwo.Lang.Bronze = LPrintTwo.Lang.Bronze or {}
LPrintTwo.Lang.Silver = LPrintTwo.Lang.Silver or {}
LPrintTwo.Lang.Gold = LPrintTwo.Lang.Gold or {}
LPrintTwo.Lang.Diamond = LPrintTwo.Lang.Diamond or {}

include("lprinttwo/config/config.lua")
AddCSLuaFile("lprinttwo/config/config.lua")

include("lprinttwo/config/lang.lua")
AddCSLuaFile("lprinttwo/config/lang.lua")

if SERVER then

  LPrintTwo.Server = LPrintTwo.Server or {} // Creates serverside table.

  PrintToConsole("Initalizing serverside.")

  include("lprinttwo/core/sv_main.lua") PrintToConsole("sv_main.lua")

  PrintToConsole("Loaded serverside.")
  PrintToConsole("Once the first player joins, the addon will print if it's outdated or not.")

else

  LPrintTwo.Client = LPrintTwo.Client or {} // Creates clientside table.

end