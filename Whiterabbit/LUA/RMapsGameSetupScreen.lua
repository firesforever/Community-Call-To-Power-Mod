-------------------------------------------------
-- GameSetup Screen
-------------------------------------------------
include( "IconSupport" );
include( "UniqueBonuses" );
      
local bIsModding = (ContextPtr:GetID() == "ModdingGameSetupScreen");

-------------------------------------------------
-- Back Button Handler
-------------------------------------------------
function OnBack()
    UIManager:DequeuePopup( ContextPtr );
    ContextPtr:SetHide( true );
	Controls.LargeMapImage:UnloadTexture();    
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );

-------------------------------------------------
-------------------------------------------------
function OnStart()
	
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	local MVolume = GetVolumeKnobValue(GetVolumeKnobIDFromName("USER_VOLUME_MUSIC"));
	
	SetVolumeKnobValue(GetVolumeKnobIDFromName("USER_VOLUME_MUSIC"), 0);
	modUserData.SetValue ("mvolume", MVolume)
	
	
	PreGame.SetPersistSettings(not bIsModding); -- Whether or not to save settings for the "Play Now" option.
	
	if( bIsModding and IsWBMap(PreGame.GetMapScript()) ) then
		PreGame.SetRandomMapScript(false);
		PreGame.SetLoadWBScenario(PreGame.GetLoadWBScenario());
		PreGame.SetOverrideScenarioHandicap(true);
	else
		PreGame.SetLoadWBScenario(false);
	end
	
	Events.SerialEventStartGame();
	UIManager:SetUICursor( 1 );
end
Controls.StartButton:RegisterCallback( Mouse.eLClick, OnStart );


-------------------------------------------------
-------------------------------------------------
function OnAdvanced()
    UIManager:QueuePopup( Controls.AdvancedSetup, PopupPriority.CustomMod );
end
Controls.AdvancedButton:RegisterCallback( Mouse.eLClick, OnAdvanced );


-------------------------------------------------
-------------------------------------------------
function OnSetCivNames()
    UIManager:PushModal( Controls.SetCivNames );
end
Controls.EditButton:RegisterCallback( Mouse.eLClick, OnSetCivNames );


-------------------------------------------------
-------------------------------------------------
function OnCancel()
	Controls.RemoveButton:SetHide(true);

	PreGame.SetLeaderName( 0, "" );
	PreGame.SetCivilizationDescription( 0, "" );
	PreGame.SetCivilizationShortDescription( 0, "" );
	PreGame.SetCivilizationAdjective( 0, "" );
	
	local civIndex = PreGame.GetCivilization( 0 );
    if( civIndex ~= -1 ) then
        civ = GameInfo.Civilizations[ civIndex ];

        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType]();
		local leaderDescription = leader.Description;
		
		PlayerLeader = Locale.ConvertTextKey( leaderDescription );
		PlayerCiv = Locale.ConvertTextKey( civ.ShortDescription );
		Controls.Title:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", Locale.ConvertTextKey( leaderDescription ), Locale.ConvertTextKey( civ.ShortDescription ) ) );
	else
		PlayerLeader = Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER" );
        PlayerCiv = Locale.ConvertTextKey( "TXT_KEY_RANDOM_CIV" );
        Controls.Title:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", PlayerLeader, PlayerCiv ) );

	end
end
Controls.RemoveButton:RegisterCallback( Mouse.eLClick, OnCancel );


-------------------------------------------------
-------------------------------------------------
function OnCivilization()
    UIManager:QueuePopup( Controls.SelectCivilization, PopupPriority.CustomMod );
    Controls.MainSelection:SetHide( true );
    Controls.SelectGameSpeed:SetHide( true );
    Controls.SelectDifficulty:SetHide( true );
    Controls.SelectMapType:SetHide( true );
    Controls.SelectMapSize:SetHide( true );
    Controls.LargeMapImage:UnloadTexture();
end
Controls.CivilizationButton:RegisterCallback( Mouse.eLClick, OnCivilization );


-------------------------------------------------
-------------------------------------------------
function OnSpeed()
    Controls.SelectGameSpeed:SetHide( not Controls.SelectGameSpeed:IsHidden() );
    
    Controls.SelectMapType:SetHide( true );
    Controls.SelectMapSize:SetHide( true );
    Controls.SelectDifficulty:SetHide( true );
 
end
Controls.GameSpeedButton:RegisterCallback( Mouse.eLClick, OnSpeed );


