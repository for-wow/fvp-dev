local m = CreateFrame('PLAYERMODEL')
m:SetPoint("CENTER", UIParent, "CENTER")
m:SetWidth(50)
m:SetHeight(50)

local f = CreateFrame('FRAME')
f:RegisterEvent('PLAYER_LOGIN')
f:RegisterEvent('PLAYER_TARGET_CHANGED')

f:SetScript('OnEvent', function()
	if event == 'PLAYER_LOGIN' then
		FVPA_CreatureList = FVPA_CreatureList or {}
	elseif event == 'PLAYER_TARGET_CHANGED' then
		local tn = UnitName('target') -- Target Name
		if tn then
			m:Show()
			m:SetUnit('target')
			FVPA_CreatureList[tn] = GetZoneText() .. '|' .. GetRealZoneText() .. '|' .. GetSubZoneText() .. '|' .. GetMinimapZoneText() .. '|' .. m:GetModel()
			m:Hide()
		end
		--SELECTED_CHAT_FRAME:AddMessage(tn .. ' - ' .. tm)
	end
end)
