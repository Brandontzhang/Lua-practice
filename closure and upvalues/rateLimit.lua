-- 2. Rate Limiting Function calls

-- useful time functions
-- os.time(): returns time since Unix epoch
-- os.clock(): returns cpu time in seconds

-- Delay is in seconds
function RateLimit(fn, delay)
	local start = -1

	return function(...)
		local currentTime = os.time()
		local elapsedTime = currentTime - start

		if elapsedTime < 0 or elapsedTime > delay then
			start = currentTime
			return fn(...)
		end

		-- otherwise ignore the request
	end
end

function PrintMessage(msg)
	print(msg)
end

PrintMessage = RateLimit(PrintMessage, 5)

PrintMessage("Hello")
PrintMessage("You won't see this")
os.execute("sleep 5")
PrintMessage("But you should see this")
