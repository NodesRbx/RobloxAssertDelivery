-- NetworkService
-- Provides low-level routing and message dispatch utilities.

local NetworkService = {}
NetworkService._routes = {}

function NetworkService.Register(route, handler)
	assert(type(route) == "string", "Route must be a string.")
	assert(type(handler) == "function", "Handler must be a function.")
	NetworkService._routes[route] = handler
end

function NetworkService.Dispatch(route, payload)
	local fn = NetworkService._routes[route]
	if not fn then
		return { ok = false, error = "Unknown route: " .. route }
	end

	local ok, res = pcall(fn, payload)
	return { ok = ok, result = res }
end

return NetworkService
