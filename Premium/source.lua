local HttpService = game:GetService("HttpService")

-- Replace with the raw link to your JSON file
local whitelistUrl = "https://raw.githubusercontent.com/Twistzzmassivescripts/Twistzz/main/Premium/Whitelist.json"

local function isHWIDWhitelisted(hwid)
	local success, result = pcall(function()
		local response = HttpService:GetAsync(whitelistUrl)
		local data = HttpService:JSONDecode(response)
		return data
	end)

	if success and result and result.whitelisted_hwids then
		for _, whitelisted in ipairs(result.whitelisted_hwids) do
			if whitelisted == hwid then
				return true
			end
		end
	end
	return false
end

-- Example usage (you'd replace this with actual HWID logic)
local exampleHWID = "HWID_1"
if isHWIDWhitelisted(exampleHWID) then
	print("✅ HWID is whitelisted!")
else
	print("❌ HWID
