if Config.FrameWork.old then
    ESX = nil
    TriggerEvent(Config.FrameWork.sharedObject, function(obj) ESX = obj end)
else
    ESX = exports["es_extended"]:getSharedObject()
end

function banPlayer(source, reason, weapon)
    xPlayer.kick(reason)
    -- you can implement your own ban logic
end

RegisterServerEvent("Zahya:ESX:CheckValidWeapons")
AddEventHandler("Zahya:ESX:CheckValidWeapons", function(newWeapons)
    local playerId = source  
    local xPlayer = ESX.GetPlayerFromId(playerId)  

    if xPlayer then
        for weaponName, _ in pairs(newWeapons) do
            local lowerWeaponName = string.lower(weaponName)
            if not xPlayer.hasWeapon(weaponName) and not xPlayer.hasWeapon(lowerWeaponName) and Config.WhitelistedWeapons[weaponName] == nil then
                print("^1 [Zahya Anti Give Weapon] ^0" .. xPlayer.getName() .. " ^0" .. xPlayer.identifier .. " ^0" .. weaponName)
                local embed = {
                    ["title"] = "Zahya Anti Give Weapon",
                    ["fields"] = {
                        {
                            ["name"] = "Player Name",
                            ["value"] = xPlayer.getName(),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "ID",
                            ["value"] = xPlayer.source,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Identifier",
                            ["value"] = xPlayer.identifier,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Weapon Name",
                            ["value"] = weaponName,
                            ["inline"] = true
                        }
                    },
                    ["color"] = 16711680, -- red color
                    ["footer"] = {
                        ["text"] = "Zahya Anti Give Weapon",
                        ["icon_url"] = "https://example.com/icon.png" -- replace with your icon URL
                    }
                }
                -- you can change the webhook URL in config_webhook.lua
                PerformHttpRequest(Webhooks.url, "POST", json.encode({embeds = {embed}}), {
                    ["Content-Type"] = "application/json"
                })
                banPlayer(xPlayer.source, "Tried to spawn a weapon", weaponName)
                return
            end
        end
    end
end)
