-------------------------------------------------
-- Notification Log Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "TechHelpInclude" );

local g_CultureInstanceManager3 = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton3Stack );
local g_EconomicsManager = InstanceManager:new( "EconomicsButton", "OpenEconomics", Controls.EconomicsButtonStack );
local g_ScienceManager = InstanceManager:new( "ScienceButton", "OpenScience", Controls.ScienceButtonStack );
local g_MilitaryManager = InstanceManager:new( "MilitaryButton", "OpenMilitary", Controls.MilitaryButtonStack );
local g_SocialManager = InstanceManager:new( "SocialButton", "OpenSocial", Controls.SocialButtonStack );
local g_EngineeringManager = InstanceManager:new( "EngineeringButton", "OpenEngineering", Controls.EngineeringButtonStack );

local m_PopupInfo = nil;

local Cat1=0;
local ButtonCount=1;
local portraitSize = 256;




-------------------------------------------------
-- On Popup
-------------------------------------------------

function InitialSetup()

	
	AddEconomicsButton( );
	AddScienceButton( );
	AddMilitaryButton( );
	AddSocialButton( );
	AddEngineeringButton( );


end

function AddEconomicsButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable = g_EconomicsManager:GetInstance();
	
	IconHookup( 17, portraitSize, "TECH_ATLAS_1", controlTable.EconomicsIcon );
	
	controlTable.OpenEconomics:SetToolTipString("Economics");
    controlTable.OpenEconomics:SetVoid1( 901 ); -- indicates type
    controlTable.OpenEconomics:SetVoid2( void );
 
    
	controlTable.EconomicsIcon:SetHide( false );

    controlTable.OpenEconomics:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddScienceButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable2 = g_ScienceManager:GetInstance();
	
	IconHookup( 24, portraitSize, "TECH_ATLAS_1", controlTable2.ScienceIcon );
	
	controlTable2.OpenScience:SetToolTipString("Science");
    controlTable2.OpenScience:SetVoid1( 902 ); -- indicates type
    controlTable2.OpenScience:SetVoid2( void );
    
	controlTable2.ScienceIcon:SetHide( false );

    controlTable2.OpenScience:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddMilitaryButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable3 = g_MilitaryManager:GetInstance();
	
	IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable3.MilitaryIcon );
	
	controlTable3.OpenMilitary:SetToolTipString("Military");
    controlTable3.OpenMilitary:SetVoid1( 903 ); -- indicates type
    controlTable3.OpenMilitary:SetVoid2( void );
    
	controlTable3.MilitaryIcon:SetHide( false );

    controlTable3.OpenMilitary:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddSocialButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable4 = g_SocialManager:GetInstance();
	
	IconHookup( 16, portraitSize, "TECH_ATLAS_1", controlTable4.SocialIcon );

	
	controlTable4.OpenSocial:SetToolTipString("Social");
    controlTable4.OpenSocial:SetVoid1( 904 ); -- indicates type
    controlTable4.OpenSocial:SetVoid2( void );

    
	controlTable4.SocialIcon:SetHide( false );

    controlTable4.OpenSocial:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddEngineeringButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable5 = g_EngineeringManager:GetInstance();
	
	IconHookup( 6, portraitSize, "TECH_ATLAS_1", controlTable5.EngineeringIcon );

	
	controlTable5.OpenEngineering:SetToolTipString("Engineering");
    controlTable5.OpenEngineering:SetVoid1( 905 ); -- indicates type
    controlTable5.OpenEngineering:SetVoid2( void );

    
	controlTable5.EngineeringIcon:SetHide( false );

    controlTable5.OpenEngineering:RegisterCallback( Mouse.eLClick, NotificationSelected );
end

function NotificationSelected (id)
    
	--The id of the button indicates which technology tree the user wants to view, Firesforever 15/10/2010
		g_CultureInstanceManager3:ResetInstances();
		UIManager:DequeuePopup( ContextPtr );
		Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, Data1=id  } );

	--OnClose();
	--UI.ActivateNotification(id);
end

