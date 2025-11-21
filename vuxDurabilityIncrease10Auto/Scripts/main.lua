-- Tested on version 0.1.3.0
local vuxGameVersion = "0.1.3.0"
local vuxModVersion = "Auto 10"
local vuxCheckRestart = 0
local vuxCheckAcknowledge = 0
local vuxDuraMult = 10
local darkAvatar7BaseDura = 0

NotifyOnNewObject("/Script/Pal.PalStaticItemDataBase", function(vux)
    if vuxDuraMult == 0 then
        vux.Durability = -1
    elseif vuxDuraMult > 0 then
        vux.Durability = vux.Durability * vuxDuraMult
    end
end)

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
    if vuxCheckRestart ~= 1 then
        local items = FindAllOf("PalStaticItemDataBase")
        if items then
            for _, item in ipairs(items) do
                if item.Durability then
                    if vuxDuraMult == 0 then
                        darkAvatar7BaseDura = items.Durability
                        item.Durability = -1
                    elseif vuxDuraMult > 0 then
                        darkAvatar7BaseDura = items.Durability
                        item.Durability = item.Durability * vuxDuraMult
                    end
                end
            end
        end
        print("Durability mod version " .. vuxModVersion .. " loaded for game version " .. vuxGameVersion)
    end
    vuxCheckRestart = 1
end)

RegisterHook("/Script/Engine.PlayerController:ServerAcknowledgePossession", function()
    if vuxCheckAcknowledge ~= 1 then
        local items = FindAllOf("PalStaticItemDataBase")
        if items then
            for _, item in ipairs(items) do
                if item.Durability then
                    if darkAvatar7BaseDura == item.Durability then
                        if vuxDuraMult == 0 then
                            item.Durability = -1
                        elseif vuxDuraMult > 0 then
                            item.Durability = item.Durability * vuxDuraMult
                        end
                    end
                end
            end
        end
    end
    vuxCheckAcknowledge = 1
end)
