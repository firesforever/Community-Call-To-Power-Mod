-------------------------------------------------
-- Notification Log Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
local g_CultureInstanceManager = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton1Stack );
local g_CultureInstanceManager2 = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton2Stack );
local g_CultureInstanceManager3 = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton3Stack );
--local g_TechCatsInstanceManager = InstanceManager:new( "NotificationButton2", "Button", Controls.NotificationButton2Stack );
local m_PopupInfo = nil;

local Cat1=0;
local ButtonCount=1;




-------------------------------------------------
-- On Popup
-------------------------------------------------

function InitialSetup()


	
	--g_CultureInstanceManager:ResetInstances();

	--Here we are going to do a search through all of the technologies looking for ones in the different categories, Firesforever 14/10/2010
	--This needs to be updated when a new tech category is added ***
	

	for row in DB.Query("SELECT * FROM TechTreeCat LEFT JOIN Civilization_TechTreeAccess ON TechTreeCat.Type = Civilization_TechTreeAccess.TechTreeType") do
		
		if row.CivilizationMainTree == NULL then
			if ButtonCount==1 then 	
				AddNotificationButton(row.ID, row.Description, 1, 0);
			elseif ButtonCount==2 then
				AddNotificationButton2(row.ID, row.Description, 1, 0);
			else
				AddNotificationButton3(row.ID, row.Description, 1, 0);	
			end
			if ButtonCount==3 then
				ButtonCount=1;
			else
				ButtonCount=ButtonCount+1;
			end
		end
	end


	
	Controls.NotificationButton1Stack:CalculateSize();
	Controls.NotificationButton1Stack:ReprocessAnchoring();
	Controls.NotificationScrollPanel:CalculateInternalSize();

end


function OnPopup( popupInfo )

	if popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_TECH_TREE then
		return;
	end

	if (popupInfo.Data1 > 900) then
		return;
	end

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


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function AddNotificationButton3( id, description, turn, dismissed )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	
	local controlTable = g_CultureInstanceManager3:GetInstance();
	controlTable.NotificationText:SetText(Locale.ConvertTextKey(description));
	controlTable.NotificationTurnText:SetText(Locale.ConvertTextKey("TXT_KEY_TP_TECH_TURN_COUNTER"));


    controlTable.Button:SetVoid1( id ); -- indicates type
    controlTable.Button:SetVoid2( void );
   -- controlTable.Button:SetDisabled( dismissed );
    
    controlTable.TextStack:CalculateSize();
    controlTable.TextStack:ReprocessAnchoring();
    

    
    controlTable.Button:RegisterCallback( Mouse.eLClick, NotificationSelected );
end

function AddNotificationButton2( id, description, turn, dismissed )	

	--This adds buttons to the center of the box, Firesforever 15/10/2010

	local controlTable = g_CultureInstanceManager2:GetInstance();
	controlTable.NotificationText:SetText(Locale.ConvertTextKey(description));
	controlTable.NotificationTurnText:SetText(Locale.ConvertTextKey("TXT_KEY_TP_TECH_TURN_COUNTER", id));


    controlTable.Button:SetVoid1( id ); -- indicates type
    controlTable.Button:SetVoid2( void );
   -- controlTable.Button:SetDisabled( dismissed );
    
    controlTable.TextStack:CalculateSize();
    controlTable.TextStack:ReprocessAnchoring();
    

    
    controlTable.Button:RegisterCallback( Mouse.eLClick, NotificationSelected );
end

function AddNotificationButton( id, description, turn, dismissed )

	--This adds buttons to the left side of the box, Firesforever 15/10/2010	

	local controlTable = g_CultureInstanceManager:GetInstance();
	controlTable.NotificationText:SetText(Locale.ConvertTextKey(description));
	controlTable.NotificationTurnText:SetText(Locale.ConvertTextKey("TXT_KEY_TP_TECH_TURN_COUNTER", id));


    controlTable.Button:SetVoid1( id ); -- indicates type
    controlTable.Button:SetVoid2( void );
   -- controlTable.Button:SetDisabled( dismissed );
    
    controlTable.TextStack:CalculateSize();
    controlTable.TextStack:ReprocessAnchoring();
    

    
    controlTable.Button:RegisterCallback( Mouse.eLClick, NotificationSelected );
end


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function NotificationSelected (id)
    
	--The id of the button indicates which technology tree the user wants to view, Firesforever 15/10/2010

		UIManager:DequeuePopup( ContextPtr );
		Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, Data1=(911+id)  } );

	--OnClose();
	--UI.ActivateNotification(id);
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose ()
    UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );
function OpenTechTreeDefault()
 
	UIManager:DequeuePopup( ContextPtr );
 
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, Data1=901  } );
end
Controls.OpenTTButtonDefault:RegisterCallback( Mouse.eLClick, OpenTechTreeDefault);
function OpenTechTreeOurTechnologies()
 
	UIManager:DequeuePopup( ContextPtr );
 
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TECH_TREE, Data1=902  } );
end
Controls.OpenTTButtonOurTechnologies:RegisterCallback( Mouse.eLClick, OpenTechTreeOurTechnologies);



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