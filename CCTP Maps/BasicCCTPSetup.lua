-- BasicCCTPSetup
-- By: Firesforever
-- Thanks: Seraphim for the RNE mod
----------------------------------------------------------------
-------------------------------------------------
-- Scenario Load Screen
-------------------------------------------------
include( "IconSupport" );
include( "UniqueBonuses" );
include( "InstanceManager" );

include("MasterMapInfo");

-------------------------------------------------
-- Back Button Handler
-------------------------------------------------
function OnAdvanced()
    UIManager:QueuePopup( Controls.AdvancedSetup, PopupPriority.CustomMod );
end
Controls.AdvancedButton:RegisterCallback( Mouse.eLClick, OnAdvanced );

function OnBack()
    UIManager:DequeuePopup( ContextPtr );
    ContextPtr:SetHide( true );
	Controls.LargeMapImage:UnloadTexture();    
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );

-------------------------------------------------
-------------------------------------------------
function OnStart()
	-- Save map options to use later in the map manager
	modUserData.SetValue ("TSLorRSL", PreGame.GetMapOption(10))
	modUserData.SetValue ("TRL", PreGame.GetMapOption(11))
	
	PreGame.SetPersistSettings(true); -- Whether or not to save settings for the "Play Now" option.
	
	PreGame.SetRandomMapScript(false);
	PreGame.SetLoadWBScenario(false);
	PreGame.SetOverrideScenarioHandicap(true);
	
	InitCCTP();

	Events.SerialEventStartGame();
	UIManager:SetUICursor( 1 );
end
Controls.StartButton:RegisterCallback( Mouse.eLClick, OnStart );


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
    --Controls.SelectMapType:SetHide( true );
    --Controls.SelectMapSize:SetHide( true );
    Controls.LargeMapImage:UnloadTexture();
end
Controls.CivilizationButton:RegisterCallback( Mouse.eLClick, OnCivilization );


-------------------------------------------------
-------------------------------------------------
function OnSpeed()
    Controls.SelectGameSpeed:SetHide( not Controls.SelectGameSpeed:IsHidden() );
    
 --   Controls.SelectMapType:SetHide( true );
 --   Controls.SelectMapSize:SetHide( true );
    Controls.SelectDifficulty:SetHide( true );
 
end
Controls.GameSpeedButton:RegisterCallback( Mouse.eLClick, OnSpeed );


-------------------------------------------------
-------------------------------------------------
function OnDifficulty()
    Controls.SelectDifficulty:SetHide( not Controls.SelectDifficulty:IsHidden() );
    
    Controls.SelectGameSpeed:SetHide( true );
    --Controls.SelectMapType:SetHide( true );
    --Controls.SelectMapSize:SetHide( true );
end
Controls.DifficultyButton:RegisterCallback( Mouse.eLClick, OnDifficulty );

-------------------------------------------------
-------------------------------------------------
function OnSenarioCheck()
	
	if (Controls.ScenarioCheck:IsChecked()) then
		Controls.ScenarioCheck:SetCheck( true );
		PreGame.SetMapOption(10, 1);
		--modUserData.SetValue ("TSLorRSL", "TSL")
		print ("true")
	else 
		Controls.ScenarioCheck:SetCheck( false );
		PreGame.SetMapOption(10, 2);
		--modUserData.SetValue ("TSLorRSL", "RSL")
		print ("false")
	end
end
Controls.ScenarioCheck:RegisterCallback( Mouse.eLClick, OnSenarioCheck );

function OnResourcesCheck()
	if (Controls.ResourcesCheck:IsChecked()) then
		Controls.ResourcesCheck:SetCheck( true )
		PreGame.SetMapOption(11, 1);
		print ("true")
	else 
		Controls.ResourcesCheck:SetCheck( false );
		PreGame.SetMapOption(11, 2);
		print ("false")
	end
