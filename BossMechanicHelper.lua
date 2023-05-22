SLASH_BMH1 = "/bmh"

SlashCmdList["BMH"] = function(msg)
    if msg == "config" then
        -- Show the configuration frame
        if BossMechanicHelperConfigFrame then
            BossMechanicHelperConfigFrame:Show()
        else
            message("Configuration frame is not loaded. Please check if all the addon files are properly installed.")
        end
    else
        -- Show the dropdown menu
        if BossMechanicHelperDropdown then
            ToggleDropDownMenu(1, nil, BossMechanicHelperDropdown, "cursor", 0, 0)
        else
            message("Dropdown menu is not loaded. Please check if all the addon files are properly installed.")
        end
    end
end

function BossMechanicHelper_BossSelected(self)
    local boss, bossMechanic = self.value, self.arg1
    if boss and bossMechanic then
        SendChatMessage("Mechanic for " .. boss .. ": " .. bossMechanic, "RAID")
    else
        message("Failed to send the mechanic message. Please make sure the selected boss has a mechanic associated with it.")
    end
end

function BossMechanicHelper_InitializeDropdown(self, level)
    local info = UIDropDownMenu_CreateInfo()
    for instance, bosses in pairs(BossMechanicHelperDefaultMechanics) do
        for boss, mechanic in pairs(bosses) do
            info.text = instance .. " - " .. boss
            info.value = boss
            info.arg1 = mechanic
            info.func = BossMechanicHelper_BossSelected
            UIDropDownMenu_AddButton(info)
        end
    end
end

function BossMechanicHelper_ConfigSave()
    -- Save the changes made in the configuration frame
    if BossMechanicHelperConfigScrollFrame.buttons then
        for i=1, table.getn(BossMechanicHelperConfigScrollFrame.buttons) do
            local button = BossMechanicHelperConfigScrollFrame.buttons[i]
            if button and BossMechanicHelperDefaultMechanics[button.instance] and BossMechanicHelperDefaultMechanics[button.instance][button.boss] then
                BossMechanicHelperDefaultMechanics[button.instance][button.boss] = button.editBox:GetText()
            else
                message("Failed to save the mechanic. Please make sure the mechanic is associated with a valid boss and instance.")
            end
        end
    else
        message("No configuration buttons found. Please check if the configuration frame is properly loaded.")
    end
end
