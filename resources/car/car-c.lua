-- define a local variable called `spawnPos` with a coordinate somewhere on the map
-- Lua in FiveM (through CfxLua) supports first-class vectors, which in this case can be accessed using .x, .y and .z.
local spawnPos = vector3(-595.342, 2086.008, 131.412)

-- add an event handler for the (local) event called 'onClientGameTypeStart'.
-- it takes no arguments in this case (in Lua you can omit arguments), since our resource is a game type and you can only run one at once,
-- that means this will basically run when we start ourselves on the client. nice!



--[[]
AddEventHandler('onClientGameTypeStart', function()
    -- set an automatic spawn callback for the spawn manager.
    -- normally, this works using hardcoded spawn points, but since this is a scripting tutorial, we'll do it this way.
    --
    -- the spawn manager will call this when the player is dead, or when forceRespawn is called.
    exports.spawnmanager:setAutoSpawnCallback(function()
        -- spawnmanager has said we should spawn, let's spawn!
        exports.spawnmanager:spawnPlayer({
            -- this argument is basically a table containing the spawn location...
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            -- ... and the model to spawn as.
            model = 'a_m_m_skater_01'
        }, function()
            -- a callback to be called once the player is spawned in and the game is visible
            -- in this case, we just send a message to the local chat box.
            TriggerEvent('chat:addMessage', {
                args = { 'Anormal de mierda' }
            })
        end)
    end)

    -- enable auto-spawn
    exports.spawnmanager:setAutoSpawn(true)

    -- and force respawn when the game type starts
    exports.spawnmanager:forceRespawn()
end)
 --]]


 
RegisterCommand('car', function(source, args)
    -- account for the argument not being passed
    local vehicleName = args[1] 
    local id  = PlayerPedId()

    if (args[1] == nil) then --Check if the wanted level argument is missing
        TriggerEvent('chat:addMessage', {
            args = { '^1 Specify a name.' }
        })
        return
        end

    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { '^3That car doesnt exist.' }
        })

        return
    end

    -- load the model
    RequestModel(vehicleName)

    -- wait for the model to load
    while not HasModelLoaded(vehicleName) do
        Wait(500) -- often you'll also see Citizen.Wait
    end

    -- get the player's position
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

    -- create the vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- set the player ped into the vehicle's driver seat
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- give the vehicle back to the game (this'll make the game decide when to despawn the vehicle)
    SetEntityAsNoLongerNeeded(vehicle)

    -- release the model
    SetModelAsNoLongerNeeded(vehicleName)
    local coords = NetworkGetPlayerCoords(id)
    -- tell the player
    TriggerEvent('chat:addMessage', {
		args = { '^3Spawning  ^8' .. vehicleName}
	})
end, false)
-- Retrieves the Vehicle ID ped is in
RegisterCommand('currentCar',function()
    local ped = GetPlayerPed()
    local veh = GetVehiclePedIsIn(ped, false)
    local model = GetEntityModel(veh)
    local displaytext = GetDisplayNameFromVehicleModel(model)
    TriggerEvent('chat:addMessage', {
		args = { 'Your car is ' .. veh}
    })
end,false)

-- Reparis the vehicle PED is in
RegisterCommand('repair',function()
    local ped = GetPlayerPed()
    local veh = GetVehiclePedIsIn(ped, false)
    SetVehicleFixed(veh)
    TriggerEvent('chat:addMessage', {
		args = { '^3Your car is repaired now '}
    })
end,false)

-- Gains power speed
RegisterCommand('speed',function(source,args)
    local ped = GetPlayerPed() -- Take the player's PED
    local veh = GetVehiclePedIsIn(ped, false) -- Take the player's current vehicle
    local speed = tonumber(args[1])
    if (veh == 0) then -- If veh == 0 means that you are not in any vehicle
        TriggerEvent('chat:addMessage', {
            args = { '^3You are not in a car.'}
        })
    else
        if (args[1] == nil) then
            TriggerEvent('chat:addMessage', { -- Checks if /speed has an input
                args = { '^3It has to be a float Value. ^8Example :^2/speed 99.0'}
            })
        else
        

            if(string.match(tostring(args[1]),"%.")) then -- Checks if /speed has a float value
                TriggerEvent('chat:addMessage', {
                    args = { '^3Giving to your current car' ..' '..speed .. ' of power speed...'}
                })
                SetVehicleEnginePowerMultiplier(veh,speed)
            else
                TriggerEvent('chat:addMessage', {
                    args = { '^3It has to be a float Value. ^8Example :^2 /speed 99.0'}
                })
            end
        end
    end

    
end,false)