end
Controls.ResourcesCheck:RegisterCallback( Mouse.eLClick, OnResourcesCheck );
-------------------------------------------------
-------------------------------------------------
function InitCCTP()
	
	-- Here we will be placing the civs into the game
	-- PreGame.SetCivilization(playerID, civ.ID)
	
	local civEntries = {}; 
	
		local sql = [[	SELECT 
						Civilizations.ID AS ID, 
						Civilizations.Type AS Type 
						FROM Civilizations
					]];
		
		local playerID = 0
		local WorldChosen = modUserData.GetValue ("MapSelected")
		local found = 0
		local scenarios = {}
		local scenario = {}
		local i = 1
		
		-- lets find out which scenario info we should be using for the chosen world
		
		for k, v in ipairs(CCTPScenarios) do
			scenarios = CCTPScenarios [k]
			if WorldChosen == scenarios [1] then
				scenario = scenarios [2]
			end
		end
		
		if CCTPScenarios[1] == nil then
			print ("Error: No match between world and array found - Check MasterMapInfo file")  
		end
		
		local maxScenarioCivs = scenario [2]
		maxCivs = scenario [1]
		print (maxCivs)
		
		local playerCiv = modUserData.GetValue ("playerCiv")
		
		-- Lets create a table of all the possible civs
		for row in DB.Query(sql) do
			table.insert(civEntries, row);
		end
		
		-- Lets randomise the list of civs so we dont always get the same ones if the player has chosen less than the maximum available
		for i = maxCivs, 2, -1 do
			local r = math.random(i) -- a random number between 1 and maxcivs
			civEntries[i], civEntries[r] = civEntries[r], civEntries[i] -- swap the randomly selected item to position i
		end 
		
		local numCivs = (modUserData.GetValue ("numCivs") - 1)
		print (numCivs, "number of playable civs")
		-- Now lets place the civs into the game
		local row = {}
		local playerNum = 0
		for pPlayer,v in pairs(civEntries) do
			row = v
			local i = 3
			local found = 0
			local pcivCheck = PreGame.GetCivilization(playerNum)
			--print (playerNum, pcivCheck, "player Civ ID")
			--local slotCheck = PreGame.GetSlotStatus( pPlayer )
			--local slotCheck = PreGame.GetTeam( pPlayer )
			
			if pcivCheck ~= -1 then
				print ("The player has chosen a civ")
				playerNum = playerNum + 1
				
				if playerNum == numCivs then  -- This needs to relate to number of players in the game
					break;
				end
				
			else
				repeat 
					local CivAllowed = scenario [i]
					--print (CivAllowed)
				
					if row.Type == CivAllowed and playerCiv ~= row.ID then
						print (playerNum, CivAllowed,": civ is allowed in this scenario")
						PreGame.SetCivilization(playerNum, row.ID)
						found = 1
						playerNum = playerNum + 1
					else
						--print ("civ not found")
						--print (i)
						i = i + 1
					end
				until found == 1 or CivAllowed == nil
			
				if playerNum == numCivs then  -- This needs to relate to number of players in the game
					break;
				end
			end
		end
end

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
	local mapScriptFileName = PreGame.GetMapScript();
	-------------------------------------------------
	-- Mapscript Selected
	-------------------------------------------------
	--SetMapTypeSizeForMap(mapScriptFileName);
	--SetupForScenarioMap(mapScriptFileName);
	SetMapTypeForScript();
	SetMapSizeForScript();
	   
    -- Set Difficulty Slot
	SetDifficulty();
    
    -- Set Game Pace Slot
	SetGamePace();

    -- Sets up Selected Civ Slot
	SetSelectedCiv();
    
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
function SetMapTypeForScript()
	local mapScriptFileName = PreGame.GetMapScript();
	local WorldChosen = modUserData.GetValue ("MapSelected")
	local mapScript = nil;
	local mapOptions = {}
	local mapOption = {}
	
	-- Identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		mapOptions = CCTPScenarios [k]
		if WorldChosen == mapOptions [1] then
			mapOption = mapOptions [9]
		end
	end
	
	for row in GameInfo.MapScripts() do
		if(row.FileName == mapScriptFileName) then
			mapScript = row;
			break;
		end
	end
	if(mapScript ~= nil) then
		local info = GameInfo.Worlds[ 4 ];
		IconHookup( info.PortraitIndex, 128, info.IconAtlas, Controls.SizeIcon );
		
		--This needs to be set for every map that has True start locations
		if mapOption[1] == 1 then
			Controls.TypeHelp:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_TSL_DESC" ) );
			Controls.ScenarioCheck:SetDisabled(false);
		elseif mapOption[1] == 0 then
			Controls.TypeHelp:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_NO_TSL_DESC" ) );
			Controls.ScenarioCheck:SetDisabled(true);
			Controls.ScenarioCheck:SetCheck( false );
		else
			print ("Error: No TSL map option or incorrect value set")
		end
		Controls.TypeName:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_TSL_NAME" ) );
	else
		PreGame.SetRandomMapScript(true);
	end

