local tweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local arsenalFrameTWINFO = TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)

local Arsenal = Instance.new("ScreenGui")
local ArsenalFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local DetectedGameName = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Aimbot = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local InfiniteYield = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local esp = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

local deb = false

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = "Head"
_G.Sensitivity = 0

local draggableFrame = ArsenalFrame

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

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and IsDragging then
		update(input)
	end
end)

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

	local tween = tweenService:Create(Notification_2, arsenalFrameTWINFO, {Transparency = 0}):Play()
	wait(notificationTime)
	local tween = tweenService:Create(Notification_2, arsenalFrameTWINFO, {Transparency = 1}):Play()
	wait(0.7)
	Notification:Destroy()
end

function createStroke(location)
	local stroke = Instance.new("UIStroke", location)
	stroke.Thickness = 3
	stroke.Color = Color3.fromRGB(255,255,255)
	stroke.Transparency = 0
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end

createStroke(Aimbot)
createStroke(InfiniteYield)
createStroke(esp)
createStroke(DetectedGameName)
createStroke(Title)

print("[☑️ ArdaT] Arsenal Script Loading")

Arsenal.Name = "ArsenalGUI"
Arsenal.Parent = game.CoreGui

ArsenalFrame.Name = "ArsenalFrame"
ArsenalFrame.Parent = Arsenal
ArsenalFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ArsenalFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ArsenalFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ArsenalFrame.BorderSizePixel = 0
ArsenalFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ArsenalFrame.Draggable = true

Title.Name = "Title"
Title.Parent = ArsenalFrame
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

UICorner_2.Parent = ArsenalFrame

DetectedGameName.Name = "DetectedGameName"
DetectedGameName.Parent = ArsenalFrame
DetectedGameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DetectedGameName.BackgroundTransparency = 1.000
DetectedGameName.BorderColor3 = Color3.fromRGB(0, 0, 0)
DetectedGameName.BorderSizePixel = 0
DetectedGameName.Position = UDim2.new(0, 0, 0.917525768, 0)
DetectedGameName.Size = UDim2.new(1, 0, 0.0799999982, 0)
DetectedGameName.Font = Enum.Font.Nunito
DetectedGameName.Text = "Detected Game:Arsenal"
DetectedGameName.TextColor3 = Color3.fromRGB(255, 255, 255)
DetectedGameName.TextScaled = true
DetectedGameName.TextSize = 14.000
DetectedGameName.TextWrapped = true

UICorner_3.Parent = DetectedGameName

Aimbot.Name = "Aimbot"
Aimbot.Parent = ArsenalFrame
Aimbot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.BackgroundTransparency = 1.000
Aimbot.BorderColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.BorderSizePixel = 0
Aimbot.Position = UDim2.new(0.25, 0, 0.300000012, 0)
Aimbot.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
Aimbot.Font = Enum.Font.Unknown
Aimbot.Text = "Enable Aimbot"
Aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.TextScaled = true
Aimbot.TextSize = 14.000
Aimbot.TextWrapped = true

UICorner_4.Parent = Aimbot

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = ArsenalFrame
InfiniteYield.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.BackgroundTransparency = 1.000
InfiniteYield.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderSizePixel = 0
InfiniteYield.Position = UDim2.new(0.400000006, 0, 0.600000024, 0)
InfiniteYield.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
InfiniteYield.Font = Enum.Font.Unknown
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextScaled = true
InfiniteYield.TextSize = 14.000
InfiniteYield.TextWrapped = true

UICorner_5.Parent = InfiniteYield

esp.Name = "esp"
esp.Parent = ArsenalFrame
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
esp.BackgroundTransparency = 1.000
esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
esp.BorderSizePixel = 0
esp.Position = UDim2.new(0.550000012, 0, 0.300000012, 0)
esp.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
esp.Font = Enum.Font.Unknown
esp.Text = "Enable ESP"
esp.TextColor3 = Color3.fromRGB(255, 255, 255)
esp.TextScaled = true
esp.TextSize = 14.000
esp.TextWrapped = true

UICorner_6.Parent = esp

createNotification("Bildirim", "ArdaT istemcisi başarılı bir şekilde yüklendi",3, 10,"Tr. Green")
createNotification("Uyarı", "Her oyunda ban yeme riski vardır.Çok Belli Etmeden Oynayın",5, 15,"Tr. Red")

esp.MouseButton1Down:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
end)

Aimbot.MouseButton1Down:Connect(function()
	if not deb then
		deb = true
		Aimbot.Text = "Disable Aimbot"
		_G.AimbotEnabled = true
	elseif deb then
		deb = false
		Aimbot.Text = "Enable Aimbot"
		_G.AimbotEnabled = false
	end
		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false

		local function GetClosestPlayer()
			local MaximumDistance = math.huge
			local Target = nil

			coroutine.wrap(function()
				wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
			end)()

			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

										if VectorDistance < MaximumDistance then
											Target = v
											MaximumDistance = VectorDistance
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaximumDistance then
										Target = v
										MaximumDistance = VectorDistance
									end
								end
							end
						end
					end
				end
			end

			return Target
		end

		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)

		RunService.RenderStepped:Connect(function()
			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
end)
