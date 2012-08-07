-------------------------------------------------
-- Select Map Type
-------------------------------------------------
include("IconSupport");
include("InstanceManager");

g_InstanceManager = InstanceManager:new( "ItemInstance", "Button", Controls.Stack );
local g_BackButton = {};
local g_isModding = true;

---------------------------------------------------------------- 
function IsWBMap(file)
	return Path.UsesExtension(file,".Civ5Map"); 
end

-- These are WB Maps that we explicitly do not want to display.
local worldBuilderMapsToFilter = {
	-- Filter out the earth maps since they are a special case.
	"Assets\\Maps\\Earth_Duel.Civ5Map",
	"Assets\\Maps\\Earth_Huge.Civ5Map",
	"Assets\\Maps\\Earth_Large.Civ5Map",
	"Assets\\Maps\\Earth_Small.Civ5Map",
	"Assets\\Maps\\Earth_Standard.Civ5Map",
	"Assets\\Maps\\Earth_Tiny.Civ5Map",
}


-------------------------------------------------
-------------------------------------------------
function OnBack()
    ContextPtr:SetHide( true );
    ContextPtr:LookUpControl( ".." ):SetHide( false );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnBack );


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

function OnMapScriptSelected(script)
	PreGame.SetEarthMap(false);
	
	if(script == nil) then
		PreGame.SetRandomMapScript(true);
	else
		PreGame.SetRandomMapScript(false);
		
		local mapScript = "";
		if(type(script) == "string") then
			mapScript = script;
		else
			mapScript = script.FileName;
		end
		
		PreGame.SetMapScript(mapScript);
		
		if(IsWBMap(mapScript)) then
		
			local mapInfo = UI.GetMapPreview(mapScript);
			if(mapInfo ~= nil) then		
				local world = GameInfo.Worlds[mapInfo.MapSize];
			
				--Adjust Map Size
				PreGame.SetRandomWorldSize( false );
				PreGame.SetWorldSize( mapInfo.MapSize );
				PreGame.SetNumMinorCivs( world.DefaultMinorCivs );	
				
			end
		end
	end
	
	OnBack();
end

function OnEarthMapSelected()
	PreGame.SetEarthMap(true);
	OnBack();
end


function ShowHideHandler( bIsHide )
    if( not bIsHide ) then
		Controls.Title:SetText( Locale.ConvertTextKey("TXT_KEY_MAP_TITLE") );
		
        Controls.ScrollPanel:SetScrollValue( 0 );
        
        RefreshMapScripts();
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );

function RefreshMapScripts()

	g_InstanceManager:ResetInstances();
	
		local entries = {};
		--AddEarthMapEntry(entries);
	
		-------------------------------------------------
		-- Populate list w/ Modded maps & regular & modded mapscripts
		-------------------------------------------------
		-- World builder Maps
		local maps = Modding.GetMapFiles();
		
		-- Modded Map Scripts
		-- Create a local table of map scripts first so that we can sort alphabetically
		for row in GameInfo.MapScripts() do
			Name2 = Locale.ConvertTextKey(row.Name)
			print (Name2)
			if Name2 == "CCTP Compatible Map" or Name2 =="Terra" or Name2 == "Europe" or Name2 == "Earth" then
				print (Name2, ": is not compatible with CCTP")
			else
				table.insert(entries, {
					Name = Locale.ConvertTextKey(row.Name),
					Description = Locale.ConvertTextKey(row.Description or "");
					Icon = {row.IconIndex or 00, 64, row.IconAtlas},
					Callback = function() OnMapScriptSelected(row.FileName) end,
				});
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
	

	Controls.Stack:CalculateSize();
	Controls.Stack:ReprocessAnchoring();
	Controls.ScrollPanel:CalculateInternalSize();
end

RefreshMapScripts();


