--==========================
--     CONFIG
--==========================
local SCRIPT_NAME = "Speed Hub"
local CHANNEL_NAME = "HemaTech_1"
local CHANNEL_LINK = "https://youtube.com/@hema_tech1?si=G3HLZR7tmOwXdUAl"
local IMAGE_URL = "https://i.ibb.co/DDjF2c9N/20251003-134219.png"
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
DarkOverlay.BackgroundTransparency = 0.6 -- شفافية متوسطة
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 1

-- الإطار الرئيسي (متناسب مع حجم الشاشة)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.8, 0, 0.75, 0) -- نسبة 80% عرض، 75% ارتفاع
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- خلفية داكنة
MainFrame.BackgroundTransparency = 0 -- واضح تماماً
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2 -- فوق الخلفية

-- إضافة زوايا مدورة
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 15)

-- إضافة ظل أنيق
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 80, 80)
UIStroke.Thickness = 3
UIStroke.Transparency = 0

-- Header مع تدرج لوني
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0.13, 0) -- نسبة 13% من الارتفاع
Header.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Header.BorderSizePixel = 0
Header.BackgroundTransparency = 0
Header.ZIndex = 3

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Parent = Header
HeaderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 90, 90)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 70, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
})

-- إضافة زوايا مدورة للهيدر
local HeaderCorner = Instance.new("UICorner")
HeaderCorner.Parent = Header
HeaderCorner.CornerRadius = UDim.new(0, 15)

-- Title في الهيدر - واضح جداً
local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.Size = UDim2.new(0.9, 0, 0.8, 0)
Title.Position = UDim2.new(0.05, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = SCRIPT_NAME
Title.TextSize = 32
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.TextTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.TextStrokeTransparency = 0.7
Title.ZIndex = 4

-- صورة قناة أنيقة في المنتصف - تم إصلاحها
local ImageContainer = Instance.new("Frame")
ImageContainer.Parent = MainFrame
ImageContainer.Size = UDim2.new(0.22, 0, 0.22, 0) -- نسبة 22%
ImageContainer.Position = UDim2.new(0.5, 0, 0.25, 0)
ImageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
ImageContainer.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ImageContainer.BorderSizePixel = 0
ImageContainer.BackgroundTransparency = 0
ImageContainer.ZIndex = 3

local ImageCorner = Instance.new("UICorner")
ImageCorner.Parent = ImageContainer
ImageCorner.CornerRadius = UDim.new(1, 0) -- دائري بالكامل

local Image = Instance.new("ImageLabel")
Image.Parent = ImageContainer
Image.Size = UDim2.new(1, 0, 1, 0) -- تغيير من 0.95 إلى 1
Image.Position = UDim2.new(0, 0, 0, 0) -- تغيير من 0.025 إلى 0
Image.BackgroundTransparency = 1
Image.Image = IMAGE_URL
Image.ScaleType = Enum.ScaleType.Crop -- استخدام Fit بدلاً من Crop إذا كانت الصورة تظهر مقصوصة
Image.ZIndex = 4

-- Channel Name تحت الصورة - في المنتصف
local ChannelContainer = Instance.new("Frame")
ChannelContainer.Parent = MainFrame
ChannelContainer.Size = UDim2.new(0.9, 0, 0.08, 0)
ChannelContainer.Position = UDim2.new(0.5, 0, 0.45, 0)
ChannelContainer.AnchorPoint = Vector2.new(0.5, 0.5)
ChannelContainer.BackgroundTransparency = 1
ChannelContainer.ZIndex = 3

local Channel = Instance.new("TextLabel")
Channel.Parent = ChannelContainer
Channel.Size = UDim2.new(1, 0, 1, 0) -- تغيير من 0.8 إلى 1
Channel.Position = UDim2.new(0, 0, 0, 0) -- تغيير من 0.15 إلى 0
Channel.BackgroundTransparency = 1
Channel.Text = "🎬 " .. CHANNEL_NAME -- إضافة أيقونة
Channel.Font = Enum.Font.GothamBold
Channel.TextSize = 24
Channel.TextColor3 = Color3.fromRGB(240, 240, 240)
Channel.TextXAlignment = Enum.TextXAlignment.Center -- تغيير من Left إلى Center
Channel.TextTransparency = 0
Channel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Channel.TextStrokeTransparency = 0.8
Channel.ZIndex = 4

-- Copy Button كبير وواضح جداً
local CopyButton = Instance.new("TextButton")
CopyButton.Parent = MainFrame
CopyButton.Size = UDim2.new(0.65, 0, 0.12, 0) -- نسبة 65% عرض، 12% ارتفاع
CopyButton.Position = UDim2.new(0.5, 0, 0.62, 0)
CopyButton.AnchorPoint = Vector2.new(0.5, 0.5)
CopyButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CopyButton.Text = "📋 COPY CHANNEL LINK"
CopyButton.Font = Enum.Font.GothamBlack
CopyButton.TextSize = 22
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.AutoButtonColor = false
CopyButton.BackgroundTransparency = 0
CopyButton.TextTransparency = 0
CopyButton.ZIndex = 3

local CopyButtonCorner = Instance.new("UICorner")
CopyButtonCorner.Parent = CopyButton
CopyButtonCorner.CornerRadius = UDim.new(0, 12)

local CopyButtonGradient = Instance.new("UIGradient")
CopyButtonGradient.Parent = CopyButton
CopyButtonGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
})

