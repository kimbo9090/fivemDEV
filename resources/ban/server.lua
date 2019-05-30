RegisterCommand("info", function(source, args)
    MySQL.Async.fetchAll("INSERT INTO playerinfo (steamID,licenseID,IP,NAME) VALUES(@steamID,@licenseID,@IP,@name)",     
    --[[ 
        (id, name, args)
        These are the columns (in our database) we will be insterting the data into  
    ]]
    {["@steamID"] = GetPlayerIdentifiers(source)[1], ["@licenseID"] = GetPlayerIdentifiers(source)[2],["@IP"] = GetPlayerEndpoint(source) ,["@name"] = GetPlayerName(source)},
        --[[ 
            Here we are defining the '@' variables to in-game native functions
         ]]
        function (result)
TriggerClientEvent("output", source, "^2".. argString.. "^0")

    end)
end)