ESX = nil

-- Get player job
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

-- Refresh the job if it changes
local PlayerData = {}
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)
RegisterNetEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)
    xPlayer.setjob(job,grade)
end)

-- Lifeinvader Advertisement
RegisterCommand('ad', function(source, args)
 	TriggerServerEvent('esx_ads:globalad', args)
end)

-- Dark Web Advertisement
RegisterCommand('darkad', function(source, args)
	if Config.DenyPolice and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
		ESX.ShowNotification(_U('no_password'))
	else	
		TriggerServerEvent('esx_ads:darkad', args)
	end
end)

-- Job Advertisements
RegisterCommand('jobad', function(source, args)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
		TriggerServerEvent('esx_ads:taxiad', args)
	elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
		TriggerServerEvent('esx_ads:mechanicad', args)
 	elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'cardealer' then
		TriggerServerEvent('esx_ads:cardealerad', args)
 	elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'realestateagent' then
		TriggerServerEvent('esx_ads:estatead', args)
 	else
		ESX.ShowNotification(_U('no_job'))
	end
end)