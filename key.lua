-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- Create main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Size = UDim2.new(0, 300, 0, 150)
Window.Position = UDim2.new(0.5, -150, 0.5, -75)
Window.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Window.BorderSizePixel = 0
Window.Active = true
Window.Draggable = true
Window.Parent = ScreenGui

-- Black Outline
local Outline = Instance.new("Frame")
Outline.Name = "Outline"
Outline.Size = UDim2.new(1, 0, 1, 0)
Outline.Position = UDim2.new(0, 0, 0, 0)
Outline.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Outline.BorderSizePixel = 0
Outline.ZIndex = 2
Outline.Parent = Window

-- Add rounded corners to outline
local function addUICorner(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or UDim.new(0, 8)
    corner.Parent = frame
end

-- Create title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -20, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.5
Title.Text = "Enter Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 3
Title.Parent = Window
addUICorner(Title)

-- Create key input
local Input = Instance.new("TextBox")
Input.Name = "KeyInput"
Input.Size = UDim2.new(1, -20, 0, 30)
Input.Position = UDim2.new(0, 10, 0, 50)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 16
Input.Font = Enum.Font.Gotham
Input.PlaceholderText = "Enter key here..."
Input.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
Input.ZIndex = 3
Input.Parent = Window
addUICorner(Input)

-- Create submit button
local Submit = Instance.new("TextButton")
Submit.Name = "Submit"
Submit.Size = UDim2.new(1, -20, 0, 30)
Submit.Position = UDim2.new(0, 10, 0, 90)
Submit.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Submit.Text = "Submit"
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.TextSize = 16
Submit.Font = Enum.Font.GothamBold
Submit.ZIndex = 3
Submit.Parent = Window
addUICorner(Submit)

-- Create error message
local ErrorMessage = Instance.new("TextLabel")
ErrorMessage.Name = "ErrorMessage"
ErrorMessage.Size = UDim2.new(1, -20, 0, 20)
ErrorMessage.Position = UDim2.new(0, 10, 0, 120)
ErrorMessage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ErrorMessage.BackgroundTransparency = 0.5
ErrorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
ErrorMessage.TextSize = 14
ErrorMessage.Font = Enum.Font.Gotham
ErrorMessage.ZIndex = 3
ErrorMessage.Parent = Window
addUICorner(ErrorMessage)

-- Add rounded corners to outline
addUICorner(Outline)

-- Create outline border
local function createOutlineBorder()
    local borderThickness = 2
    
    -- Top border
    local top = Instance.new("Frame")
    top.Name = "TopBorder"
    top.Size = UDim2.new(1, 0, 0, borderThickness)
    top.Position = UDim2.new(0, 0, 0, 0)
    top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    top.BorderSizePixel = 0
    top.ZIndex = 3
    top.Parent = Outline
    addUICorner(top)
    
    -- Bottom border
    local bottom = Instance.new("Frame")
    bottom.Name = "BottomBorder"
    bottom.Size = UDim2.new(1, 0, 0, borderThickness)
    bottom.Position = UDim2.new(0, 0, 1, -borderThickness)
    bottom.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bottom.BorderSizePixel = 0
    bottom.ZIndex = 3
    bottom.Parent = Outline
    addUICorner(bottom)
    
    -- Left border
    local left = Instance.new("Frame")
    left.Name = "LeftBorder"
    left.Size = UDim2.new(0, borderThickness, 1, 0)
    left.Position = UDim2.new(0, 0, 0, 0)
    left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    left.BorderSizePixel = 0
    left.ZIndex = 3
    left.Parent = Outline
    addUICorner(left)
    
    -- Right border
    local right = Instance.new("Frame")
    right.Name = "RightBorder"
    right.Size = UDim2.new(0, borderThickness, 1, 0)
    right.Position = UDim2.new(1, -borderThickness, 0, 0)
    right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    right.BorderSizePixel = 0
    right.ZIndex = 3
    right.Parent = Outline
    addUICorner(right)
    
    return {top, bottom, left, right}
end

-- Create all border elements
local borders = createOutlineBorder()

-- Add rounded corners
local function addUICorner(frame, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or UDim.new(0, 8)
    corner.Parent = frame
end
addUICorner(Window)
addUICorner(Outline)

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Key Entry"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Window

-- Key Prompt
local Prompt = Instance.new("TextLabel")
Prompt.Name = "Prompt"
Prompt.Size = UDim2.new(1, 0, 0, 20)
Prompt.Position = UDim2.new(0, 0, 0.4, 0)
Prompt.BackgroundTransparency = 1
Prompt.Text = "Press ENTER to submit key"
Prompt.TextColor3 = Color3.fromRGB(100, 100, 100)
Prompt.Font = Enum.Font.Gotham
Prompt.TextSize = 14
Prompt.TextXAlignment = Enum.TextXAlignment.Center
Prompt.Parent = Window

-- Key Input
local Input = Instance.new("TextBox")
Input.Name = "Input"
Input.Size = UDim2.new(0.8, 0, 0, 40)
Input.Position = UDim2.new(0.1, 0, 0.4, 0)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.Font = Enum.Font.Gotham
Input.TextSize = 20
Input.PlaceholderText = "Enter key..."
Input.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
Input.ClearTextOnFocus = false
Input.Parent = Window
addUICorner(Input)

-- Submit Button
local Submit = Instance.new("TextButton")
Submit.Name = "Submit"
Submit.Size = UDim2.new(0.8, 0, 0, 40)
Submit.Position = UDim2.new(0.1, 0, 0.7, 0)
Submit.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
Submit.Text = "Submit"
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.Font = Enum.Font.GothamBold
Submit.TextSize = 20
Submit.AutoButtonColor = false
Submit.Parent = Window
addUICorner(Submit)

-- Rainbow animation for borders
local rainbowColors = {
    Color3.fromRGB(255, 0, 0),     -- Red
    Color3.fromRGB(255, 127, 0),   -- Orange
    Color3.fromRGB(255, 255, 0),   -- Yellow
    Color3.fromRGB(0, 255, 0),     -- Green
    Color3.fromRGB(0, 0, 255),     -- Blue
    Color3.fromRGB(75, 0, 130),    -- Indigo
    Color3.fromRGB(148, 0, 211)    -- Violet
}
local colorIndex = 1

local function updateRainbow()
    local nextIndex = colorIndex % #rainbowColors + 1
    local currentColor = rainbowColors[nextIndex]
    
    -- Update all border elements
    for _, border in ipairs(borders) do
        local tween = TweenService:Create(border, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {BackgroundColor3 = currentColor})
        tween:Play()
    end
    
    colorIndex = nextIndex
    task.wait(0.3)
    updateRainbow()
end

-- Start rainbow animation after fade in completes
task.wait(0.5) -- Wait for fade in
updateRainbow()

-- Key validation
local VALID_KEY = "BlazingHUB"

-- Key submission handler
local function handleKeySubmit()
    local enteredKey = Input.Text
    if enteredKey == VALID_KEY then
        Window.Visible = false
        print("Key accepted!")
        -- Add your key success code here
    else
        local Error = Instance.new("TextLabel")
        Error.Name = "Error"
        Error.Size = UDim2.new(0.8, 0, 0, 30)
        Error.Position = UDim2.new(0.1, 0, 0.1, 0)
        Error.BackgroundTransparency = 1
        Error.Text = "Invalid key!"
        Error.TextColor3 = Color3.fromRGB(255, 0, 0)
        Error.Font = Enum.Font.Gotham
        Error.TextSize = 16
        Error.Parent = Window

        -- Remove error text after 2 seconds
        game:GetService("Debris"):AddItem(Error, 2)
    end
end

-- Connect both button and enter key
Submit.MouseButton1Click:Connect(handleKeySubmit)

-- Listen for enter key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Return then
        handleKeySubmit()
    end
end)

-- Show UI when player joins
-- Fade in animation
Window.BackgroundTransparency = 1
Window.Visible = true

-- Create fade in tween
local fadeIn = TweenService:Create(Window, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
fadeIn:Play()

-- Add fade in to all child elements
local function fadeInChild(element)
    if element:IsA("GuiObject") and element ~= Outline then
        element.BackgroundTransparency = 1
        local childFade = TweenService:Create(element, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
        childFade:Play()
        
        -- Fade in text elements
        if element:IsA("TextLabel") or element:IsA("TextButton") then
            element.TextTransparency = 1
            local textFade = TweenService:Create(element, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
            textFade:Play()
        end
    end
end

-- Apply fade in to all children
for _, child in ipairs(Window:GetChildren()) do
    fadeInChild(child)
end