local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({ Name = "PetaPeta | StarzXPro", LoadingTitle = "StarzXPro GUI", LoadingSubtitle = "by Faheem", ConfigurationSaving = { Enabled = true, FolderName = "starzxpro", FileName = "starzx_ui" }, Discord = { Enabled = false, Invite = "", RememberJoins = true }, KeySystem = false, KeySettings = { Title = "StarzXPro GUI", Subtitle = "Key System", Note = "", FileName = "starzx_key", SaveKey = true, GrabKeyFromSite = false, Key = "1234" } })

local Tab1 = Window:CreateTab("Info+", 10834) Tab1:CreateParagraph({ Title = "StarzXPro GUI", Content = "This script made by Faheem. Known bugs:\n\n- Speed resets when hiding or running.\n- PetaPeta ESP disappears when the doll is lost.\n\nCredits to: Black Gamer, K4sii" })

local Tab2 = Window:CreateTab("In-Game", 4883) local Section1 = Tab2:CreateSection("LocalPlayer")

Tab2:CreateSlider({ Name = "Speed", Range = {1, 100}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "Speed", Callback = function(Value) local plr = game.Players.LocalPlayer local char = plr.Character or plr.CharacterAdded:Wait() local hum = char:FindFirstChildWhichIsA("Humanoid") if hum then hum.WalkSpeed = Value end end, })

Tab2:CreateSlider({ Name = "Jump Power", Range = {1, 100}, Increment = 1, Suffix = "Jump", CurrentValue = 50, Flag = "Jump", Callback = function(Value) local plr = game.Players.LocalPlayer local char = plr.Character or plr.CharacterAdded:Wait() local hum = char:FindFirstChildWhichIsA("Humanoid") if hum then hum.JumpPower = Value end end, })

Tab2:CreateParagraph({ Title = "Soon", Content = "(SOON) ADD MORE" })

local Tab3 = Window:CreateTab("Visual+", 9241)

local Section2 = Tab3:CreateSection("Items") local Section3 = Tab3:CreateSection("Player") local Section4 = Tab3:CreateSection("Enemies") local Section5 = Tab3:CreateSection("Hint+")

local function highlightESP(object, color) if not object:FindFirstChildOfClass("Highlight") then local hl = Instance.new("Highlight") hl.FillColor = color hl.FillTransparency = 0.2 hl.OutlineTransparency = 1 hl.Parent = object end end

Tab3:CreateToggle({ Name = "ESP Box", CurrentValue = false, Flag = "espbox", Callback = function(state) if state then for _, part in ipairs(workspace:GetDescendants()) do if part:IsA("BasePart") and part.Name == "BoxBottom" then highlightESP(part, Color3.fromRGB(0,255,0)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Safe", CurrentValue = false, Flag = "espsafe", Callback = function(state) if state then for _, part in ipairs(workspace:GetDescendants()) do if part:IsA("BasePart") and part.Name == "Meshes/safe_Safe" then highlightESP(part, Color3.fromRGB(255,255,0)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Key", CurrentValue = false, Flag = "espkey", Callback = function(state) if state then for _, part in ipairs(workspace:GetDescendants()) do if part:IsA("BasePart") and part.Name == "Key" then highlightESP(part, Color3.fromRGB(255, 100, 255)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Player", CurrentValue = false, Flag = "espplayer", Callback = function(state) if state then for _, p in ipairs(game.Players:GetPlayers()) do if p ~= game.Players.LocalPlayer then local char = p.Character if char and char:FindFirstChild("HumanoidRootPart") then highlightESP(char, Color3.fromRGB(0,255,255)) end end end end end, })

Tab3:CreateToggle({ Name = "ESP PetaPeta", CurrentValue = false, Flag = "esppeta", Callback = function(state) if state then for _, model in ipairs(workspace:GetDescendants()) do if model:IsA("Model") and (model.Name == "EnemyModel" or model.Name == "EnemyModels") then highlightESP(model, Color3.fromRGB(255, 100, 100)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Coin", CurrentValue = false, Flag = "espcoin", Callback = function(state) if state then for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Name == "Meshes/coin" then highlightESP(obj, Color3.fromRGB(255, 215, 0)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Hint", CurrentValue = false, Flag = "esphint", Callback = function(state) if state then for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Name == "Hint" then highlightESP(obj, Color3.fromRGB(0, 255, 0)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Hint Paper", CurrentValue = false, Flag = "esppaper", Callback = function(state) if state then for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Name == "HintPaper" then highlightESP(obj, Color3.fromRGB(150, 150, 255)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Hide", CurrentValue = false, Flag = "esphide", Callback = function(state) if state then for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Name == "Meshes/closet_DoorR" then highlightESP(obj, Color3.fromRGB(255, 0, 0)) end end end end, })

Tab3:CreateToggle({ Name = "ESP Evil Room", CurrentValue = false, Flag = "espevilroom", Callback = function(state) if state then for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Name == "EvilRoom" then highlightESP(obj, Color3.fromRGB(200, 0, 200)) end end end end, })

Tab3:CreateParagraph({ Title = "Note", Content = "Might be not work" })

