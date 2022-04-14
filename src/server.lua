local maxPlayerCount = GetConvarInt("sv_maxclients", -1)

function updatePlayerCount(target)
	if not target then
		target = -1
	end
	local playerCount = GetNumPlayerIndices()

	TriggerClientEvent("vDiscordRichPresence:setPlayerCount", target, playerCount, maxPlayerCount)
end

AddEventHandler('playerJoining', function(oldID)
	updatePlayerCount()
end)

AddEventHandler('playerDropped', function(reason)
	updatePlayerCount()
end)

RegisterNetEvent('vDiscordRichPresence:getPlayerCount')
AddEventHandler('vDiscordRichPresence:getPlayerCount', function()
	updatePlayerCount(source)
end)