end
----------------------------------------------------------------        
---------------------------------------------------------------- 
function SetMapSizeForScript()
	local WorldChosen = modUserData.GetValue ("MapSelected")
	Controls.MapSizeButton:SetHide(false);
	Controls.MapSizeButton:SetDisabled(false);
	IconHookup( 3, 128, "WORLDTYPE_ATLAS", Controls.TypeIcon ); 
	
	local mapOptions = {}
	local mapOption = {}
	
	-- Identifies which map data the chosen world uses
	for k, v in ipairs(CCTPScenarios) do
		mapOptions = CCTPScenarios [k]
		if WorldChosen == mapOptions [1] then
			mapOption = mapOptions [9]
		end
	end
	
	--This needs to be set for every map that has real resource placement
	if mapOption[2] == 1 then
		Controls.SizeHelp:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_TRL_DESC" ) );
		Controls.ResourcesCheck:SetDisabled(false);
	elseif mapOption[2] == 0 then
		Controls.SizeHelp:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_NO_TRL_DESC" ) );
		Controls.ResourcesCheck:SetDisabled(true);
		Controls.ResourcesCheck:SetCheck( false );
	end
	Controls.SizeName:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_RRL_NAME" ) );
	
end

----------------------------------------------------------------        
---------------------------------------------------------------- 


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

		SetCivName(Locale.ConvertTextKey( leaderDescription ), Locale.ConvertTextKey( civ.ShortDescription ));
        
		IconHookup( leader.PortraitIndex, 128, leader.IconAtlas, Controls.Portrait );

		SimpleCivIconHookup( 0, 64, Controls.IconShadow );      
         
		-- Sets Trait bonus Text
        local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
        local trait = leaderTrait.TraitType;
        Controls.BonusTitle:SetText( Locale.ConvertTextKey( GameInfo.Traits[trait].ShortDescription ));
        Controls.BonusDescription:SetText( Locale.ConvertTextKey( GameInfo.Traits[trait].Description ));
        
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
        SetCivName(Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER" ), Locale.ConvertTextKey( "TXT_KEY_RANDOM_CIV" ));

		IconHookup( 22, 128, "LEADER_ATLAS", Controls.Portrait );
		if questionOffset ~= nil then       
			Controls.IconShadow:SetTexture( questionTextureSheet );
			Controls.IconShadow:SetTextureOffset( questionOffset );
        end

		-- Sets Trait bonus Text
        Controls.BonusTitle:SetText( Locale.ConvertTextKey( "TXT_KEY_MISC_RANDOMIZE" ));
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

function SetCivName(defaultLeader, defaultCiv)
    local name = PreGame.GetLeaderName(0);
    local civName = PreGame.GetCivilizationDescription(0);
	if(name ~= "" and civName ~= "") then
		Controls.Title:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", name, civName ) );
		Controls.RemoveButton:SetHide(false);
	else
		Controls.Title:SetText( Locale.ConvertTextKey( "TXT_KEY_RANDOM_LEADER_CIV", defaultLeader, defaultCiv ) );
		Controls.RemoveButton:SetHide(true);
	end
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function IsWBMap(file)
	return Path.UsesExtension(file,".Civ5Map"); 
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function ChopFileName(file)
	_, _, chop = string.find(file,"\\.+\\(.+)%."); 
	return chop;
end
----------------------------------------------------------------        
----------------------------------------------------------------        
function ShowHideHandler( isHide )
    --if( isHide == false ) then 	
		UpdateDisplay();
				    
		Controls.ScreenTitle:SetText( Locale.ConvertTextKey( "TXT_KEY_CCTP_TITLE" ) );

		Controls.MainSelection:SetHide( false );

		--Controls.SelectMapType:SetHide( true );
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

----------------------------------------------------------------
-- Initialization
---------------------------------------------------------------- 
function Initialization()
	local maps = Modding.GetMapFiles();
	local DefaultMap = nil;
	
	-- Set check options to default
	Controls.ScenarioCheck:SetCheck( true );
	PreGame.SetMapOption(10, 1);
	Controls.ResourcesCheck:SetCheck( true );
	PreGame.SetMapOption(11, 1);
	
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	
	--Looks like this will allow for map scripts to be loaded
	for row in GameInfo.MapScripts{ SupportsSinglePlayer = 1, Hidden = 0} do
		if string.find(row.FileName ,"CCTPMapManager.lua" ,1) then
			DefaultMap = row;
			break;
		end
	end
	if DefaultMap == nil then
		print("Error - Map not found");
		return;
	end
	PreGame.SetEarthMap(false);
	PreGame.SetRandomMapScript(false);
	PreGame.SetMapScript(DefaultMap.FileName);
	PreGame.SetLoadWBScenario(false);
	PreGame.SetRandomWorldSize( false );
	PreGame.SetGameSpeed( 2 );
	PreGame.SetNumMinorCivs(27);
	PreGame.SetGameOption("GAMEOPTION_POLICY_SAVING", true);
	PreGame.SetGameOption("GAMEOPTION_RAGING_BARBARIANS", true);
	PreGame.SetMapOption(5, 3);
	PreGame.SetMapOption(11, true);
end

Initialization()