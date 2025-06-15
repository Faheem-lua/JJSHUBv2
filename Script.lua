local supportedPlaceIds = {
    [14451515684] = true,
}

if not supportedPlaceIds[game.PlaceId] then
    game.Players.LocalPlayer:Kick("Not Supported!")
end

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PetaPeta | Starz Hub"
gui.ResetOnSpawn = false

local uis = game:GetService("UserInputService")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 320)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local uiCorner = Instance.new("UICorner")
uiCorner.Parent = frame

local rainbow = coroutine.create(function()
    while true do
        for hue = 0, 1, 0.01 do
            frame.UIStroke.Color = Color3.fromHSV(hue, 1, 1)
            uiCorner.CornerRadius = UDim.new(0, 12)
            task.wait(0.03)
        end
    end
end)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Parent = frame
frame.UIStroke = stroke

coroutine.resume(rainbow)

local notify = Instance.new("TextLabel")
notify.Size = UDim2.new(1, 0, 0, 25)
notify.Position = UDim2.new(0, 0, 0, -25)
notify.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notify.TextColor3 = Color3.new(1, 1, 1)
notify.Text = "Script Made by Faheem & Black Gamer"
notify.Font = Enum.Font.Cartoon
notify.TextScaled = true
notify.Parent = frame

task.delay(4, function()
    notify:Destroy()
end)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -35, 0, 5)
toggleBtn.Text = "X"
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextColor3 = Color3.new(0, 0, 0)
toggleBtn.Font = Enum.Font.Cartoon
toggleBtn.Parent = frame

local openBtn = Instance.new("TextButton")
openBtn.Text = "OPEN"
openBtn.Size = UDim2.new(0, 100, 0, 40)
openBtn.Position = UDim2.new(0.5, -50, 0.9, 0)
openBtn.AnchorPoint = Vector2.new(0.5, 0.5)
openBtn.Visible = false
openBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
openBtn.TextColor3 = Color3.new(0, 0, 0)
openBtn.Font = Enum.Font.Cartoon
openBtn.Parent = gui

local isOpen = true

toggleBtn.MouseButton1Click:Connect(function()
    isOpen = false
    frame.Visible = false
    openBtn.Visible = true
end)

openBtn.MouseButton1Click:Connect(function()
    isOpen = true
    frame.Visible = true
    openBtn.Visible = false
end)

local function createButton(text, yOffset, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, yOffset)
    btn.Text = text
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Cartoon
    btn.Parent = frame
    return btn
end

local espBtn = createButton("Esp PetaPeta", 40, Color3.fromRGB(255, 100, 100))
local speedBtn = createButton("Fast Speed", 80, Color3.fromRGB(100, 100, 255))
local boxBtn = createButton("Esp Box", 120, Color3.fromRGB(100, 255, 100))
local safeBtn = createButton("Esp Safe", 160, Color3.fromRGB(255, 255, 0))
local extrasBtn = createButton("Coin + Hint + Hide", 200, Color3.fromRGB(128, 0, 255))
local keyBtn = createButton("ESP Key", 240, Color3.fromRGB(255, 255, 255))
local infoBtn = createButton("Info", 280, Color3.fromRGB(180, 180, 180))

espBtn.MouseButton1Click:Connect(function()
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and (model.Name == "EnemyModel" or model.Name == "EnemyModels") then
            if not model:FindFirstChildOfClass("Highlight") then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(255, 100, 100)
                hl.FillTransparency = 0.2
                hl.OutlineTransparency = 1
                hl.Parent = model
            end
        end
    end
end)

speedBtn.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum then
        hum.WalkSpeed = 41
    end
end)

boxBtn.MouseButton1Click:Connect(function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Name == "BoxBottom" then
            if not part:FindFirstChildOfClass("Highlight") then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(0, 255, 0)
                hl.FillTransparency = 0.2
                hl.OutlineTransparency = 1
                hl.Parent = part
            end
        end
    end
end)

safeBtn.MouseButton1Click:Connect(function()
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Name == "Meshes/safe_Safe" then
            if not part:FindFirstChildOfClass("Highlight") then
                local hl = Instance.new("Highlight")
                hl.FillColor = Color3.fromRGB(255, 255, 0)
                hl.FillTransparency = 0.2
                hl.OutlineTransparency = 1
                hl.Parent = part
            end
        end
    end
end)

extrasBtn.MouseButton1Click:Connect(function()
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local maxDistance = 300

    local function createESP(part, text, color)
        if part:FindFirstChild("ESP") then return end
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP"
        billboard.Adornee = part
        billboard.Size = UDim2.new(0, 100, 0, 20)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true

        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = color
        label.TextStrokeTransparency = 0.5
        label.TextScaled = true
        label.Font = Enum.Font.Cartoon

        billboard.Parent = part
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name == "Meshes/coin" or obj.Name == "Meshes/closet_DoorR" or obj.Name == "HintPaper") then
            local dist = root and (obj.Position - root.Position).Magnitude or math.huge
            if dist <= maxDistance then
                if obj.Name == "Meshes/coin" then
                    createESP(obj, "COIN", Color3.fromRGB(128, 0, 255))
                elseif obj.Name == "Meshes/closet_DoorR" then
                    createESP(obj, "HIDE", Color3.fromRGB(128, 0, 255))
                elseif obj.Name == "HintPaper" then
                    createESP(obj, "HINT", Color3.fromRGB(128, 0, 255))
                end
            end
        end
    end
end)

keyBtn.MouseButton1Click:Connect(function()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name:lower():find("key") then
            local gui = Instance.new("BillboardGui")
            gui.Name = "ESP"
            gui.Adornee = obj
            gui.Size = UDim2.new(0, 100, 0, 20)
            gui.StudsOffset = Vector3.new(0, 2, 0)
            gui.AlwaysOnTop = true

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundColor3 = Color3.new(1, 1, 1)
            label.TextColor3 = Color3.new(0, 0, 0)
            label.Text = "KEY"
            label.TextScaled = true
            label.Font = Enum.Font.Cartoon
            label.Parent = gui

            gui.Parent = obj
        end
    end
end)

infoBtn.MouseButton1Click:Connect(function()
    local infoGui = Instance.new("TextLabel")
    infoGui.Size = UDim2.new(0.6, 0, 0.2, 0)
    infoGui.Position = UDim2.new(0.2, 0, 0.4, 0)
    infoGui.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    infoGui.TextColor3 = Color3.new(1, 1, 1)
    infoGui.TextScaled = true
    infoGui.TextWrapped = true
    infoGui.Font = Enum.Font.Cartoon
    infoGui.Text = [[
This script made by Faheem. Known bugs:

- Speed resets when hiding or running.
- PetaPeta ESP disappears when the doll is lost.

Credits to: Black Gamer, K4sii
]]
    infoGui.Parent = gui
    task.delay(5, function()
        infoGui:Destroy()
    end)
end)
