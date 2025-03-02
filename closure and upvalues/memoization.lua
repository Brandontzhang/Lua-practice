-- 1. Caching/Memoization
-- Can be used to memoize slower functions. I think this is similar to the useCallback function in React

local function square(x)
	return x * x
end

-- use a table to cache the result...
local function memoize(fn)
	local cache = {}

	return function(arg)
		if cache[arg] then
			return cache[arg]
		else
			local result = fn(arg)
			cache[arg] = result
			return result
		end
	end
end

local calculateSquare = memoize(square) -- this function includes the memoization of previous function calls
print(calculateSquare(10)) -- 10 is memoized
print(calculateSquare(10)) -- will be much faster here
print(calculateSquare(12)) -- new value to memoize

-- Implement Fibonacci
local function fib(n)
	if n <= 1 then
		return n
	end
	return fib(n - 1) + fib(n - 2)
end

fib = memoize(fib)

-- Calculate Factorial
local function factorial(n)
	if n == 0 then
		return 1
	end

	return factorial(n - 1) * n
end

factorial = memoize(factorial)
