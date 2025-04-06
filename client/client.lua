if Config.FrameWork.old then
    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent(Config.FrameWork.sharedObject, function(obj) ESX = obj end)
            Wait(0)
        end
    end)
else
    ESX = exports["es_extended"]:getSharedObject()
end

local knownWeapons = {}
local esxWeapons = {}

Citizen.CreateThread(function()
    while not ESX do
        Wait(100)
    end
    for _, weapon in ipairs(ESX.GetConfig().Weapons) do
        esxWeapons[weapon.name] = GetHashKey(weapon.name)
    end
end)

Citizen.CreateThread(function()
    while not ESX then
        Wait(100)
    end
	Wait(5000)
    while true do

        local ped = PlayerPedId()
        local newWeapons = {}

        for weaponName, weaponHash in pairs(esxWeapons) do
            if HasPedGotWeapon(ped, weaponHash, false) then
                if not knownWeapons[weaponName] then
                    newWeapons[weaponName] = true
                    knownWeapons[weaponName] = true
                end
            else
                -- weapon removed
                knownWeapons[weaponName] = nil
            end
        end

        if next(newWeapons) then
            TriggerServerEvent("Zahya:ESX:CheckValidWeapons", newWeapons)
        end
        Wait(Config.checkInterval * 1000)
    end
end)
