// Adds the stuff to the F4 menu.
include("lprinttwo/config/config.lua")

if(LPrintTwo.Config.AddDarkRP == true) then
  
  DarkRP.createCategory {
    name = "Livaco's Printers 2",
    categorises = "entities",
    startExpanded = true,
    color = Color(200, 0, 0),
    sortOrder = 25
  }

  DarkRP.createEntity("Bronze Printer", {
    ent = "lprinttwo_bronze",
    model = "models/props_c17/consolebox01a.mdl",
    price = 500,
    max = 3,
    cmd = "buybronzeprinter",
    category = "Livaco's Printers 2"
  })

  DarkRP.createEntity("Silver Printer", {
    ent = "lprinttwo_silver",
    model = "models/props_c17/consolebox01a.mdl",
    price = 800,
    max = 3,
    cmd = "buysilverprinter",
    category = "Livaco's Printers 2"
  })

  DarkRP.createEntity("Gold Printer", {
    ent = "lprinttwo_gold",
    model = "models/props_c17/consolebox01a.mdl",
    price = 1200,
    max = 3,
    cmd = "buygoldprinter",
    category = "Livaco's Printers 2"
  })

  DarkRP.createEntity("Diamond Printer", {
    ent = "lprinttwo_diamond",
    model = "models/props_c17/consolebox01a.mdl",
    price = 1600,
    max = 3,
    cmd = "buydiamondprinter",
    category = "Livaco's Printers 2"
  })

end