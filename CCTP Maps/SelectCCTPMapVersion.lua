-- SelectCCTPMapVersion
-- By: Firesforever
-- Note: need to implement a better system for placing the list of worlds
-- Thanks: Seraphim for the RNE mod
--------------------------------------------------------------

-------------------------------------------------
-- Select Map Version
-------------------------------------------------
include("IconSupport");
include("InstanceManager");
include("MasterMapInfo");

g_InstanceManager = InstanceManager:new( "ItemInstance", "Button", Controls.MapsStack );
local g_BackButton = {};


-------------------------------------------------
-------------------------------------------------
--function OnBack()
--   ContextPtr:SetHide( true );
--    ContextPtr:LookUpControl( ".." ):SetHide( false );
--end
--Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnBack );


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

function OnMapScriptSelected(modeID)
	--print("!!!script",script);
	PreGame.SetEarthMap(false);
	PreGame.SetRandomMapScript(false);

	
	local MDesc  -- The description of the map
	local MBg	 -- The Backgroud picture on the description box to use
	local MChosen -- This allows us to know what map has been chosen
	local WorldSize
	local MaxCivs
	
	local i = 1
	local found = 0
	local scenarios = {}
	local World = {}
	local mapOption = {}
	local Civs = {}
	
	
	if modeID == 0 then
		print ("Random Map Script Chosen")
		MChosen = 0
		MDesc = "TXT_KEY_CCTP_RMAP_DESC"
		MBg = "MapRandom512.dds"
		WorldSize = 5
	else
		while scenarios [1] ~= "end" do
			scenarios = CCTPScenarios [i]
			if scenarios[1] ~= "end" then
				World = scenarios [8]
				mapOption = scenarios [9]
				Civs = scenarios [2]
				if modeID == scenarios[1] then
					print ("found")
					MChosen = scenarios[1]
					MDesc = World[2]
					MBg = World[3]
					WorldSize = mapOption[3]
					MaxCivs = Civs[2]
					--found = 1
					i = i + 1
				else
					i = i + 1
				end
			end
		end
	end
	
	local DefaultMap = nil;
	if MChosen == 0 then
		for row in GameInfo.MapScripts{ SupportsSinglePlayer = 1, Hidden = 0} do
			if string.find(row.FileName ,"Continents.lua" ,1) then
				DefaultMap = row;
			end
		end
		if DefaultMap == nil then
			print("Error - Random Map script missing");
			return;
		end	
		PreGame.SetMapScript(DefaultMap.FileName);
	else
		for row in GameInfo.MapScripts{ SupportsSinglePlayer = 1, Hidden = 0} do
			if string.find(row.FileName ,"CCTPMapManager.lua" ,1) then
				DefaultMap = row;
			end
		end
		if DefaultMap == nil then
			print("Error - CCTP true world map script missing");
			return;
		end	
		PreGame.SetMapScript(DefaultMap.FileName);
	end
	
	--lets determine how many civs the chosen world has by default
	modUserData.SetValue ("maxCivs", MaxCivs)
	PreGame.SetWorldSize( WorldSize );
	modUserData.SetValue ("MapSelected", MChosen)
	Controls.MapDesc:SetText( Locale.ConvertTextKey( MDesc ) );
	--Controls.DetailsBackgroundImage:UnloadTexture();
	Controls.DetailsBackgroundImage:SetTexture(MBg);
	
	if WorldSize == 0 then
		modUserData.SetValue ("numCivs", 2)
	elseif WorldSize == 1 then
		modUserData.SetValue ("numCivs", 4)
	elseif WorldSize == 2 then
		modUserData.SetValue ("numCivs", 6)
	elseif WorldSize == 3 then
		modUserData.SetValue ("numCivs", 8)
	elseif WorldSize == 4 then
		modUserData.SetValue ("numCivs", 10)
	elseif WorldSize == 5 then
		modUserData.SetValue ("numCivs", 12)
	end
	
	Controls.StartButton:SetDisabled(false);
	--OnBack();
end

function ShowHideHandler( bIsHide )
	Controls.ScrollPanel:SetScrollValue( 0 );

	RefreshMapScripts();

end
ContextPtr:SetShowHideHandler( ShowHideHandler );

