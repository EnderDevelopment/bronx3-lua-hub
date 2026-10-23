-- WeaponInfo.lua

local WeaponInfo = {}

-- Initialize weapon information display
function WeaponInfo:init(mainFrame)
    self.mainFrame = mainFrame
    self:createWeaponInfoTab()

    return self
end

-- Create weapon information tab
function WeaponInfo:createWeaponInfoTab()
    local weaponInfoTab = Instance.new("Frame")
    weaponInfoTab.Name = "WeaponInfoTab"
    weaponInfoTab.Size = UDim2.new(0, 380, 0, 200)
    weaponInfoTab.Position = UDim2.new(0, 10, 0, 90)
    weaponInfoTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    weaponInfoTab.BorderSizePixel = 0
    weaponInfoTab.Parent = self.mainFrame

    -- Add weapon information display here
end

return WeaponInfo