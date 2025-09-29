--// C00lkidHub.lua
-- Made by enz0 (Pro_99nightsforest)

--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--// Rayfield Loader
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Key System Config
local OwnerKey = "Freekeybyowner"
local SpecialKey = "WelcomeSpecialperson"
local PublicKey = "Public key"
local OtherKey = "Yourkeyis123"

local WrongAttempts = 0
local MaxWrong = 5
local AccessLevel = nil

--// Helper: Funny Rejects
local FunnyRejects = {
    "LOL nope 💀",
    "Bro really tried 💀",
    "❌ Wrong key, goofy",
    "😂 Not even close",
    "🚪 Door is locked fam",
    "Skill issue 💀",
    "Bruh moment 🤡"
}
local function FunnyReject()
    return FunnyRejects[math.random(1, #FunnyRejects)]
end

--// Helper: Kick Player with funny message
local KickMessages = {
    "💀 TOO MANY WRONG KEYS!! GET OUT 🚪💨",
    "🤣 You got cooked, kicked for spam",
    "😂 Game over, no entry for clowns",
    "❌ Instant kick, better luck never"
}
local function KickPlayer()
    LocalPlayer:Kick(KickMessages[math.random(1, #KickMessages)])
end

--// Notifications
local function Notify(title, content, time)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = time or 6,
        Image = 4483362458
    })
end

--// GUI
local Window = Rayfield:CreateWindow({
    Name = 'C00lkid "made by enz0"',
    LoadingTitle = "C00lkidHub",
    LoadingSubtitle = "by enz0",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = true,
    KeySettings = {
        Title = "C00lkidHub Key System",
        Subtitle = "Enter the correct key!",
        Note = "Keys: Owner, Special, Public, or Other",
        FileName = "C00lkidKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {OwnerKey, SpecialKey, PublicKey, OtherKey}
    }
})

--// Key System Logic
Rayfield:OnKeyEntered(function(Key)
    if Key == OwnerKey then
        AccessLevel = "Owner"
        print("[C00lkidHub] OWNER KEY used by: " .. LocalPlayer.Name)
        Notify("✅ Owner Access", "Welcome back, enz0!", 8)
    elseif Key == SpecialKey then
        AccessLevel = "Special"
        print("[C00lkidHub] SPECIAL KEY used by: " .. LocalPlayer.Name)
        Notify("💎 Special Access", "Welcome, special friend!", 8)
    elseif Key == PublicKey then
        AccessLevel = "Public"
        print("[C00lkidHub] PUBLIC KEY used by: " .. LocalPlayer.Name)
        Notify("🌍 Public Access", "Enjoy the hub!", 8)
    elseif Key == OtherKey then
        AccessLevel = "Other"
        print("[C00lkidHub] OTHER KEY used by: " .. LocalPlayer.Name)
        Notify("🔑 Access", "Valid universal key!", 8)
    end
end)

Rayfield:OnKeyNotFound(function()
    WrongAttempts = WrongAttempts + 1
    local left = MaxWrong - WrongAttempts

    Notify("WRONG!", FunnyReject() .. " (" .. WrongAttempts .. "/" .. MaxWrong .. ")", 5)
    warn("[C00lkidHub] Player " .. LocalPlayer.Name .. " wrong key (" .. WrongAttempts .. "/" .. MaxWrong .. ")")

    if WrongAttempts >= MaxWrong then
        KickPlayer()
    elseif left == 1 then
        Notify("⚠️ Warning!", "Next wrong = instant kick 💀", 6)
    end
end)

--// Tabs
local PublicTab = Window:CreateTab("Public Scripts 🌍", 4483362458)
local SpecialTab = Window:CreateTab("Special 💎", 4483362458)
local OwnerTab = Window:CreateTab("Owner 👑", 4483362458)
local FunTab = Window:CreateTab("C00lkid Buttons 🤡", 4483362458)
local PowerTab = Window:CreateTab("Powerful ⚡", 4483362458)
local AngryTab = Window:CreateTab("Angry 😡", 4483362458)

-- Public Tab Example
PublicTab:CreateButton({
    Name = "Fly (FE?)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YOURFLYSCRIPT"))()
    end,
})

-- Special Tab Example
SpecialTab:CreateParagraph({Title = "Special Menu", Content = "Welcome, special friend from aliang elementary school 😼"})

-- Owner Tab Example
OwnerTab:CreateParagraph({Title = "Owner Menu", Content = "Welcome back, Pro_99nightsforest aka enz0!"})
OwnerTab:CreateButton({
    Name = "Destroy Hub",
    Callback = function()
        game:GetService("CoreGui").Rayfield:Destroy()
    end,
})

-- Funny Tab
FunTab:CreateButton({
    Name = "FE Sound Spam",
    Callback = function()
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = "rbxassetid://6534947240"
        sound.Looped = true
        sound:Play()
    end,
})

-- Powerful Tab Example
PowerTab:CreateButton({
    Name = "Super Speed",
    Callback = function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end,
})
PowerTab:CreateButton({
    Name = "Super Jump",
    Callback = function()
        LocalPlayer.Character.Humanoid.JumpPower = 200
    end,
})

-- Angry Tab
AngryTab:CreateParagraph({Title = "GRRRR 😡", Content = "This tab is just angry lol"})
