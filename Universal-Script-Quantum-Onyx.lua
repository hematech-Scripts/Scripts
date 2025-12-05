--==========================
--     CONFIG
--==========================
local SCRIPT_NAME = "Quantum-Onyx"
local CHANNEL_NAME = "HemaTech_1"
local CHANNEL_LINK = "https://youtube.com/@hema_tech1?si=G3HLZR7tmOwXdUAl"
local LOADING_TIME = 10 -- seconds
local SOUND_URL = "rbxassetid://84378944688963"

--==========================
--     UI CREATOR
--==========================
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

-- Create fullscreen interface
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

-- Blur Effect for background
local Blur = Instance.new("BlurEffect")
Blur.Parent = game:GetService("Lighting")
Blur.Size = 0
Blur.Name = "LoadingBlurEffect"

-- Dark transparent overlay above Blur
local DarkOverlay = Instance.new("Frame")
DarkOverlay.Parent = ScreenGui
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.Position = UDim2.new(0, 0, 0, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkOverlay.BackgroundTransparency = 0.6
DarkOverlay.BorderSizePixel = 0
DarkOverlay.ZIndex = 1

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.75, 0, 0.65, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 15)

-- Add elegant shadow
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 80, 80)
UIStroke.Thickness = 3
UIStroke.Transparency = 0

-- Header with gradient
local Header = Instance.new("Frame")
Header.Parent = MainFrame
Header.Size = UDim2.new(1, 0, 0.18, 0)
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

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.Parent = Header
HeaderCorner.CornerRadius = UDim.new(0, 15)

-- Title in header
local Title = Instance.new("TextLabel")
Title.Parent = Header
Title.Size = UDim2.new(1, 0, 0.8, 0)
Title.Position = UDim2.new(0, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = SCRIPT_NAME
Title.TextSize = 36
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.TextTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.TextStrokeTransparency = 0.5
Title.ZIndex = 4

-- Channel Name with YouTube logo
local ChannelContainer = Instance.new("Frame")
ChannelContainer.Parent = MainFrame
ChannelContainer.Size = UDim2.new(0.85, 0, 0.15, 0)
ChannelContainer.Position = UDim2.new(0.5, 0, 0.4, 0)
ChannelContainer.AnchorPoint = Vector2.new(0.5, 0.5)
ChannelContainer.BackgroundTransparency = 1
ChannelContainer.ZIndex = 3

-- YouTube logo close to the name
local YouTubeIcon = Instance.new("TextLabel")
YouTubeIcon.Parent = ChannelContainer
YouTubeIcon.Size = UDim2.new(0.12, 0, 0.8, 0)
YouTubeIcon.Position = UDim2.new(0.25, 0, 0.1, 0)
YouTubeIcon.BackgroundTransparency = 1
YouTubeIcon.Text = "▶"
YouTubeIcon.TextSize = 35
YouTubeIcon.Font = Enum.Font.GothamBlack
YouTubeIcon.TextColor3 = Color3.fromRGB(255, 0, 0) -- YouTube red color
YouTubeIcon.TextTransparency = 0
YouTubeIcon.ZIndex = 4

-- Channel name next to YouTube logo
local Channel = Instance.new("TextLabel")
Channel.Parent = ChannelContainer
Channel.Size = UDim2.new(0.7, 0, 0.8, 0)
Channel.Position = UDim2.new(0.37, 0, 0.1, 0)
Channel.BackgroundTransparency = 1
Channel.Text = CHANNEL_NAME
Channel.Font = Enum.Font.GothamBold
Channel.TextSize = 28
Channel.TextColor3 = Color3.fromRGB(240, 240, 240)
Channel.TextXAlignment = Enum.TextXAlignment.Left
Channel.TextTransparency = 0
Channel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Channel.TextStrokeTransparency = 0.7
Channel.ZIndex = 4

-- Subscribe Button - كلمة Subscribe باللون الأبيض
local SubscribeButton = Instance.new("TextButton")
SubscribeButton.Parent = MainFrame
SubscribeButton.Size = UDim2.new(0.6, 0, 0.14, 0)
SubscribeButton.Position = UDim2.new(0.5, 0, 0.65, 0)
SubscribeButton.AnchorPoint = Vector2.new(0.5, 0.5)
SubscribeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- YouTube red
SubscribeButton.Text = "🔔 SUBSCRIBE"
SubscribeButton.Font = Enum.Font.GothamBlack
SubscribeButton.TextSize = 22
SubscribeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- نص أبيض
SubscribeButton.AutoButtonColor = false
SubscribeButton.BackgroundTransparency = 0
SubscribeButton.TextTransparency = 0
SubscribeButton.ZIndex = 3

local SubscribeButtonCorner = Instance.new("UICorner")
SubscribeButtonCorner.Parent = SubscribeButton
SubscribeButtonCorner.CornerRadius = UDim.new(0, 10)

local SubscribeButtonGradient = Instance.new("UIGradient")
SubscribeButtonGradient.Parent = SubscribeButton
SubscribeButtonGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
})

