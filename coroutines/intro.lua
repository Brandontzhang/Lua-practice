-- Coroutines allow you to pause execution and resume later
-- Useful for asynchronous tasks, iterators, and state processing

local co = coroutine.create(function()
	print("Step 1")
	coroutine.yield() -- pause
	print("Step 2")
	coroutine.yield() -- pause again
	print("Step 3")
end)

coroutine.resume(co) -- Print Step 1
coroutine.resume(co) -- Print Step 2
coroutine.resume(co) -- Print Step 3

-- Coroutines can also require input
local function requestInput()
	local input = coroutine.yield("Please provide input")
	print("You entered " .. input)
end

co = coroutine.create(requestInput)
print(coroutine.resume(co))
coroutine.resume(co, "input text")
