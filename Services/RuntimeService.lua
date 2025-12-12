-- RuntimeService
-- Tracks active runtime contexts and environment states.

local RuntimeService = {}
RuntimeService.State = {
	Initialized = false,
	Timestamp = 0,
}

function RuntimeService.Initialize()
	RuntimeService.State.Initialized = true
	RuntimeService.State.Timestamp = os.clock()
end

function RuntimeService.GetState()
	return RuntimeService.State
end

return RuntimeService
