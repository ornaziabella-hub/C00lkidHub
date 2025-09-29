--// Services
local HttpService = game:GetService("HttpService")

--// GitHub Keys JSON link
local KeysURL = "https://raw.githubusercontent.com/ornaziabella-hub/C00lkidHub/main/keys.json"

--// Fetch Keys Function
local function fetchKeys()
    local success, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(KeysURL))
    end)
    if success then
        return data
    else
        warn("❌ Could not fetch keys from GitHub.")
        return nil
    end
end

--// Expire Check
local function isExpired(expireTime)
    local now = os.time()
    local expire = DateTime.fromIsoDate(expireTime):ToUniversalTime().UnixTimestamp
    return now > expire
end

--// Check Key Function
local function checkKey(key, data)
    -- Owner
    for _,v in ipairs(data.owner) do
        if key == v then return "owner" end
    end
    -- Special
    for _,v in ipairs(data.special) do
        if key == v then return "special" end
    end
    -- Daily
    if not isExpired(data.expires) then
        for _,v in ipairs(data.daily) do
            if key == v then return "daily" end
        end
    end
    return nil
end

--// Rayfield Loader
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Load saved key (memory)
local SavedKey = nil
pcall(function()
    local file = isfile and readfile("C00lkidHub_Key.txt")
    if file then
        SavedKey = file
    end
end)

local function unlockHub(role)
    -- ✅ Here is where you put your real tabs
    local MainWindow = Rayfield:CreateWindow({
        Name = "C00lkid Hub",
        LoadingTitle = "C00lkid Hub",
        LoadingSubtitle = "Loaded as "..role,
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "C00lkidHub",
            FileName = "HubConfig"
        }
    })

    if role == "owner" then
        MainWindow:CreateTab("👑 Owner", 7734068321)
    end
    if role == "special" then
        MainWindow:CreateTab("🌟 Special", 7734068321)
    end
    if role == "daily" then
        MainWindow:CreateTab("🗝️ Daily", 7734068321)
    end

    MainWindow:CreateTab("😡 Angry", 7734068321)
    MainWindow:CreateTab("💬 Force Chat", 7734068321)
end

--// If already saved key, try it
if SavedKey then
    local keys = fetchKeys()
    if keys then
        local role = checkKey(SavedKey, keys)
        if role then
            unlockHub(role)
            return
        end
    end
end

--// Key Window
local KeyWindow = Rayfield:CreateWindow({
    Name = "C00lkid Hub - Key System",
    LoadingTitle = "C00lkid Hub",
    LoadingSubtitle = "Enter Your Key",
    ConfigurationSaving = {
        Enabled = false
    }
})

local KeyTab = KeyWindow:CreateTab("🔑 Key System", 4483362458)
KeyTab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Paste key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(input)
        local keys = fetchKeys()
        if not keys then
            Rayfield:Notify({ Title = "Error", Content = "Failed to fetch keys!", Duration = 5 })
            return
        end
        local role = checkKey(input, keys)
        if role then
            Rayfield:Notify({ Title = "Success", Content = "Key accepted! ("..role..")", Duration = 5 })
            -- Save key
            pcall(function()
                if writefile then
                    writefile("C00lkidHub_Key.txt", input)
                end
            end)
            unlockHub(role)
        else
            Rayfield:Notify({ Title = "Invalid", Content = "Wrong or expired key!", Duration = 5 })
        end
    end
})
