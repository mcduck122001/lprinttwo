AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("lprinttwo/config/config.lua")
include("lprinttwo/config/lang.lua")

function ENT:Initialize()

	-- Boring default shit.

	self:SetModel("models/props_c17/consolebox01a.mdl")
	self:SetColor(Color(200, 200, 200, 255))

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then

		phys:Wake()

	end

	// These checks are in place for if the player spawns in the entity through the Q menu, or if the player owning the entity disconnects.
	// Prevents errors.
	if(!IsValid(self:Getowning_ent())) then

		self:SetOwnerName(LPrintTwo.Lang.DisconectName)

	else

		self:SetOwnerName(self:Getowning_ent():Nick())

	end

	// Preset the Network Variables.
	self:SetMoney(0)
	self:SetHP(100)

	self.Time = CurTime() + LPrintTwo.Config.Silver.TypePerCycle // Immediently start a cycle.

	self:SetUseType(SIMPLE_USE)

end

function ENT:Think()

	self.Time = self.Time - 1

	// If a cycle has been ran.
	if(self.Time <= CurTime()) then

		// Add money + heat
		self:SetMoney(self:GetMoney() + LPrintTwo.Config.Silver.MoneyPerCycle)

		self.Time = CurTime() + LPrintTwo.Config.Silver.TypePerCycle // Reset the time.

	end

end

function ENT:Use(caller, ply)

	ply:addMoney(self:GetMoney())
	DarkRP.notify(ply, 1, 5, string.format(LPrintTwo.Lang.MoneyMessage, string.Comma(self:GetMoney())))
	self:SetMoney(0)

end

// Take Damage function
function ENT:OnTakeDamage(x)

	self:SetHP(self:GetHP() - x:GetDamage())

	if self:GetHP() <= 0 then

		if(LPrintTwo.Config.PrinterExplode) then
			self:Explode()
		end
		self:Remove()

	end

end

// Happy little explosion :)
function ENT:Explode()

	local explode = ents.Create("env_explosion")
	explode:SetPos(self:GetPos())
	explode:Spawn()
	explode:SetKeyValue("iMagnitude", "1")
	explode:Fire("Explode", 0, 0)
	explode:EmitSound("weapon_AWP.Single", 400, 400)

end