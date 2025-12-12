-- ServiceManifest
-- Registry file enumerating all engine-attached internal services.

local ServiceManifest = {
	Version = "3.1.4",
	Build = 14209,

	Services = {
		"AssertMainAPI",
		"ClientBridgeAPI",
		"PipelineDeliveryCore",
		"RuntimeBindings",
		"ChannelLookup",
	}
}

function ServiceManifest.HasService(name)
	for _, s in ipairs(ServiceManifest.Services) do
		if s == name then
			return true
		end
	end
	return false
end

function ServiceManifest.GetVersion()
	return ServiceManifest.Version
end

return ServiceManifest
