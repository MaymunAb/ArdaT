local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

local Chaos = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local GameTitle = Instance.new("TextLabel")
local Buttons = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Aimbot = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ESP = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local InfiniteYield = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")
local Title2 = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local CloseUI = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

local IsDragging = false 	
local dragInput
local StartingPoint
local oldPos

local ESPClicked = false
local AimbotClicked = false
local InfiniteYieldClicked = false

local ToggleESP = false 
local TeamCheckESP = false
local PlayerNameESP = "Name"
local DebounceForESP = false

shared.settings = {
	killaura = false,
	maxdistance = 30,
	debugging = true
}

Chaos.Name = "Chaos"
Chaos.Parent = game.Players.LocalPlayer.PlayerGui
Chaos.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Chaos.Enabled = true

Frame.Parent = Chaos
Frame.AnchorPoint = Vector2.new(0, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.349999994, 0, 0.5, 0)
Frame.Size = UDim2.new(0.3, 0, 0, 0)

GameTitle.Name = "GameTitle"
GameTitle.Parent = Frame
GameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameTitle.BackgroundTransparency = 1.000
GameTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
GameTitle.BorderSizePixel = 0
GameTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
GameTitle.Size = UDim2.new(1, 0, 0.100000001, 0)
GameTitle.Font = Enum.Font.Arimo
GameTitle.Text = "Chaos"
GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
GameTitle.TextSize = 18.000
GameTitle.TextWrapped = true
GameTitle.AnchorPoint = Vector2.new(0.5, 0.45)

Buttons.Name = "Buttons"
Buttons.Parent = Frame
Buttons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Buttons.BorderSizePixel = 0
Buttons.Position = UDim2.new(0.100000001, 0, 0.200000003, 0)
Buttons.Size = UDim2.new(0.800000012, 0, 0.600000024, 0)

UICorner.Parent = Buttons

Aimbot.Name = "Kill Aura"
Aimbot.Parent = Buttons
Aimbot.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Aimbot.BorderColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.BorderSizePixel = 0
Aimbot.Position = UDim2.new(0.174494192, 0, 0.144451067, 0)
Aimbot.Size = UDim2.new(0.150000006, 0, 0.300000012, 0)
Aimbot.Font = Enum.Font.Arimo
Aimbot.Text = ""
Aimbot.TextColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.TextSize = 14.000

UICorner_2.Parent = Aimbot

Title.Name = "Title"
Title.Parent = Aimbot
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(-0.155617788, 0, 0.999999702, 0)
Title.Size = UDim2.new(1.29999995, 0, 0.5, 0)
Title.Font = Enum.Font.Arimo
Title.Text = "Aimbot"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000
Title.TextWrapped = true

ESP.Name = "ESP"
ESP.Parent = Buttons
ESP.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ESP.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESP.BorderSizePixel = 0
ESP.Position = UDim2.new(0.424494237, 0, 0.144451067, 0)
ESP.Size = UDim2.new(0.150000006, 0, 0.300000012, 0)
ESP.Font = Enum.Font.Arimo
ESP.Text = ""
ESP.TextColor3 = Color3.fromRGB(0, 0, 0)
ESP.TextSize = 14.000

UICorner_3.Parent = ESP

Title_2.Name = "Title"
Title_2.Parent = ESP
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(-0.155617788, 0, 0.999999702, 0)
Title_2.Size = UDim2.new(1.29999995, 0, 0.5, 0)
Title_2.Font = Enum.Font.Arimo
Title_2.Text = "ESP"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000
Title_2.TextWrapped = true

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = Buttons
InfiniteYield.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
InfiniteYield.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.BorderSizePixel = 0
InfiniteYield.Position = UDim2.new(0.674494267, 0, 0.144451067, 0)
InfiniteYield.Size = UDim2.new(0.150000006, 0, 0.300000012, 0)
InfiniteYield.Font = Enum.Font.Arimo
InfiniteYield.Text = ""
InfiniteYield.TextColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.TextSize = 14.000

UICorner_4.Parent = InfiniteYield

Title_3.Name = "Title"
Title_3.Parent = InfiniteYield
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(-0.155617788, 0, 0.999999702, 0)
Title_3.Size = UDim2.new(1.29999995, 0, 0.5, 0)
Title_3.Font = Enum.Font.Arimo
Title_3.Text = "Infinite"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 16.000
Title_3.TextWrapped = true

Title2.Name = "Title2"
Title2.Parent = InfiniteYield
Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title2.BackgroundTransparency = 1.000
Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title2.BorderSizePixel = 0
Title2.Position = UDim2.new(-0.155617788, 0, 1.49849105, 0)
Title2.Size = UDim2.new(1.29999995, 0, 0.5, 0)
Title2.Font = Enum.Font.Arimo
Title2.Text = "Yield"
Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title2.TextSize = 16.000
Title2.TextWrapped = true

UICorner_5.Parent = Frame