-- Add sound icon on button - باللون الأبيض
local SoundIcon = Instance.new("TextLabel")
SoundIcon.Parent = SubscribeButton
SoundIcon.Size = UDim2.new(0.1, 0, 0.6, 0)
SoundIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
SoundIcon.BackgroundTransparency = 1
SoundIcon.Text = "🔊"
SoundIcon.TextSize = 14
SoundIcon.Font = Enum.Font.GothamBold
SoundIcon.TextColor3 = Color3.fromRGB(255, 255, 255) -- أيقونة صوت بيضاء
SoundIcon.TextTransparency = 0.3
SoundIcon.ZIndex = 4

-- Status / Loading Bar
local StatusContainer = Instance.new("Frame")
StatusContainer.Parent = MainFrame
StatusContainer.Size = UDim2.new(0.85, 0, 0.1, 0)
StatusContainer.Position = UDim2.new(0.5, 0, 0.9, 0)
StatusContainer.AnchorPoint = Vector2.new(0.5, 0.5)
StatusContainer.BackgroundTransparency = 1
StatusContainer.ZIndex = 3

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = StatusContainer
LoadingText.Size = UDim2.new(1, 0, 0.5, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Initializing..."
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextSize = 16
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextXAlignment = Enum.TextXAlignment.Center
LoadingText.TextTransparency = 0
LoadingText.ZIndex = 4

local ProgressContainer = Instance.new("Frame")
ProgressContainer.Parent = StatusContainer
ProgressContainer.Size = UDim2.new(1, 0, 0.5, 0)
ProgressContainer.Position = UDim2.new(0, 0, 0.5, 0)
ProgressContainer.BackgroundTransparency = 1

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

local ProgressBar = Instance.new("Frame")
ProgressBar.Parent = ProgressBarBG
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ProgressBar.BorderSizePixel = 0
ProgressBar.BackgroundTransparency = 0
ProgressBar.ZIndex = 4

local TimerText = Instance.new("TextLabel")
TimerText.Parent = ProgressContainer
TimerText.Size = UDim2.new(0.15, 0, 1, 0)
TimerText.Position = UDim2.new(0.95, 0, 0, 0)
TimerText.BackgroundTransparency = 1
TimerText.Text = LOADING_TIME .. "s"
TimerText.Font = Enum.Font.GothamBlack
TimerText.TextSize = 16
TimerText.TextColor3 = Color3.fromRGB(255, 80, 80)
TimerText.TextTransparency = 0
TimerText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TimerText.TextStrokeTransparency = 0.7
TimerText.ZIndex = 4

--==========================
--     SOUND SYSTEM
--==========================
-- Sound variable
local mySound = nil

-- Function to play sound on click
local function playSubscribeSound()
    -- Clean previous sound if exists
    if mySound then
        mySound:Stop()
        mySound:Destroy()
        mySound = nil
    end
    
    -- Create and play sound
    mySound = Instance.new("Sound")
    mySound.Parent = SoundService
    mySound.SoundId = SOUND_URL
    mySound.Volume = 0.8 -- High volume level
    mySound.Looped = false
    
    -- Try to load and play sound
    local success, errorMsg = pcall(function()
        mySound:Load()
        mySound:Play()
    end)
    
    if not success then
        warn("Sound error:", errorMsg)
        if mySound then
            mySound:Destroy()
            mySound = nil
        end
    else
        -- Add effect to button when sound plays
        SoundIcon.Text = "🔊"
        SoundIcon.TextColor3 = Color3.fromRGB(255, 255, 255) -- أيقونة بيضاء
        
        -- Return icon after one second
        task.wait(1)
        if SoundIcon then
            SoundIcon.Text = "🔊"
            SoundIcon.TextColor3 = Color3.fromRGB(255, 255, 255) -- بيضاء
        end
        
        -- Clean after sound ends
        mySound.Ended:Connect(function()
            if mySound then
                mySound:Destroy()
                mySound = nil
            end
        end)
    end
end

--==========================
--     ANIMATIONS
--==========================

-- Hide elements initially
MainFrame.Position = UDim2.new(0.5, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0.65, 0, 0.5, 0)
MainFrame.BackgroundTransparency = 0.8

-- Blur appearance animation
local blurTween = TweenService:Create(
    Blur, 
    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = 20}
)
blurTween:Play()

-- Dark overlay appearance
local darkTween = TweenService:Create(
    DarkOverlay,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.6}
)
darkTween:Play()

-- Main frame appearance
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
    {Size = UDim2.new(0.75, 0, 0.65, 0)}
)
frameTween2:Play()

