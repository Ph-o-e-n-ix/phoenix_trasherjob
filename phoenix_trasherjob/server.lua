
if Config.UseNewESX then
	ESX = exports["es_extended"]:getSharedObject()
else
	local ESX = nil
	TriggerEvent('esx:getSharedObject', function(obj) 
		ESX = obj 
	end)
end

RegisterServerEvent("trash:getreward")
AddEventHandler("trash:getreward", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney(Config.Moneytype, Config.Reward)
end)

RegisterServerEvent("trash:getbonus")
AddEventHandler("trash:getbonus", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney(Config.Moneytype, Config.Bonus)
end)

RegisterServerEvent("trash:takebail")
AddEventHandler("trash:takebail", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney(Config.Moneytype, Config.Bail)
end)

RegisterServerEvent("trash:givebailback")
AddEventHandler("trash:givebailback", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney(Config.Moneytype, Config.Bail)
end)



RegisterServerEvent("phoenix:sendwebhook")
AddEventHandler("phoenix:sendwebhook", function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
	local information = {
		{
			["color"] = '16127',
			["author"] = {
				["icon_url"] = 'Webhook',
				["name"] = 'Trasher',
			},
			["title"] = 'Trasher',
			["description"] = '' ..xPlayer.getName(source)..' has done the Job.',

			["footer"] = {
				["text"] = os.date('%d/%m/%Y [%X]'),
			}
		}
	}
	PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Phoenix Bot', embeds = information}), {['Content-Type'] = 'application/json'})

end)
