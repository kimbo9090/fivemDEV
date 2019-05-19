RegisterCommand('tp', function(source, args)

--Command usage
  if (args[1] == nil and args[2] == nil and args[3] == nil) then --Check if all arguments are missing
    TriggerEvent('chat:addMessage', {
        args = { '^1 No coordinates specified!' }
    })
    TriggerEvent('chat:addMessage', {
      args = { '^7 Usage: ^2 /tp ^* x y z ^r ^7 or ^2 /tp ^* location' }
    })
    return
    end
  

  --Teleport by location name
  if (args[2] == nil and args[3] == nil) then
    if (Config.Locations[args[1]] ~= nil) then --check for a valid location
      TriggerEvent('chat:addMessage', {
        args = {'^7 Teleporting to: ^3'.. Config.Locations[args[1]].name}})
        SetPedCoordsKeepVehicle(PlayerPedId(), Config.Locations[args[1]].x, Config.Locations[args[1]].y, Config.Locations[args[1]].z)
        return
      else
        TriggerEvent('chat:addMessage', {
          args = {'^1 Location not found'}})
      return
    end
  end
  


  local x = tonumber(args[1])
  local y = tonumber(args[2])
  local z = tonumber(args[3])

  TriggerEvent('chat:addMessage', {
    args = { '^7 Teleporting to: ^2'..tostring(x)..','..tostring(y)..','..tostring(z) }
  })

  SetPedCoordsKeepVehicle(PlayerPedId(), x, y, z)
  
end)


--Coords command
RegisterCommand('coords', function(source, args)

  local playerCoords = GetEntityCoords(PlayerPedId())
  TriggerEvent('chat:addMessage', {
    args = {'^2'.. tostring(playerCoords) }
  })

end)