RegisterCommand('wanted', function(source, args)

  if (args[1] == nil) then --Check if the wanted level argument is missing
    TriggerEvent('chat:addMessage', {
        args = { '^1 Specify a wanted level from ^7 0 ^1 to ^7 5' }
    })
    TriggerEvent('chat:addMessage', {
      args = { '^7 Usage: ^2 /wanted ^_ level' }
    })
    return
    end
  
  local level = tonumber(args[1])
  SetPlayerWantedLevel(PlayerId(), level, false) 
  SetPlayerWantedLevelNow(PlayerId(), false)
  TriggerEvent('chat:addMessage', {
    args = { '^7 Wanted level set to: ^2'.. tostring(level) }
  })
end)