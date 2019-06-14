RegisterCommand('roll', function(source, args, rawCommand)
    -- Interpret the number of sides
    local die = 6
    if args[1] ~= nil and tonumber(args[1]) then
        die = tonumber(args[1])
    end

    -- Interpret the number of rolls
    rolls = 1
    if args[2] ~= nil and tonumber(args[2]) then
        rolls = tonumber(args[2])
    end

    -- Roll and add up rolls
    local number = 0
    for i = rolls,1,-1
    do
        number = number + math.random(1,die)
    end

    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedTasks(GetPlayerPed(-1))
    TriggerServerEvent('3dme:shareDisplay', 'Rolled a d' .. die .. ' ' .. rolls .. ' time(s): ' .. number)
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

--Written by ZacFierce and MrFunBeard
--Any alteration and addition can be made and posted as long as credits are given :)