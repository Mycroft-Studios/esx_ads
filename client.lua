ESX = nil

----- Language Config -----

local payed = "You payed $200 for the ad."
local denied = "You don't have permission for this."

-- Get player job
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

-- Job ads
RegisterCommand('jobad', function(source, args)
	if PlayerData.job.name == 'taxi' then
		TriggerServerEvent('global:taxiad', args)
		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', payed)
	elseif PlayerData.job.name == 'mechanic' then
		TriggerServerEvent('global:mechanicad', args)
		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', payed)
 	elseif PlayerData.job.name == 'cardealer' then
		TriggerServerEvent('global:cardealerad', args)
		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', payed)
	else
		exports['mythic_notify']:DoHudText('error', denied)
	end
end)

-- Global ad
RegisterCommand('ad', function(source, args)
	if PlayerData.job.name == 'unemployed' then
		exports['mythic_notify']:DoHudText('error', denied)
	else
 		TriggerServerEvent('global:globalad', args)
 		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', payed)
	end
end)

-- Darkweb ad
RegisterCommand('darkad', function(source, args)
	if PlayerData.job.name == 'police' then
		exports['mythic_notify']:DoHudText('error', denied)
	else
 		TriggerServerEvent('global:darkwebad', args)
 		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', payed)
	end
end)