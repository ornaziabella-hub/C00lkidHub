-- C00lkid Hub "made by enz0"
-- Uses Rayfield UI Library

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

---------------------------------------------------------
-- Key System
---------------------------------------------------------
local KeySettings = {
    Title = "C00lkid Hub Key System",
    Subtitle = "Made by enz0",
    Note = "Enter your key to unlock the hub",
    FileName = "C00lkidKey",
    SaveKey = true,
    GrabKeyFromSite = false,
    Key = {"Freekeybyowner", "Public key"} -- owner + public
}

local Window = Rayfield:CreateWindow({
    Name = 'C00lkid "made by enz0"',
    LoadingTitle = "C00lkid Hub",
    LoadingSubtitle = "FE + TikTok Scripts",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "C00lkidHub"
    },
    KeySystem = true,
    KeySettings = KeySettings
})

---------------------------------------------------------
-- Notifications
---------------------------------------------------------
local function CoolNotify(title, content, duration)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3
    })
end

CoolNotify("C00lkid Hub", "If you like the script, follow @krnl.scripts ❤️", 6)

---------------------------------------------------------
-- Wrong Key Kick Troll
---------------------------------------------------------
task.spawn(function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    if _G.RayfieldKey and not table.find(KeySettings.Key, _G.RayfieldKey) then
        lp:Kick("🤡 L BOZO WRONG KEY 🤡")
    end
end)

---------------------------------------------------------
-- Tabs
---------------------------------------------------------
-- Troll Hub
local TrollTab = Window:CreateTab("🤡 Troll Hub", 4483362458)
TrollTab:CreateButton({
    Name = "Troll Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/jPj1D0qQ"))()
        CoolNotify("Troll Hub", "Troll Script Loaded!", 3)
    end
})

-- FE Hub
local FeTab = Window:CreateTab("⚡ FE Hub", 4483362458)
FeTab:CreateButton({
    Name = "Fly (FE)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y9jXmG6J"))()
        CoolNotify("FE Hub", "Fly Loaded!", 3)
    end
})
FeTab:CreateButton({
    Name = "Noclip (FE)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fQx1wF7"))()
        CoolNotify("FE Hub", "Noclip Loaded!", 3)
    end
})
FeTab:CreateButton({
    Name = "Speed (FE)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/B7nZ6Fsb"))()
        CoolNotify("FE Hub", "Speed Loaded!", 3)
    end
})
FeTab:CreateButton({
    Name = "Jump (FE)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/4JbQdQyW"))()
        CoolNotify("FE Hub", "Jump Loaded!", 3)
    end
})

---------------------------------------------------------
-- TikTok FE Scripts Tab
---------------------------------------------------------
local TikTokTab = Window:CreateTab("🎵 TikTok FE Scripts", 6035300000)

-- Load ALL
TikTokTab:CreateButton({
    Name = "🚀 Load ALL TikTok FE Scripts",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU"))() -- Fullbright
        loadstring(game:HttpGet("https://pastebin.com/raw/Y9jXmG6J"))() -- Fly
        loadstring(game:HttpGet("https://pastebin.com/raw/9fQx1wF7"))() -- Noclip
        loadstring(game:HttpGet("https://pastebin.com/raw/B7nZ6Fsb"))() -- Speed
        loadstring(game:HttpGet("https://pastebin.com/raw/4JbQdQyW"))() -- Jump
        loadstring(game:HttpGet("https://pastebin.com/raw/QLQxk6ki"))() -- Touch Kill
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sxelent/Script-Pack/main/FE%20BEST%20HAT%20FLING%20SCRIPT.lua"))() -- Fling
        loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))() -- Emotes
        loadstring(game:HttpGet("https://pastebin.com/raw/0WDhhGd1"))() -- Telekinesis
        CoolNotify("TikTok FE", "🎵 TikTok Mode Activated 🚀", 6)
    end
})

-- Individual buttons
TikTokTab:CreateButton({
    Name = "Fullbright (Local ❌)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU"))()
        CoolNotify("TikTok FE", "Loaded Fullbright", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Fly (Local ❌)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y9jXmG6J"))()
        CoolNotify("TikTok FE", "Loaded Fly", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Noclip (Local ❌)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fQx1wF7"))()
        CoolNotify("TikTok FE", "Loaded Noclip", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Speed (Local ❌)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/B7nZ6Fsb"))()
        CoolNotify("TikTok FE", "Loaded Speed", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Jump (Local ❌)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/4JbQdQyW"))()
        CoolNotify("TikTok FE", "Loaded Jump", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Touch Kill (FE ✅)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/QLQxk6ki"))()
        CoolNotify("TikTok FE", "Loaded Touch Kill", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Fling (FE ✅)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sxelent/Script-Pack/main/FE%20BEST%20HAT%20FLING%20SCRIPT.lua"))()
        CoolNotify("TikTok FE", "Loaded Fling", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Emotes (FE ✅)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))()
        CoolNotify("TikTok FE", "Loaded Emotes", 3)
    end
})
TikTokTab:CreateButton({
    Name = "FE Telekinesis (FE ✅)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/0WDhhGd1"))()
        CoolNotify("TikTok FE", "Loaded Telekinesis", 3)
    end
})
