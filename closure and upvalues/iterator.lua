-- Create the range function
-- for num in range(1, 10, 3) do
--     print(num)  -- ✅ 1, 4, 7, 10
-- end
--
-- A closure should store current value.
-- coroutine.yield() can help pause/resume iteration.
-- I actually don't know what a coroutine is...
--
-- Coroutines:
-- coroutine.create(fn) creates a coroutine.
-- coroutine.resume(co) starts execution.
-- coroutine.yield() pauses execution and saves its state.
-- Another coroutine.resume(co) resumes from where it left off.

function Range(start, stop, step)
	return coroutine.wrap(function()
		for i = start, stop, step do
			coroutine.yield(i) -- Pause and return `i`
		end
	end)
end

for num in Range(1, 10, 3) do
	print(num)
end
