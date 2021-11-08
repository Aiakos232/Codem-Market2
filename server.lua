

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('itemgo')
AddEventHandler('itemgo', function(money,itemcode,itemstring)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getMoney() <= money then
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You don t have enough money')
	else 
		xPlayer.addInventoryItem(itemcode , 1)
		xPlayer.removeMoney(money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'You got '..itemstring)
	end
end)
