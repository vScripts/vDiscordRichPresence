Config = {}

-- https://discord.com/developers/applications
Config.AppId = 0

-- The asset name from (Rich Presence -> Art Assets) of the application
Config.AssetName = "logo"
-- The text it should how when hovering the asset
Config.AssetText = "Server name"

-- The buttons on the rich presence
Config.Buttons = {
	{
		Type = "connect",
		Text = "Play"
	},
	{
		Type = "url",
		Text = "Discord",
		Url = "https://discord.gg/"
	}
}