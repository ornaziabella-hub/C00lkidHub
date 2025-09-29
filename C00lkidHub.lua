-- C00lkidHub.lua
-- Made by enz0 (Pro_99nightsforest)

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- JSON Key URL (always use this!)
local keyUrl = "https://raw.githubusercontent.com/ornaziabella-hub/C00lkidHub/main/keys.json"

-- Get keys
local HttpService = game:GetService("HttpService")
local success, keysData = pcall(function()
    return HttpService:JSONDecode(game:HttpGet(keyUrl))
end)

if not success or not keysData then
    warn("Failed to load keys.json")
    return
end

-- Save key memory
local function saveKey(key)
    writefile("C00lkidHub_Key.txt", key)
end

local function loadSavedKey()
    if isfile("C00lkidHub_Key.txt") then
        return readfile("C00lkidHub_Key.txt")
    end
end

-- Validate key
local function isValidKey(input)
    -- Owner key (forever)
    if input == keysData.Owner then return "Owner" end
    -- Special person key (forever)
    if input == keysData.Special then return "Special" end
    -- Public key
    if input == keysData.Public then return "Public" end
    -- Daily keys
    for _, dailyKey in ipairs(keysData.Daily or {}) do
        if input == dailyKey then return "Daily" end
    end
    return false
end

-- Check saved key first
local savedKey = loadSavedKey()
local role = savedKey and isValidKey(savedKey)

if not role then
    -- Key UI
    Rayfield:CreateWindow({
        Name = "C00lkidHub - Key System",
        LoadingTitle = "Welcome to C00lkidHub",
        LoadingSubtitle = "Made by enz0",
        ConfigurationSaving = {
            Enabled = false
        },
        KeySystem = true,
        KeySettings = {
            Title = "Enter Your Key",
            Subtitle = "Get keys from keys.json link",
            Note = "Owner, Special, Public, or Daily key",
            FileName = "C00lkidHub_Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Actions = {
                [keysData.Owner] = function() saveKey(keysData.Owner) end,
                [keysData.Special] = function() saveKey(keysData.Special) end,
                [keysData.Public] = function() saveKey(keysData.Public) end,
            }
        }
    })
else
    -- Already have a valid key
    print("Welcome back with role:", role)
end

-- Here you can add your Tabs + Features below
-- Example:
-- local Window = Rayfield:CreateWindow({ Name = "C00lkid Main GUI" })
-- local Tab = Window:CreateTab("Universal Scripts")
-- Tab:CreateButton({ Name = "Fly", Callback = function() print("Fly pressed") end })
