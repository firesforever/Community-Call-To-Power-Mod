-------------------------------------------------
-- Advanced Settings Screen
-------------------------------------------------
--[[
	Design Overview
	The UI is made up of a table of *ScreenOptions* which are tables themselves consisting of a common interface.
	These common methods are called one after the other when certain events occur to ensure that the data is 
	up-to-date and valid.
	
	ScreenOption overview
	Each option structure contains the following functions:
		FullSync()		--	Refreshes all possible values and current value from the game.
							This is also where event handlers for controls are typically assigned.
		PartialSync()	--	Refreshes only the current value from the game.
		Validate(args)	--	Verifies that current value is a valid value (if not, will assign args.Valid = false)

	When a value is changed for whatever reason, validation is performed to determine whether 
	or not we can enable/disable the start button.

	When the screen is shown, a partial sync is performed to ensure values are update.
	
	Full syncs are performed either when the screen is initialized or when mods change the game state.
----------------------------------------------------------------------------------------------------------------------]]
include( "IconSupport" );
include( "UniqueBonuses" );
include( "InstanceManager" );
include("MasterMapInfo");

-------------------------------------------------
-- Globals
-------------------------------------------------
g_SlotInstances = {};	-- Container for all player slots 
g_GameOptionsManager = InstanceManager:new("GameOptionInstance", "GameOptionRoot", Controls.GameOptionsStack);
g_DropDownOptionsManager = InstanceManager:new("DropDownOptionInstance", "DropDownOptionRoot", Controls.DropDownOptionsStack);
g_VictoryCondtionsManager = InstanceManager:new("GameOptionInstance", "GameOptionRoot", Controls.VictoryConditionsStack);

------------------------------------------------------------------------------------------------------
-- Complex Methods
-- Pulled out from Screen Options since they were so long
------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic drop down game options
function RefreshDropDownGameOptions()
	g_DropDownOptionsManager:ResetInstances();

	local currentMapScript = PreGame.GetMapScript();
	if(PreGame.IsRandomMapScript())then
		currentMapScript = nil;
	end
	
	local options = {};
	for option in DB.Query("select * from MapScriptOptions where exists (select 1 from MapScriptOptionPossibleValues where FileName = MapScriptOptions.FileName and OptionID = MapScriptOptions.OptionID) and Hidden = 0 and FileName = ?", currentMapScript) do
		options[option.OptionID] = {
			ID = option.OptionID,
			Name = Locale.ConvertTextKey(option.Name),
			ToolTip = (option.Description) and Locale.ConvertTextKey(option.Description) or nil,
			Disabled = (option.ReadOnly == 1) and true or false,
			DefaultValue = option.DefaultValue,
			SortPriority = option.SortPriority,
			Values = {},
		}; 
	end
	
	for possibleValue in DB.Query("select * from MapScriptOptionPossibleValues where FileName = ? order by SortIndex ASC", currentMapScript) do
		if(options[possibleValue.OptionID] ~= nil) then
			table.insert(options[possibleValue.OptionID].Values, {
				Name	= Locale.ConvertTextKey(possibleValue.Name),
				ToolTip = (possibleValue.Description) and Locale.ConvertTextKey(possibleValue.Description) or nil,
				Value	= possibleValue.Value,
			});
		end
	end
	
	local sortedOptions = {};
	for k,v in pairs(options) do
		table.insert(sortedOptions, v);
	end
	 
	-- Sort the options
	table.sort(sortedOptions, function(a, b) 
		if(a.SortPriority == b.SortPriority) then
			return a.Name < b.Name; 
		else
			return a.SortPriority < b.SortPriority;
		end
	end);
	
	-- Update the UI!
	for _, option in ipairs(sortedOptions) do
	
		local gameOption = g_DropDownOptionsManager:GetInstance();
				
		gameOption.OptionName:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.OptionName:SetToolTipString(option.ToolTip);
		else
			gameOption.OptionName:SetToolTipString();
		end
		
		gameOption.OptionDropDown:SetDisabled(option.Disabled);
		local dropDownButton = gameOption.OptionDropDown:GetButton();
		
		gameOption.OptionDropDown:ClearEntries();
		for _, possibleValue in ipairs(option.Values) do
			controlTable = {};
			gameOption.OptionDropDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetText(possibleValue.Name);
			
			if(possibleValue.ToolTip ~= nil) then
				controlTable.Button:SetToolTipString(possibleValue.ToolTip);
			else
				controlTable.Button:SetToolTipString();
			end
			
			
			controlTable.Button:RegisterCallback(Mouse.eLClick, function()
				dropDownButton:SetText(possibleValue.Name);
				if(possibleValue.ToolTip) then
					dropDownButton:SetToolTipString(possibleValue.ToolTip);
				else
					dropDownButton:SetToolTipString();
				end
				PreGame.SetMapOption(option.ID, possibleValue.Value);
			end);
		end
		
		--Assign the currently selected value.
		local savedValue = PreGame.GetMapOption(option.ID);
		local defaultValue;
		if(savedValue ~= -1) then
			defaultValue = option.Values[savedValue];
		else
			defaultValue = option.Values[option.DefaultValue];
		end
		
		if(defaultValue ~= nil) then
			dropDownButton:SetText(defaultValue.Name);
			
			if(defaultValue.ToolTip ~= nil) then
				dropDownButton:SetToolTipString(defaultValue.ToolTip);
			else
				dropDownButton:SetToolTipString();
			end
		end
	
		if(option.Disabled) then
			dropDownButton:SetDisabled(true);
		end
		
		gameOption.OptionDropDown:CalculateInternals();
	end
	
	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------
