-- SelectMapVersion
-- Author: Seraphim
-- DateCreated: 1/11/2011 3:16:24 PM
--------------------------------------------------------------

-------------------------------------------------
-- Select Map Version
-------------------------------------------------
include("IconSupport");
include("InstanceManager");

g_InstanceManager = InstanceManager:new( "ItemInstance", "Button", Controls.Stack );
local g_BackButton = {};


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

function OnMapScriptSelected(modeID)
	--print("!!!script",script);
	PreGame.SetEarthMap(false);
	PreGame.SetRandomMapScript(false);
	if modeID == 0 then
		PreGame.SetWorldSize( 3 );
		PreGame.SetGameSpeed( 2 );
	elseif modeID == 1 then
		PreGame.SetWorldSize( 4 );
		PreGame.SetGameSpeed( 2 );
	elseif modeID == 2 then
		PreGame.SetWorldSize( 4 );
		PreGame.SetGameSpeed( 1 );
	elseif modeID == 3 then
		PreGame.SetWorldSize( 5 );
		PreGame.SetGameSpeed( 2 );
	end
	PreGame.SetNumMinorCivs( 27 );
	OnBack();
end

function ShowHideHandler( bIsHide )
	Controls.ScrollPanel:SetScrollValue( 0 );

	RefreshMapScripts();

end
ContextPtr:SetShowHideHandler( ShowHideHandler );

function RefreshMapScripts()

	g_InstanceManager:ResetInstances();

	local entries = {};
	local entryCallback = nil;
	entryCallback = function() OnMapScriptSelected(0) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_FREE_FOR_ALL"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_FREE_FOR_ALL"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});
	entryCallback = function() OnMapScriptSelected(1) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_ANCIENT"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_ANCIENT"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(2) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_MODERN"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_MODERN"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(3) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(4) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
		entryCallback = function() OnMapScriptSelected(5) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
		entryCallback = function() OnMapScriptSelected(6) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
		entryCallback = function() OnMapScriptSelected(7) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Description = Locale.ConvertTextKey("TXT_KEY_RNE_MAP_TYPE_RANDOM"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	

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

----------------------------------------------------------------        
---------------------------------------------------------------- 
function ChopFileName(file)
	_, _, chop = string.find(file,"\\.+\\(.+)%."); 
	return chop;
end
       
RefreshMapScripts();


