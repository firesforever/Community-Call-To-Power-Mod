-- ScriptDataManager
-- Author: killmeplease
-- DateCreated: 10/19/2010 8:55:27 PM
--------------------------------------------------------------

--------------------------------------------------------------
-- SCRIPT DATA MANAGER
--------------------------------------------------------------

scriptData = { };	-- cache table
print("SCRIPT DATA MANAGER LOADED");

function AccessData(pItem, modName)
	local itemData = scriptData[pItem];
	if itemData == nil then		
		-- was not initialized yet (being accessing for first time)
		local sdata = pItem:GetScriptData();	-- load data
		if sdata == "" or sdata == nil then		-- is no data?
			scriptData[pItem] = { [modName] = {} };	-- create empty data for item and for mod
		else
			-- there is data for a given item, deserialize it:
			scriptData[pItem] = Deserialize(sdata);
			if scriptData[pItem][modName] == nil then
				scriptData[pItem][modName] = {};	-- if no data for a given mod - create empty
			end
		end
	end

	-- return cat.item.mod data, loaded or newly created (empty) and function to save changes
	return scriptData[pItem][modName];
end

function SaveData(pItem)	-- save function works for all mods data for an item so no need to specify a mod
	sdata = Serialize(scriptData[pItem]);
	pItem:SetScriptData(sdata);
end

--------------------------------------------------------------
-- SERIALIZATION
--------------------------------------------------------------

function Serialize(tbl)
   local res = "{ ";
   local num = 0;
   for k, v in pairs(tbl) do
      if num > 0 then
         res = res.." ";
      end
      res = res..k.."=";
      if type(v) == "table" then
         res = res..Serialize(v);
      else		-- simple type?
         if v == false or v == true or type(v) == "number" then
            v = tostring(v);
         else	-- string
            v = v:gsub('"', "[QUOTE]");
            v = v:gsub('{', "[LCB]");
            v = v:gsub('}', "[RCB]");
            v = "\""..v.."\"";    
         end
         res = res..v;
      end
      num = num + 1;
   end
   return res.." }";
end

function Deserialize(str)
   local tbls = {};  -- nested tables
   local topTbl = {};
   repeat
      topTbl = {};  -- clear variable for top tbl
      -- find first top-level table position in str, its values list and key
      local strStart, strEnd, topTblKey, topTblVals = str:find("([%w]*)={%s([^{}]*)%s}");
      if topTblKey == nil then
         strStart, strEnd, topTblVals = str:find("{%s([^{}]*)%s}");
      end
      topTblVals = topTblVals or "";	-- emty table case

      -- parse values:
      -- save string values of top table to a temp table
      local strings = {};
      for vstr in topTblVals:gmatch('"([^"]*)"') do  -- match "..." string values
         vstr = vstr:gsub("%[QUOTE%]", '"');
         vstr = vstr:gsub("%[LCB%]", '{');
         vstr = vstr:gsub("%[RCB%]", '}');
         table.insert(strings, vstr);
      end
      -- cut string values from top table string and replace them with "@" symbol
      topTblVals = topTblVals:gsub('"[^"]*"', "@");

      -- parse key=value pairs
      stringNum = 1;
      for k, v in topTblVals:gmatch("(%S+)=(%S+)") do
         -- parse value
         if v == "#" then
            v = tbls[k];
         elseif v == "@" then
            v = strings[stringNum];
            stringNum = stringNum + 1;
         else
            -- parse simple value, a number or a boolean
            local n = tonumber(v);
            if n ~= nil then
               v = n;
            elseif v == "true" then
               v = true;
            elseif v == "false" then
               v = false;
            end
         end
         -- parse key:
         local n = tonumber(k);
         if n ~= nil then
            k = n;  
         end
         -- add value to the table:
         topTbl[k] = v;
      end
      if topTblKey ~= nil then  -- key is nil when it is a base table
         tbls[topTblKey] = topTbl;
         str = str:sub(1, strStart - 1)..topTblKey.."=#"..str:sub(strEnd + 1);
      else
         str = "#";
      end
      --print(str);
   until str == "#";
   return topTbl;
end