
-- FiresForever 2011 - "Procylon's Call to Power Project"



-------------------------------------------------
-- Social Polices Page Popup - V1
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "TechHelpInclude" );

local g_CultureInstanceManager3 = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton3Stack );
local g_GovernmentsManager = InstanceManager:new( "GovernmentsButton", "OpenGovernments", Controls.GovernmentsButtonStack );
local g_GovIdeologiesManager = InstanceManager:new( "GovIdeologiesButton", "OpenGovIdeologies", Controls.GovIdeologiesButtonStack );
local g_GovSystemsManager = InstanceManager:new( "GovSystemsButton", "OpenGovSystems", Controls.GovSystemsButtonStack );
local g_ReligionsManager = InstanceManager:new( "ReligionsButton", "OpenReligions", Controls.ReligionsButtonStack );
local g_ReligiousIdeologiesManager = InstanceManager:new( "ReligiousIdeologiesButton", "OpenReligiousIdeologies", Controls.ReligiousIdeologiesButtonStack );

local m_PopupInfo = nil;

local Cat1=0;
local ButtonCount=1;
local portraitSize = 256;




-------------------------------------------------
-- On Popup
-------------------------------------------------

function InitialSetup()

	
	AddGovernmentsButton( );
	AddGovIdeologiesButton( );
	AddGovSystemsButton( );

end

function AddGovernmentsButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable = g_GovernmentsManager:GetInstance();
	
	IconHookup( 2, portraitSize, "MSP_ATLAS_1", controlTable.GovernmentsIcon );
	IconHookup( 3, portraitSize, "MSP_ATLAS_1", controlTable.GovernmentsIcon2 );
	
	controlTable.OpenGovernments:SetToolTipString("Governments");
    controlTable.OpenGovernments:SetVoid1( 901 ); -- indicates type
    controlTable.OpenGovernments:SetVoid2( void );
 
    
	controlTable.GovernmentsIcon:SetHide( false );

    controlTable.OpenGovernments:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddGovIdeologiesButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable2 = g_GovIdeologiesManager:GetInstance();
	
	IconHookup( 0, portraitSize, "MSP_ATLAS_1", controlTable2.GovIdeologiesIcon );
	
	controlTable2.OpenGovIdeologies:SetToolTipString("Government Ideologies");
    controlTable2.OpenGovIdeologies:SetVoid1( 902 ); -- indicates type
    controlTable2.OpenGovIdeologies:SetVoid2( void );
    
	controlTable2.GovIdeologiesIcon:SetHide( false );

    controlTable2.OpenGovIdeologies:RegisterCallback( Mouse.eLClick, NotificationSelected );
end
function AddGovSystemsButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable3 = g_GovSystemsManager:GetInstance();
	
	IconHookup( 4, portraitSize, "MSP_ATLAS_1", controlTable3.GovSystemsIcon );
	
	controlTable3.OpenGovSystems:SetToolTipString("Government Systems");
    controlTable3.OpenGovSystems:SetVoid1( 903 ); -- indicates type
    controlTable3.OpenGovSystems:SetVoid2( void );
    
	controlTable3.GovSystemsIcon:SetHide( false );

    controlTable3.OpenGovSystems:RegisterCallback( Mouse.eLClick, NotificationSelected );
end

function NotificationSelected (id)
    
	--The id of the button indicates which technology tree the user wants to view, Firesforever 15/10/2010
		g_CultureInstanceManager3:ResetInstances();
		UIManager:DequeuePopup( ContextPtr );
		Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY, Data1=id  } );
	--OnClose();
	--UI.ActivateNotification(id);
end

function OnPopup( popupInfo )

	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY then
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