-- Refreshes all dynamic checkbox game options
function RefreshCheckBoxGameOptions()
	g_GameOptionsManager:ResetInstances();

	---------------------------------
	-- General Game Options
	local options = {};
	-- First, Gather a list of all options
	for option in GameInfo.GameOptions{Visible = 1} do
		local option = {
			Type = option.Type,
			Name = Locale.ConvertTextKey(option.Description),
			ToolTip = (option.Help) and Locale.ConvertTextKey(option.Help) or nil,
			Checked = (option.Default == 1) and true or false,
			Disabled = false,
			GameOption = true,
			SortPriority = 0,
		};
		
		local savedValue = PreGame.GetGameOption(option.Type);
		if(savedValue ~= nil) then
			option.Checked = savedValue == 1;
		end
		
		table.insert(options, option);
	end
	
	for option in DB.Query("select * from MapScriptOptions where not exists (select 1 from MapScriptOptionPossibleValues where FileName = MapScriptOptions.FileName and OptionID = MapScriptOptions.OptionID) and Hidden = 0 and FileName = ?", PreGame.GetMapScript()) do
		local option = {
			ID = option.OptionID,
			Name = Locale.ConvertTextKey(option.Name),
			ToolTip = (option.Description) and Locale.ConvertTextKey(option.Description) or nil,
			Checked = (option.DefaultValue == 1) and true or false,
			Disabled = (option.ReadOnly == 1) and true or false,
			GameOption = false,
			SortPriority = option.SortPriority,
		};
		
		local savedValue = PreGame.GetMapOption(option.ID);
		if(savedValue ~= nil) then
			option.Checked = savedValue == 1;
		end
		
		table.insert(options, option);
	end
	
	-- Sort the options alphabetically
	table.sort(options, function(a, b) 
		if(a.SortPriority == b.SortPriority) then
			return a.Name < b.Name;
		else
			return a.SortPriority < b.SortPriority;
		end
	end);
	
	-- Add Options to UI.
	local sizeY = 0;
	for _, option in ipairs(options) do
		local gameOption = g_GameOptionsManager:GetInstance();
		
		local gameOptionTextButton = gameOption.GameOptionRoot:GetTextButton();
		gameOptionTextButton:SetText(option.Name);
								
		if(option.ToolTip ~= nil) then
			gameOption.GameOptionRoot:SetToolTipString(option.ToolTip);
		end
		
		gameOption.GameOptionRoot:SetDisabled(option.Disabled);
		gameOption.GameOptionRoot:SetCheck(option.Checked);
		sizeY = sizeY + gameOption.GameOptionRoot:GetSizeY();
		if(option.GameOption == true) then
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetGameOption(option.Type, bCheck);
			end);
		else
			gameOption.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetMapOption(option.ID, bCheck);
			end);
		end	
	end	
	
	Controls.CityStateStack:CalculateSize();
	Controls.CityStateStack:ReprocessAnchoring();
	
	Controls.DropDownOptionsStack:CalculateSize();
	Controls.DropDownOptionsStack:ReprocessAnchoring();
		
	Controls.MaxTurnStack:CalculateSize();
	Controls.MaxTurnStack:ReprocessAnchoring();
	
	Controls.GameOptionsStack:CalculateSize();
	Controls.GameOptionsStack:ReprocessAnchoring();
	
	Controls.GameOptionsFullStack:CalculateSize();
	Controls.GameOptionsFullStack:ReprocessAnchoring();

	Controls.OptionsScrollPanel:CalculateInternalSize();
