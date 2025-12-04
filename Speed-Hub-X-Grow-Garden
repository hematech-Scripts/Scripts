--==========================
--     CONFIG
--==========================
local SCRIPT_NAME = "My Script"
local CHANNEL_NAME = "My Channel"
local CHANNEL_LINK = "https://youtube.com/yourchannel"
local IMAGE_URL = "https://i.imgur.com/yourimage.png"
local LOADING_TIME = 10 -- seconds

--==========================
--     UI CREATOR
--==========================
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- إنشاء واجهة تأخذ الشاشة كاملة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

-- Blur Effect للخلفية
local Blur = Instance.new("BlurEffect")
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0
Blur.Name = "LoadingBlurEffect"

-- إطار خلفية داكنة شفافة فوق Blur
local DarkOverlay = Instance.new("Frame")
DarkOverlay.Parent = ScreenGui
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.Position = UDim2.new(0, 0, 0, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkOverlay.BackgroundTransparency = 0.7 -- شفافية متوسطة
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 1

-- الإطار الرئيسي (متناسب مع حجم الشاشة)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.8, 0, 0.7, 0) -- نسبة 80% عرض، 70% ارتفاع
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25) -- خلفية داكنة
MainFrame.BackgroundTransparency = 0.1 -- شفافية خفيفة
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2 -- فوق الخلفية

-- إضافة زوايا مدورة
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 20)

-- إضافة ظل أنيق
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 80, 80)
UIStroke.Thickness = 3
UIStroke.Transparency = 0

-- Header مع تدرج لوني
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0.15, 0) -- نسبة 15% من الارتفاع
Header.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Header.BorderSizePixel = 0
Header.BackgroundTransparency = 0

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Parent = Header
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
})

-- إضافة زوايا مدورة للهيدر
local HeaderCorner = Instance.new("UICorner")
HeaderCorner.Parent = Header
HeaderCorner.CornerRadius = UDim.new(0, 20)

-- Title في الهيدر
local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.1, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = SCRIPT_NAME
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Center

-- رمز إغلاق (للزينة)
local CloseIcon = Instance.new("TextLabel")
CloseIcon.Parent = Header
CloseIcon.Size = UDim2.new(0.1, 0, 0.8, 0)
CloseIcon.Position = UDim2.new(0.9, 0, 0.1, 0)
CloseIcon.BackgroundTransparency = 1
CloseIcon.Text = "×"
CloseIcon.TextSize = 36
CloseIcon.Font = Enum.Font.GothamBold
CloseIcon.TextColor3 = Color3.fromRGB(255, 255, 255)

-- صورة قناة أنيقة في المنتصف
local ImageContainer = Instance.new("Frame")
ImageContainer.Parent = MainFrame
ImageContainer.Size = UDim2.new(0.25, 0, 0.25, 0) -- نسبة 25%
ImageContainer.Position = UDim2.new(0.5, 0, 0.3, 0)
ImageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
ImageContainer.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ImageContainer.BorderSizePixel = 0
ImageContainer.BackgroundTransparency = 0

local ImageCorner = Instance.new("UICorner")
ImageCorner.Parent = ImageContainer
ImageCorner.CornerRadius = UDim.new(1, 0) -- دائري بالكامل

local Image = Instance.new("ImageLabel")
Image.Parent = ImageContainer
Image.Size = UDim2.new(0.95, 0, 0.95, 0)
Image.Position = UDim2.new(0.025, 0, 0.025, 0)
Image.BackgroundTransparency = 1
Image.Image = IMAGE_URL
Image.ScaleType = Enum.ScaleType.Crop

local ImageCorner2 = Instance.new("UICorner")
ImageCorner2.Parent = Image
ImageCorner2.CornerRadius = UDim.new(1, 0)

-- Channel Name تحت الصورة
local ChannelContainer = Instance.new("Frame")
ChannelContainer.Parent = MainFrame
ChannelContainer.Size = UDim2.new(0.8, 0, 0.08, 0)
ChannelContainer.Position = UDim2.new(0.5, 0, 0.55, 0)
ChannelContainer.AnchorPoint = Vector2.new(0.5, 0.5)
ChannelContainer.BackgroundTransparency = 1

