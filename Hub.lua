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

function enableClientAntikick()
	local Players = game:GetService("Players")
	if not hookmetamethod then 
		createNotification("Uyarı!", "Hileniz (HookMetaMethod) fonksiyonunu desteklemiyor.", 3, 150, "Tr. Red")
		return
	end
	local LocalPlayer = Players.LocalPlayer
	local oldhmmi
	local oldhmmnc
	oldhmmi = hookmetamethod(game, "__index", function(self, method)
		if self == LocalPlayer and method:lower() == "kick" then
			return error("Expected ':' not '.' calling member function Kick", 2)
		end
		return oldhmmi(self, method)
	end)
	oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
		if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
			return
		end
		return oldhmmnc(self, ...)
	end)
end

print("Enabling Anti Kick")
enableClientAntikick()

if game.PlaceId == 6441847031 then
  print("Detected:Chaos")
  createNotification("[Chaos]Oyun Destekleniyor!", "lütfen kodun çalıştırılmasını Bekleyiniz..", 2, 100, "Tr. Green")
  loadstring(game:HttpGet('https://raw.githubusercontent.com/MaymunAb/ArdaT/main/Chaos.lua'))()
elseif game.PlaceId == 286090429 then
  print("Detected:Arsenal")
  createNotification("[Arsenal]Oyun Destekleniyor!", "lütfen kodun çalıştırılmasını Bekleyiniz..", 2, 100, "Tr. Green")
  loadstring(game:HttpGet('https://raw.githubusercontent.com/MaymunAb/ArdaT/main/Arsenal.lua'))()
elseif game.PlaceId == 4991214437 then
  print("Detected:Town")
  createNotification("[Town]Oyun Destekleniyor!", "lütfen kodun çalıştırılmasını Bekleyiniz..", 2, 100, "Tr. Green")
  loadstring(game:HttpGet('https://raw.githubusercontent.com/MaymunAb/ArdaT/main/Town.lua'))()
else
  createNotification("Oyun Desteklenmiyor", "Lütfen ArdaT'ın Desteklenen Oyunlar Listesine Bakınız", 2, 100, "Tr. Red")
end
