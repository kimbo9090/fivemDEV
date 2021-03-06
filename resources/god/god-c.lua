--[[
@ Author Tomás Miralles Montoro
@ Version 0.1
@ Description Este módulo te permite ponerte en estado de invulnerable.
]]

-- Función para hacer a un jugador invulnerable
RegisterCommand('god', function()
    local id  = PlayerId() -- Guardamos la ID del jugador
    TriggerEvent('chat:addMessage', {
		args = { '^8/ungod ^3to revert the effect.'} 
    })
    TriggerEvent('chat:addMessage', {
		args = { 'God mode ^2 activated' } -- Informamos de que el modo dios ha sido activado
    })
    SetPlayerInvincible(id,true) -- Ponemos el estado de invencible en True
end, false)

-- Función para hacer a un jugador vulnerable
RegisterCommand('ungod', function()
    local id  = PlayerId() -- Guardamos la ID del jugador
    TriggerEvent('chat:addMessage', {
		args = { 'God mode ^2 deactivated' } -- Informamos de que el modo dios ha sido desactivado
    })
    SetPlayerInvincible(id,false) --Ponemos el estado de invencible en False
end, false)