local Channel = Instance.new("TextLabel")
Channel.Parent = ChannelContainer
Channel.Size = UDim2.new(1, 0, 1, 0)
Channel.BackgroundTransparency = 1
Channel.Text = CHANNEL_NAME
Channel.Font = Enum.Font.GothamSemibold
Channel.TextSize = 22
Channel.TextColor3 = Color3.fromRGB(220, 220, 220)
Channel.TextXAlignment = Enum.TextXAlignment.Center

-- Copy Button كبير وواضح
local CopyButton = Instance.new("TextButton")
CopyButton.Parent = MainFrame
CopyButton.Size = UDim2.new(0.6, 0, 0.12, 0) -- نسبة 60% عرض، 12% ارتفاع
CopyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
CopyButton.AnchorPoint = Vector2.new(0.5, 0.5)
CopyButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CopyButton.Text = "📋 Copy Channel Link"
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.TextSize = 20
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.AutoButtonColor = false
CopyButton.BackgroundTransparency = 0
CopyButton.TextTransparency = 0
CopyButton.ZIndex = 3 -- فوق كل شيء

local CopyButtonCorner = Instance.new("UICorner")
CopyButtonCorner.Parent = CopyButton
CopyButtonCorner.CornerRadius = UDim.new(0, 12)

local CopyButtonGradient = Instance.new("UIGradient")
CopyButtonGradient.Parent = CopyButton
CopyButtonGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
})

-- Status / Loading Bar
local StatusContainer = Instance.new("Frame")
StatusContainer.Parent = MainFrame
StatusContainer.Size = UDim2.new(0.8, 0, 0.08, 0)
StatusContainer.Position = UDim2.new(0.5, 0, 0.85, 0)
StatusContainer.AnchorPoint = Vector2.new(0.5, 0.5)
StatusContainer.BackgroundTransparency = 1

local StatusText = Instance.new("TextLabel")
StatusText.Parent = StatusContainer
StatusText.Size = UDim2.new(1, 0, 0.4, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Loading script..."
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 16
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.TextXAlignment = Enum.TextXAlignment.Center

local StatusBarBG = Instance.new("Frame")
StatusBarBG.Parent = StatusContainer
StatusBarBG.Size = UDim2.new(1, 0, 0.6, 0)
StatusBarBG.Position = UDim2.new(0, 0, 0.4, 0)
StatusBarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
StatusBarBG.BorderSizePixel = 0
StatusBarBG.BackgroundTransparency = 0

local StatusBarBGCorner = Instance.new("UICorner")
StatusBarBGCorner.Parent = StatusBarBG
StatusBarBGCorner.CornerRadius = UDim.new(0, 8)

local StatusBar = Instance.new("Frame")
StatusBar.Parent = StatusBarBG
StatusBar.Size = UDim2.new(0, 0, 1, 0)
StatusBar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
StatusBar.BorderSizePixel = 0
StatusBar.BackgroundTransparency = 0

local StatusBarCorner = Instance.new("UICorner")
StatusBarCorner.Parent = StatusBar
StatusBarCorner.CornerRadius = UDim.new(0, 8)

-- مؤشر الوقت المتبقي
local TimerText = Instance.new("TextLabel")
TimerText.Parent = StatusContainer
TimerText.Size = UDim2.new(0.2, 0, 0.6, 0)
TimerText.Position = UDim2.new(1.05, 0, 0.4, 0)
TimerText.BackgroundTransparency = 1
TimerText.Text = LOADING_TIME .. "s"
TimerText.Font = Enum.Font.GothamBold
TimerText.TextSize = 16
TimerText.TextColor3 = Color3.fromRGB(255, 80, 80)

--==========================
--     ANIMATIONS
--==========================

-- إخفاء العناصر في البداية للأنيميشن
MainFrame.Position = UDim2.new(0.5, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0.7, 0, 0.5, 0)
MainFrame.BackgroundTransparency = 1

-- أنيميشن ظهور Blur
local blurTween = TweenService:Create(
    Blur, 
    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = 15}
)
blurTween:Play()

