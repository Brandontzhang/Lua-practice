-- 3. Event Listeners (Observer Pattern)

function CreateEvent()
	-- this table event holds everything. The listeners and the two functions below
	local event = { listener = {} }

	function event:addListener(listener)
		-- self here refers to the events table
		table.insert(self.listeners, listener)
	end

	function event:trigger(...)
		for _, listener in ipairs(self.listener) do
			listener(...)
		end
	end

	return event
end
