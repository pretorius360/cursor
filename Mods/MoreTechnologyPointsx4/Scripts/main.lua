-- mady by caites and Eld3rBrain

local palConfig = require "config"

-- Prints the mod successful loading message in red
print(palConfig.palRedColorWrapperFront .. palConfig.palModName .. " version " .. palConfig.palModVersion .. " loaded for game version " .. palConfig.palGameVersion .. palConfig.palRedColorWrapperBack)

-- Register the new modifiers and print a successful change message in red
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
    if palConfig.palCheckRestart ~= 1 then
        local items = FindAllOf("PalGameSetting")
        if items then
            for _, item in ipairs(items) do
                item.technologyPointPerLevel = palConfig.palTechnologyPointPerLevel
                item.TechnologyPoint_UnlockFastTravel = palConfig.palTechnologyPointUnlockFastTravel
                item.bossTechnologyPointPerTowerBoss = palConfig.palTechnologyPointPerTowerBoss
                item.bossTechnologyPointPerNormalBoss = palConfig.palTechnologyPointPerNormalBoss
            end
        end
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Level set to " .. palConfig.palTechnologyPointPerLevel .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Unlock Fast Travel set to " .. palConfig.palTechnologyPointUnlockFastTravel .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Tower Boss set to " .. palConfig.palTechnologyPointPerTowerBoss .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Normal Boss set to " .. palConfig.palTechnologyPointPerNormalBoss .. palConfig.palRedColorWrapperBack)       
    end
    palConfig.palCheckRestart = 1
end)

RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", function(Context)
    if not palConfig.serverAcknowledgedPossession then
        local items = FindAllOf("PalGameSetting")
        if items then
            for _, item in ipairs(items) do
                item.technologyPointPerLevel = palConfig.palTechnologyPointPerLevel
                item.TechnologyPoint_UnlockFastTravel = palConfig.palTechnologyPointUnlockFastTravel
                item.bossTechnologyPointPerTowerBoss = palConfig.palTechnologyPointPerTowerBoss
                item.bossTechnologyPointPerNormalBoss = palConfig.palTechnologyPointPerNormalBoss
            end
        end
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Level set to " .. palConfig.palTechnologyPointPerLevel .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Unlock Fast Travel set to " .. palConfig.palTechnologyPointUnlockFastTravel .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Tower Boss set to " .. palConfig.palTechnologyPointPerTowerBoss .. palConfig.palRedColorWrapperBack)
        print(palConfig.palRedColorWrapperFront .. "[" .. palConfig.palModName .. "] Technology Point Per Normal Boss set to " .. palConfig.palTechnologyPointPerNormalBoss .. palConfig.palRedColorWrapperBack) 
    end
    palConfig.serverAcknowledgedPossession = true
end)