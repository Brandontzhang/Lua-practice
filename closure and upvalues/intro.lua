-- Persisting local variables due to nested functions

local function outer()
	local count = 0 -- count is an upvalue (captured and stored by the inner function)
	return function()
		count = count + 1
		return count
	end
end

local counter = outer()

print(counter())
print(counter())

local function makeMultiplier(factor)
	return function(x)
		return x * factor -- factor is an upvalue!
	end
end

local double = makeMultiplier(2)
local triple = makeMultiplier(3)

print(double(5)) -- ✅ 10 (5 * 2)
print(triple(5)) -- ✅ 15 (5 * 3)
