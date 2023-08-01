local _G = getfenv(0)

local f = CreateFrame('FRAME')
f:RegisterEvent('UPDATE_BATTLEFIELD_STATUS')
f:RegisterEvent('UPDATE_BATTLEFIELD_SCORE')
f:RegisterEvent('UPDATE_WORLD_STATES')
f:SetScript('OnEvent', function()
	SELECTED_CHAT_FRAME:AddMessage(event)
end)

SLASH_FVPDEV_S1 = '/delevent'
function SlashCmdList.FVPDEV_S(msg)
	if msg == '' then
		SELECTED_CHAT_FRAME:AddMessage(' /delevent BST - for delete event UPDATE_BATTLEFIELD_STATUS')
		SELECTED_CHAT_FRAME:AddMessage(' /delevent BSC - for delete event UPDATE_BATTLEFIELD_SCORE')
		SELECTED_CHAT_FRAME:AddMessage(' /delevent WST - for delete event UPDATE_WORLD_STATES')
	elseif msg == 'BST' then
		f:UnregisterEvent('UPDATE_BATTLEFIELD_STATUS')
		SELECTED_CHAT_FRAME:AddMessage('Delete event UPDATE_BATTLEFIELD_STATUS')
	elseif msg == 'BSC' then
		f:UnregisterEvent('UPDATE_BATTLEFIELD_SCORE')
		SELECTED_CHAT_FRAME:AddMessage('Delete event UPDATE_BATTLEFIELD_SCORE')
	elseif msg == 'WST' then
		f:UnregisterEvent('UPDATE_WORLD_STATES')
		SELECTED_CHAT_FRAME:AddMessage('Delete event UPDATE_WORLD_STATES')
	else
		SELECTED_CHAT_FRAME:AddMessage('Unknown command')
	end
end
