--[[
    Initalize.lua
    Handles the backbones to our environmental API
    @author NodeSupport
--]]

local environment = {
    modules = {}
}

if getgenv().gg then
    return warn("Battlegrounds Zero Environment is already loaded")
end

getgenv().gg = environment

function environment.load(path)
    if not path then
        return warn("Invalid Pathway for loading module")
    end
    if type(path) == "string" then
        to_clipboard("https://raw.githubusercontent.com/ToggledReach/BattlegroundsZero/master/".. path ".lua")
        return loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ToggledReach/BattlegroundsZero/master/".. path ".lua"))()
    elseif type(path) == "number" then
        return game:GetObjects("rbxassetid://" .. path)[1]
    end
end

gg.ui = environment.load(4735247703)
gg.modules.login = environment.load("Modules/login")