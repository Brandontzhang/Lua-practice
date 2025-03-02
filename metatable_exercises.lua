local locked_table = { name = "Brandon" }
setmetatable(locked_table, {
	__newindex = function(_, key, _)
		error("Cannot add new key: " .. key)
	end,
})

-- Should throw an error
-- locked_table.age = 26

-- Simulating OOP
local Person = {}
Person.__index = Person -- setting the index as itself... what this means I'm not sure yet

-- A constructor
function Person:new(name, age)
	local instance = setmetatable({}, Person) -- Inheriting from Person
	instance.name = name
	instance.age = age
	return instance
end

-- Having a colon prevents the need to pass in the table itself for the self argument. Reduces boilerplate code
function Person:introduce()
	print("Hi, I'm " .. self.name .. " and I'm " .. self.age .. " years old")
end

-- Brandon is a table that uses the Person metatable as a reference/fallback
local brandon = Person:new("Brandon", 26)
brandon:introduce()

local Shape = {}
Shape.__index = Shape

function Shape:area()
	error("area() must be implemented!")
end

local Circle = { radius = 5 }
function Circle:area()
	return self.radius * self.radius * 3.14
end
setmetatable(Circle, Shape) -- Assign Shape as fallback

print(Circle:area()) -- ❌ Error: area() must be implemented!
