RegisterCommand('tp', function(source, args)

  if (args[1] == nil and args[2] == nil and args[3] == nil) then --Check if all arguments are missing
    TriggerEvent('chat:addMessage', {
        args = { '^1 No coordinates specified!' }
    })
    TriggerEvent('chat:addMessage', {
      args = { '^7 Usage: ^2 /tp ^* x y z' }
    })
    return
    end
  
  local x = tonumber(args[1])
  local y = tonumber(args[2])
  local z = tonumber(args[3])

  TriggerEvent('chat:addMessage', {
    args = { '^7 Teleporting to: ^2'..tostring(x)..','..tostring(y)..','..tostring(z) }
  })

  SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z)
  
end)



RegisterCommand('coords', function(source, args)

  local playerCoords = GetEntityCoords(PlayerPedId())
  TriggerEvent('chat:addMessage', {
    args = {'^2'.. tostring(playerCoords) }
  })

end)