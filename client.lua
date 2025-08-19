-- ESX Export (new)
ESX = exports["es_extended"]:getSharedObject() -- From https://documentation.esx-framework.org/tutorials/tutorials-esx/sharedevent/

-- Discord Rich Presence
local appId = '' -- https://discord.com/developers/applications
local largeImageKey = 'Your Logo' -- https://discord.com/developers/applications/xxx/rich-presence/assets
local largeImageText = 'Your City'
local smallImageKey = 'Your Logo' -- https://discord.com/developers/applications/xxx/rich-presence/assets
local smallImageText = 'Your Text'

Citizen.CreateThread(function()
    SetDiscordAppId(appId)
    SetDiscordRichPresenceAsset(largeImageKey)
    SetDiscordRichPresenceAssetText(largeImageText)
    SetDiscordRichPresenceAssetSmall(smallImageKey)
    SetDiscordRichPresenceAssetSmallText(smallImageText)
    
    local playerName, playerId, details, state
    while true do
        playerName = GetPlayerName(PlayerId())
        playerId = GetPlayerServerId(PlayerId())
        details = "Nick: " .. playerName
        state = "ID: " .. playerId
	Citizen.Wait(60000)
    end
end)

-- Remove Bulletproof Helmets
Citizen.CreateThread(function()
    Citizen.Wait(500) -- Stay on 500 if its Higher it breaks
      SetPedConfigFlag(PlayerPedId(), 438, true)
end)

-- Remove Cover function of GTA5 (Q)
Citizen.CreateThread(function()
  Citizen.Wait(500)
    SetPlayerCanUseCover(PlayerID(), false)
end)

-- Hud Color
Citizen.CreateThread(function()
    ReplaceHudColourWithRgba(116, 255, 135, 0, 255) -- Add your Color its RGBA(RED GREEN BLUE ALPHA, keep 116, and 255)
end)
 
-- Pausemenu 
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~o~Shared by~w~ Nixo0001 ~c~>>~b~ change in client.lua (51)')
  Citizen.Wait(15000)
end)
Citizen.CreateThread(function()
    AddTextEntry('PM_PANE_CFX', '~o~Shared by~w~ Nixo0001 ~c~>>~b~ change in client.lua (55)')
    Citizen.Wait(15000)
end)

-- Infinte Stamina 
Citizen.CreateThread(function()
    local playerPed, playerId, staminaMultiplier
    while true do
        Citizen.Wait(3000)
        playerPed = PlayerPedId()
        playerId = PlayerId()

        if IsPedRunning(playerPed) then
            staminaMultiplier = 1.0
        elseif IsPedSprinting(playerPed) or IsPedSwimming(playerPed) or IsPedSwimmingUnderWater(playerPed) or IsPedClimbing(playerPed) then
            staminaMultiplier = 2.0
        elseif IsPedInAnyVehicle(playerPed) then
            staminaMultiplier = 3.0
        end

        RestorePlayerStamina(playerId, staminaMultiplier)
    end
end)
