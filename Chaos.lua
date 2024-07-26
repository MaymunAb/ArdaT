local tweenService = game:GetService("TweenService")
local chaosFrameTWINFO = TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)

function createNotification(title, content, notificationTime, zindex, brickColor)
	print("Creating Notification")
	local Notification = Instance.new("ScreenGui")
	local Notification_2 = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local Content = Instance.new("TextLabel")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke", Title)

	UIStroke.Color = Color3.new(1, 1, 1)
	UIStroke.Thickness = 2
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	Notification.Name = "Notification"
	Notification.Parent = game.CoreGui
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Notification_2.Name = "Notification"
	Notification_2.Parent = Notification
	Notification_2.ZIndex = zindex
	Notification_2.BackgroundTransparency = 1
	Notification_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Notification_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification_2.BorderSizePixel = 0
	Notification_2.BackgroundColor = BrickColor.new(brickColor)
	Notification_2.Position = UDim2.new(0.720000029, 0, 0.829999983, 0)
	Notification_2.Size = UDim2.new(0.25, 0, 0.1, 0)

	Title.Name = "Title"
	Title.Parent = Notification_2
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0.300000012, 0)
	Title.Font = Enum.Font.Nunito
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true

	UICorner.Parent = Title

	Content.Name = "Content"
	Content.Parent = Notification_2
	Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Content.BackgroundTransparency = 1.000
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0, 0, 0.300000012, 0)
	Content.Size = UDim2.new(1, 0, 0.699999988, 0)
	Content.Font = Enum.Font.Nunito
	Content.Text = content
	Content.TextColor3 = Color3.fromRGB(255, 255, 255)
	Content.TextSize = 22.000
	Content.TextWrapped = true

	UICorner_2.Parent = Notification_2
	
	local tween = tweenService:Create(Notification_2, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 0}):Play()
	wait(notificationTime)
	local tween = tweenService:Create(Notification_2, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
	wait(0.7)
	Notification:Destroy()
end


local Chaos = Instance.new("ScreenGui")
local ChaosFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local DetectedGameName = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local AimbotSettings = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local InfiniteYield = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local ESPSettings = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Minimize = Instance.new("ImageButton")
local OpenUI = Instance.new("Frame")
local Open = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")

local UIS = game:GetService("UserInputService")

local draggableFrame = ChaosFrame

local IsDragging = false 	
local dragInput		
local StartingPoint
local oldPos	

local function update(input)
	local delta = input.Position - StartingPoint
	draggableFrame.Position = UDim2.new(oldPos.X.Scale, oldPos.X.Offset + delta.X, oldPos.Y.Scale, oldPos.Y.Offset + delta.Y)
end

draggableFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		IsDragging = true
		StartingPoint = input.Position
		oldPos = draggableFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				IsDragging = false
			end
		end)
	end
end)

draggableFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and IsDragging then
		update(input)
	end
end)

Chaos.Name = "Chaos"
Chaos.Parent = game.CoreGui

ChaosFrame.Name = "ChaosFrame"
ChaosFrame.Parent = Chaos
ChaosFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ChaosFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChaosFrame.BorderSizePixel = 0
ChaosFrame.Position = UDim2.new(0.5,0,0.5,0)
ChaosFrame.Size = UDim2.new(0,0,0,0)
ChaosFrame.Draggable = true
ChaosFrame.AnchorPoint = Vector2.new(0.5,0.5)

Title.Name = "Title"
Title.Parent = ChaosFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0.200000003, 0)
Title.Font = Enum.Font.Nunito
Title.Text = "ArdaT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UICorner.Parent = Title

UICorner_2.Parent = ChaosFrame

DetectedGameName.Name = "DetectedGameName"
DetectedGameName.Parent = ChaosFrame
DetectedGameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DetectedGameName.BackgroundTransparency = 1.000
DetectedGameName.BorderColor3 = Color3.fromRGB(0, 0, 0)
DetectedGameName.BorderSizePixel = 0
DetectedGameName.Position = UDim2.new(0, 0, 0.917525768, 0)
DetectedGameName.Size = UDim2.new(1, 0, 0.0799999982, 0)
DetectedGameName.Font = Enum.Font.Nunito
DetectedGameName.Text = "Detected Game:Chaos"
DetectedGameName.TextColor3 = Color3.fromRGB(255, 255, 255)
DetectedGameName.TextScaled = true
DetectedGameName.TextSize = 14.000
DetectedGameName.TextWrapped = true

UICorner_3.Parent = DetectedGameName

