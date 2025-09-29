-- C00lkidHub.lua
-- Made for Pro_99nightsforest (enz0) 😎

-- // SERVICES
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- // KEYS
local Keys = {
    Public = "Yourkeyis123",
    Special = "WelcomeSpecialperson",
    Owner = "Pro_99nightsforest",
    Locked = "Force chat"
}

-- // WRONG KEY SYSTEM
local attempts = 0
local maxAttempts = 3
local lockTime = 300 -- 5 mins
local lockedUntil = 0

-- // HELPER FUNCTION
local function funnyWrong()
    local phrases = {
        "LOL wrong key 😂",
        "Bruh... try harder 😜",
        "Wrong key, noob!",
        "Haha not today 🤣",
        "Skill issue with keys 😏"
    }
    return phrases[math.random(1, #phrases)]
end

-- // LOAD RAYFIELD
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "😺 C00lKid Hub 😺",
    LoadingTitle = "Welcome to C00lkidHub",
    LoadingSubtitle = "Made by enz0",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = true,
    KeySettings = {
        Title = "C00lkidHub",
        Subtitle = "Enter Key",
        Note = "Public: " .. Keys.Public .. " | Special: " .. Keys.Special .. " | Owner key is secret 😉",
        FileName = "C00lkidKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {Keys.Public, Keys.Special, Keys.Owner, Keys.Locked}
    }
})

-- // AUTHENTICATION CHECK
local userRole = "Guest"
local function checkKey(inputKey)
    if os.time() < lockedUntil then
        return false, "⏳ Wait " .. (lockedUntil - os.time()) .. "s before trying again!"
    end
    if inputKey == Keys.Owner then
        if LocalPlayer.Name == Keys.Owner then
            userRole = "Owner"
            return true, "✅ Welcome Owner!"
        else
            return false, "🚫 Uh oh, you're NOT the owner!"
        end
    elseif inputKey == Keys.Special then
        Rayfield:Notify("Question!", "What was Enzo's old school?")
        wait(1)
        Rayfield:Notify("Hint", "Answer: aliang elementary school")
        userRole = "Special"
        return true, "🎉 Welcome Special Person!"
    elseif inputKey == Keys.Public then
        userRole = "Public"
        return true, "👍 Public access granted"
    elseif inputKey == Keys.Locked then
        if userRole == "Owner" or userRole == "Special" then
            return true, "🔓 Access granted to locked tab!"
        else
            userRole = "Locked"
            return true, "🔑 Locked tab access"
        end
    end
    attempts += 1
    if attempts >= maxAttempts then
        lockedUntil = os.time() + lockTime
        attempts = 0
        return false, "😡 Too many wrong keys! Locked for 5 minutes!"
    end
    return false, funnyWrong()
end

-- // TABS
local publicTab = Window:CreateTab("🌎 Public")
local specialTab = Window:CreateTab("💖 Special", 4483362458)
local ownerTab = Window:CreateTab("👑 Owner", 4483362458)
local lockedTab = Window:CreateTab("🔒 Force Chat", 4483362458)

-- // PUBLIC TAB CONTENT
publicTab:CreateButton({
    Name = "Dance!",
    Callback = function() LocalPlayer.Character.Humanoid:LoadAnimation(Instance.new("Animation", {AnimationId="rbxassetid://507771019"})):Play() end
})

-- // SPECIAL TAB CONTENT
specialTab:CreateButton({
    Name = "Cute Sparkles",
    Callback = function()
        local sp = Instance.new("Sparkles", LocalPlayer.Character.Head)
        sp.Name = "CuteSparkles"
    end
})

-- // OWNER TAB CONTENT
ownerTab:CreateButton({
    Name = "Kick All",
    Callback = function()
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                plr:Kick("👑 The Owner kicked you!")
            end
        end
    end
})

-- // LOCKED TAB CONTENT (Force Chat)
local spam = false
lockedTab:CreateButton({
    Name = "Force Chat Random Player: 'Hello Fat'",
    Callback = function()
        local target = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]
        if target and target ~= LocalPlayer then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hello fat", "All")
        end
    end
})
lockedTab:CreateToggle({
    Name = "Spam Chat: 'EZ LOL'",
    CurrentValue = false,
    Callback = function(Value)
        spam = Value
        while spam do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("EZ LOL", "All")
            wait(1)
        end
    end
})