-- إضافة تأثير النص للزر
local CopyButtonStroke = Instance.new("UIStroke")
CopyButtonStroke.Parent = CopyButton
CopyButtonStroke.Color = Color3.fromRGB(255, 255, 255)
CopyButtonStroke.Thickness = 2
CopyButtonStroke.Transparency = 0.5

-- Status / Loading Bar مع نص التحميل المتغير
local StatusContainer = Instance.new("Frame")
StatusContainer.Parent = MainFrame
StatusContainer.Size = UDim2.new(0.85, 0, 0.1, 0)
StatusContainer.Position = UDim2.new(0.5, 0, 0.78, 0)
StatusContainer.AnchorPoint = Vector2.new(0.5, 0.5)
StatusContainer.BackgroundTransparency = 1
StatusContainer.ZIndex = 3

-- نص التحميل المتغير
local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = StatusContainer
LoadingText.Size = UDim2.new(1, 0, 0.4, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "🔄 INITIALIZING..."
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextSize = 18
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextXAlignment = Enum.TextXAlignment.Center
LoadingText.TextTransparency = 0
LoadingText.ZIndex = 4

-- Progress Bar Container
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Parent = StatusContainer
ProgressContainer.Size = UDim2.new(1, 0, 0.5, 0)
ProgressContainer.Position = UDim2.new(0, 0, 0.45, 0)
ProgressContainer.BackgroundTransparency = 1

-- Progress Bar Background
local ProgressBarBG = Instance.new("Frame")
ProgressBarBG.Parent = ProgressContainer
ProgressBarBG.Size = UDim2.new(0.8, 0, 1, 0)
ProgressBarBG.Position = UDim2.new(0.1, 0, 0, 0)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ProgressBarBG.BorderSizePixel = 0
ProgressBarBG.BackgroundTransparency = 0
ProgressBarBG.ZIndex = 3

local ProgressBarBGCorner = Instance.new("UICorner")
ProgressBarBGCorner.Parent = ProgressBarBG
ProgressBarBGCorner.CornerRadius = UDim.new(0, 8)

-- Progress Bar Fill
local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = ProgressBarBG
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ProgressBar.BorderSizePixel = 0
ProgressBar.BackgroundTransparency = 0
ProgressBar.ZIndex = 4

local ProgressBarCorner = Instance.new("UICorner")
ProgressBarCorner.Parent = ProgressBar
ProgressBarCorner.CornerRadius = UDim.new(0, 8)

local ProgressBarGradient = Instance.new("UIGradient")
ProgressBarGradient.Parent = ProgressBar
ProgressBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 120)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
})

-- مؤشر الوقت المتبقي - واضح جداً
local TimerText = Instance.new("TextLabel")
TimerText.Parent = ProgressContainer
TimerText.Size = UDim2.new(0.15, 0, 1, 0)
TimerText.Position = UDim2.new(0.95, 0, 0, 0)
TimerText.BackgroundTransparency = 1
TimerText.Text = LOADING_TIME .. "s"
TimerText.Font = Enum.Font.GothamBlack
TimerText.TextSize = 18
TimerText.TextColor3 = Color3.fromRGB(255, 80, 80)
TimerText.TextTransparency = 0
TimerText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TimerText.TextStrokeTransparency = 0.7
TimerText.ZIndex = 4

-- Loading Dots Animation (النقاط المتحركة)
local LoadingDots = Instance.new("TextLabel")
LoadingDots.Parent = StatusContainer
LoadingDots.Size = UDim2.new(0.2, 0, 0.3, 0)
LoadingDots.Position = UDim2.new(0.9, 0, 0.05, 0)
LoadingDots.BackgroundTransparency = 1
LoadingDots.Text = ""
LoadingDots.Font = Enum.Font.GothamBold
LoadingDots.TextSize = 24
LoadingDots.TextColor3 = Color3.fromRGB(255, 80, 80)
LoadingDots.TextTransparency = 0
LoadingDots.ZIndex = 4