CloseUI.Name = "CloseUI"
CloseUI.Parent = Frame
CloseUI.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.BorderSizePixel = 0
CloseUI.Position = UDim2.new(0.928011298, 0, 0, 0)
CloseUI.Size = UDim2.new(0.0700000003, 0, 0.100000001, 0)
CloseUI.ZIndex = 2
CloseUI.Font = Enum.Font.Arimo
CloseUI.Text = "X"
CloseUI.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseUI.TextScaled = true
CloseUI.TextSize = 14.000
CloseUI.TextWrapped = true

local configK3S = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)

function LoadUI()
	local configK2 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local configK4 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local configK5 = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local configK6 = TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	
	Buttons.BackgroundTransparency = 1
	CloseUI.BackgroundTransparency = 1
	CloseUI.TextTransparency = 1
	GameTitle.TextTransparency = 1
	
	for i,v in ipairs(Buttons:GetDescendants()) do
		if v:IsA("TextButton") then
			v.BackgroundTransparency = 1
		elseif v:IsA("TextLabel") then
			v.TextTransparency = 1
		end
	end	
	
	TweenService:Create(Frame, configK4, {Size = UDim2.new(0.3, 0, 0.1, 0)}):Play()
	wait(0.5)
	TweenService:Create(GameTitle, configK2, {TextTransparency = 0}):Play()
	TweenService:Create(Frame, configK5, {Size = UDim2.new(0.3,0,0.35,0)}):Play()
	wait(1.1)
	TweenService:Create(GameTitle, configK6, {Position = UDim2.new(0.5, 0,0.08, 0)}):Play()
	wait(0.8)
	TweenService:Create(Buttons, configK2, {BackgroundTransparency = 0}):Play()
	
	for i,v in ipairs(Buttons:GetDescendants()) do
		if v:IsA("TextButton") then
			TweenService:Create(v, configK2, {BackgroundTransparency = 0}):Play()
		elseif v:IsA("TextLabel") then
			TweenService:Create(v, configK2, {TextTransparency = 0}):Play()
		end
	end	
	TweenService:Create(CloseUI, configK2, {TextTransparency = 0}):Play()
	TweenService:Create(CloseUI, configK2, {BackgroundTransparency = 0}):Play()
end

LoadUI()

