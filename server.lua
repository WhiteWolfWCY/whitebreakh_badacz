ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_badacz:zbierzwode')
AddEventHandler('esx_badacz:zbierzwode', function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('probka_woda').count == 40 then
                TriggerClientEvent('esx_badacz:zaduzo', source)
                return
            else
                TriggerClientEvent('esx_badacz:zbieranie', source)
                TriggerClientEvent('esx_badacz:timer', source)
                Citizen.Wait(14000)
                xPlayer.addInventoryItem('probka_woda', 10)
            end
        end
end)

RegisterServerEvent('esx_badacz:zbierzdrewno')
AddEventHandler('esx_badacz:zbierzdrewno', function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('probka_drewno').count == 40 then
                TriggerClientEvent('esx_badacz:zaduzo', source)
                return
            else
                TriggerClientEvent('esx_badacz:zbieranie', source)
                TriggerClientEvent('esx_badacz:timer', source)
                Citizen.Wait(14000)
                xPlayer.addInventoryItem('probka_drewno', 10)
            end
        end
end)

RegisterServerEvent('esx_badacz:analiza')
AddEventHandler('esx_badacz:analiza', function(item, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('analiza_pendrive').count == 1 then
                TriggerClientEvent('esx_badacz:maanalize', source)
                return
            else
                TriggerClientEvent
        end
end)

-- Written by WhiteWolf and BreakH in 2019 -- 