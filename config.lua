Config = {}

Config.FrameWork = {
    old = false, -- true = legacy ESX using 'esx:getSharedObject', false = export-based
    sharedObject = "esx:getSharedObject", -- only used if old = true
}

Config.WhitelistedWeapons = {
    ["WEAPON_PETROLCAN"] = true, -- allowed even if player doesn't "own" it
}

Config.checkInterval = 10 -- time in seconds between weapon scans