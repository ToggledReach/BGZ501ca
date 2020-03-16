local criticalHits = {
    Activated = false,
    Keybind = Enum.KeyCode.N,

    Chance = 50,
    Delay = 0.5,
}

local UserInputService = game:GetService("UserInputService")

gg.getCriticalHitData = function()
    return criticalHits
end

-- Creating a slider

local newSlider = gg.slider.new(gg.ui:WaitForChild("Menu").Settings.criticalHits.ChanceSlider, 0, 100, 0, true) -- min, max, round

newSlider:Bind(function(val)
    criticalHits.Chance = val
end)

local newSlider = gg.slider.new(gg.ui:WaitForChild("Menu").Settings.criticalHits.DelaySlider, 0, 1, 1) -- min, max, round

newSlider:Bind(function(val)
    criticalHits.Delay = val
end)

-- New Keybind

local newKeybind = gg.keybinds.newButton(gg.ui.Menu.Settings.criticalHits.Keybind, "Critical Hits")

newKeybind:Bind(function(key)
    criticalHits.Keybind = key
end)


-- TODO // remake this section to be universal using Keybinds.lua

local label

UserInputService.InputBegan:connect(function(input)
    local TextBoxFocused = UserInputService:GetFocusedTextBox()
    if TextBoxFocused then return end
    local KeyCode = input.KeyCode
    if KeyCode == criticalHits.Keybind then
        if criticalHits.Activated == false then
            if label then
                label:Destroy()
                label = nil
            end

            label = gg.ui.Templates.TextLabel:Clone()
            label.Text = "Critical Hits"
            label.Parent = gg.ui.Overlay:WaitForChild("Active")
            label.Visible = true
        else
            if label then
                label:Destroy()
                label = nil
            end
        end
        criticalHits.Activated = not criticalHits.Activated
    end
end)

return criticalHits