-- C00lkidHub.lua
-- Loads keys from GitHub JSON file

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Fetch JSON from your GitHub
local keysUrl = "https://raw.githubusercontent.com/ornaziabella-hub/C00lkidHub/main/keys.json"
local success, keysData = pcall(function()
    return game:HttpGet(keysUrl)
end)

if not success then
    warn("⚠️ Failed to load keys.json")
    return
end

local keys = HttpService:JSONDecode(keysData)

-- Key system variables
local ownerKey = keys.OwnerKey
local specialKey = keys.SpecialKey
local publicKeys = keys.PublicKeys or {}
local expireDate = keys.ExpireDate

-- Date check
local function isExpired()
    local today = os.date("!*t") -- UTC date
    local y, m, d = today.year, today.month, today.day
    local expYear, expMonth, expDay = string.match(expireDate, "(%d+)-(%d+)-(%d+)")
    expYear, expMonth, expDay = tonumber(expYear), tonumber(expMonth), tonumber(expDay)

    if (y > expYear) or (y == expYear and m > expMonth) or (y == expYear and m == expMonth and d > expDay) then
        return true
    end
    return false
end

-- Gui library (Rayfield)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Ask for key
Rayfield:CreateWindow({
    Name = "🔑 C00lkidHub Key System",
    LoadingTitle = "C00lkidHub Security",
    LoadingSubtitle = "Checking your key...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "C00lkidHub",
        FileName = "KeyMemory"
    }
})

local Window = Rayfield:CreateWindow({ Name = "C00lkidHub" })

local function openHub(userType)
    Rayfield:Notify("✅ Success", "Welcome, "..userType.."!", 5)

    -- Example tabs
    local mainTab = Window:CreateTab("Main")
    mainTab:CreateButton({
        Name = "Fly (FE try)",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/YOURFLYSCRIPT"))()
        end
    })

    if userType == "Owner" then
        local ownerTab = Window:CreateTab("Owner Zone")
        ownerTab:CreateLabel("Only the Owner can see this tab")
    elseif userType == "Special" then
        local specialTab = Window:CreateTab("Special Zone")
        specialTab:CreateLabel("Hi special person! 🎉")
    end
end

-- Key check
Rayfield:Prompt({
    Title = "Enter Key",
    InputPlaceholder = "Type your key here",
    Callback = function(inputKey)
        if isExpired() then
            Rayfield:Notify("❌ Key Expired", "Please get a new key", 5)
            return
        end

        if inputKey == ownerKey then
            openHub("Owner")
        elseif inputKey == specialKey then
            openHub("Special")
        else
            for _, pubKey in ipairs(publicKeys) do
                if inputKey == pubKey then
                    openHub("Public User")
                    return
                end
            end
            Rayfield:Notify("❌ Wrong Key", "That key doesn’t match", 5)
        end
    end
})
