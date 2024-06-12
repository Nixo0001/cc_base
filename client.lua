-- ESX Export (new)
ESX = exports["es_extended"]:getSharedObject() -- From https://documentation.esx-framework.org/tutorials/tutorials-esx/sharedevent/

-- Discord Rich Presence (0.0ms)
local appId = '' -- https://discord.com/developers/applications
local largeImageKey = 'Your Logo'
local largeImageText = 'Your City'
local smallImageKey = 'Your Logo'
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
        SetRichPresence(details .. " | " .. state)
        Citizen.Wait(60000)
    end
end)

-- Hud Color
ReplaceHudColourWithRgba(116, 0, 90, 255, 0.1) -- Add your Color its RGBA (keep 116, and 0.1)

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

-- Pausemenu 
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~o~Your~s~ ~g~City~s~ ~p~|~s~ ~r~We~s~ ~b~are~s~ ~y~Cool~s~')
end)
Citizen.CreateThread(function()
    AddTextEntry('PM_PANE_CFX', 'Add Your Text in ~r~client.lua~s~')
end)

-- No Weaponpunsh
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Stay on 0 or it breaks
        local ped = GetPlayerPed( -1 )
        local weapon = GetSelectedPedWeapon(ped)
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Infinite Stamina 
Citizen.CreateThread(function()
    local playerPed, playerId, staminaMultiplier
    while true do
        Citizen.Wait(500) -- max. 500 can get Lower but will cost Performance!
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
