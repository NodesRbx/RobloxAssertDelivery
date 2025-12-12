-- ClientBridgeAPI
-- Abstract communication layer between client and internal service code.

local ClientBridgeAPI = {}
ClientBridgeAPI._routes = {}

function ClientBridgeAPI.RegisterRoute(route, handler)
	assert(typeof(route) == "string", "Route must be a string.")
	assert(typeof(handler) == "function", "Handler must be a function.")
	ClientBridgeAPI._routes[route] = handler
end

function ClientBridgeAPI.Resolve(route, data)
	local handler = ClientBridgeAPI._routes[route]
	if not handler then
		return {
			ok = false,
			error = "Route not found",
			route = route,
		}
	end

	local success, response = pcall(handler, data)
	return {
		ok = success,
		response = response,
		route = route,
	}
end

return ClientBridgeAPI