-------------------------------------------------
-------------------------------------------------
function OnDifficulty()
    Controls.SelectDifficulty:SetHide( not Controls.SelectDifficulty:IsHidden() );
    
    Controls.SelectGameSpeed:SetHide( true );
    Controls.SelectMapType:SetHide( true );
    Controls.SelectMapSize:SetHide( true );
end
Controls.DifficultyButton:RegisterCallback( Mouse.eLClick, OnDifficulty );


-------------------------------------------------
-------------------------------------------------
function OnMapType()
	Controls.SelectMapType:SetHide( not Controls.SelectMapType:IsHidden() );

	Controls.SelectMapSize:SetHide( true );
	Controls.SelectDifficulty:SetHide( true );
	Controls.SelectGameSpeed:SetHide( true );
   
	bScenarioSettingsLoaded = false;
end
Controls.MapTypeButton:RegisterCallback( Mouse.eLClick, OnMapType );

-------------------------------------------------
-------------------------------------------------
function OnSenarioCheck()
	PreGame.SetLoadWBScenario(not PreGame.GetLoadWBScenario());
	if(PreGame.GetLoadWBScenario()) then
		Controls.AdvancedButton:SetDisabled(true);
		Controls.StartButton:SetText(Locale.ConvertTextKey("TXT_KEY_START_SCENARIO"));
		
		local mapScriptFileName = PreGame.GetMapScript();
		if(IsWBMap(mapScriptFileName)) then
			ApplyScenarioSettings(mapScriptFileName);
			SetupForScenarioMap(mapScriptFileName);
		end
	else
		Controls.AdvancedButton:SetDisabled(false);
		Controls.StartButton:SetText(Locale.ConvertTextKey("TXT_KEY_START_GAME"));
	end
end
Controls.ScenarioCheck:RegisterCallback( Mouse.eLClick, OnSenarioCheck );

-------------------------------------------------
-------------------------------------------------
function OnMapSize()
    Controls.SelectMapSize:SetHide( not Controls.SelectMapSize:IsHidden() );
  
    Controls.SelectMapType:SetHide( true );  
    Controls.SelectDifficulty:SetHide( true );
    Controls.SelectGameSpeed:SetHide( true );

end
Controls.MapSizeButton:RegisterCallback( Mouse.eLClick, OnMapSize );


