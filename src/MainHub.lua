-- MainHub.lua

local MainHub = {}

-- Initialize the main hub
function MainHub:init()
    self.window = Instance.new("ScreenGui")
    self.window.Name = "MainHub"
    self.window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    self.mainFrame = Instance.new("Frame")
    self.mainFrame.Name = "MainFrame"
    self.mainFrame.Size = UDim2.new(0, 400, 0, 300)
    self.mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    self.mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.mainFrame.BorderSizePixel = 0
    self.mainFrame.Parent = self.window

    self:createSearchBar()
    self:createTabs()
    self:createDraggableWindow()

    return self
end

-- Create search bar
function MainHub:createSearchBar()
    local searchBar = Instance.new("TextBox")
    searchBar.Name = "SearchBar"
    searchBar.Size = UDim2.new(0, 380, 0, 30)
    searchBar.Position = UDim2.new(0, 10, 0, 10)
    searchBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    searchBar.BorderSizePixel = 0
    searchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBar.PlaceholderText = "Search..."
    searchBar.Parent = self.mainFrame

    searchBar.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            print("Searching for: " .. searchBar.Text)
        end
    end)
end

-- Create tabs
function MainHub:createTabs()
    local tabs = {"Weapons", "Settings", "Info"}
    local tabButtons = {}

    for i, tabName in ipairs(tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Name = tabName .. "Tab"
        tabButton.Size = UDim2.new(0, 100, 0, 30)
        tabButton.Position = UDim2.new(0, (i-1)*100, 0, 50)
        tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tabButton.BorderSizePixel = 0
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Text = tabName
        tabButton.Parent = self.mainFrame

        table.insert(tabButtons, tabButton)
    end

    -- Add tab switching logic here
end

-- Create draggable window
function MainHub:createDraggableWindow()
    local dragging = false
    local dragStart = nil
    local startPos = nil

    self.mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    self.mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                local delta = input.Position - dragStart
                self.mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)
end

return MainHub