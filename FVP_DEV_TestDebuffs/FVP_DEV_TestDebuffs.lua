CreateFrame('FRAME', 'FVPTEST_DebuffList', TargetFrame)
FVPTEST_DebuffList:SetBackdrop({
    bgFile = 'Interface\\DialogFrame\\UI-DialogBox-Background', 
    edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
    tile = true, tileSize = 16, edgeSize = 16, 
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
FVPTEST_DebuffList:SetPoint('CENTER', UIParent)
FVPTEST_DebuffList:SetWidth(250)
FVPTEST_DebuffList:SetHeight(240)
FVPTEST_DebuffList:SetMovable(true)
FVPTEST_DebuffList:EnableMouse(true)
FVPTEST_DebuffList:RegisterForDrag("LeftButton")
FVPTEST_DebuffList:SetScript("OnDragStart", function() this:StartMoving() end)
FVPTEST_DebuffList:SetScript("OnDragStop",  function() this:StopMovingOrSizing() end)
FVPTEST_DebuffList:Show()
for i = 1, 20 do
    FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff' .. i, 'OVERLAY', 'GameFontNormalSmall')
    getglobal('FVPTEST_Debuff' .. i):SetPoint('TOPLEFT', FVPTEST_DebuffList, 8, -8 - (11 * (i - 1)))
end
for i = 21, 40 do
    FVPTEST_DebuffList:CreateFontString('FVPTEST_Debuff' .. i, 'OVERLAY', 'GameFontNormalSmall')
    getglobal('FVPTEST_Debuff' .. i):SetPoint('TOPLEFT', FVPTEST_DebuffList, 108, -8 - (11 * (i - 21)))
end

local f = CreateFrame('FRAME')
f:RegisterEvent('PLAYER_LOGIN')
f:RegisterEvent('PLAYER_TARGET_CHANGED')
 
f:SetScript('OnEvent', function()
    if event == 'PLAYER_LOGIN' then
 
        MAX_TARGET_DEBUFFS = 40
        for i = 17, MAX_TARGET_DEBUFFS do
            local b = CreateFrame("Button", "TargetFrameDebuff" .. i, TargetFrame, "TargetDebuffButtonTemplate")
            b:SetID(i)
            b:SetPoint("LEFT", getglobal("TargetFrameDebuff" .. (i - 1)), "RIGHT", 3, 0)
        end
 
    elseif event == 'PLAYER_TARGET_CHANGED' then
 
        for i = 1, MAX_TARGET_DEBUFFS do
            debuff, debuffStack, debuffType = UnitDebuff("target", i)
            getglobal('FVPTEST_Debuff' .. i):SetText(i .. ' - ' .. (debuffType or ''))
        end
 
    end
end)
