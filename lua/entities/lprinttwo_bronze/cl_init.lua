include("shared.lua")
include("lprinttwo/config/config.lua")
include("lprinttwo/config/lang.lua")

// Fonts
surface.CreateFont("lprinttwo_bronze1", {
	font = LPrintTwo.Config.Font,
	size = 40
})

surface.CreateFont("lprinttwo_bronze2", {
	font = LPrintTwo.Config.Font,
	size = 17
})

surface.CreateFont("lprinttwo_bronze3", {
	font = LPrintTwo.Config.Font,
	size = 30
})

function ENT:Draw()

	self:DrawModel()

	// Setup 3D2D
	local ang = self:GetAngles()
	local lpos = Vector(-16.25, -15, 10.6)
	local pos = self:LocalToWorld(lpos)

	ang:RotateAroundAxis(self:GetAngles():Up(), 90)

	cam.Start3D2D(pos, ang, 0.1)

	// Base box
	draw.RoundedBox(0, 0, 0, 305, 305, Color(0, 0, 0, 220))

	// Titles
	draw.SimpleText(LPrintTwo.Lang.Bronze.Name, "lprinttwo_bronze1", 305 / 2, 5, Color(255, 255, 255, 255), 1, 0)
	draw.SimpleText(string.format(LPrintTwo.Lang.OwnedBy, self:GetOwnerName()), "lprinttwo_bronze2", 305 / 2, 50, Color(255, 255, 255, 255), 1, 0)

	// Money + Heat Text
	draw.SimpleText(string.format(LPrintTwo.Lang.MoneyStored, string.Comma(self:GetMoney())), "lprinttwo_bronze3", 305 / 2, 130, Color(255, 255, 255, 255), 1, 0)

	// Health Bar
	draw.RoundedBox(5, 20, 200, 265, 50, Color(0, 0, 0, 200)) // Background

	local HPColor = Color(0, 255, 0, 200) // Change the bar to Red if it's under 25HP
	if(self:GetHP() < 25) then
		HPColor = Color(200, 0, 0, 200)
	end

	draw.RoundedBox(5, 20, 200, self:GetHP() * 2.65, 50, HPColor) // Box
	draw.SimpleText(string.format(LPrintTwo.Lang.HP, self:GetHP() .. "%"), "lprinttwo_bronze1", 305 / 2, 205, Color(255, 255, 255, 255), 1, 0)

	cam.End3D2D()

end