function RefreshMapScripts()
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	Controls.StartButton:SetDisabled(true);
	g_InstanceManager:ResetInstances();
	
	local entries = {};
	local entryCallback = nil;
	worldNumber = 5

	local i = 1
	local scenarios = {}
	local World = {}
	
	--Add the random map script button
	entryCallback = function() OnMapScriptSelected(0) end;
	table.insert(entries, {
	Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RMAP_TITLE"),
	Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RMAP_TITLE"),
	Callback = entryCallback,
	Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	
	while scenarios [1] ~= "end" do
		scenarios = CCTPScenarios [i]
		if scenarios[1] ~= "end" then
			World = scenarios [8]
			if scenarios[1] == 1 then	
				entryCallback = function() OnMapScriptSelected(1) end;
			elseif scenarios[1] == 2 then
				entryCallback = function() OnMapScriptSelected(2) end;
			elseif scenarios[1] == 3 then
				entryCallback = function() OnMapScriptSelected(3) end;
			elseif scenarios[1] == 4 then
				entryCallback = function() OnMapScriptSelected(4) end;
			elseif scenarios[1] == 5 then
				entryCallback = function() OnMapScriptSelected(5) end;
			elseif scenarios[1] == 6 then
				entryCallback = function() OnMapScriptSelected(6) end;
			elseif scenarios[1] == 7 then
				entryCallback = function() OnMapScriptSelected(7) end;
			elseif scenarios[1] == 8 then
				entryCallback = function() OnMapScriptSelected(8) end;
			elseif scenarios[1] == 9 then
				entryCallback = function() OnMapScriptSelected(9) end;
			elseif scenarios[1] == 10 then
				entryCallback = function() OnMapScriptSelected(10) end;
			elseif scenarios[1] == 11 then	
				entryCallback = function() OnMapScriptSelected(11) end;
			elseif scenarios[1] == 12 then
				entryCallback = function() OnMapScriptSelected(12) end;
			elseif scenarios[1] == 13 then
				entryCallback = function() OnMapScriptSelected(13) end;
			elseif scenarios[1] == 14 then
				entryCallback = function() OnMapScriptSelected(14) end;
			elseif scenarios[1] == 15 then
				entryCallback = function() OnMapScriptSelected(15) end;
			elseif scenarios[1] == 16 then
				entryCallback = function() OnMapScriptSelected(16) end;
			elseif scenarios[1] == 17 then
				entryCallback = function() OnMapScriptSelected(17) end;
			elseif scenarios[1] == 18 then
				entryCallback = function() OnMapScriptSelected(18) end;
			elseif scenarios[1] == 19 then
				entryCallback = function() OnMapScriptSelected(19) end;
			elseif scenarios[1] == 20 then
				entryCallback = function() OnMapScriptSelected(20) end;
			end		
			table.insert(entries, {
				Name = Locale.ConvertTextKey(World[1]),
				Description = Locale.ConvertTextKey(World[1]),
				Callback = entryCallback,
				Icon = {3, 64, "WORLDTYPE_ATLAS"},
			});			
		i = i + 1
		--worldNumber = worldNumber + 1
		end
	end
	
	table.sort(entries, function(a, b) return a.Name < b.Name; end);

	for i, v in ipairs(entries) do
		local item = g_InstanceManager:GetInstance();
		IconHookup(v.Icon[1], v.Icon[2], v.Icon[3], item.Icon);
		item.Name:SetText(v.Name);
		item.Button:SetToolTipString(v.Description);
		item.Button:RegisterCallback(Mouse.eLClick, function() 
			if(v.Callback) then 
				v.Callback(); 
			end
		end);
	end

	
	Controls.MapsStack:CalculateSize();
	Controls.MapsStack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
end

----------------------------------------------------------------        
---------------------------------------------------------------- 
function ChopFileName(file)
	_, _, chop = string.find(file,"\\.+\\(.+)%."); 
	return chop;
end

function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE then
            OnBack();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

function OnBack()
    UIManager:DequeuePopup( ContextPtr );
    ContextPtr:SetHide( true );
	
end
Controls.BackButton:RegisterCallback( Mouse.eLClick, OnBack );

function StartButton()
    
	--Controls.MapSetup1:SetHide( false );
	UIManager:QueuePopup( Controls.RTPSetup, PopupPriority.CustomMod );
	--UIManager:DequeuePopup( ContextPtr );
    --ContextPtr:SetHide( true );
	
end
Controls.StartButton:RegisterCallback( Mouse.eLClick, StartButton );

       
RefreshMapScripts();


