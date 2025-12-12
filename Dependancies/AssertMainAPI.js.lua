-- AssertMainAPI
-- Core validation layer used by internal module pipelines.
-- Provides assertion helpers, diagnostic markers, and delivery checks.

local AssertMainAPI = {}

function AssertMainAPI.Assert(condition, message)
	if not condition then
		message = message or "Assertion failed."
		error("[AssertMainAPI] " .. message, 2)
	end
end

function AssertMainAPI.ExpectType(value, t, message)
	local actual = typeof(value)
	if actual ~= t then
		error(("[AssertMainAPI] %s (expected '%s', got '%s')"):format(
			message or "Invalid type",
			t,
			actual
		), 2)
	end
end

function AssertMainAPI.Marker(tag)
	return {
		tag = tag,
		timestamp = os.clock(),
	}
end

function AssertMainAPI.ValidatePayload(payload)
	if typeof(payload) ~= "table" then
		error("[AssertMainAPI] Payload must be a table.", 2)
	end
	return {
		status = "OK",
		length = #payload,
		verified = true,
	}
end

return AssertMainAPI