--==========================
--     ANIMATIONS
--==========================

-- إخفاء العناصر في البداية للأنيميشن
MainFrame.Position = UDim2.new(0.5, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0.7, 0, 0.55, 0)
MainFrame.BackgroundTransparency = 0.8

-- أنيميشن ظهور Blur
local blurTween = TweenService:Create(
    Blur, 
    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = 20}
)
blurTween:Play()

-- ظهور الخلفية الداكنة
local darkTween = TweenService:Create(
    DarkOverlay,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.6}
)
darkTween:Play()

-- ظهور الإطار الرئيسي
task.wait(0.3)

local frameTween1 = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0
    }
)
frameTween1:Play()

local frameTween2 = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.9, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    {Size = UDim2.new(0.8, 0, 0.75, 0)}
)
frameTween2:Play()

-- ظهور الصورة مع تأثير
task.wait(0.4)
ImageContainer.Size = UDim2.new(0.1, 0, 0.1, 0)
local imageTween = TweenService:Create(
    ImageContainer,
    TweenInfo.new(0.8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    {Size = UDim2.new(0.22, 0, 0.22, 0)}
)
imageTween:Play()

--==========================
--     COPY BUTTON مع تأثيرات متطورة
--==========================
CopyButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.68, 0, 0.13, 0),
            BackgroundColor3 = Color3.fromRGB(255, 80, 80)
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
            Size = UDim2.new(0.65, 0, 0.12, 0),
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
        {Size = UDim2.new(0.63, 0, 0.11, 0)}
    )
    clickTween1:Play()
    
    task.wait(0.1)
    
    local clickTween2 = TweenService:Create(
        CopyButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.65, 0, 0.12, 0)}
    )
    clickTween2:Play()
    
    -- تغيير النص واللون
    local originalText = CopyButton.Text
    local originalColor = CopyButton.BackgroundColor3
    
    CopyButton.Text = "✅ COPIED!"
    CopyButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
    CopyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    
    task.wait(1.5)
    
    -- العودة إلى الحالة الأصلية
    CopyButton.Text = originalText
    CopyButton.BackgroundColor3 = originalColor
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

--==========================
--     LOADING ANIMATION & PROGRESS
--==========================
local timeLeft = LOADING_TIME
local connection

-- قائمة نصوص التحميل
local loadingMessages = {
    "🔄 INITIALIZING...",
    "⚙️ LOADING ASSETS...",
    "🔧 CONFIGURING...",
    "🚀 PREPARING SCRIPT...",
    "🎮 ALMOST READY..."
}

local messageIndex = 1
local dotsAnimation = ""

-- وظيفة تحديث النقاط المتحركة
local function updateLoadingDots()
    dotsAnimation = dotsAnimation == "..." and "." or dotsAnimation .. "."
    LoadingDots.Text = dotsAnimation
end

-- وظيفة تغيير نص التحميل
local function updateLoadingMessage()
    LoadingText.Text = loadingMessages[messageIndex]
    messageIndex = messageIndex + 1
    if messageIndex > #loadingMessages then
        messageIndex = 1
    end
end

-- تحديث شريط التقدم مع الوقت
local function updateLoadingProgress()
    if timeLeft > 0 then
        local pct = 1 - (timeLeft / LOADING_TIME)
        
        -- تحديث شريط التقدم
        ProgressBar.Size = UDim2.new(pct, 0, 1, 0)
        
        -- تحديث مؤشر الوقت
        TimerText.Text = string.format("%.1fs", timeLeft)
        
        -- تغيير نص التحميل كل 2 ثانية
        if timeLeft % 2 < 0.1 then
            updateLoadingMessage()
        end
        
        -- تحديث النقاط المتحركة
        if timeLeft % 0.5 < 0.1 then
            updateLoadingDots()
        end
        
        timeLeft = timeLeft - 0.1
    else
        connection:Disconnect()
        LoadingText.Text = "✅ READY!"
        LoadingDots.Text = ""
    end
end

-- بدء التحديث
connection = RunService.Heartbeat:Connect(function()
    updateLoadingProgress()
end)

-- الانتظار حتى انتهاء الوقت
task.wait(LOADING_TIME + 0.5)

--==========================
--     ANIMATION EXIT
--==========================

-- تحديث النص النهائي
LoadingText.Text = "🚀 LAUNCHING SCRIPT..."
TimerText.Text = "0.0s"
ProgressBar.Size = UDim2.new(1, 0, 1, 0)

task.wait(0.5)

-- إخفاء الإطار الرئيسي
local frameOutTween = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    {
        Position = UDim2.new(0.5, 0, 1.3, 0),
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
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
