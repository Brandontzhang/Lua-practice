local file = io.open("test.txt", "w")
if file then
	file:write("Hello Lua~")
	file.close(file)
end

file = io.open("test.txt", "r")
if file then
	local content = file:read("*a")
	print(content)
	file:close()
end
