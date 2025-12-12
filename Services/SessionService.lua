-- SessionService
-- Generates and tracks internal session identifiers.

local SessionService = {}
SessionService._active = {}

local function generate()
	return ("S%x%x%x%x"):format(
		math.random(0, 0xFFFF),
		math.random(0, 0xFFFF),
		math.random(0, 0xFFFF),
		math.random(0, 0xFFFF)
	)
end

function SessionService.New()
	local id = generate()
	SessionService._active[id] = os.clock()
	return id
end

function SessionService.Exists(id)
	return SessionService._active[id] ~= nil
end

function SessionService.Remove(id)
	SessionService._active[id] = nil
end

return SessionService
