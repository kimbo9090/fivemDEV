RegisterCommand("info", function(source, args) --This function will register all important info of a player
    MySQL.Async.fetchAll("INSERT INTO playerinfo (steamID,licenseID,IP,NAME) VALUES(@steamID,@licenseID,@IP,@name)",  -- The query itself   
    {["@steamID"] = GetPlayerIdentifiers(source)[1], ["@licenseID"] = GetPlayerIdentifiers(source)[2],["@IP"] = GetPlayerEndpoint(source) ,["@name"] = GetPlayerName(source)},
        function (result)
            local steamID = GetPlayerIdentifiers(source)[1] --SteamID
            local license = GetPlayerIdentifiers(source)[2] --The unique License ID
            local IP =  GetPlayerEndpoint(source) -- IP Address
            local name = GetPlayerName(source) -- In game name
TriggerClientEvent("output", source, "^2\n".. -- We send to the client the output of the data we just collected
'STEAM_ID : '.. steamID .. '\n' ..
'LICENSE_ID : '.. license .. '\n'..
'IP : '.. IP ..'\n' .. 
'NAME : '.. name .. '\n' .. "^0")

    end)
end)