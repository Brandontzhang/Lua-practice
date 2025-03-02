-- A table can also be treated as a function

Logger = { msg = "Hello this is a message" }

setmetatable(Logger, {
	__call = function(self)
		print(self.msg)
	end,
})

Logger()
