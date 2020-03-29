if(LPrintTwo.Config.EnableOShop == true) then
  OShop.CreateCategory("Livaco's Printers 2", {
    description = "Printers",
    color = Color(200, 0, 200)
  })

  OShop.CreateItem("Bronze Printer", {
    category = "Livaco's Printers 2",
    itemtype = "entity",
    class = "lprinttwo_bronze",
    description = "A bronze printer.",
    price = 500
  })

  OShop.CreateItem("Silver Printer", {
    category = "Livaco's Printers 2",
    itemtype = "entity",
    class = "lprinttwo_silver",
    description = "A silver printer.",
    price = 800
  })

  OShop.CreateItem("Gold Printer", {
    category = "Livaco's Printers 2",
    itemtype = "entity",
    class = "lprinttwo_gold",
    description = "A gold printer.",
    price = 1200
  })

  OShop.CreateItem("Diamond Printer", {
    category = "Livaco's Printers 2",
    itemtype = "entity",
    class = "lprinttwo_diamond",
    description = "A diamond printer.",
    price = 1600
  })
end