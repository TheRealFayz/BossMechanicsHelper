function BossMechanicHelperConfigFrame_OnLoad(self)
    -- Create scroll frame
    local scrollFrame = CreateFrame("ScrollFrame", "BossMechanicHelperConfigScrollFrame", self, "UIPanelScrollFrameTemplate")
    scrollFrame:SetWidth(350)
    scrollFrame:SetHeight(250)
    scrollFrame:SetPoint("TOPLEFT", self, "TOPLEFT", 20, -20)

    -- Add buttons to the scroll frame
    local previousButton
    for instance, bosses in pairs(BossMechanicHelperDefaultMechanics) do
        for boss, mechanic in pairs(bosses) do
            local button = CreateFrame("Button", nil, scrollFrame, "UIPanelButtonTemplate")
            button:SetWidth(300)
            button:SetHeight(30)
            if previousButton then
                button:SetPoint("TOPLEFT", previousButton, "BOTTOMLEFT", 0, -10)
            else
                button:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT")
            end
            button:SetText(mechanic)
            button.instance = instance
            button.boss = boss
            previousButton = button
            if not scrollFrame.buttons then scrollFrame.buttons = {} end
            table.insert(scrollFrame.buttons, button)
        end
    end

    -- Add save button
    local saveButton = CreateFrame("Button", "BossMechanicHelperConfigSaveButton", self, "UIPanelButtonTemplate")
    saveButton:SetWidth(100)
    saveButton:SetHeight(30)
    saveButton:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -20, 20)
    saveButton:SetText("Save")
    saveButton:SetScript("OnClick", BossMechanicHelper_ConfigSave)
end

function BossMechanicHelperConfigFrame_OnEvent(self, event, ...)
    -- Add event handling code here...
end
