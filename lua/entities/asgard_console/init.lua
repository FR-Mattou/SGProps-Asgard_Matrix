AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
include('shared.lua')

function ENT:Initialize()
    self:SetModel("models/sg-props/asgard_console.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	self.active = true
	self.exitcur=0

    self.phys = self:GetPhysicsObject()
	if (self.phys:IsValid()) then
		self.phys:Wake()
	end

    if WireLib then
		self.wirepos=Vector(0,0,0)
		self.wireang=Angle(0,0,0)
		Wire_CreateInputs(self, { "Active" })
		Wire_CreateOutputs(self, { "Activate", "Opened" })
		Wire_TriggerOutput(self, "Activate", 1)
	end

    self.cart = ents.Create("asgard_cart")
    self.cart:SetPos(self:LocalToWorld(Vector(0,0,0)))
    self.cart:SetAngles(self:GetAngles()+Angle(0,0,0))
    self.cart:Spawn()
	self.cart:Activate()
	//self.cart:SetCollisionGroup(COLLISION_GROUP_WORLD)
    self.cart:SetParent(self)
	//constraint.Weld(self,self.cart,0,0)

	self.cart.console = self

    self.phys = self:GetPhysicsObject()
	if (self.phys:IsValid()) then
		self.phys:Wake()
	end

end

function ENT:Use(ply, caller)
	if CurTime()>self.exitcur then
		self.exitcur=CurTime()+1
		if self.active then
			self:SetSkin(1)
			self.active = false
			Wire_TriggerOutput(self, "Activate", 0)
		else
			self:SetSkin(0)
			self.active = true
			Wire_TriggerOutput(self, "Activate", 1)
		end
	end
end

if WireLib then
	function ENT:TriggerInput(k,v)
		if k=="Active" then
			if v==0 and self.active then
				self:SetSkin(1)
				self.active = false
				Wire_TriggerOutput(self, "Activate", 0)
			else
				self:SetSkin(0)
				self.active = true
				Wire_TriggerOutput(self, "Activate", 1)
			end
		end
	end
end