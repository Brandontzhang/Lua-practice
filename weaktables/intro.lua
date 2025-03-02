-- A weak table allows for keys and values to be garbage collected when no other references exist
-- Used by setting the __mode on a metatables
-- k = keys are weak
-- v = values are weak
-- kv for both
--
-- General used for tracking temporary states that will be automatically wiped after a while

local cache = {} -- Regular table
local weakCache = setmetatable({}, { __mode = "v" }) -- Weak values

do
	local temp = { data = "This disappears!" }
	cache["key"] = temp
	weakCache["key"] = temp
end -- `temp` goes out of scope here

collectgarbage() -- Force garbage collection

print(cache["key"]) -- ✅ Still exists
print(weakCache["key"]) -- ❌ nil (Garbage collected)
