AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
include('shared.lua')

local MoveX = 0
local LimOffset = 12
local Speed = 0.05

function ENT:Initialize()
    self:SetModel("models/sg-props/asgard_cart.mdl")
    self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetRenderMode( RENDERMODE_NORMAL )
	
	self.phys = self:GetPhysicsObject()
	if (self.phys:IsValid()) then
		self.phys:EnableMotion(false)
	end

    self.opened = false
	self.exitcur=0

end

function ENT:Use(ply, caller)
	if CurTime()>self.exitcur then
		self.exitcur=CurTime()+1

		if self.opened then
			timer.Create("[Asgard Console]Moving",Speed,LimOffset,function()
                MoveX = MoveX + 1
                self:SetPos(Vector(0,MoveX,0))
            end)

			self.opened = false
			Wire_TriggerOutput(self.console, "Opened", 0)
		else
            timer.Create("[Asgard Console]Moving",Speed,LimOffset,function()
                MoveX = MoveX - 1
                self:SetPos(Vector(0,MoveX,0))
            end)

			self.opened = true
			Wire_TriggerOutput(self.console, "Opened", 1)
		end
	end
end
