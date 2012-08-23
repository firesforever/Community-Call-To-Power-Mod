-------------------------------------------------
-- Notification Log Popup
-------------------------------------------------
include( "IconSupport" );
include( "InstanceManager" );
include( "TechHelpInclude" );

local g_InfoButtonManager1 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.AncientButtonStack );
local g_TechPageButtonManager1 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.AncientButtonStack );

local g_InfoButtonManager2 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.Classical1ButtonStack );
local g_TechPageButtonManager2 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.Classical1ButtonStack );

local g_InfoButtonManager3 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.MedievalButtonStack );
local g_TechPageButtonManager3 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.MedievalButtonStack );

local g_InfoButtonManager4 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.RenaissanceButtonStack );
local g_TechPageButtonManager4 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.RenaissanceButtonStack );

local g_InfoButtonManager5 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.IndustrialButtonStack );
local g_TechPageButtonManager5 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.IndustrialButtonStack );

local g_InfoButtonManager6 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.ModernButtonStack );
local g_TechPageButtonManager6 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.ModernButtonStack );

local g_InfoButtonManager7 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.DigitalButtonStack );
local g_TechPageButtonManager7 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.DigitalButtonStack );

local g_InfoButtonManager8 = InstanceManager:new( "InfoButton", "OpenInfo", Controls.InformationButtonStack );
local g_TechPageButtonManager8 = InstanceManager:new( "TechPageButton", "OpenTechPageButton", Controls.InformationButtonStack );

local m_PopupInfo = nil;

local Cat1=0;
local ButtonCount=1;
local portraitSize = 128;




-------------------------------------------------
-- On Popup
-------------------------------------------------

function InitialSetup()

	AddAncientButton( );
	AddClassicalButton( );
	AddMedievalButton( );
	AddRenaissanceButton( );
	AddIndustrialButton( );	
	AddModernButton( );	
	AddDigitalButton( );
	AddInformationButton( );
	
end

function AddAncientButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 901
	local xx = -10
	local yy = -10
	while TechPage ~= 904 do
		local controlTable1 = g_InfoButtonManager1:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 901
	xx = 50
	yy = 325
	while TechPage ~= 904 do
		
		local TechPageDesc
		if TechPage == 901 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_LAND" );
		elseif TechPage == 902 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SEA" );
		elseif TechPage == 903 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SPIRIT" );
		end
		
		local controlTable1 = g_TechPageButtonManager1:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddClassicalButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 904
	local xx = -10
	local yy = -10
	while TechPage ~= 907 do
		local controlTable1 = g_InfoButtonManager2:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 904
	xx = 50
	yy = 325
	while TechPage ~= 907 do
		
		local TechPageDesc
		if TechPage == 904 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_NUMBERTHEORY" );
		elseif TechPage == 905 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ALPHABET" );
		elseif TechPage == 906 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ARTISANS" );
		end
		
		local controlTable1 = g_TechPageButtonManager2:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddMedievalButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 907
	local xx = -10
	local yy = -10
	while TechPage ~= 910 do
		local controlTable1 = g_InfoButtonManager3:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 907
	xx = 50
	yy = 325
	while TechPage ~= 910 do
		
		local TechPageDesc
		if TechPage == 907 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_EXOTIC_GOODS" );
		elseif TechPage == 908 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_MEDIEVAL_UNIVERSITY" );
		elseif TechPage == 909 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_EMPIRICISM" );
		end
		
		local controlTable1 = g_TechPageButtonManager3:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddRenaissanceButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 910
	local xx = -10
	local yy = -10
	while TechPage ~= 913 do
		local controlTable1 = g_InfoButtonManager4:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 910
	xx = 50
	yy = 325
	while TechPage ~= 913 do
		
		local TechPageDesc
		if TechPage == 910 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_HOMO_UNIVERSALIS" );
		elseif TechPage == 911 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_GEOCENTRISM" );
		elseif TechPage == 912 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ALCHEMY" );
		end
		
		local controlTable1 = g_TechPageButtonManager4:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddIndustrialButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 913
	local xx = -10
	local yy = -10
	while TechPage ~= 916 do
		local controlTable1 = g_InfoButtonManager5:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 913
	xx = 50
	yy = 325
	while TechPage ~= 916 do
		
		local TechPageDesc
		if TechPage == 913 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_INDUSTRIAL_REVOLUTION" );
		elseif TechPage == 914 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SCIENCE" );
		elseif TechPage == 915 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_SOCIAL_CLASSES" );
		end
		
		local controlTable1 = g_TechPageButtonManager5:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddModernButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 916
	local xx = -10
	local yy = -10
	while TechPage ~= 919 do
		local controlTable1 = g_InfoButtonManager6:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 916
	xx = 50
	yy = 325
	while TechPage ~= 919 do
		
		local TechPageDesc
		if TechPage == 916 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ELECTRICAL_PHENOMENA" );
		elseif TechPage == 917 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_MOLECULES" );
		elseif TechPage == 918 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_AERODYNAMICS" );
		end
		
		local controlTable1 = g_TechPageButtonManager6:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddDigitalButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 919
	local xx = -10
	local yy = -10
	while TechPage ~= 922 do
		local controlTable1 = g_InfoButtonManager7:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 919
	xx = 50
	yy = 325
	while TechPage ~= 922 do
		
		local TechPageDesc
		if TechPage == 919 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_DIGITAL_REVOLUTION" );
		elseif TechPage == 920 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_HUMAN_AUGMENTATION" );
		elseif TechPage == 921 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ADVANCED_ASSEMBLY" );
		end
		
		local controlTable1 = g_TechPageButtonManager7:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function AddInformationButton( )	

	--This adds buttons to the right side of the box, Firesforever 15/10/2010
	

	local TechPage = 922
	local xx = -10
	local yy = -10
	while TechPage ~= 925 do
		local controlTable1 = g_InfoButtonManager8:GetInstance();
		controlTable1.OpenInfo:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenInfo:SetVoid2( void );
		
		IconHookup( 33, portraitSize, "TECH_ATLAS_1", controlTable1.Classical1Icon );
	
		controlTable1.OpenInfo:SetToolTipString(TechPage);
		
		controlTable1.OpenInfo:SetOffsetVal( xx,yy );
		
		controlTable1.Classical1Icon:SetHide( false );

		controlTable1.OpenInfo:RegisterCallback( Mouse.eLClick, NotificationSelected );
		xx = xx + 310
		yy = -10
		yy = yy - 118
		TechPage = TechPage + 1
	end
	TechPage = 922
	xx = 50
	yy = 325
	while TechPage ~= 925 do
		
		local TechPageDesc
		if TechPage == 922 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_NEW_LIFE" );
		elseif TechPage == 923 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_ATOM_MANIPULATION" );
		elseif TechPage == 924 then
			TechPageDesc = Locale.ConvertTextKey( "TXT_KEY_CCTP_TECHPAGE_FRINGE_SCIENCE" );
		end
		
		local controlTable1 = g_TechPageButtonManager8:GetInstance();
		controlTable1.OpenTechPageButton:SetVoid1( TechPage ); -- indicates type
		controlTable1.OpenTechPageButton:SetVoid2( void );
	
		controlTable1.OpenTechPageButton:SetToolTipString(TechPageDesc);
		controlTable1.TechText:SetText( TechPageDesc );
		
		controlTable1.OpenTechPageButton:SetOffsetVal( xx,yy );

		controlTable1.OpenTechPageButton:RegisterCallback( Mouse.eLClick, NotificationSelected );
		
		xx = xx + 310
		yy = 325
		yy = yy - 361
		TechPage = TechPage + 1
	end
