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
LoaderFrame.Position = UDim2.new(0.5, 0, 0.300000012, 0)
LoaderFrame.Size = UDim2.new(0, 0, 0.400000006, 0)
LoaderFrame.AnchorPoint = Vector2.new(0.5,0)

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
uiStroke.Color = Color3.new(0.372549, 1, 0.262745)
uiStroke.Thickness = 4

local uiStroke1 = Instance.new("UIStroke", BarBackground)
uiStroke1.Color = Color3.new(0.372549, 1, 0.262745)
uiStroke1.Thickness = 2

print("✅[ArdaT Client]:Loaded! ", versionText.Text)

local function Load()
	local tween = TweenService:Create(LoaderFrame, TweenInfo.new(0.6, Enum.EasingStyle.Sine ,Enum.EasingDirection.In, 0, false, 0.5), {Size = UDim2.new(0.3,0,0.4,0)}):Play()
	local barTween = TweenService:Create(Bar, TweenInfo.new(3, Enum.EasingStyle.Sine ,Enum.EasingDirection.In, 0, false, 0), {Size = UDim2.new(1,0,1,0)})
	wait(3)
	barTween:Play()
	wait(3.5)
	Loader:Destroy()
end

Load()
