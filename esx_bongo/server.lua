--[[DEVELOPED BY JAROSZ#4793!]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--^ESX server

ESX.RegisterUsableItem('bongo', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem('bagofdope').count
        if item >= 1 then
            TriggerClientEvent('bongo:use', _source)
            xPlayer.removeInventoryItem('bagofdope', 1)
        else
        TriggerClientEvent('bongo:error', _source)
        end
end)
--[[DEVELOPED BY JAROSZ#4793!]]
