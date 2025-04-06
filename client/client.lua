local knownWeapons = {}
local esxWeapons = {}

Citizen.CreateThread(function()
    for _, weapon in ipairs(ESX.GetConfig().Weapons) do
        esxWeapons[weapon.name] = GetHashKey(weapon.name)
    end
end)

Citizen.CreateThread(function()
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
            TriggerServerEvent("Hamada:ESX:CheckValidWeapons", newWeapons)
        end
        Wait(Config.checkInterval * 1000)
    end
end)
