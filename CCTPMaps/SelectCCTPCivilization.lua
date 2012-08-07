-------------------------------------------------
-- Select Civilization
-------------------------------------------------
include( "UniqueBonuses" );
include("MasterMapInfo");

------------------------------------------------
-- Global Variables
------------------------------------------------
g_bIsScenario = false;
g_bWasScenario = true;
g_bRefreshCivs = false;
  
-------------------------------------------------
-------------------------------------------------
function OnBack()
	UIManager:DequeuePopup( ContextPtr );
	ContextPtr:SetHide( true );
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );


----------------------------------------------------------------        
----------------------------------------------------------------        
function ShowHideHandler( bIsHide )
	g_bRefreshCivs = true;
	local isWBMap = IsWBMap(PreGame.GetMapScript());
	g_bIsScenario = (PreGame.GetLoadWBScenario() and isWBMap);
	if(g_bWasScenario ~= g_bIsScenario) then
		g_bRefreshCivs = true;
	end
	g_bWasScenario = g_bIsScenario;

   if( not bIsHide and (isWBMap or g_bRefreshCivs)) then
		g_bRefreshCivs = false;
    	Controls.Stack:DestroyAllChildren(); 
    	InitCivSelection();
   end

end
ContextPtr:SetShowHideHandler( ShowHideHandler );

----------------------------------------------------------------        
---------------------------------------------------------------- 
function IsWBMap(file)
	return Path.UsesExtension(file,".Civ5Map"); 
end

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
-- set the Civ
----------------------------------------------------------------        
function CivilizationSelected( civID, scenarioPlayerID )
    
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	PreGame.SetCivilization( 0, civID );
	modUserData.SetValue ("playerCiv", civID)
	
    if g_bIsScenario then
		UI.MoveScenarioPlayerToSlot( scenarioPlayerID, 0 );
		print("select civ");
		local playerList = UI.GetMapPlayers(PreGame.GetMapScript());
		if(playerList ~= nil) then
			local player = playerList[scenarioPlayerID + 1];
			if(player ~= nil) then
				PreGame.SetHandicap(0, player.DefaultHandicap);
			end
		end
    end
    
    OnBack();
end

function AddRandomCivilizationEntry()
	------------------------------------------------------------------------------------------------
	-- set up the random slot
	------------------------------------------------------------------------------------------------
	local controlTable = {};
	ContextPtr:BuildInstanceForControl( "ItemInstance", controlTable, Controls.Stack );
	controlTable.Button:SetVoid1( -1 );
	controlTable.Button:RegisterCallback( Mouse.eLClick, CivilizationSelected );

	controlTable.Title:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER");
	controlTable.Description:LocalizeAndSetText("TXT_KEY_RANDOM_LEADER_HELP");
	
	IconHookup( 22, 128, "LEADER_ATLAS", controlTable.Portrait );
	if questionOffset ~= nil then       
		controlTable.CivIcon:SetTexture( questionTextureSheet );
		controlTable.CivIcon:SetTextureOffset( questionOffset );
	end
		
	-- Sets Trait bonus Text
	controlTable.BonusDescription:SetText( "" );

	 -- Sets Bonus Icons
	local maxSmallButtons = 2;
	for buttonNum = 1, maxSmallButtons, 1 do
		local buttonName = "B"..tostring(buttonNum);
		controlTable[buttonName]:SetTexture( questionTextureSheet );
		controlTable[buttonName]:SetTextureOffset( questionOffset );
		controlTable[buttonName]:SetToolTipString( unknownString );
		controlTable[buttonName]:SetHide(false);
		local buttonFrameName = "BF"..tostring(buttonNum);
		controlTable[buttonFrameName]:SetHide(false);
	end
end

function AddCivilizationEntry(traitsQuery, populateUniqueBonuses, civ, leaderType, leaderDescription, leaderPortraitIndex, leaderIconAtlas, scenarioCivID)

	local controlTable = {};
	ContextPtr:BuildInstanceForControl( "ItemInstance", controlTable, Controls.Stack );
    
	controlTable.Button:SetVoid1( civ.ID );
	controlTable.Button:SetVoid2( scenarioCivID );
	controlTable.Button:RegisterCallback( Mouse.eLClick, CivilizationSelected );

	IconHookup( leaderPortraitIndex, 128, leaderIconAtlas, controlTable.Portrait );
	local textureOffset, textureAtlas = IconLookup( civ.PortraitIndex, 64, civ.IconAtlas );
	if textureOffset ~= nil then       
		controlTable.CivIcon:SetTexture( textureAtlas );
		controlTable.CivIcon:SetTextureOffset( textureOffset );
	end
    
    -- Sets Trait bonus Text
	local shortDescription = "";
	
	for row in traitsQuery(leaderType) do
		controlTable.BonusDescription:LocalizeAndSetText(row.Description);
		shortDescription = row.ShortDescription;
	end
	
	local title = Locale.ConvertTextKey("TXT_KEY_RANDOM_LEADER_CIV", leaderDescription, civ.ShortDescription);
	title = string.format("%s (%s)", title, Locale.ConvertTextKey( shortDescription ));
	
	controlTable.Title:SetText(title);			
	controlTable.Description:LocalizeAndSetText(civ.Description);
	
	populateUniqueBonuses( controlTable, civ.Type);
	
	return controlTable;
