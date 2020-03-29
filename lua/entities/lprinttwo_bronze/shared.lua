include("lprinttwo/config/lang.lua")

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = LPrintTwo.Lang.Bronze.Name
ENT.Category = "Livaco's Printers 2"
ENT.Spawnable = true
ENT.AdminOnly = true

function ENT:SetupDataTables()

  self:NetworkVar("Entity", 0, "owning_ent") // DarkRP ownining_ent Var
  self:NetworkVar("String", 1, "OwnerName") // Owner Name var, for 3D2D

  self:NetworkVar("Int", 2, "Money") // Money Stored
  self:NetworkVar("Int", 4, "HP") // Health

end