-- YouTube logo appearance with effect
task.wait(0.4)
YouTubeIcon.TextTransparency = 0.5
YouTubeIcon.Position = UDim2.new(0.2, 0, 0.1, 0)
local youtubeTween = TweenService:Create(
    YouTubeIcon,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
        TextTransparency = 0,
        Position = UDim2.new(0.25, 0, 0.1, 0)
    }
)
youtubeTween:Play()

-- Channel name appearance
Channel.TextTransparency = 0.5
Channel.Position = UDim2.new(0.32, 0, 0.1, 0)
local channelTween = TweenService:Create(
    Channel,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
        TextTransparency = 0,
        Position = UDim2.new(0.37, 0, 0.1, 0)
    }
)
channelTween:Play()

--==========================
--     SUBSCRIBE BUTTON with sound effect
--==========================
SubscribeButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(
        SubscribeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.62, 0, 0.15, 0),
            BackgroundColor3 = Color3.fromRGB(255, 30, 30)
        }
    )
    hoverTween:Play()
    
    -- Add effect to icon
    SoundIcon.TextTransparency = 0
end)

SubscribeButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(
        SubscribeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0.6, 0, 0.14, 0),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        }
    )
    leaveTween:Play()
    
    -- Restore icon transparency
    SoundIcon.TextTransparency = 0.3
end)

SubscribeButton.MouseButton1Click:Connect(function()
    -- Copy channel link
    setclipboard(CHANNEL_LINK)
    
    -- Save original text
    local originalText = SubscribeButton.Text
    
    -- Change text with click effect - كلمة SUBSCRIBED باللون الأبيض
    SubscribeButton.Text = "✅ SUBSCRIBED!"
    SubscribeButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0) -- أخضر
    SubscribeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- نص أبيض
    
    -- Play sound on subscribe
    playSubscribeSound()
    
    -- Button click effect
    local clickTween1 = TweenService:Create(
        SubscribeButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.58, 0, 0.13, 0)}
    )
    clickTween1:Play()
    
    task.wait(0.1)
    
    local clickTween2 = TweenService:Create(
        SubscribeButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.6, 0, 0.14, 0)}
    )
    clickTween2:Play()
    
    -- Wait a bit
    task.wait(1.5)
    
    -- Return to original state - كلمة SUBSCRIBE باللون الأبيض
    SubscribeButton.Text = originalText
    SubscribeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- أحمر
    SubscribeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- نص أبيض
end)

--==========================
--     LOADING ANIMATION & PROGRESS
--==========================
local timeLeft = LOADING_TIME
local connection

local loadingMessages = {
    "Initializing...",
    "Loading assets...",
    "Configuring...",
    "Preparing script...",
    "Almost ready..."
}

local messageIndex = 1

local function updateLoadingProgress()
    if timeLeft > 0 then
        local pct = 1 - (timeLeft / LOADING_TIME)
        
        ProgressBar.Size = UDim2.new(pct, 0, 1, 0)
        TimerText.Text = string.format("%.1fs", timeLeft)
        
        if timeLeft % 2 < 0.1 then
            LoadingText.Text = loadingMessages[messageIndex]
            messageIndex = messageIndex + 1
            if messageIndex > #loadingMessages then
                messageIndex = 1
            end
        end
        
        timeLeft = timeLeft - 0.1
    else
        connection:Disconnect()
        LoadingText.Text = "✅ READY!"
    end
end

connection = RunService.Heartbeat:Connect(function()
    updateLoadingProgress()
end)

task.wait(LOADING_TIME + 0.5)

--==========================
--     ANIMATION EXIT
--==========================

LoadingText.Text = "🚀 Launching script..."
TimerText.Text = "0.0s"
ProgressBar.Size = UDim2.new(1, 0, 1, 0)

task.wait(0.5)

-- Hide main frame
local frameOutTween = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In),
    {
        Position = UDim2.new(0.5, 0, 1.3, 0),
        BackgroundTransparency = 1
    }
)
frameOutTween:Play()

-- Hide dark overlay
local darkOutTween = TweenService:Create(
    DarkOverlay,
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {BackgroundTransparency = 1}
)
darkOutTween:Play()

-- Remove Blur
local blurOutTween = TweenService:Create(
    Blur, 
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    {Size = 0}
)
blurOutTween:Play()

-- Wait a bit
task.wait(1)

-- Clean sound if playing
if mySound then
    mySound:Stop()
    mySound:Destroy()
    mySound = nil
end

-- Clean interface
ScreenGui:Destroy()
Blur:Destroy()

-- Wait a bit before running script
task.wait(0.5)

--==========================
--     EXECUTE MAIN SCRIPT
--==========================
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Quantum-Onyx-Project-32118"))()
