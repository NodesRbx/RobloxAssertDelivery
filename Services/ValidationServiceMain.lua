-- ValidationService
-- Provides structural and type validation for internal data.

local ValidationService = {}

function ValidationService.CheckTable(tbl)
	if type(tbl) ~= "table" then
		return false, "Expected table"
	end
	return true, nil
end

function ValidationService.ExpectKeys(tbl, keys)
	for _, key in ipairs(keys) do
		if tbl[key] == nil then
			return false, "Missing required key: " .. key
		end
	end
	return true
end

return ValidationService
