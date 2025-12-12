-- DiagnosticsService
-- Collects tracing, warnings, and performance metrics.

local DiagnosticsService = {}
DiagnosticsService._logs = {}

function DiagnosticsService.Log(message, level)
	table.insert(DiagnosticsService._logs, {
		msg = tostring(message),
		level = level or "INFO",
		time = os.clock(),
	})
end

function DiagnosticsService.GetLogs()
	return DiagnosticsService._logs
end

return DiagnosticsService