end
------------------------------------------------------------------------------------------------------
-- Refreshes all of the player data.
function RefreshPlayerList()

	RefreshHumanPlayer();

	local count = 1;
	if(PreGame.IsRandomWorldSize()) then
		Controls.ListingScrollPanel:SetHide(true);
		Controls.UnknownPlayers:SetHide(false);
		Controls.AddAIButton:SetDisabled(true);
	else
		Controls.UnknownPlayers:SetHide(true);
		Controls.ListingScrollPanel:SetHide(false);
		Controls.AddAIButton:SetDisabled(false);
		
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1 do
			if( PreGame.GetSlotStatus( i ) ~= SlotStatus.SS_COMPUTER ) then
				g_SlotInstances[i].Root:SetHide( true );
			else
    			-- Player Listing Entry
    			local controlTable = g_SlotInstances[i];
				controlTable.Root:SetHide( false );
				controlTable.PlayerNameLabel:SetHide( true );
				
				if(i ~= 1) then --Don't allow player to delete first AI so games will always have at least 2 players
					controlTable.RemoveButton:SetHide(false);
					controlTable.RemoveButton:RegisterCallback( Mouse.eLClick, function()
					
						if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER) then
							PreGame.SetSlotStatus(i, SlotStatus.SS_OPEN);
						end
						PerformPartialSync();
						
						--moduser remove here
						print ("civ was deleted")
						local numCivs = modUserData.GetValue ("numCivs")
						numCivs = numCivs - 1
						print (numCivs)
						modUserData.SetValue ("numCivs", numCivs)
					
					end);
				else
					controlTable.RemoveButton:SetHide(true);
				end
	            
				local civIndex = PreGame.GetCivilization( i );

				if( civIndex ~= -1 ) then
					local civ = GameInfo.Civilizations[ civIndex ];

					controlTable.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", count + 1);
					
					-- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
					local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
					local leaderDescription = leader.Description;

					--controlTable.LeaderName:SetText( Locale.ConvertTextKey( leaderDescription ) );
					controlTable.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey(leaderDescription), Locale.ConvertTextKey(civ.ShortDescription));

					IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, controlTable.Portrait );
					IconHookup( civ.PortraitIndex, 64, civ.IconAtlas, controlTable.Icon );
			
				else
  					controlTable.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", count + 1);
					controlTable.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");

					IconHookup( 22, 64, "LEADER_ATLAS", controlTable.Portrait );
					SimpleCivIconHookup(-1, 64, controlTable.Icon);
				end
				count = count + 1;
			end
		end
	end
	
	local numCivs = modUserData.GetValue ("numCivs")
	local maxCivs = modUserData.GetValue ("maxCivs")
	print (maxCivs) 
	print (numCivs)
	if numCivs >= maxCivs or numCivs >= 22 then
		Controls.AddAIButton:SetDisabled(true);
	elseif numCivs < maxCivs then
		Controls.AddAIButton:SetDisabled(false);
	end
	
	Controls.CivCount:SetText(  Locale.ConvertTextKey("TXT_KEY_AD_SETUP_CIVILIZATION", count) );

	Controls.SlotStack:CalculateSize();
	Controls.SlotStack:ReprocessAnchoring();
	Controls.ListingScrollPanel:CalculateInternalSize();

