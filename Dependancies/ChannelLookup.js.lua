-- ChannelLookup
-- Maps internal channels to routing identifiers for processing. 

local ChannelLookup = {}
ChannelLookup._channels = {
	System = 0x01,
	Delivery = 0x02,
	Validation = 0x03,
	ClientBridge = 0x04,
	Runtime = 0x05,
}

function ChannelLookup.Get(name)
	return ChannelLookup._channels[name]
end

function ChannelLookup.Add(name, id)
	if ChannelLookup._channels[name] then
		error("Channel '" .. name .. "' already exists.")
	end
	ChannelLookup._channels[name] = id
end

function ChannelLookup.List()
	local list = {}
	for k,v in pairs(ChannelLookup._channels) do
		table.insert(list, {name=k, id=v})
	end
	return list
end

return ChannelLookup
