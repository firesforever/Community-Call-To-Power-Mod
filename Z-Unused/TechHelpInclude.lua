-------------------------------------------------
-- Help text for techs
-------------------------------------------------

function GetHelpTextForTech( iTechID, bShowProgress )
	local pTechInfo = GameInfo.Technologies[iTechID];
	
	local pActiveTeam = Teams[Game.GetActiveTeam()];
	local pTeamTechs = pActiveTeam:GetTeamTechs();
	local iTechCost = pTeamTechs:GetResearchCost(iTechID);
	
	local strHelpText = "";

	-- Name
	strHelpText = strHelpText .. Locale.ToUpper(Locale.ConvertTextKey( pTechInfo.Description ));

	-- Do we have this tech?
	if (pTeamTechs:HasTech(iTechID)) then
		strHelpText = strHelpText .. " [COLOR_POSITIVE_TEXT](" .. Locale.ConvertTextKey("TXT_KEY_RESEARCHED") .. ")[ENDCOLOR]";
	end

	-- Cost/Progress
	strHelpText = strHelpText .. "[NEWLINE]-------------------------[NEWLINE]";
	
	local iProgress = pTeamTechs:GetResearchProgress(iTechID);
	
	-- Don't show progres if we have 0 or we're done with the tech
	if (iProgress == 0 or pTeamTechs:HasTech(iTechID)) then
		bShowProgress = false;
	end
	
	if (bShowProgress) then
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_TECH_HELP_COST_WITH_PROGRESS", iProgress, iTechCost);
	else
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_TECH_HELP_COST", iTechCost);
	end
	
	-- Leads to...
	local strLeadsTo = "";
	local bFirstLeadsTo = true;
	for row in GameInfo.Technology_PrereqTechs() do
		local pPrereqTech = GameInfo.Technologies[row.PrereqTech];
		local pLeadsToTech = GameInfo.Technologies[row.TechType];
		
		if (pPrereqTech and pLeadsToTech) then
			if (pTechInfo.ID == pPrereqTech.ID) then
				
				-- If this isn't the first leads-to tech, then add a comma to separate
				if (bFirstLeadsTo) then
					bFirstLeadsTo = false;
				else
					strLeadsTo = strLeadsTo .. ", ";
				end
				
				strLeadsTo = strLeadsTo .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey( pLeadsToTech.Description ) .. "[ENDCOLOR]";
			end
		end
	end
	
	if (strLeadsTo ~= "") then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_TECH_HELP_LEADS_TO", strLeadsTo);
	end

		-- Required Tech - Firesforever 16/01/2011...
	local strRequired = "";
	local bFirstRequired = true;
	
	--for row in DB.Query("SELECT * FROM Technologies LEFT JOIN Technology_PrereqTechs ON Technologies.Type = Technology_PrereqTechs.TechType") do
	
	for row in GameInfo.Technology_PrereqTechs() do
		local pPrereqTech = GameInfo.Technologies[row.PrereqTech];
		local pLeadsToTech = GameInfo.Technologies[row.TechType];
		
		
		if (pPrereqTech and pLeadsToTech) then
			if (pTechInfo.ID == pLeadsToTech.ID) then
				
				-- If this isn't the first leads-to tech, then add a comma to separate
				if (bFirstRequired) then
					bFirstRequired = false;
				else
					strRequired = strRequired .. ", ";
				end
				
				strRequired = strRequired .. "[COLOR_POSITIVE_TEXT]" .. Locale.ConvertTextKey( pPrereqTech.Description ) .. "[ENDCOLOR]";
			end
		end
	end

	if (strRequired ~= "") then
		strHelpText = strHelpText .. "[NEWLINE]";
		strHelpText = strHelpText .. Locale.ConvertTextKey("TXT_KEY_TECH_HELP_REQUIRES", strRequired);
	end

	-- Pre-written help text
	strHelpText = strHelpText .. "[NEWLINE]-------------------------[NEWLINE]";
	strHelpText = strHelpText .. Locale.ConvertTextKey( pTechInfo.Help );
	
	return strHelpText;
end