end
------------------------------------------------------------------------------------------------------
-- Refreshes all of the human player data (called by RefreshPlayerList)
function RefreshHumanPlayer()
	local civIndex = PreGame.GetCivilization(0);

    if( civIndex ~= -1 ) then
        local civ = GameInfo.Civilizations[civIndex];

        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
		local leaderDescription = leader.Description;

		local name = PreGame.GetLeaderName(0);
		local civName = PreGame.GetCivilizationShortDescription(0);

		if(name ~= "") then
			Controls.CivPulldown:SetHide(true);
			Controls.CivName:SetHide(false);
			Controls.CivName:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName ));
			Controls.RemoveButton:SetHide(false);
		else
			Controls.CivName:SetHide(true);
			Controls.RemoveButton:SetHide(true);
			Controls.CivPulldown:SetHide(false);
			Controls.CivPulldown:GetButton():SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey( leaderDescription ), Locale.ConvertTextKey( civ.ShortDescription ) ) );
		end
		
		IconHookup( leader.PortraitIndex, 64, leader.IconAtlas, Controls.Portrait );
		IconHookup( civ.PortraitIndex, 64, civ.IconAtlas, Controls.Icon );
	else
		Controls.CivNumberIndex:LocalizeAndSetText("TXT_KEY_NUMBERING_FORMAT", 1);
		local name = PreGame.GetLeaderName(0);
		local civName = PreGame.GetCivilizationShortDescription(0);
		
		if(name ~= "") then
			Controls.CivPulldown:SetHide(true);
			Controls.CivName:SetHide(false);
			Controls.CivName:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName ));
			Controls.RemoveButton:SetHide(false);
		else
			Controls.CivName:SetHide(true);
			Controls.RemoveButton:SetHide(true);
			Controls.CivPulldown:SetHide(false);
			Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");
		end

		IconHookup( 22, 64, "LEADER_ATLAS", Controls.Portrait );
		SimpleCivIconHookup(-1, 64, Controls.Icon);
    end
end
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-- Screen Options
------------------------------------------------------------------------------------------------------
ScreenOptions = {

----------------------------------------------------------------
["Civs"] = {
	FullSync = function()
	
		function GetPlayableCivInfo()
			local civs = {};
			
			local WorldChosen = modUserData.GetValue ("MapSelected")
			local scenarios = {}
			local scenario = {}

			-- Identifies which map data the chosen world uses
			for k, v in ipairs(CCTPScenarios) do
				scenarios = CCTPScenarios [k]
				if WorldChosen == scenarios [1] then
					scenario = scenarios [2]
				end
			end
			
			local sql = [[Select	Civilizations.ID as CivID, 
									Civilizations.Type as Type, 
									Leaders.ID as LeaderID, 
									Civilizations.Description, 
									Civilizations.ShortDescription, 
									Leaders.Description as LeaderDescription 
									from Civilizations, Leaders, Civilization_Leaders 
									where Civilizations.Playable = 1 and CivilizationType = Civilizations.Type and LeaderheadType = Leaders.Type]];
	
			for row in DB.Query(sql) do
				local i = 3
				local found = 0
			
				repeat 
					local CivAllowed = scenario [i]
					--print (CivAllowed)
				
					if row.Type == CivAllowed then
						--print (CivAllowed,": civ is allowed in this scenario")
						table.insert(civs, {
									CivID = row.CivID,
									LeaderID = row.LeaderID,
									LeaderDescription = Locale.Lookup(row.LeaderDescription),
									ShortDescription = Locale.Lookup(row.ShortDescription),
									Description = row.Description,
									});
						found = 1
					else
						--print ("civ not found")
						--print (i)
						i = i + 1
					end
				until found == 1 or CivAllowed == nil
			end
			
			table.sort(civs, function(a,b) return Locale.Compare(a.LeaderDescription, b.LeaderDescription) == -1; end);
			
			return civs;
		end
	
		function PopulateCivPulldown( playableCivs, pullDown, playerID )

			pullDown:ClearEntries();
			-- set up the random slot
			local controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );
			controlTable.Button:SetVoids( playerID, -1 );
			controlTable.Button:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER");
			controlTable.Button:LocalizeAndSetToolTip("TXT_KEY_RANDOM_LEADER_HELP");
	
			for id, civ in ipairs(playableCivs) do
				local controlTable = {};
				pullDown:BuildEntry( "InstanceOne", controlTable );

				controlTable.Button:SetVoids( playerID, id );
				controlTable.Button:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", civ.LeaderDescription, civ.ShortDescription);
				controlTable.Button:LocalizeAndSetToolTip(civ.Description);
			end    
		    
			pullDown:CalculateInternals();
			pullDown:RegisterSelectionCallback(function(playerID, id)
				local civID = playableCivs[id] and playableCivs[id].CivID or -1;
			
				PreGame.SetCivilization( playerID, civID);
				PerformPartialSync();
			end);
		end
		
		local playableCivs = GetPlayableCivInfo();
		PopulateCivPulldown(playableCivs, Controls.CivPulldown, 0 );
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			PopulateCivPulldown(playableCivs, g_SlotInstances[i].CivPulldown, i );
		end
	end,
	
	PartialSync = function()
		RefreshPlayerList();
	end,
	
},
----------------------------------------------------------------

