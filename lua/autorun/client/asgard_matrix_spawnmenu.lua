local props = {
    [1] = "models/sg-props/asgard_console_full.mdl",
    [2] = "models/sg-props/asgard_crystal.mdl",
    [3] = "models/sg-props/asgard_console_old.mdl",
    [4] = "models/sg-props/asgard_console.mdl",
    [5] = "models/sg-props/asgard_cart.mdl",
    [6] = "models/sg-props/asgard_extra_basic.mdl",
    [7] = "models/sg-props/asgard_extra_left.mdl",
    [8] = "models/sg-props/asgard_extra_right.mdl"
}

hook.Add( "PopulatePropMenu", "[Mattou]Asgard-Matrix_PropMenu", function()
    local contents = {}
    contents = spawnmenu.GetPropTable()

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

    spawnmenu.AddPropCategory( "sg_props", "SG - Props", contents, "" )
end)

