-- Lifeinvader Advertisement
RegisterCommand('ad', function(source, args)
 	TriggerServerEvent('esx_ads:globalad', args)
end)

-- Dark Web Advertisement
RegisterCommand('darkad', function(source, args)
	if Config.DenyPolice and ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == 'police' then
		ESX.ShowNotification(_U('no_password'))
	else	
		TriggerServerEvent('esx_ads:darkad', args)
	end
end)

-- Job Advertisements
RegisterCommand('jobad', function(source, args)
	if ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == 'taxi' then
		TriggerServerEvent('esx_ads:taxiad', args)
	elseif ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == 'mechanic' then
		TriggerServerEvent('esx_ads:mechanicad', args)
 	elseif ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == 'cardealer' then
		TriggerServerEvent('esx_ads:cardealerad', args)
 	elseif ESX.GetPlayerData().job and ESX.GetPlayerData().job.name == 'realestateagent' then
		TriggerServerEvent('esx_ads:estatead', args)
 	else
		ESX.ShowNotification(_U('no_job'))
	end
end)