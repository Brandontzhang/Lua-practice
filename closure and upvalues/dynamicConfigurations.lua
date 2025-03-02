-- 4. Store configurations and return a default if a value is missing

function Configurations(defaults)
	local config = {}
	local fields = defaults or {} -- fields are private and only accessible through the functions

	setmetatable(config, {
		__index = function(_, key)
			return "Unknown setting: " .. key
		end,
	})

	function config:get(field)
		return fields[field]
	end

	function config:set(field, value)
		fields[field] = value
	end

	return config
end
