local props = {
    "models/sg-props/asgard_console_full.mdl",
    "models/sg-props/asgard_crystal.mdl",
    "models/sg-props/asgard_console_old.mdl",
    "models/sg-props/asgard_console.mdl",
    "models/sg-props/asgard_cart.mdl",
    "models/sg-props/asgard_extra_basic.mdl",
    "models/sg-props/asgard_extra_left.mdl",
    "models/sg-props/asgard_extra_right.mdl"
}

hook.Add( "PopulatePropMenu", "[Mattou]Asgard-Matrix_PropMenu", function()
    local contents = {}
    
    table.insert( contents, {
	type = "header",
	text = "Entities"
    })

    table.insert( contents, {
        type = "entity",
        spawnname = "asgard_console",
        nicename = "Asgard Console",
        material = "entities/asgard_console.png"
    })

    table.insert( contents, {
        type = "header",
        text = "Asgard"
    })

    for i = 1,#props do
        table.insert( contents, {
            type = "model",
            model = props[i]
        })
    end      

    spawnmenu.AddPropCategory( "sg_props_asgardmatrix", "SG-Props - Asgard Console", contents, "" )
end)

