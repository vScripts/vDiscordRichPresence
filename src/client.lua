function UpdateRichPresencePlayerCount(playerCount, maxPlayerCount)
	local pId = GetPlayerServerId(PlayerId())
	local pName = GetPlayerName(PlayerId())

	SetRichPresence(string.format("%d/%d | %s (ID: %s)", playerCount, maxPlayerCount, pName, pId))
end

RegisterNetEvent("vDiscordRichPresence:setPlayerCount")
AddEventHandler("vDiscordRichPresence:setPlayerCount", function(playerCount, maxPlayerCount)
	UpdateRichPresencePlayerCount(playerCount, maxPlayerCount)
end)

Citizen.CreateThread(function()
	TriggerServerEvent("vDiscordRichPresence:getPlayerCount")

	while true do
		SetDiscordAppId(Config.AppId)

		SetDiscordRichPresenceAsset(Config.AssetName)
        SetDiscordRichPresenceAssetText(Config.AssetText)

		for i, button in ipairs(Config.Buttons) do
			if (i > 2) then break end

			local url = button.Url
			if (button.Type == "connect") then
				url = "fivem://connect/" .. GetCurrentServerEndpoint()
			end
			SetDiscordRichPresenceAction(i - 1, button.Text, url)
		end

		Citizen.Wait(60 * 1000)
	end
end)