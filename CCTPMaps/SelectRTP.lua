-- SelectMapVersion
-- Original Author: Seraphim
-- Modified for CCTP: Firesforever
--------------------------------------------------------------

-------------------------------------------------
-- Select Map Version
-------------------------------------------------
include("IconSupport");
include("InstanceManager");

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
	
	modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	
	local MDesc  -- The description of the map
	local MBg	 -- The Backgroud picture on the description box to use
	local MChosen -- This allows us to know what map has been chosen
	local WorldSize
	
	--print("!!!script",script);
	PreGame.SetEarthMap(false);
	PreGame.SetRandomMapScript(false);
	if modeID == 0 then
		RTPChosen = 1
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_ASSASSIN"
		RTPBg = "Assassin.dds"
	elseif modeID == 1 then
		RTPChosen = 2
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_EL_PRESIDENTE"
		RTPBg = "ElPresidente.dds"
	elseif modeID == 2 then
		RTPChosen = 3
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_GOD_KING"
		RTPBg = "GodKing.dds"
	elseif modeID == 3 then
		RTPChosen = 4
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_HEIR"
		RTPBg = "Heir.dds"
	elseif modeID == 4 then
		RTPChosen = 5
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_WANDERER"
		RTPBg = "Wanderer.dds"
	elseif modeID == 5 then
		RTPChosen = 6
		RTPDesc = "TXT_KEY_CCTP_RTP_DESC_WAR_LORD"
		RTPBg = "WarLord.dds"
	end
	
	modUserData.SetValue ("RTPSelected", RTPChosen)
	Controls.MapDesc:SetText( Locale.ConvertTextKey( RTPDesc ) );
	--Controls.DetailsBackgroundImage:UnloadTexture();
	Controls.DetailsBackgroundImage:SetTexture(RTPBg);
	
	Controls.StartButton:SetDisabled(false);
	--OnBack();
end

function ShowHideHandler( bIsHide )
	Controls.ScrollPanel:SetScrollValue( 0 );

	RefreshMapScripts();

end
ContextPtr:SetShowHideHandler( ShowHideHandler );

function RefreshMapScripts()
	
	Controls.StartButton:SetDisabled(true);
	g_InstanceManager:ResetInstances();

	local entries = {};
	local entryCallback = nil;
	entryCallback = function() OnMapScriptSelected(0) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_ASSASSIN"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_ASSASSIN"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});
	entryCallback = function() OnMapScriptSelected(1) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_EL_PRESIDENTE"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_EL_PRESIDENTE"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(2) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_GOD_KING"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_GOD_KING"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(3) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_HEIR"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_HEIR"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(4) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_WANDERER"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_WANDERER"),
		Callback = entryCallback,
		Icon = {3, 64, "WORLDTYPE_ATLAS"},
	});	
	entryCallback = function() OnMapScriptSelected(5) end;
	table.insert(entries, {
		Name = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_WAR_LORD"),
		Description = Locale.ConvertTextKey("TXT_KEY_CCTP_RTP_TYPE_WAR_LORD"),
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
    modver = 1;
	modid = "CCTP";
	modUserData = Modding.OpenUserData(modid, modver);
	local WorldChosen = modUserData.GetValue ("MapSelected")
	if WorldChosen == 0 then
		UIManager:QueuePopup( Controls.MapSetup2, PopupPriority.CustomMod );
	else
		UIManager:QueuePopup( Controls.MapSetup1, PopupPriority.CustomMod );
	end
	
end
Controls.StartButton:RegisterCallback( Mouse.eLClick, StartButton );

       
RefreshMapScripts();


