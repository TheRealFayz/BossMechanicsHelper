-- BossMechanicHelperConfig.lua

function BossMechanicHelperConfigFrame_OnLoad(self)
    -- Event registration
    self:RegisterEvent("VARIABLES_LOADED")
    self.scrollFrame.update = BossMechanicHelperConfigScrollFrame_Update
    HybridScrollFrame_CreateButtons(self.scrollFrame, "BossMechanicHelperConfigButtonTemplate", 0, 0)
end

-- Event handler
function BossMechanicHelperConfigFrame_OnEvent(self, event, ...)
    if event == "VARIABLES_LOADED" then
        -- Update the scroll frame when the variables are loaded
        if BossMechanicHelperConfigScrollFrame_Update then
            BossMechanicHelperConfigScrollFrame_Update()
        else
            message("Failed to update the configuration frame. Please make sure all the addon files are properly installed.")
        end
    end
end
