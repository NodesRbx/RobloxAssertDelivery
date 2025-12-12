-- RuntimeBindings
-- Provides dynamic function binding and environment linking.

local RuntimeBindings = {}
RuntimeBindings._bound = {}

function RuntimeBindings.Bind(name, fn)
	if typeof(name) ~= "string" then
		error("RuntimeBindings requires string key.")
	end
	if typeof(fn) ~= "function" then
		error("RuntimeBindings requires function value.")
	end
	RuntimeBindings._bound[name] = fn
end

function RuntimeBindings.Invoke(name, ...)
	local fn = RuntimeBindings._bound[name]
	if not fn then
		error("[RuntimeBindings] No binding found for: " .. name)
	end
	return fn(...)
end

function RuntimeBindings.List()
	local list = {}
	for n in pairs(RuntimeBindings._bound) do
		table.insert(list, n)
	end
	return list
end

return RuntimeBindings
