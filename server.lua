ESX = nil

-- EDIT HOW MUCH THE AD COSTS HERE --
local amount = 200


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Taxi ad
RegisterServerEvent('global:taxiad')
AddEventHandler('global:taxiad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Downtown Cab Co', 'Advertisement', table.concat(args, " "), 'CHAR_TAXI', 1)
	end
end)

-- Mechanic ad
RegisterServerEvent('global:mechanicad')
AddEventHandler('global:mechanicad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos Customs', 'Advertisement', table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
	end
end)

-- Cardealer ad
RegisterServerEvent('global:cardealerad')
AddEventHandler('global:cardealerad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos Customs', 'Advertisement', table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
	end
end)

-- Global ad
RegisterServerEvent('global:globalad')
AddEventHandler('global:globalad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Lifeinvader', 'Advertisement', table.concat(args, " "), 'CHAR_LIFEINVADER', 1)
	end
end)

-- Darkweb ad
RegisterServerEvent('global:darkwebad')
AddEventHandler('global:darkwebad', function(args)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'DARKWEB', 'Advertisement', table.concat(args, " "), 'CHAR_LESTER_DEATHWISH', 1)
	end
end)

-- Remove money
RegisterNetEvent("advert:removemoney")
AddEventHandler("advert:removemoney", function(index)
    local playerMoney = getMoney(source)
    if playerMoney >= amount then
        removeMoney(source, amount)
    else
       	exports['mythic_notify']:DoHudText('error', 'You dont have enough money.')
    end
end)

-- Helper functions
function getMoney(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local getmoney = xPlayer.getMoney()
    return getmoney
end

function removeMoney(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(amount)
end