end

function InitCivSelection()
	
	-- Lets open up the moduser database as we need to get info from it
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	local traitsQuery = DB.CreateQuery([[SELECT Description, ShortDescription FROM Traits inner join 
										 Leader_Traits ON Traits.Type = Leader_Traits.TraitType 
										 WHERE Leader_Traits.LeaderType = ? LIMIT 1]]);
	local populateUniqueBonuses = PopulateUniqueBonuses_CreateCached();
										 
													 
	if(g_bIsScenario) then
		local civList = UI.GetMapPlayers(PreGame.GetMapScript());
		print(civList);
		if(civList ~= nil) then
			
			local sql = [[	SELECT 
							Civilizations.ID, 
							Civilizations.Type, 
							Civilizations.Description, 
							Civilizations.ShortDescription, 
							Civilizations.PortraitIndex, 
							Civilizations.IconAtlas, 
							Leaders.Type AS LeaderType,
							Leaders.Description as LeaderDescription, 
							Leaders.PortraitIndex as LeaderPortraitIndex, 
							Leaders.IconAtlas as LeaderIconAtlas 
							FROM Civilizations, Leaders, Civilization_Leaders WHERE
							Civilizations.ID = ? AND
							Civilizations.Type = Civilization_Leaders.CivilizationType AND
							Leaders.Type = Civilization_Leaders.LeaderheadType
							LIMIT 1
						]];
						
			local scenarioCivQuery = DB.CreateQuery(sql);
					
			local civEntries = {};
			
			for i, v in pairs(civList) do
				if(v.Playable) then
					for row in scenarioCivQuery(v.CivType) do
						table.insert(civEntries, {Locale.Lookup(row.LeaderDescription), row, i - 1});
					end
				end
			end
			
			-- Sort by leader description;
			table.sort(civEntries, function(a, b) return Locale.Compare(a[1], b[1]) == -1 end);
			
			for i,v in ipairs(civEntries) do
				local row = v[2];
				local scenarioCivID = v[3];
				AddCivilizationEntry(traitsQuery, populateUniqueBonuses, row, row.LeaderType, row.LeaderDescription, row.LeaderPortraitIndex, row.LeaderIconAtlas, scenarioCivID);
			end	
		end
	else
		AddRandomCivilizationEntry();
					
		local civEntries = {}; 
			
		local sql = [[	SELECT 
						Civilizations.ID, 
						Civilizations.Type, 
						Civilizations.Description, 
						Civilizations.ShortDescription, 
						Civilizations.PortraitIndex, 
						Civilizations.IconAtlas, 
						Leaders.Type AS LeaderType,
						Leaders.Description as LeaderDescription, 
						Leaders.PortraitIndex as LeaderPortraitIndex, 
						Leaders.IconAtlas as LeaderIconAtlas 
						FROM Civilizations, Leaders, Civilization_Leaders WHERE
						Civilizations.Type = Civilization_Leaders.CivilizationType AND
						Leaders.Type = Civilization_Leaders.LeaderheadType AND
						Civilizations.Playable = 1
					]];
		
		local WorldChosen = modUserData.GetValue ("MapSelected")
		local scenario = {}
		
		-- This will let us know which list of playable civs we should be checking against for this world
		if WorldChosen == 1 then
			scenario = LEMScenario1
		elseif WorldChosen == 2 then
			scenario = LEMScenario1
		elseif WorldChosen == 3 then
			scenario = LEMScenario1
		elseif WorldChosen == 4 then
			scenario = LEMScenario1
		elseif WorldChosen == 5 then
			scenario = LEMScenario1
		elseif WorldChosen == 6 then
			scenario = LEMScenario2
		elseif WorldChosen == 7 then
			scenario = LEMScenario3
		else
			print ("no world chosen")
		end
		
		for row in DB.Query(sql) do
			
			local i = 3
			local found = 0
			
			repeat 
				local CivAllowed = scenario [i]
				--print (CivAllowed)
				
				if row.Type == CivAllowed then
					print (CivAllowed,": civ is allowed in this scenario")
					table.insert(civEntries, {Locale.Lookup(row.LeaderDescription), row});
					found = 1
				else
					--print ("civ not found")
					--print (i)
					i = i + 1
				end
			until found == 1 or CivAllowed == nil
			
		end
		
		-- Sort by leader description;
		table.sort(civEntries, function(a, b) return Locale.Compare(a[1], b[1]) == -1 end);
				
		for i,v in ipairs(civEntries) do
			local row = v[2];
			AddCivilizationEntry(traitsQuery, populateUniqueBonuses, row, row.LeaderType, row.LeaderDescription, row.LeaderPortraitIndex, row.LeaderIconAtlas);
		end
	end

	Controls.Stack:CalculateSize();
	Controls.Stack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
end

Events.AfterModsActivate.Add(function()
	g_bRefreshCivs = true;
end);

Events.AfterModsDeactivate.Add(function()
	g_bRefreshCivs = true;
end);