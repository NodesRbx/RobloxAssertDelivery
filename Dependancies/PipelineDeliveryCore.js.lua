-- PipelineDeliveryCore
-- Manages internal stage sequencing for module pipelines.
-- Handles registration, linking, and execution of staged tasks.

local PipelineDeliveryCore = {}
PipelineDeliveryCore._stages = {}

function PipelineDeliveryCore.DefineStage(name, callback)
	if PipelineDeliveryCore._stages[name] then
		error("Stage '" .. name .. "' is already defined.")
	end
	PipelineDeliveryCore._stages[name] = callback
end

function PipelineDeliveryCore.Execute(stageName, context)
	local stage = PipelineDeliveryCore._stages[stageName]
	if not stage then
		error("[PipelineDeliveryCore] Undefined stage: " .. stageName)
	end

	local success, result = pcall(stage, context or {})
	return {
		ok = success,
		result = result,
		stage = stageName,
	}
end

function PipelineDeliveryCore.ListStages()
	local list = {}
	for name in pairs(PipelineDeliveryCore._stages) do
		table.insert(list, name)
	end
	return list
end

return PipelineDeliveryCore