----------------------------------------------------------------
["CustomOptions"] = {
	FullSync = function()
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
	
	PartialSync = function()
		-- Still doing a full sync here..
		RefreshDropDownGameOptions();
		RefreshCheckBoxGameOptions();
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["Eras"] = {
	FullSync = function()
		local pullDown = Controls.EraPullDown;
		pullDown:ClearEntries();
		for info in GameInfo.Eras() do

			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:LocalizeAndSetText(info.Description);
			instance.Button:SetVoid1( info.ID );
		end
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback( function(id)
			local era = GameInfo.Eras[id];
			PreGame.SetEra( id );
			pullDown:GetButton():LocalizeAndSetText(era.Description);
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.Eras[ PreGame.GetEra() ];
		Controls.EraPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.EraPullDown:GetButton():LocalizeAndSetToolTip(info.Strategy);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["GameSpeeds"] = {
	FullSync = function()
		local pullDown = Controls.GameSpeedPullDown;
		
		pullDown:ClearEntries();
	
		local gameSpeeds = {};
		for row in GameInfo.GameSpeeds() do
			table.insert(gameSpeeds, row);
		end
		table.sort(gameSpeeds, function(a, b) return b.VictoryDelayPercent > a.VictoryDelayPercent end);

		for _, v in ipairs(gameSpeeds) do
			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:SetText( Locale.ConvertTextKey( v.Description ) );
			instance.Button:SetToolTipString( Locale.ConvertTextKey( v.Help ) );
			instance.Button:SetVoid1( v.ID );
		end
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback( function(id)
			PreGame.SetGameSpeed( id );
			local gameSpeed = GameInfo.GameSpeeds[id];
			pullDown:GetButton():LocalizeAndSetText(gameSpeed.Description);
			pullDown:GetButton():SetToolTipString( Locale.ConvertTextKey( gameSpeed.Help ) );
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ];
		Controls.GameSpeedPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.GameSpeedPullDown:GetButton():SetToolTipString( Locale.ConvertTextKey( info.Help ) );
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["Handicaps"] = {
	FullSync = function()
		local pullDown = Controls.HandicapPullDown;
		pullDown:ClearEntries();
		for info in GameInfo.HandicapInfos() do

			local instance = {};
			pullDown:BuildEntry( "InstanceOne", instance );
		    
			instance.Button:LocalizeAndSetText(info.Description);
			instance.Button:LocalizeAndSetToolTip(info.Help);
			instance.Button:SetVoid1( info.ID );
		end
		
		pullDown:CalculateInternals();
		
		pullDown:RegisterSelectionCallback(function(id)
			local handicap = GameInfo.HandicapInfos[id];
			PreGame.SetHandicap( 0, id );
			pullDown:GetButton():LocalizeAndSetText(handicap.Description);
			pullDown:GetButton():LocalizeAndSetToolTip(handicap.Help);
		
			PerformPartialSync();
		end);
	end,
	
	PartialSync = function()
		local info = GameInfo.HandicapInfos[PreGame.GetHandicap(0)];
		Controls.HandicapPullDown:GetButton():LocalizeAndSetText(info.Description);
		Controls.HandicapPullDown:GetButton():LocalizeAndSetToolTip(info.Help);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------

----------------------------------------------------------------

----------------------------------------------------------------
["MaxTurns"] = {
	FullSync = function()
		Controls.MaxTurnsCheck:RegisterCallback( Mouse.eLClick, function()
			if(Controls.MaxTurnsCheck:IsChecked()) then
				Controls.MaxTurnsEditbox:SetHide(false);
			else
				Controls.MaxTurnsEditbox:SetHide(true);
				PreGame.SetMaxTurns(0);
			end
			
			PerformPartialSync();
		end);

		Controls.MaxTurnsEdit:RegisterCallback(function()
			PreGame.SetMaxTurns(Controls.MaxTurnsEdit:GetText());
		end);
		
		ScreenOptions["MaxTurns"].PartialSync();
	end,
	
	PartialSync = function()
		local maxTurns = PreGame.GetMaxTurns();
		if(maxTurns > 0) then
			Controls.MaxTurnsCheck:SetCheck(true);
		end
		Controls.MaxTurnsEditbox:SetHide(not Controls.MaxTurnsCheck:IsChecked());
		Controls.MaxTurnsEdit:SetText(maxTurns);
	end,
},
----------------------------------------------------------------

----------------------------------------------------------------
["MinorCivs"] = {
	FullSync = function()
		function OnMinorCivsSlider( fValue )
		
			local maxMinorCivs = math.min(41, #GameInfo.MinorCivilizations);
			PreGame.SetNumMinorCivs( math.floor( fValue * maxMinorCivs ) );
			Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", math.floor(fValue * maxMinorCivs));
		end
		Controls.MinorCivsSlider:RegisterSliderCallback( OnMinorCivsSlider );
	end,
	
	PartialSync = function()
		local maxMinorCivs = math.min(41, #GameInfo.MinorCivilizations);
	
		if ( not PreGame.IsRandomWorldSize() ) then
			Controls.MinorCivsSlider:SetHide(false);
			Controls.MinorCivsLabel:SetHide(false);
			
			if (PreGame.GetNumMinorCivs() == -1) then
				PreGame.SetNumMinorCivs(GameInfo.Worlds[ PreGame.GetWorldSize() ].DefaultMinorCivs);
			end
			Controls.MinorCivsSlider:SetValue( PreGame.GetNumMinorCivs() / maxMinorCivs );
			Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", PreGame.GetNumMinorCivs());
		else
			Controls.MinorCivsSlider:SetHide(true);
			Controls.MinorCivsLabel:SetHide(true);
			
			if (PreGame.GetNumMinorCivs() == -1) then
				Controls.MinorCivsSlider:SetValue(0 / maxMinorCivs);
				Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", 0);
			else
				Controls.MinorCivsSlider:SetValue(PreGame.GetNumMinorCivs() / maxMinorCivs);
				Controls.MinorCivsLabel:LocalizeAndSetText("TXT_KEY_AD_SETUP_CITY_STATES", PreGame.GetNumMinorCivs());
			end
		end
	end,	
},
----------------------------------------------------------------

----------------------------------------------------------------
["Teams"] = {
	FullSync = function()
		function PopulateTeamPulldown( pullDown, playerID )
			local count = 0;

			pullDown:ClearEntries();
			
			-- Display Each Player
			local controlTable = {};
			pullDown:BuildEntry( "InstanceOne", controlTable );
			
			controlTable.Button:LocalizeAndSetText("TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", 1);
			controlTable.Button:SetVoids( playerID, 0 );
			
			for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				if( PreGame.GetSlotStatus( i ) == SlotStatus.SS_COMPUTER ) then
					local controlTable = {};
					pullDown:BuildEntry( "InstanceOne", controlTable );
					
					controlTable.Button:LocalizeAndSetText("TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", i + 1);
					controlTable.Button:SetVoids( playerID, i );
				end
			end    

			pullDown:CalculateInternals();
			pullDown:RegisterSelectionCallback(function(playerID, playerChoiceID)
				
				PreGame.SetTeam(playerID, playerChoiceID);
				local slotInstance = g_SlotInstances[playerID];
				
				if( slotInstance ~= nil ) then
					slotInstance.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(playerID) + 1 );
				else
					Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(playerID) + 1 );
				end
				
				PerformValidation();
			end);
			
			
			local team = PreGame.GetTeam(playerID);
			local slotInstance = g_SlotInstances[playerID];
			
			if( slotInstance ~= nil ) then
				slotInstance.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
			else
				Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
			end

		end
	
		PopulateTeamPulldown( Controls.TeamPullDown, 0);
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			PopulateTeamPulldown( g_SlotInstances[i].TeamPullDown, i);
		end		
	end,
	
	PartialSync = function()
		Controls.TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", PreGame.GetTeam(0) + 1 );
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local team = PreGame.GetTeam(i);
			g_SlotInstances[i].TeamLabel:LocalizeAndSetText( "TXT_KEY_MULTIPLAYER_DEFAULT_TEAM_NAME", team + 1 );
		end		
	end,
	
	Validate = function(args)
		local playerTeam = PreGame.GetTeam(0);
	    
		for i = 1, GameDefines.MAX_MAJOR_CIVS-1 do
			if( PreGame.GetSlotStatus(i) == SlotStatus.SS_COMPUTER ) then
        		if( PreGame.GetTeam(i) ~= playerTeam ) then
        			return;
        		end
    		end
		end
		
		args.Valid = false;
		args.Reason = "TXT_KEY_BAD_TEAMS";
	end,
},
-------------------------------------------------

----------------------------------------------------------------
["VictoryConditions"] =	{
	FullSync = function()
		g_VictoryCondtionsManager:ResetInstances();
	
		for row in GameInfo.Victories() do
			local victoryCondition = g_VictoryCondtionsManager:GetInstance();
			
			local victoryConditionTextButton = victoryCondition.GameOptionRoot:GetTextButton();
			victoryConditionTextButton:LocalizeAndSetText(row.Description);
			
			victoryCondition.GameOptionRoot:SetCheck(PreGame.IsVictory(row.Type));
			
			victoryCondition.GameOptionRoot:RegisterCheckHandler( function(bCheck)
				PreGame.SetVictory(row.ID, bCheck);
			end);
		end
		
		Controls.VictoryConditionsStack:CalculateSize();
		Controls.VictoryConditionsStack:ReprocessAnchoring();
	end,
	
	PartialSync = function()
		ScreenOptions["VictoryConditions"].FullSync();
	end,
},
----------------------------------------------------------------

}
-------------------------------------------------

----------------------------------------------------------------
-- ScreenOptions methods
-- Used to manage the entries in ScreenOptions
----------------------------------------------------------------
function ForEachScreenOption(func, ...)
	for _,v in pairs(ScreenOptions) do
		if(v[func]) then
			v[func](...);
		end
	end
end
------------------------------------------------------------------
function PerformFullSync()
	ForEachScreenOption("FullSync");
end
------------------------------------------------------------------
function PerformPartialSync()
	ForEachScreenOption("PartialSync");
end
------------------------------------------------------------------
function PerformValidation()
	local args = {Valid = true};
	ForEachScreenOption("Validate", args);
	
	Controls.StartButton:SetDisabled(not args.Valid);
	
	if(not args.Valid) then
		Controls.StartButton:LocalizeAndSetToolTip(args.Reason);
	else
		Controls.StartButton:SetToolTipString(nil);
	end
end
------------------------------------------------------------------

------------------------------------------------------------------
-- Edit Player Details
------------------------------------------------------------------
Controls.EditButton:RegisterCallback( Mouse.eLClick, function()
	UIManager:PushModal(Controls.SetCivNames);
end);
-------------------------------------------------
function OnCancelEditPlayerDetails()
	Controls.RemoveButton:SetHide(true);
	Controls.CivName:SetHide(true);
	Controls.CivPulldown:SetHide(false);

	PreGame.SetLeaderName( 0, "");
	PreGame.SetCivilizationDescription( 0, "");
	PreGame.SetCivilizationShortDescription( 0, "");
	PreGame.SetCivilizationAdjective( 0, "");
	
	local civIndex = PreGame.GetCivilization( 0 );
    if( civIndex ~= -1 ) then
		local civ = GameInfo.Civilizations[ civIndex ];

        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
		local leaderDescription = leader.Description;
		
		Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey(leaderDescription), Locale.ConvertTextKey(civ.ShortDescription));
	else
		Controls.CivPulldown:GetButton():LocalizeAndSetText("TXT_KEY_RANDOM_CIV");
	end
end
Controls.RemoveButton:RegisterCallback( Mouse.eLClick, OnCancelEditPlayerDetails );
------------------------------------------------------------------



   
---------------------------------------------------------------- 
-- Add AI Button Handler
---------------------------------------------------------------- 
function OnAdAIClicked()
    -- skip player 0 
    for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        if( PreGame.GetSlotStatus(i) ~= SlotStatus.SS_COMPUTER) then
            PreGame.SetSlotStatus(i, SlotStatus.SS_COMPUTER);
            PreGame.SetCivilization(i, -1);
            break;
        end
    end
	--moduser added civ here
	print ("civ was added")
	local numCivs = modUserData.GetValue ("numCivs")
	numCivs = numCivs + 1
	modUserData.SetValue ("numCivs", numCivs)

	ScreenOptions["Teams"].FullSync();
    PerformPartialSync();
end
Controls.AddAIButton:RegisterCallback(Mouse.eLClick, OnAdAIClicked);


---------------------------------------------------------------- 
-- Back Button Handler
---------------------------------------------------------------- 
function OnBackClicked()
    UIManager:DequeuePopup( ContextPtr );
end
Controls.BackButton:RegisterCallback(Mouse.eLClick, OnBackClicked);

---------------------------------------------------------------- 
-- Start Button Handler
---------------------------------------------------------------- 
function OnStartClicked()
	
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	local MVolume = GetVolumeKnobValue(GetVolumeKnobIDFromName("USER_VOLUME_MUSIC"));
	
	SetVolumeKnobValue(GetVolumeKnobIDFromName("USER_VOLUME_MUSIC"), 0);
	
	modUserData.SetValue ("mvolume", MVolume)
	
	Events.SerialEventStartGame();
	UIManager:SetUICursor( 1 );
end
Controls.StartButton:RegisterCallback(Mouse.eLClick, OnStartClicked);

----------------------------------------------------------------
-- Input Handler
----------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_ESCAPE then
		    OnBackClicked();
        	return true;
		end
	end
	
end
ContextPtr:SetInputHandler( InputHandler );
----------------------------------------------------------------     

----------------------------------------------------------------
-- Visibility Handler
---------------------------------------------------------------- 
function ShowHideHandler( bIsHide )
	-- Note: Must be called even when bIsHide == true due to the 
	-- way the edit player details screen works.
	PerformFullSync()
	ScreenOptions["Teams"].FullSync();
    PerformPartialSync();
	PerformValidation();
end
ContextPtr:SetShowHideHandler( ShowHideHandler );
---------------------------------------------------------------- 

-----------------------------------------------------------------
-- Adjust for resolution
-----------------------------------------------------------------
function AdjustScreenSize()
    local _, screenY = UIManager:GetScreenSizeVal();

    local TOP_COMPENSATION = 52 + ((screenY - 768) * 0.3 );
    local BOTTOM_COMPENSATION = 190;
    local LOCAL_SLOT_COMPENSATION = 74;

    Controls.MainGrid:SetSizeY( screenY - TOP_COMPENSATION );
    Controls.ListingScrollPanel:SetSizeY( screenY - TOP_COMPENSATION - BOTTOM_COMPENSATION - LOCAL_SLOT_COMPENSATION );
    Controls.OptionsScrollPanel:SetSizeY( screenY - TOP_COMPENSATION - BOTTOM_COMPENSATION );
    
    Controls.ListingScrollPanel:CalculateInternalSize();
    Controls.OptionsScrollPanel:CalculateInternalSize();
end

-------------------------------------------------
-------------------------------------------------
function OnUpdateUI( type )
    if( type == SystemUpdateUIType.ScreenResize ) then
        AdjustScreenSize();
    end
end
Events.SystemUpdateUI.Add( OnUpdateUI );


-- When mods affect game state, perform a full sync.
Events.AfterModsActivate.Add(function()
	PerformFullSync();
end);

Events.AfterModsDeactivate.Add(function()
	PerformFullSync();
end);

-- This is a one time initialization function for UI elements.
-- It should NEVER be called more than once.
function CreateSlotInstances()
	for i = 1, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		g_SlotInstances[i] = {};
		ContextPtr:BuildInstanceForControl( "PlayerSlot", g_SlotInstances[i], Controls.SlotStack );
		g_SlotInstances[i].Root:SetHide( true );	
	end
end

function OpenModuser(  )
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
end
OpenModuser()
AdjustScreenSize();
CreateSlotInstances();
PerformFullSync();