function OnPopup( popupInfo )

	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_TECH_TREE then
		return;
	end

	if (popupInfo.Data1 > 900) then
		return;
	end
	local randomquote = math.random(34)
	local description;
	
	if randomquote == 1 then
		description = "TXT_KEY_TECH_DQUOTE1";
	elseif randomquote == 2 then
		description = "TXT_KEY_TECH_DQUOTE2";
	elseif randomquote == 3 then
		description = "TXT_KEY_TECH_DQUOTE3";
	elseif randomquote == 4 then
		description = "TXT_KEY_TECH_DQUOTE4";
	elseif randomquote == 5 then
		description = "TXT_KEY_TECH_DQUOTE5";
	elseif randomquote == 6 then
		description = "TXT_KEY_TECH_DQUOTE6";
	elseif randomquote == 7 then
		description = "TXT_KEY_TECH_DQUOTE7";
	elseif randomquote == 8 then
		description = "TXT_KEY_TECH_DQUOTE8";
	elseif randomquote == 9 then
		description = "TXT_KEY_TECH_DQUOTE9";
	elseif randomquote == 10 then
		description = "TXT_KEY_TECH_DQUOTE10";
	elseif randomquote == 11 then
		description = "TXT_KEY_TECH_DQUOTE11";
	elseif randomquote == 12 then
		description = "TXT_KEY_TECH_DQUOTE12";
	elseif randomquote == 13 then
		description = "TXT_KEY_TECH_DQUOTE13";
	elseif randomquote == 14 then
		description = "TXT_KEY_TECH_DQUOTE14";
	elseif randomquote == 15 then
		description = "TXT_KEY_TECH_DQUOTE15";
	elseif randomquote == 16 then
		description = "TXT_KEY_TECH_DQUOTE16";
	elseif randomquote == 17 then
		description = "TXT_KEY_TECH_DQUOTE17";
	elseif randomquote == 18 then
		description = "TXT_KEY_TECH_DQUOTE18";
	elseif randomquote == 19 then
		description = "TXT_KEY_TECH_DQUOTE19";
	elseif randomquote == 20 then
		description = "TXT_KEY_TECH_DQUOTE20";
	elseif randomquote == 21 then
		description = "TXT_KEY_TECH_DQUOTE21";
	elseif randomquote == 22 then
		description = "TXT_KEY_TECH_DQUOTE22";
	elseif randomquote == 23 then
		description = "TXT_KEY_TECH_DQUOTE23";
	elseif randomquote == 24 then
		description = "TXT_KEY_TECH_DQUOTE24";
	elseif randomquote == 25 then
		description = "TXT_KEY_TECH_DQUOTE25";
	elseif randomquote == 26 then
		description = "TXT_KEY_TECH_DQUOTE26";
	elseif randomquote == 27 then
		description = "TXT_KEY_TECH_DQUOTE27";
	elseif randomquote == 28 then
		description = "TXT_KEY_TECH_DQUOTE28";
	elseif randomquote == 29 then
		description = "TXT_KEY_TECH_DQUOTE29";
	elseif randomquote == 30 then
		description = "TXT_KEY_TECH_DQUOTE30";
	elseif randomquote == 31 then
		description = "TXT_KEY_TECH_DQUOTE31";
	elseif randomquote == 32 then
		description = "TXT_KEY_TECH_DQUOTE32";
	elseif randomquote == 33 then
		description = "TXT_KEY_TECH_DQUOTE33";
	elseif randomquote == 34 then
		description = "TXT_KEY_TECH_DQUOTE34";
	end

	--"TXT_KEY_TECH_DQUOTE1";

	AddNotificationButton3(description);


	-- Set Civ Icon
	CivIconHookup( Game.GetActivePlayer(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true );
	
	m_PopupInfo = popupInfo;

	--InitialSetup();

	if( m_PopupInfo.Data1 == 1 ) then
    	if( ContextPtr:IsHidden() == false ) then
    	    OnClose();
        else
        	UIManager:QueuePopup( ContextPtr, PopupPriority.eUtmost );
    	end
	else
    	UIManager:QueuePopup( ContextPtr, PopupPriority.NotificationLog );
	end
end
Events.SerialEventGameMessagePopup.Add( OnPopup );

function AddNotificationButton3( description )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable = g_CultureInstanceManager3:GetInstance();
	controlTable.NotificationText:SetText(Locale.ConvertTextKey(description));
	

    controlTable.Button:SetVoid2( void );
   -- controlTable.Button:SetDisabled( dismissed );
    
    controlTable.TextStack:CalculateSize();
    controlTable.TextStack:ReprocessAnchoring();
    

    
    controlTable.Button:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose ()
    g_CultureInstanceManager3:ResetInstances();
	UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnClose();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function ShowHideHandler( bIsHide, bInitState )

    if( not bInitState ) then
        if( not bIsHide ) then
        	UI.incTurnTimerSemaphore();
        	Events.SerialEventGameMessagePopupShown(m_PopupInfo);
        else
            UI.decTurnTimerSemaphore();
            Events.SerialEventGameMessagePopupProcessed.CallImmediate(ButtonPopupTypes.BUTTONPOPUP_NOTIFICATION_LOG, 0);
        end
    end
end
ContextPtr:SetShowHideHandler( ShowHideHandler );


--This code only needs to be done once, Firesforever 14/10/2010
InitialSetup()
