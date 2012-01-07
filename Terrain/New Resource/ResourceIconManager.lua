-------------------------------------------------
-- Resource Icon Manager
-------------------------------------------------
include( "InstanceManager" );
include( "ResourceTooltipGenerator" );

local g_ResourceManager = InstanceManager:new( "ResourceIcon", "Anchor", Controls.ResourceIconContainer );

local g_ResourceIconOffsetX = -30; -- this is in world space and corresponds to the top-left vertex of the hex
local g_ResourceIconOffsetY = 15;  -- this is in world space and corresponds to the top-left vertex of the hex
local g_ResourceIconOffsetZ = 0;   -- this is in world space and corresponds to the top-left vertex of the hex

local g_bHideResourceIcons = not OptionsManager.GetResourceOn();
local g_bIsStrategicView   = false;


-------------------------------------------------
-------------------------------------------------
function GetResourceIconOffset( resourceID )
    -- icon size = 64
    -- y offset = size * 3 states
    return (resourceID % 8) * 64, math.floor(resourceID / 8) * 64;
end


-------------------------------------------------
-------------------------------------------------
function OnResourceAdded( hexPosX, hexPosY, ImprovementType, ResourceType )
	if ResourceType > -1 then
		local gridX, gridY  = ToGridFromHex( hexPosX, hexPosY );
        local plot = Map.GetPlot( gridX, gridY );

        if( not plot:IsRevealed( Game.GetActiveTeam(), false ) ) then
            return;
        end

        instance = g_ResourceManager:GetInstance();
        
    	local x, y, z = GridToWorld( gridX, gridY );
        instance.Anchor:SetWorldPositionVal( x + g_ResourceIconOffsetX,
                                             y + g_ResourceIconOffsetY,
                                             z + g_ResourceIconOffsetZ );
                                             
    	local resourceIndex = GameInfo.Resources[ResourceType].PortraitIndex;

		-- Added by Kyoss
		if GameInfo.Resources[ResourceType].IconAtlas ~= "RESOURCE_ATLAS" then
			--get right Texture Atlas
			local customAtlas = false;
			for iTA in GameInfo.IconTextureAtlases() do
				local iconAtlasRef, iconAtlasIconSize = iTA.Atlas, iTA.IconSize;
				if iconAtlasRef == GameInfo.Resources[ResourceType].IconAtlas and iconAtlasIconSize == 64 then
					customAtlas = iTA.Filename;
					instance.ResourceIcon:SetTexture(customAtlas);
					break;
				end
			end
		end
		-- End: Added by Kyoss

        instance.ResourceIcon:SetTextureOffsetVal( GetResourceIconOffset( resourceIndex ) );
        
        -- Tool Tip
        local strToolTip = GenerateResourceToolTip(plot);
        if( strToolTip ~= nil ) then
			instance.ResourceIcon:SetToolTipString(strToolTip);
		end
    end
end
Events.SerialEventRawResourceIconCreated.Add( OnResourceAdded )


-------------------------------------------------
-------------------------------------------------
function OnRequestYieldDisplay( type )

    if( type == YieldDisplayTypes.USER_ALL_RESOURCE_ON ) then
        g_bHideResourceIcons = false;
    elseif( type == YieldDisplayTypes.USER_ALL_RESOURCE_OFF ) then
        g_bHideResourceIcons = true;
    end
    
    if( not g_bIsStrategicView ) then
        Controls.ResourceIconContainer:SetHide( g_bHideResourceIcons );
    end
end
Events.RequestYieldDisplay.Add( OnRequestYieldDisplay );


-------------------------------------------------
-------------------------------------------------
function OnStrategicViewStateChanged( bStrategicView )
    g_bIsStrategicView = bStrategicView;
    if( bStrategicView ) then
        Controls.ResourceIconContainer:SetHide( true );
    else
        Controls.ResourceIconContainer:SetHide( g_bHideResourceIcons );
    end
end
Events.StrategicViewStateChanged.Add(OnStrategicViewStateChanged);