end

function NotificationSelected (id)
    print (id)
	--The id of the button indicates which technology tree the user wants to view, Firesforever 15/10/2010
		--UIManager:DequeuePopup( ContextPtr );
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
function OnAncientTechs( )

	Controls.EraAncientSelectHighlight:SetHide(false);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( false );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );

end
Controls.EraAncient:RegisterCallback( Mouse.eLClick, OnAncientTechs );

function OnClassicalTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(false);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( false );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );
	
end
Controls.EraClassical:RegisterCallback( Mouse.eLClick, OnClassicalTechs );

function OnMedievalTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(false);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( false );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );
	
end
Controls.EraMedieval:RegisterCallback( Mouse.eLClick, OnMedievalTechs );

function OnRenaissanceTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(false);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( false );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );

end
Controls.EraRenaissance:RegisterCallback( Mouse.eLClick, OnRenaissanceTechs );

function OnIndustrialTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(false);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( false );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );

end
Controls.EraIndustrial:RegisterCallback( Mouse.eLClick, OnIndustrialTechs );

function OnModernTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(false);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( false );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( true );
	
end
Controls.EraModern:RegisterCallback( Mouse.eLClick, OnModernTechs );

function OnDigitalTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(false);
	Controls.EraInformationSelectHighlight:SetHide(true);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( false );
	Controls.EraInformationScrollPanel:SetHide( true );
	
end
Controls.EraDigital:RegisterCallback( Mouse.eLClick, OnDigitalTechs );

function OnInformationTechs( )

	Controls.EraAncientSelectHighlight:SetHide(true);
	Controls.EraClassicalSelectHighlight:SetHide(true);
	Controls.EraMedievalSelectHighlight:SetHide(true);
	Controls.EraRenaissanceSelectHighlight:SetHide(true);
	Controls.EraIndustrialSelectHighlight:SetHide(true);
	Controls.EraModernSelectHighlight:SetHide(true);
	Controls.EraDigitalSelectHighlight:SetHide(true);
	Controls.EraInformationSelectHighlight:SetHide(false);

	-- Show the selected policies and hide the rest
	Controls.EraAncientScrollPanel:SetHide( true );	
	Controls.EraClassicalScrollPanel:SetHide( true );
	Controls.EraMedievalScrollPanel:SetHide( true );
	Controls.EraRenaissanceScrollPanel:SetHide( true );
	Controls.EraIndustrialScrollPanel:SetHide( true );
	Controls.EraModernScrollPanel:SetHide( true );
	Controls.EraDigitalScrollPanel:SetHide( true );
	Controls.EraInformationScrollPanel:SetHide( false );
	
end
Controls.EraInformation:RegisterCallback( Mouse.eLClick, OnInformationTechs );
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnClose ()
	UIManager:DequeuePopup( ContextPtr );
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnClose );


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
           -- OnClose();
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
