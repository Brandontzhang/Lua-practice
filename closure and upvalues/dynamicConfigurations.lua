-- 4. Store configurations and return a default if a value is missing
-- Challenges:
-- Certain settings cannot be changed (protected = { "admin" })
-- Nested settings are supported (config:set("ui.theme", "light"))
function Configurations(defaults)
	local config = {}
	local fields = defaults or {} -- fields are private and only accessible through the functions
	local protected = {} -- actually should probably do this with a metatable

	setmetatable(config, {
		__index = function(_, key)
			return "Unknown setting: " .. key
		end,
	})

	function config:get(field)
		return fields[field]
	end

	function config:setProtected(field)
		protected.insert(field)
	end

	function config:set(field, value)
		if protected[field] == nil then
			fields[field] = value
		else
			print(field .. " is a protected field")
		end
	end

	return config
end