local function update(input)
	local delta = input.Position - StartingPoint
	Frame.Position = UDim2.new(oldPos.X.Scale, oldPos.X.Offset + delta.X, oldPos.Y.Scale, oldPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		IsDragging = true
		StartingPoint = input.Position
		oldPos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				IsDragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

Frame.InputChanged:Connect(function(input)
	if input == dragInput and IsDragging then
		update(input)
	end
end)

CloseUI.MouseButton1Click:Connect(function()
	Chaos:Destroy()
end)

Aimbot.MouseButton1Click:Connect(function()
	if not AimbotClicked then
		AimbotClicked = true
		shared.settings.killaura = true
		TweenService:Create(Aimbot, configK3S, {BackgroundColor3 = Color3.fromRGB(0, 170, 0)}):Play()
		local function getchar(plr,yield)
			local plr = plr or LocalPlayer
			return plr.Character or yield and plr.CharacterAdded:Wait()
		end

		local function gethumanoid(plr,yield)
			local plr = plr or LocalPlayer
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
				if v ~= LocalPlayer then
					local char = getchar(v)
					if char and not char:FindFirstChildWhichIsA("ForceField") then
						local BasePart = char:FindFirstChildWhichIsA("BasePart")
						local Humanoid = gethumanoid(v)
						local DistanceFromTarget = BasePart and LocalPlayer:DistanceFromCharacter(BasePart.CFrame.Position)

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
						warn("[ANAN XD KILLAURA ]: Attacked {",Target,"}  from  {",Distance,"}  studs away")
					end
				end
			end
			task.wait()
		until not shared.settings.killaura 
	elseif AimbotClicked then
		AimbotClicked = false
		shared.settings.killaura = false
		TweenService:Create(Aimbot, configK3S, {BackgroundColor3 = Color3.fromRGB(170, 0, 0)}):Play()
	end
end)

ESP.MouseButton1Click:Connect(function()
	if not ESPClicked then
		ESPClicked = true
		ToggleESP = true
		TweenService:Create(ESP, configK3S, {BackgroundColor3 = Color3.fromRGB(0, 170, 0)}):Play()
		
		while task.wait() do
			if not ToggleESP then
				break
			end
			if DebounceForESP then 
				return 
			end
			DebounceForESP = true

			pcall(function()
				for i,v in pairs(Players:GetChildren()) do
					if v:IsA("Player") then
						if v ~= LocalPlayer then
							if v.Character then

								local pos = math.floor(((LocalPlayer.Character:FindFirstChild("HumanoidRootPart")).Position - (v.Character:FindFirstChild("HumanoidRootPart")).Position).magnitude)

								if v.Character:FindFirstChild("Totally NOT Esp") == nil and v.Character:FindFirstChild("Icon") == nil and TeamCheckESP == false then
									local ESP = Instance.new("Highlight", v.Character)

									ESP.Name = "Totally NOT Esp"
									ESP.Adornee = v.Character
									ESP.Archivable = true
									ESP.Enabled = true
									ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
									ESP.FillColor = v.TeamColor.Color
									ESP.FillTransparency = 0.5
									ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
									ESP.OutlineTransparency = 0

									--//ESP-Text\\--
									local Icon = Instance.new("BillboardGui", v.Character)
									local ESPText = Instance.new("TextLabel")

									Icon.Name = "Icon"
									Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
									Icon.Active = true
									Icon.AlwaysOnTop = true
									Icon.ExtentsOffset = Vector3.new(0, 1, 0)
									Icon.LightInfluence = 1.000
									Icon.Size = UDim2.new(0, 800, 0, 50)

									ESPText.Name = "ESP Text"
									ESPText.Parent = Icon
									ESPText.BackgroundColor3 = v.TeamColor.Color
									ESPText.BackgroundTransparency = 1.000
									ESPText.Size = UDim2.new(0, 800, 0, 50)
									ESPText.Font = Enum.Font.SciFi
									ESPText.Text = v[PlayerNameESP].." | Distance: "..pos
									ESPText.TextColor3 = v.TeamColor.Color
									ESPText.TextSize = 18.000
									ESPText.TextWrapped = true
								else
									if v.TeamColor ~= LocalPlayer.TeamColor and v.Character:FindFirstChild("Totally NOT Esp") == nil and v.Character:FindFirstChild("Icon") == nil and TeamCheckESP == true then
										--//ESP-Highlight\\--
										local ESP = Instance.new("Highlight", v.Character)

										ESP.Name = "Totally NOT Esp"
										ESP.Adornee = v.Character
										ESP.Archivable = true
										ESP.Enabled = true
										ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										ESP.FillColor = v.TeamColor.Color
										ESP.FillTransparency = 0.5
										ESP.OutlineColor = Color3.fromRGB(255, 255, 255)
										ESP.OutlineTransparency = 0

										--//ESP-Text\\--
										local Icon = Instance.new("BillboardGui", v.Character)
										local ESPText = Instance.new("TextLabel")

										Icon.Name = "Icon"
										Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
										Icon.Active = true
										Icon.AlwaysOnTop = true
										Icon.ExtentsOffset = Vector3.new(0, 1, 0)
										Icon.LightInfluence = 1.000
										Icon.Size = UDim2.new(0, 800, 0, 50)

										ESPText.Name = "ESP Text"
										ESPText.Parent = Icon
										ESPText.BackgroundColor3 = v.TeamColor.Color
										ESPText.BackgroundTransparency = 1.000
										ESPText.Size = UDim2.new(0, 800, 0, 50)
										ESPText.Font = Enum.Font.SciFi
										ESPText.Text = v[PlayerNameESP].." | Distance: "..pos
										ESPText.TextColor3 = v.TeamColor.Color
										ESPText.TextSize = 18.000
										ESPText.TextWrapped = true
									else
										if not v.Character:FindFirstChild("Totally NOT Esp").FillColor == v.TeamColor.Color and not v.Character:FindFirstChild("Icon").TextColor3 == v.TeamColor.Color then
											v.Character:FindFirstChild("Totally NOT Esp").FillColor = v.TeamColor.Color
											v.Character:FindFirstChild("Icon").TextColor3 = v.TeamColor.Color
										else
											if v.Character:FindFirstChild("Totally NOT Esp").Enabled == false and v.Character:FindFirstChild("Icon").Enabled == false then
												v.Character:FindFirstChild("Totally NOT Esp").Enabled = true
												v.Character:FindFirstChild("Icon").Enabled = true
											else
												if v.Character:FindFirstChild("Icon") then
													v.Character:FindFirstChild("Icon")["ESP Text"].Text = v[PlayerNameESP].." | Distance: "..pos
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end)

			wait()

			DebounceForESP = false
		end
	elseif ESPClicked then
		ESPClicked = false
		ToggleESP = false
		
		for i, v in ipairs(workspace:GetDescendants()) do
			if v.Name == "Totally NOT Esp" then
				v:Destroy()
			end
		end
		
		TweenService:Create(ESP, configK3S, {BackgroundColor3 = Color3.fromRGB(170, 0, 0)}):Play()
	end
end)

InfiniteYield.MouseButton1Click:Connect(function()
	if not InfiniteYieldClicked then
		InfiniteYieldClicked = true
		TweenService:Create(InfiniteYield, configK3S, {BackgroundColor3 = Color3.fromRGB(0, 170, 0)}):Play()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	elseif InfiniteYieldClicked then
		warn("[ ANAN XD ]: You can't disable infinite yield!")
	end
end)

UICorner_6.Parent = CloseUI
