-- Mini C00lkid Hub by enz0
-- Simple Rayfield setup with key system

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "C00lkid Mini Hub | made by enz0",
   LoadingTitle = "C00lkid Hub",
   LoadingSubtitle = "Mini version",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = true,
   KeySettings = {
      Title = "C00lkid Mini Hub",
      Subtitle = "Enter the Key",
      Note = "Owner Key = Freekeybyowner | Public Key = Public key",
      FileName = "C00lkidMini",
      SaveKey = false,
      GrabKeyFromSite = false,
      Keys = {
         ["Freekeybyowner"] = "Owner Access",
         ["Public key"] = "Public Access"
      }
   }
})

-- Main tab
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
   Name = "Troll Hub (placeholder)",
   Callback = function()
      Rayfield:Notify({
         Title = "Troll Hub",
         Content = "This is just a mini hub version.",
         Duration = 6.5,
         Image = 4483362458,
      })
   end,
})

MainTab:CreateButton({
   Name = "FE Fly (mini)",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/YbXb4wZC"))()
   end,
})
