ESX = nil

----- Language Config -----

local paid = "You paid ~r~$200~w~ for the ad."
local denied = "Access denied."

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
		ESX.ShowNotification(paid)
	elseif PlayerData.job.name == 'mechanic' then
		TriggerServerEvent('global:mechanicad', args)
		TriggerServerEvent('advert:removemoney')
		ESX.ShowNotification(paid)
 	elseif PlayerData.job.name == 'cardealer' then
		TriggerServerEvent('global:cardealerad', args)
		TriggerServerEvent('advert:removemoney')
		ESX.ShowNotification(paid)
	else
		ESX.ShowNotification(denied)
	end
end)

-- Global ad
RegisterCommand('ad', function(source, args)
	if PlayerData.job.name == 'unemployed' then
		ESX.ShowNotification(denied)
	else
 		TriggerServerEvent('global:globalad', args)
 		TriggerServerEvent('advert:removemoney')
		ESX.ShowNotification(paid)
	end
end)

-- Darkweb ad
RegisterCommand('darkad', function(source, args)
	if PlayerData.job.name == 'police' then
		ESX.ShowNotification(denied)
	else
 		TriggerServerEvent('global:darkwebad', args)
 		TriggerServerEvent('advert:removemoney')
		ESX.ShowNotification(paid)
	end
end)