-- ظهور الخلفية الداكنة
local darkTween = TweenService:Create(
    DarkOverlay,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.7}
)
darkTween:Play()

-- ظهور الإطار الرئيسي
task.wait(0.3)

local frameTween1 = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0.1
    }
)
frameTween1:Play()

local frameTween2 = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    {Size = UDim2.new(0.8, 0, 0.7, 0)}
)
frameTween2:Play()

-- ظهور الصورة مع تأثير
task.wait(0.4)
ImageContainer.Size = UDim2.new(0.1, 0, 0.1, 0)
local imageTween = TweenService:Create(
    ImageContainer,
    TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    {Size = UDim2.new(0.25, 0, 0.25, 0)}
)
imageTween:Play()

--==========================
--     COPY BUTTON مع تأثيرات
--==========================
CopyButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.65, 0, 0.13, 0),
            BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        }
    )
    hoverTween:Play()
    
    -- تأثير اهتزاز خفيف
    local shakeTween = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Rotation = 2}
    )
    shakeTween:Play()
    task.wait(0.1)
    local shakeBackTween = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Rotation = 0}
    )
    shakeBackTween:Play()
end)

CopyButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.6, 0, 0.12, 0),
            BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        }
    )
    leaveTween:Play()
end)

CopyButton.MouseButton1Click:Connect(function()
    setclipboard(CHANNEL_LINK)
    
    -- تأثير النقر
    local clickTween1 = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.58, 0, 0.11, 0)}
    )
    clickTween1:Play()
    
    task.wait(0.1)
    
    local clickTween2 = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.6, 0, 0.12, 0)}
    )
    clickTween2:Play()
    
    -- تغيير النص واللون
    CopyButton.Text = "✅ Copied!"
    CopyButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
    
    task.wait(1.5)
    
    -- العودة إلى الحالة الأصلية
    CopyButton.Text = "📋 Copy Channel Link"
    CopyButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
end)

--==========================
--     LOADING TIMER & BAR
--==========================
local timeLeft = LOADING_TIME
local connection

-- تحديث شريط التقدم مع الوقت
local function updateLoadingBar()
    if timeLeft > 0 then
        local pct = 1 - (timeLeft / LOADING_TIME)
        
        -- تحديث شريط التقدم
        StatusBar.Size = UDim2.new(pct, 0, 1, 0)
        
        -- تحديث مؤشر الوقت
        TimerText.Text = string.format("%.1fs", timeLeft)
        
        timeLeft = timeLeft - 0.1
    else
        connection:Disconnect()
    end
end

-- بدء التحديث
connection = RunService.Heartbeat:Connect(function()
    updateLoadingBar()
end)

-- الانتظار حتى انتهاء الوقت
task.wait(LOADING_TIME + 0.5)

--==========================
--     ANIMATION EXIT
--==========================

-- إخفاء الإطار الرئيسي
local frameOutTween = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    {
        Position = UDim2.new(0.5, 0, 1.2, 0),
        BackgroundTransparency = 1
    }
)
frameOutTween:Play()

-- إخفاء الخلفية الداكنة
local darkOutTween = TweenService:Create(
    DarkOverlay,
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {BackgroundTransparency = 1}
)
darkOutTween:Play()

-- إزالة Blur
local blurOutTween = TweenService:Create(
    Blur, 
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {Size = 0}
)
blurOutTween:Play()

-- الانتظار حتى اكتمال الأنيميشن
task.wait(0.8)

-- تنظيف
ScreenGui:Destroy()
Blur:Destroy()

--==========================
--     EXECUTE MAIN SCRIPT
--==========================
loadstring(game:HttpGet("https://raw.githubusercontent.com/ShxDrag/Scripty/refs/heads/main/BESTSPAWNGAG.lua"))()