-------------------------------------------------
-------------------------------------------------
function UpdateDisplay()

	-- In theory, PreGame should do this for me, but just to be sure.
	for i = 0, GameDefines.MAX_MAJOR_CIVS do
		local civIndex = PreGame.GetCivilization(i);
		if(civIndex ~= -1) then
			if(GameInfo.Civilizations[civIndex] == nil) then 
				PreGame.SetCivilization(i, -1);
			end
		end
	end
	
	--if(not bIsModding) then
		---------------------------------------------------
		---- Vanilla Single Player Mapscript Loader
		--SetMapTypeForScript();
		--SetMapSizeForScript();
		---------------------------------------------------
	--else 
		-------------------------------------------------
		-- In Modding Game Setup Screen
		if(PreGame.IsEarthMap()) then
			SetMapTypeForEarthMap();
			SetMapSizeForScript();
			
		elseif( not PreGame.IsRandomMapScript() ) then   
			local mapScriptFileName = PreGame.GetMapScript();

			if(IsWBMap(mapScriptFileName)) then 
				
				-------------------------------------------------
				-- World Builder Map Selected
				-------------------------------------------------
				SetMapTypeSizeForMap(mapScriptFileName);

				if( UI.IsMapScenario(mapScriptFileName)) then
					-------------------------------------------------
					-- Load Scenario (Very Restricted)
					SetupForScenarioMap(mapScriptFileName);
				else
					-------------------------------------------------
					-- Ignore Scenario Info
					SetupForNonScenarioMap();
				end
				-------------------------------------------------
			else 
				-------------------------------------------------
				-- Mapscript Selected
				-------------------------------------------------
				SetMapTypeForScript();
				SetMapSizeForScript();
			end
		else		    
			-------------------------------------------------
			-- Random Mapscript Selected
			-------------------------------------------------
			SetMapTypeForScript();
			SetMapSizeForScript();
		end
	--end
    
    -- Set Difficulty Slot
	SetDifficulty();
    
    -- Set Game Pace Slot
	SetGamePace();

    -- Sets up Selected Civ Slot
	SetSelectedCiv();
    
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetMapTypeForScript()
	Controls.AdvancedButton:SetDisabled(false);
	Controls.MapTypeButton:SetHide(false);
	Controls.LoadScenarioBox:SetHide( true );
	if( not PreGame.IsRandomMapScript() ) then   
		local mapScriptFileName = PreGame.GetMapScript();
		local mapScript = nil;
        
		for row in GameInfo.MapScripts() do
			if(row.FileName == mapScriptFileName) then
				mapScript = row;
				break;
			end
		end
        
		if(mapScript ~= nil) then
			IconHookup( mapScript.IconIndex or 0, 128, mapScript.IconAtlas, Controls.TypeIcon );        
			Controls.TypeHelp:SetText( Locale.ConvertTextKey( mapScript.Description or "" ) );
			Controls.TypeName:SetText( Locale.ConvertTextKey("TXT_KEY_AD_MAP_TYPE_SETTING", Locale.ConvertTextKey( mapScript.Name ) ) );
		else
			PreGame.SetRandomMapScript(true);
		end
	end
    
	if(PreGame.IsRandomMapScript()) then
		IconHookup( 4, 128, "WORLDTYPE_ATLAS", Controls.TypeIcon);        
		Controls.TypeHelp:SetText(Locale.ConvertTextKey("TXT_KEY_RANDOM_MAP_SCRIPT_HELP" ));
		Controls.TypeName:SetText(Locale.ConvertTextKey("TXT_KEY_AD_MAP_TYPE_SETTING", Locale.ConvertTextKey("TXT_KEY_RANDOM_MAP_SCRIPT")));
	end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetMapSizeForScript()
	Controls.MapSizeButton:SetHide(false);
	Controls.MapSizeButton:SetDisabled(false);
	if( not PreGame.IsRandomWorldSize() ) then
		local info = GameInfo.Worlds[ PreGame.GetWorldSize() ];
		if ( info ~= nil ) then
			IconHookup( info.PortraitIndex, 128, info.IconAtlas, Controls.SizeIcon );
			Controls.SizeHelp:SetText( Locale.ConvertTextKey( info.Help ) );
			Controls.SizeName:SetText( Locale.ConvertTextKey( "TXT_KEY_AD_MAP_SIZE_SETTING", Locale.ConvertTextKey( info.Description ) ) );
		end
	else
		IconHookup( 6, 128, "WORLDSIZE_ATLAS", Controls.SizeIcon );
		Controls.SizeHelp:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_MAP_SIZE_HELP" ) );
		Controls.SizeName:SetText( Locale.ConvertTextKey( "TXT_KEY_AD_MAP_SIZE_SETTING", Locale.ConvertTextKey( "TXT_KEY_RANDOM_MAP_SIZE" ) ) );
	end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetDifficulty()
    -- Set Difficulty Slot
    local info = GameInfo.HandicapInfos[ PreGame.GetHandicap( 0 ) ];
    if ( info ~= nil ) then
        IconHookup( info.PortraitIndex, 128, info.IconAtlas, Controls.DifficultyIcon );
        Controls.DifficultyHelp:SetText( Locale.ConvertTextKey( info.Help ) );
        Controls.DifficultyName:SetText( Locale.ConvertTextKey("TXT_KEY_AD_HANDICAP_SETTING", Locale.ConvertTextKey( info.Description ) ) );
    end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetGamePace()
    -- Set Game Pace Slot
    local info = GameInfo.GameSpeeds[ PreGame.GetGameSpeed() ];
    if ( info ~= nil ) then
        IconHookup( info.PortraitIndex, 128, info.IconAtlas, Controls.SpeedIcon );
        Controls.SpeedHelp:SetText( Locale.ConvertTextKey( info.Help ) );
        Controls.SpeedName:SetText( Locale.ConvertTextKey("TXT_KEY_AD_GAME_SPEED_SETTING", Locale.ConvertTextKey( info.Description ) ) );
    end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
