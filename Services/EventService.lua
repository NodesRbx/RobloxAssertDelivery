-- EventService
-- Simple internal event dispatcher system.

local EventService = {}
EventService._listeners = {}

function EventService.Bind(eventName, fn)
	EventService._listeners[eventName] = EventService._listeners[eventName] or {}
	table.insert(EventService._listeners[eventName], fn)
end

function EventService.Fire(eventName, ...)
	local listeners = EventService._listeners[eventName]
	if not listeners then return end
	for _, fn in ipairs(listeners) do
		fn(...)
	end
end

return EventService
