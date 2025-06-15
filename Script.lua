local supportedPlaceIds = {
    [14451515684] = true,
}

game.Players.PlayerAdded:Connect(function(player)
    if not supportedPlaceIds[game.PlaceId] then
        player:Kick("Not Supported!")
    end
end)

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ESPAndSpeedGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 330)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -35, 0, 5)
toggleBtn.Text = "X"
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextColor3 = Color3.new(0, 0, 0)
toggleBtn.Parent = frame

local isOpen = true
toggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	frame.Visible = isOpen
end)

local function createButton(text, yOffset, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, yOffset)
	btn.Text = text
	btn.BackgroundColor3 = color
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = frame
	return btn
end

local espBtn = createButton("Esp PetaPeta", 40, Color3.fromRGB(255, 100, 100))
local speedBtn = createButton("Speed Toggle", 80, Color3.fromRGB(100, 100, 255))
local boxBtn = createButton("Esp Box", 120, Color3.fromRGB(100, 255, 100))
local safeBtn = createButton("Esp Safe", 160, Color3.fromRGB(255, 255, 0))
local extrasBtn = createButton("Coin + Hint + Hide", 200, Color3.fromRGB(255, 128, 0))
local keyBtn = createButton("ESP Key", 240, Color3.fromRGB(170, 0, 255))
local infoBtn = createButton("Info", 280, Color3.fromRGB(180, 180, 180))
local creditLabel = Instance.new("TextLabel", frame)
creditLabel.Size = UDim2.new(1, -20, 0, 20)
creditLabel.Position = UDim2.new(0, 10, 1, -25)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
creditLabel.TextScaled = true
creditLabel.Font = Enum.Font.SourceSansBold
creditLabel.Text = "Made by Faheem"

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
		hum.WalkSpeed = 42
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
		label.Font = Enum.Font.SourceSansBold

		billboard.Parent = part
	end

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and (obj.Name == "Meshes/coin" or obj.Name == "Meshes/closet_DoorR" or obj.Name == "HintPaper") then
			local dist = root and (obj.Position - root.Position).Magnitude or math.huge
			if dist <= maxDistance then
				if obj.Name == "Meshes/coin" then
					createESP(obj, "COIN", Color3.fromRGB(255, 215, 0))
				elseif obj.Name == "Meshes/closet_DoorR" then
					createESP(obj, "HIDE", Color3.fromRGB(255, 0, 0))
				elseif obj.Name == "HintPaper" then
					createESP(obj, "HINT", Color3.fromRGB(0, 255, 0))
				end
			end
		end
	end
end)

keyBtn.MouseButton1Click:Connect(function()
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name:lower():find("key") then
			if not obj:FindFirstChild("ESP") then
				local esp = Instance.new("BillboardGui")
				esp.Name = "ESP"
				esp.Adornee = obj
				esp.Size = UDim2.new(0, 100, 0, 20)
				esp.StudsOffset = Vector3.new(0, 2, 0)
				esp.AlwaysOnTop = true

				local label = Instance.new("TextLabel", esp)
				label.Size = UDim2.new(1, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = "KEY"
				label.TextColor3 = Color3.fromRGB(170, 0, 255)
				label.TextScaled = true
				label.Font = Enum.Font.SourceSansBold

				esp.Parent = obj
			end
		end
	end
end)

-- Info
infoBtn.MouseButton1Click:Connect(function()
	local infoGui = Instance.new("TextLabel")
	infoGui.Size = UDim2.new(0.6, 0, 0.2, 0)
	infoGui.Position = UDim2.new(0.2, 0, 0.4, 0)
	infoGui.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	infoGui.TextColor3 = Color3.new(1, 1, 1)
	infoGui.TextScaled = true
	infoGui.TextWrapped = true
	infoGui.Text = [[
This script made by Faheem.

Known bugs:
- Speed resets when hiding or running.
- PetaPeta ESP disappears when the doll is lost.

Credits to: Black Gamer, K4sii
]]
	infoGui.Parent = gui
	task.delay(5, function()
		infoGui:Destroy()
	end)
end)