bScenarioSettingsLoaded = false;
function SetMapTypeSizeForMap(mapScriptFileName)
	local mapInfo = UI.GetMapPreview(mapScriptFileName);
	if(mapInfo ~= nil) then		
		-- Set Map Type Slot	
		local mapName = Path.GetFileNameWithoutExtension(mapScriptFileName);
		if(not Locale.IsNilOrWhitespace(mapInfo.Name)) then
			mapName = Locale.ConvertTextKey(mapInfo.Name);
		else
			mapName = Path.GetFileNameWithoutExtension(mapScriptFileName);
		end
		
		Controls.TypeName:SetText(Locale.ConvertTextKey("TXT_KEY_AD_MAP_TYPE_SETTING", mapName));
		Controls.TypeHelp:LocalizeAndSetText(mapInfo.Description);
		
		if(UI.IsMapScenario(mapScriptFileName)) then
			
			local ttEntries = {
				Locale.Lookup("TXT_KEY_AD_SETUP_PLAYER_COUNT", mapInfo.PlayerCount),
				Locale.Lookup("TXT_KEY_AD_SETUP_CITY_STATES", mapInfo.CityStateCount),
				Locale.Lookup("TXT_KEY_AD_SETUP_START_ERA", mapInfo.StartEra)
			};
			
			if(tonumber(mapInfo.MaxTurns) > 0) then
				table.insert(ttEntries, Locale.Lookup("TXT_KEY_AD_SETUP_MAX_TURNS_1", mapInfo.MaxTurns)); 
			end
			
			Controls.LoadScenarioBox:SetToolTipString(table.concat(ttEntries, "[NEWLINE]"));
		end
					
		-- Set Map Size Slot
		local info = GameInfo.Worlds[ mapInfo.MapSize ];
		if ( info ~= nil ) then
			IconHookup( info.PortraitIndex, 128, info.IconAtlas, Controls.SizeIcon );
			Controls.SizeHelp:SetText( Locale.ConvertTextKey( info.Help ) );
			Controls.SizeName:SetText( Locale.ConvertTextKey( "TXT_KEY_AD_MAP_SIZE_SETTING", Locale.ConvertTextKey( info.Description ) ) );
			Controls.MapSizeButton:SetDisabled(true);
		end
		
		if (PreGame.GetLoadWBScenario() and not bScenarioSettingsLoaded) then
			ApplyScenarioSettings(mapScriptFileName);
		end
	end
end

function SetMapTypeForEarthMap()

	Controls.AdvancedButton:SetDisabled(false);
	Controls.MapSizeButton:SetDisabled(false);

	Controls.MapTypeButton:SetHide(false);
	Controls.LoadScenarioBox:SetHide( true );
	
	IconHookup(3, 128, "WORLDTYPE_ATLAS", Controls.TypeIcon);
	Controls.TypeHelp:LocalizeAndSetText("TXT_KEY_MAP_EARTH_HELP");
	Controls.TypeName:LocalizeAndSetText("TXT_KEY_MAP_EARTH_TITLE");
end

----------------------------------------------------------------        
----------------------------------------------------------------
function ApplyScenarioSettings(mapFileName)
	if (PreGame.GetLoadWBScenario() and IsWBMap(mapFileName)) then
		UI.ResetScenarioPlayerSlots();
			
		local preview = UI.GetMapPreview(mapFileName);
		if(preview ~= nil) then
			PreGame.SetGameSpeed(preview.DefaultSpeed);
			SetGamePace();
		end
		
		local playerList = UI.GetMapPlayers(mapFileName);
		if(playerList ~= nil) then
			for i, v in pairs(playerList) do
				if(v.Playable) then
					UI.MoveScenarioPlayerToSlot(i - 1, 0);
					PreGame.SetHandicap(0, v.DefaultHandicap);
					local civ = GameInfo.Civilizations[ v.CivType ];
					if(civ ~= nil) then
						PreGame.SetCivilization(0, v.CivType);
					else
						PreGame.SetCivilization(0, -1);
					end
					
					SetSelectedCiv();
					SetDifficulty();
					break;
				end
			end
		end
		
		bScenarioSettingsLoaded = true;
	end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetupForScenarioMap(mapScriptFileName)
	local loadScenarioChecked = PreGame.GetLoadWBScenario();
	Controls.LoadScenarioBox:SetHide( false );
	Controls.AdvancedButton:SetDisabled(loadScenarioChecked);
	Controls.ScenarioCheck:SetCheck( loadScenarioChecked );
	Controls.StartButton:SetText(Locale.ConvertTextKey("TXT_KEY_START_SCENARIO"));
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetupForNonScenarioMap()
	Controls.AdvancedButton:SetDisabled(false);
	Controls.LoadScenarioBox:SetHide( true );
	--Controls.ScenarioCheck:SetCheck( false );
	Controls.StartButton:SetText(Locale.ConvertTextKey("TXT_KEY_START_GAME"));
	PreGame.SetLoadWBScenario(false);
