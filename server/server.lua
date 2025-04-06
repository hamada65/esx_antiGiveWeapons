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

RegisterServerEvent("Hamada:ESX:CheckValidWeapons")
AddEventHandler("Hamada:ESX:CheckValidWeapons", function(newWeapons)
    local playerId = source  
    local xPlayer = ESX.GetPlayerFromId(playerId)  

    if xPlayer then
        for weaponName, _ in pairs(newWeapons) do
            local lowerWeaponName = string.lower(weaponName)
            if not xPlayer.hasWeapon(weaponName) and not xPlayer.hasWeapon(lowerWeaponName) and Config.WhitelistedWeapons[weaponName] == nil then
                print("^1 [Hamada Anti Give Weapon] ^0" .. xPlayer.getName() .. " ^0" .. xPlayer.identifier .. " ^0" .. weaponName)
                TriggerEvent("zahya_logs:SendLog", "giveweapon", "red", "رسبنة سلاح", {
                    { ["name"] = "اسم اللاعب", ["value"] = xPlayer.getName(), ["inline"] = true },
                    { ["name"] = "id", ["value"] = xPlayer.source, ["inline"] = true },
                    { ["name"] = "identifier", ["value"] = xPlayer.identifier, ["inline"] = true },
                    { ["name"] = "Weapon Name", ["value"] = weaponName, ["inline"] = true }
                })
                banPlayer(xPlayer.source, "Tried to spawn a weapon", weaponName)
                return
            end
        end
    end
end)
