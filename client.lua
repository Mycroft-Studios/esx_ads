ESX = nil

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
 		exports['mythic_notify']:DoHudText('inform', 'Maksid $200 reklaami eest.')
	elseif PlayerData.job.name == 'mechanic' then
		TriggerServerEvent('global:mechanicad', args)
		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', 'Maksid $200 reklaami eest.')
	else
		exports['mythic_notify']:DoHudText('error', 'Õigused puuduvad.')
	end
end)

-- Global ad
RegisterCommand('ad', function(source, args)
	if PlayerData.job.name == 'unemployed' then
		exports['mythic_notify']:DoHudText('error', 'Access denied.')
	else
 		TriggerServerEvent('global:globalad', args)
 		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', 'Maksid $200 reklaami eest.')
	end
end)

-- Darkweb ad
RegisterCommand('darkad', function(source, args)
	if PlayerData.job.name == 'police' then
		exports['mythic_notify']:DoHudText('error', 'Access denied.')
	else
 		TriggerServerEvent('global:darkwebad', args)
 		TriggerServerEvent('advert:removemoney')
 		exports['mythic_notify']:DoHudText('inform', 'Maksid $200 reklaami eest.')
	end
end)