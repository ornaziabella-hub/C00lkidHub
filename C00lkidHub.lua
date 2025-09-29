--// C00lkidHub.lua
-- Made by enz0 (Pro_99nightsforest)

-- // SERVICES
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- // KEY SYSTEM
local Keys = {
    Owner = "Freekeybyowner",
    Special = "WelcomeSpecialperson",
    Public = "Public key",
    Normal = "Yourkeyis123"
}

local WrongAttempts = 0
local MaxAttempts = 3
local CooldownActive = false
local CooldownTime = 300 -- 5 minutes

-- // NOTIFICATION FUNCTION
local function Notify(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- // BACKGROUND (Happy Cat Dancing)
local bg = Instance.new("ScreenGui", PlayerGui)
bg.Name = "HappyCatBG"
bg.IgnoreGuiInset = true
bg.ResetOnSpawn = false
local img = Instance.new("ImageLabel", bg)
img.Size = UDim2.new(1, 0, 1, 0)
img.Position = UDim2.new(0, 0, 0, 0)
img.Image = "rbxassetid://7083449163" -- cute dancing cat image
img.ImageTransparency = 0.2

-- // KEY INPUT GUI
local KeyGui = Instance.new("ScreenGui", PlayerGui)
KeyGui.Name = "KeyGui"
local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.BorderSizePixel = 3

local Box = Instance.new("TextBox", Frame)
Box.Size = UDim2.new(0.8, 0, 0.3, 0)
Box.Position = UDim2.new(0.1, 0, 0.2, 0)
Box.PlaceholderText = "Enter Key..."

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0.5, 0, 0.3, 0)
Btn.Position = UDim2.new(0.25, 0, 0.6, 0)
Btn.Text = "Submit"

local role = nil

-- // KEY CHECK
Btn.MouseButton1Click:Connect(function()
    if CooldownActive then
        Notify("Cooldown Active", "Wait for countdown to finish!", 5)
        return
    end

    local input = Box.Text
    if input == Keys.Owner then
        -- Owner confirm question
        if LocalPlayer.Name == "Pro_99nightsforest" then
            role = "Owner"
            Notify("Welcome Owner", "Welcome back, enz0 👑", 6)
            KeyGui:Destroy()
        else
            Notify("Uh oh!", "Your Not Owner! Stop!", 5)
        end

    elseif input == Keys.Special then
        -- Special confirm question
        local answer = "aliang elementary school"
        local Ask = Instance.new("TextBox", Frame)
        Ask.Size = UDim2.new(0.8, 0, 0.3, 0)
        Ask.Position = UDim2.new(0.1, 0, 0.55, 0)
        Ask.PlaceholderText = "What’s enz0’s old school?"
        Ask.FocusLost:Connect(function()
            if string.lower(Ask.Text) == answer then
                role = "Special"
                Notify("Special Access", "Welcome Special Person 💎", 6)
                KeyGui:Destroy()
            else
                Notify("Uh oh!", "Your Not Special Person! Stop!", 5)
            end
        end)

    elseif input == Keys.Public then
        role = "Public"
        Notify("Welcome", "Welcome Public User 🔑", 6)
        KeyGui:Destroy()

    elseif input == Keys.Normal then
        role = "Normal"
        Notify("Welcome", "Welcome Normal User 😁", 6)
        KeyGui:Destroy()

    else
        WrongAttempts += 1
        if WrongAttempts >= MaxAttempts then
            CooldownActive = true
            local cd = CooldownTime
            Notify("Too many wrong!", "Ha stop! You can't enter!", 5)
            task.spawn(function()
                while cd > 0 do
                    Btn.Text = tostring(cd) .. "s"
                    task.wait(1)
                    cd -= 1
                end
                Btn.Text = "Submit"
                WrongAttempts = 0
                CooldownActive = false
            end)
        else
            Notify("Wrong Key!", "Try again funny guy 🤡", 4)
        end
    end
end)

-- // MAIN HUB (Rayfield-like fake UI)
local function LoadHub(role)
    local Screen = Instance.new("ScreenGui", PlayerGui)
    Screen.Name = "C00lkidHub"

    local Main = Instance.new("Frame", Screen)
    Main.Size = UDim2.new(0.4, 0, 0.5, 0)
    Main.Position = UDim2.new(0.3, 0, 0.25, 0)
    Main.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    Main.BorderSizePixel = 4

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0.1, 0)
    Title.Text = 'C00lkid "made by enz0"'
    Title.TextScaled = true
    Title.BackgroundTransparency = 1

    -- Example Tabs
    local function MakeButton(name, y, callback)
        local Btn = Instance.new("TextButton", Main)
        Btn.Size = UDim2.new(0.8, 0, 0.1, 0)
        Btn.Position = UDim2.new(0.1, 0, y, 0)
        Btn.Text = name
        Btn.MouseButton1Click:Connect(callback)
    end

    -- Universal
    MakeButton("Universal: Fly", 0.2, function()
        Notify("Fly", "You are flying ✈️", 5)
    end)
    MakeButton("Universal: Noclip", 0.32, function()
        Notify("Noclip", "Walls are fake now 🚪", 5)
    end)

    -- Owner tab
    if role == "Owner" then
        MakeButton("Owner: Kick All", 0.44, function()
            Notify("LOL", "enz0 just kicked everyone 🤡", 6)
        end)
        MakeButton("Owner: Rainbow Skin", 0.56, function()
            Notify("Wow", "enz0 turned rainbow 🌈", 6)
        end)
    end

    -- Special tab
    if role == "Special" then
        MakeButton("Special: Sparkly Mode", 0.44, function()
            Notify("Shiny", "You’re sparkly now ✨", 6)
        end)
    end

    -- Normal prank tab
    if role == "Normal" or role == "Public" then
        MakeButton("Prank: Sound", 0.68, function()
            local Sound = Instance.new("Sound", workspace)
            Sound.SoundId = "rbxassetid://9129369274" -- funny sound
            Sound:Play()
            Notify("Prank", "Funny sound played 😂", 5)
        end)
    end
end

-- // LOAD HUB after key
task.spawn(function()
    while not role do
        task.wait(0.5)
    end
    LoadHub(role)
end)
