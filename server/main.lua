local canPay = false

-- Lifeinvader Advertisement
RegisterServerEvent('esx_ads:globalad')
AddEventHandler('esx_ads:globalad', function(args)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForAdvertisement(source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Lifeinvader', _U('ad_name'), table.concat(args, " "), 'CHAR_LIFEINVADER', 1)    
    end
end)

-- DarkWeb Advertisement
RegisterServerEvent('esx_ads:darkad')
AddEventHandler('esx_ads:darkad', function(args)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForDarkWebAdvertisement(source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Dark Web', _U('ad_name'), table.concat(args, " "), 'CHAR_LESTER_DEATHWISH', 1) 
    end
end)

-- Taxi Advertisement
RegisterServerEvent('esx_ads:taxiad')
AddEventHandler('esx_ads:taxiad', function(args)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Downtown Cab Co', _U('ad_name'), table.concat(args, " "), 'CHAR_TAXI', 1)
    end
end)

-- Cardealer Advertisement
RegisterServerEvent('esx_ads:cardealerad')
AddEventHandler('esx_ads:cardealerad', function(args)
    local _source = source

        PayForJobAdvertisement(_source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Legendary Motors', _U('ad_name'), table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
    end
end)

-- Mechanic Advertisement
RegisterServerEvent('esx_ads:mechanicad')
AddEventHandler('esx_ads:mechanicad', function(args)
    local _source = source

        PayForJobAdvertisement(_source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Los Santos Customs', _U('ad_name'), table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
    end
end)

-- Real Estate Advertisement
RegisterServerEvent('esx_ads:realestatead')
AddEventHandler('esx_ads:realestatead', function(args)
    local _source = source

        PayForJobAdvertisement(_source, amount)
        Wait(Config.Delay)

    if canPay then
        TriggerClientEvent('esx:showAdvancedNotification', -1, 'Real Estate', _U('ad_name'), table.concat(args, " "), 'CHAR_PROPERTY_BAR_AIRPORT', 1)  
    end
end)




function PayForAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerBank = xPlayer.getAccount('money').money
    local PlayerMoney = xPlayer.getMoney()
    local price = Config.AdPrice

    if Config.Usebank and PlayerBank >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    elseif PlayerMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end

function PayForJobAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerBank = xPlayer.getAccount('money').money
    local PlayerMoney = xPlayer.getMoney()
    local price = Config.JobAdPrice

    if Config.Usebank and PlayerBank >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    elseif PlayerMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end

function PayForDarkWebAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerBank = xPlayer.getAccount('money').money
    local PlayerBlackMoney = xPlayer.getAccount('black_money').money
    local price = Config.DarkWebAdPrice

    if Config.UseBlack and PlayerBlackMoney >= price then
        xPlayer.removeAccountMoney('black_money', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid_black', price))
        canPay = true
    elseif PlayerBank >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end