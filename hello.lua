print("Hello Lua!")

function Hello(name)
	print("Hello " .. name)
end

-- Hello("Brandon")

function TablePractice()
	local t = {
		item1 = "one",
		item2 = "two",
		item3 = "three",
	}

	print(t.item1)
end

-- TablePractice()

function Loop()
	local sum = 0
	for num = 1, 10 do
		sum = sum + num
	end

	print(sum)

	local names = { "Erica", "Charlotte", "Mandy", "Thais", "Rachel", "Felisha" }
	for _, name in ipairs(names) do
		print(name)
	end
end

-- Loop()

function CreateKVStore()
	local kvStore = {
		key = "store",
	}

	print(kvStore)
end

CreateKVStore()
