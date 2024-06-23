local IsMobile = false
local DevicePlatform = Enum.Platform.None
pcall(function() DevicePlatform = game.Workspace:GetService("UserInputService"):GetPlatform() end)
IsMobile = (DevicePlatform == Enum.Platform.Android or DevicePlatform == Enum.Platform.IOS)
local LibRepo = 'https://raw.githubusercontent.com/Bart3kk/LinLib/main/'
local Library = nil

if IsMobile then
    Library = loadstring(game:HttpGet(LibRepo .. 'MobileLibrary.lua'))()
else
    Library = loadstring(game:HttpGet(LibRepo .. 'Library.lua'))()
end

local ThemeManager = loadstring(game:HttpGet(LibRepo .. 'ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(LibRepo .. 'SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'FallenHub - BETA',
    Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    main = Window:AddTab('Choose Games')
}

local LeftGroupBox = Tabs.main:AddLeftGroupbox('Groupbox')

local doorsLobby = LeftGroupBox:AddButton({
    Text = "Doors [Lobby]",
    Func = function()
        local placeId = 6516141723
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer

        if game.GameId == placeId then
            print("Loading Lobby Script..")
        else
            print("Teleporting to Doors [Lobby]")
            TeleportService:Teleport(placeId, player)
        end
    end
})