AimbotSettings.Name = "AimbotSettings"
AimbotSettings.Parent = ChaosFrame
AimbotSettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimbotSettings.BackgroundTransparency = 1.000
AimbotSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimbotSettings.BorderSizePixel = 0
AimbotSettings.Position = UDim2.new(0.25, 0, 0.300000012, 0)
AimbotSettings.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
AimbotSettings.Font = Enum.Font.Nunito
AimbotSettings.Text = "Enable Kill Aura"
AimbotSettings.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotSettings.TextScaled = true
AimbotSettings.TextSize = 14.000
AimbotSettings.TextWrapped = true
AimbotSettings.MouseButton1Down:Connect(function()
	if shared.settings then return end

	shared.settings = {
		killaura = true,
		maxdistance = 30,
		debugging = true
	}

	local Players = game:GetService("Players")
	local lp = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer

	local function getchar(plr,yield)
		local plr = plr or lp
		return plr.Character or yield and plr.CharacterAdded:Wait()
	end

	local function gethumanoid(plr,yield)
		local plr = plr or lp
		local char = getchar(plr,yield)
		return yield and char:WaitForChild("Humanoid") or char:FindFirstChildWhichIsA("Humanoid")
	end

	local function getDamageRemote()
		local char = getchar(nil,true)
		local Tool = char:FindFirstChildWhichIsA("Tool")
		local Remote = Tool and Tool:FindFirstChild("DamageRemote")
		return Remote
	end

	local function GetClosestPlayer()
		local dist = shared.settings.maxdistance or 1/0
		local closest_player

		for i,v in next, Players:GetPlayers() do
			if v ~= lp then
				local char = getchar(v)
				if char and not char:FindFirstChildWhichIsA("ForceField") then
					local BasePart = char:FindFirstChildWhichIsA("BasePart")
					local Humanoid = gethumanoid(v)
					local DistanceFromTarget = BasePart and lp:DistanceFromCharacter(BasePart.CFrame.Position)

					if DistanceFromTarget and DistanceFromTarget <= dist and Humanoid and Humanoid.Health > 0 then
						dist = DistanceFromTarget
						closest_player = v
					end
				end
			end
		end
		return closest_player,dist    
	end

	repeat
		local DamageRemote = getDamageRemote()
		if DamageRemote then
			local Target,Distance = GetClosestPlayer()
			if Target then
				DamageRemote:FireServer(gethumanoid(Target))
				if shared.settings.debugging then
					warn("Attacked",Target,"from",Distance,"studs away")
				end
			end
		end
		task.wait()
	until not shared.settings.killaura 
end)

UICorner_4.Parent = AimbotSettings

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = ChaosFrame
InfiniteYield.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.BackgroundTransparency = 1.000
InfiniteYield.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderSizePixel = 0
InfiniteYield.Position = UDim2.new(0.400000006, 0, 0.600000024, 0)
InfiniteYield.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
InfiniteYield.Font = Enum.Font.Nunito
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextScaled = true
InfiniteYield.TextSize = 14.000
InfiniteYield.TextWrapped = true
InfiniteYield.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

UICorner_5.Parent = InfiniteYield

ESPSettings.Name = "ESPSettings"
ESPSettings.Parent = ChaosFrame
ESPSettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPSettings.BackgroundTransparency = 1.000
ESPSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPSettings.BorderSizePixel = 0
ESPSettings.Position = UDim2.new(0.550000012, 0, 0.300000012, 0)
ESPSettings.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
ESPSettings.Font = Enum.Font.Nunito
ESPSettings.Text = "Enable ESP"
ESPSettings.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPSettings.TextScaled = true
ESPSettings.TextSize = 14.000
ESPSettings.TextWrapped = true
ESPSettings.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
end)

UICorner_6.Parent = ESPSettings

function createStroke(location)
	local stroke = Instance.new("UIStroke", location)
	stroke.Thickness = 3
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Transparency = 0
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end

createStroke(AimbotSettings)
createStroke(Title)
createStroke(DetectedGameName)
createStroke(ESPSettings)
createStroke(InfiniteYield)

UICorner_7.Parent = OpenUI
wait(0.5)
print("ArdaT Chaos Script Loaded!")
local tween = tweenService:Create(ChaosFrame, chaosFrameTWINFO, {Size = UDim2.new(0.3,0,0.4,0)}):Play()
createNotification("Bildirim", "ArdaT istemcisi başarılı bir şekilde yüklendi",5, 10,"Tr. Green")
createNotification("Uyarı", "Her oyunda ban yeme riski vardır.Çok Belli Etmeden Oynayın",10, 15,"Tr. Red")
