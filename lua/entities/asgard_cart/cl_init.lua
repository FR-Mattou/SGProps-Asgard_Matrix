include('shared.lua')

function ENT:Draw()
    
    self:DrawModel()

    if WireLib then
        Wire_Render(self)
    end

end