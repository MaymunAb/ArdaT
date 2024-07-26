function createNotification(title, content, notificationTime, zindex, brickColor)
	print("Creating Notification")
	local TweenService = game:GetService("TweenService")
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
	
	local tween = TweenService:Create(Notification_2, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 0}):Play()
	wait(notificationTime)
	local tween = TweenService:Create(Notification_2, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
	wait(0.7)
	Notification:Destroy()
end

local TweenService = game:GetService("TweenService")

local Loader = Instance.new("ScreenGui")
local LoaderFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleText = Instance.new("TextLabel")
local versionText = Instance.new("TextLabel")
local BarBackground = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Bar = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local loadingText = Instance.new("TextLabel")

Loader.Name = "Loader"
Loader.Parent = game.CoreGui

LoaderFrame.Name = "LoaderFrame"
LoaderFrame.Parent = Loader
LoaderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
LoaderFrame.BorderSizePixel = 0
LoaderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoaderFrame.Size = UDim2.new(0, 0, 0, 0)
LoaderFrame.AnchorPoint = Vector2.new(0.5,0.5)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = LoaderFrame

TitleText.Name = "TitleText"
TitleText.Parent = LoaderFrame
TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1.000
TitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleText.BorderSizePixel = 0
TitleText.Position = UDim2.new(0, 0, 0.00999999978, 0)
TitleText.Size = UDim2.new(1, 0, 0.200000003, 0)
TitleText.Font = Enum.Font.Nunito
TitleText.Text = "ArdaT"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextScaled = true
TitleText.TextSize = 14.000
TitleText.TextWrapped = true

versionText.Name = "versionText"
versionText.Parent = LoaderFrame
versionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
versionText.BackgroundTransparency = 1.000
versionText.BorderColor3 = Color3.fromRGB(0, 0, 0)
versionText.BorderSizePixel = 0
versionText.Position = UDim2.new(0.00999999978, 0, 0.850000024, 0)
versionText.Size = UDim2.new(0.25, 0, 0.150000006, 0)
versionText.Font = Enum.Font.Nunito
versionText.Text = "Version:0.15"
versionText.TextColor3 = Color3.fromRGB(255, 255, 255)
versionText.TextScaled = true
versionText.TextSize = 14.000
versionText.TextWrapped = true

BarBackground.Name = "BarBackground"
BarBackground.Parent = LoaderFrame
BarBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BarBackground.BackgroundTransparency = 1.000
BarBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
BarBackground.BorderSizePixel = 0
BarBackground.Position = UDim2.new(0.150000006, 0, 0.600000024, 0)
BarBackground.Size = UDim2.new(0.699999988, 0, 0.100000001, 0)

UICorner_2.CornerRadius = UDim.new(0, 15)
UICorner_2.Parent = BarBackground

Bar.Name = "Bar"
Bar.Parent = BarBackground
Bar.BackgroundColor3 = Color3.fromRGB(182, 255, 169)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0, 0, 1, 0)

UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = Bar

loadingText.Name = "loadingText"
loadingText.Parent = LoaderFrame
loadingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1.000
loadingText.BorderColor3 = Color3.fromRGB(0, 0, 0)
loadingText.BorderSizePixel = 0
loadingText.Position = UDim2.new(0.149114519, 0, 0.420618594, 0)
loadingText.Size = UDim2.new(0.699999988, 0, 0.150000006, 0)
loadingText.Font = Enum.Font.Nunito
loadingText.Text = "Loading"
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextScaled = true
loadingText.TextSize = 14.000
loadingText.TextWrapped = true

local uiStroke = Instance.new("UIStroke", LoaderFrame)
uiStroke.Color = Color3.new(1,1,1)
uiStroke.Thickness = 4

local uiStroke1 = Instance.new("UIStroke", BarBackground)
uiStroke1.Color = Color3.new(1,1,1)
uiStroke1.Thickness = 2

print("✅[ArdaT Client]:Loaded! ", versionText.Text)

local function Load()
	createNotification("Notification", "ArdaT Is Loading", 3, 10, "Tr. Green")
	local tween = TweenService:Create(LoaderFrame, TweenInfo.new(1, Enum.EasingStyle.Cubic ,Enum.EasingDirection.InOut, 0, false, 0.5), {Size = UDim2.new(0.25,0,0.35,0)}):Play()
	local barTween = TweenService:Create(Bar, TweenInfo.new(3, Enum.EasingStyle.Quad ,Enum.EasingDirection.In, 0, false, 0), {Size = UDim2.new(1,0,1,0)})
	wait(3)
	barTween:Play()
	wait(3.5)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MaymunAb/ArdaT/main/GameSelector.lua'))()
	wait(0.01)
	Loader:Destroy()
end

Load()