end

function SetSelectedCiv()
    -- Sets valid initial index for Civ Slot
    local civIndex = PreGame.GetCivilization( 0 );
    
    local civ = GameInfo.Civilizations[civIndex];
    
    if(civ == nil) then
		PreGame.SetCivilization(0, -1);
	end
    
    -- Sets up Selected Civ Slot
    if( civ ~= nil ) then
		
        -- Use the Civilization_Leaders table to cross reference from this civ to the Leaders table
        local leader = GameInfo.Leaders[GameInfo.Civilization_Leaders( "CivilizationType = '" .. civ.Type .. "'" )().LeaderheadType];
        local leaderDescription = leader.Description;

		
        
		IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.Portrait );

		SimpleCivIconHookup( 0, 64, Controls.IconShadow );      
         
		-- Sets Trait bonus Text
        local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
        local trait = GameInfo.Traits[leaderTrait.TraitType];
        
        Controls.BonusDescription:SetText( Locale.ConvertTextKey( trait.Description ));
        
        SetCivName(leaderDescription, civ.ShortDescription, trait.ShortDescription);
        
        -- Sets Bonus Icons
        PopulateUniqueBonuses( Controls, civ, leader );
        
        -- Set Selected Civ Map
		Controls.LargeMapImage:UnloadTexture();
        local mapTexture=civ.MapImage;
		Controls.LargeMapImage:SetTexture(mapTexture);  
        
    else 
    	-------------------------------------------------
		-- Random Civ Slot Setup
		---------------------------------------------------           
        SetCivName("TXT_KEY_RANDOM_LEADER", "TXT_KEY_RANDOM_CIV", "TXT_KEY_MISC_RANDOMIZE");

		IconHookup( 22, 128, "LEADER_ATLAS", Controls.Portrait );
		if questionOffset ~= nil then       
			Controls.IconShadow:SetTexture( questionTextureSheet );
			Controls.IconShadow:SetTextureOffset( questionOffset );
        end

		-- Sets Trait bonus Text
        Controls.BonusDescription:SetText( "" );
		
		-- Set Selected Civ Map
		Controls.LargeMapImage:UnloadTexture();
        local mapTexture="MapRandom512.dds";
		Controls.LargeMapImage:SetTexture(mapTexture);  
 
		-- Sets Bonus Icons
		local maxSmallButtons = 2;
		for buttonNum = 1, maxSmallButtons, 1 do
			local buttonName = "B"..tostring(buttonNum);
			Controls[buttonName]:SetTexture( questionTextureSheet );
			Controls[buttonName]:SetTextureOffset( questionOffset );
			Controls[buttonName]:SetToolTipString( unknownString );
			Controls[buttonName]:SetHide(false);
			local buttonFrameName = "BF"..tostring(buttonNum);
			Controls[buttonFrameName]:SetHide(false);
		end

    end
end

function SetCivName(defaultLeader, defaultCiv, defaultTrait)
    local name = PreGame.GetLeaderName(0);
    local civName = PreGame.GetCivilizationDescription(0);
    
    local title;
	if(name ~= "" and civName ~= "") then
		title = Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName );
		Controls.RemoveButton:SetHide(false);
	else
		title = Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", defaultLeader, defaultCiv);
		Controls.RemoveButton:SetHide(true);
	end
	
	title = string.format("%s (%s)", title, Locale.ConvertTextKey(defaultTrait));
	Controls.Title:SetText(title);
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function IsWBMap(file)
	return Path.UsesExtension(file,".Civ5Map"); 
end
----------------------------------------------------------------        
----------------------------------------------------------------        
function ShowHideHandler( isHide )
    --if( isHide == false ) then 	
		UpdateDisplay();
				    
		if(bIsModding) then
			Controls.ScreenTitle:SetText( Locale.ConvertTextKey( "TXT_KEY_MODDING_SETUP_TITLE" ) );
		else
			Controls.ScreenTitle:SetText( Locale.ConvertTextKey( "TXT_KEY_GAME_SELECTION_SCREEN" ) );
		end
	    
		Controls.MainSelection:SetHide( false );

		Controls.SelectMapType:SetHide( true );
		Controls.SelectMapSize:SetHide( true );
		Controls.SelectDifficulty:SetHide( true );
		Controls.SelectGameSpeed:SetHide( true );
    --end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );


----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE then
            OnBack();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );
