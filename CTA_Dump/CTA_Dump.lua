local frame = CreateFrame("FRAME")

frame:RegisterEvent("PLAYER_ENTERING_WORLD");

function frame:GetStrings()
	local locale = GetLocale();
	CTA_Dump[locale] = PLAYER_DIFFICULTY_TIMEWALKER..LFG_TYPE_DUNGEON..LFG_TYPE_HEROIC_DUNGEON..BATTLEGROUND_HOLIDAY..GENERAL..DUNGEONS..TANK..HEALER..DAMAGER

	for i = 1, GetNumRandomDungeons() do
		local _, name = GetLFGRandomDungeonInfo(i)
		CTA_Dump[locale] = CTA_Dump[locale]..name
	end

	for i = 1, GetNumRFDungeons() do
		local _, name = GetRFDungeonInfo(i)
		CTA_Dump[locale] = CTA_Dump[locale]..name
	end
end

function frame:OnEvent(event, ...)
	if CTA_Dump == nil then
		CTA_Dump = {};
	end
	C_Timer.After(5, self.GetStrings)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

frame:SetScript("OnEvent", frame.OnEvent);
