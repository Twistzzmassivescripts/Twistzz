local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local key = _G.script_key or getgenv().script_key
local whitelist_url = "https://raw.githubusercontent.com/YOURNAME/YOURREPO/main/whitelist.json"

local success, result = pcall(function()
    return HttpService:GetAsync(whitelist_url)
end)

if success then
    local data = HttpService:JSONDecode(result)
    if table.find(data.whitelisted_keys, key) then
        -- Load the real script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/YOURREPO/main/real_script.lua"))()
    else
        Players.LocalPlayer:Kick("❌ Invalid key.")
    end
else
    Players.LocalPlayer:Kick("❌ Could not validate license. Try again later.")
end
