--[[
@ Author Tomás Miralles Montoro
@ Version 0.1
@ Description Este módulo te da todas las armas
]]


RegisterCommand('weapon', function()
    local id  = PlayerPedId()
    TriggerEvent('chat:addMessage', {
		args = { 'Te voy a dar un par de armas bro' } 
    })
    GiveWeaponToPed (
      id,"WEAPON_MINIGUN",99999,false,true
    )
end, false)

