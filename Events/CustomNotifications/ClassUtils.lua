--[[
	lib.lua
	
	Creator: alpaca
	Last Change: 27.11.2010
	
	Description: Adds some useful functions
]]--

-- Constants

MAX_LOGGING_DEPTH = 10
SPACES_PER_TAB = 4
VERBOSITY = 0

--[[
	Recursively prints a table. For userdata, the metatable is logged
	Arguments:
		tab: Table. Table to log
		depth: Number. Current depth (for recursion)
		maxDepth: Number. Maximal recursion depth (to avoid infinite loops through back-referencing)
		callStack: Used internally
	Returns:
		true: on success
]]--
function printTable(tab, depth, maxDepth, callStack)
	local depth = depth or 0
	local maxDepth = maxDepth or MAX_LOGGING_DEPTH
	local iD = iD or "default"
	local callStack = callStack or {}
	
	if tab == nil then
		print(intToSpaces(depth).."<nil>")
		return 
	end
	if tab == {} then
		print(intToSpaces(depth).."<empty>")
		return
	end
	
	if depth > maxDepth then
		return "MaxDepth reached"
	end
	
	tab = (type(tab) == "userdata") and getmetatable(tab) or tab -- for userdata, we use the metatable
	
	for k,v in pairs(tab) do
		if type(v) == "table" then
			print(intToSpaces(depth).."(table) "..tostring(k))
			-- avoid infinite recursion by making sure the table is only printed once
			if callStack[v] == nil then
				callStack[v] = v
				printTable(v, depth + 1, maxDepth, iD, callStack)
			end
		else
			print(intToSpaces(depth).."("..type(k)..") "..tostring(k)..": ".."("..type(v)..") "..tostring(v))
		end
	end
end


--[[
	Prints a text only for debugging
	Arguments:
		...: The args to print
	Returns:
		true if something was printed, false otherwise
]]--
function aprint(...)
	if VERBOSITY > 0 then
		print(...)
		return true
	end
	return false
end

--[[
	Converts an integer into a string containing n times so many spaces (for indentation).
	Arguments:
		num: Number. Number of "tabs" to write
	Returns:
		String containing the spaces
]]--
function intToSpaces(num)
	local retValue = ""
	for var = 1, num*SPACES_PER_TAB do
		retValue = retValue.." "
	end
	return retValue
end


--[[
	Defines a class that can be instantiated. Taken from the LuA users wiki: http://lua-users.org/wiki/SimpleLuaClasses (April 8th 2010)
	An example for implementing a class with this can be found in the wiki.
	Arguments:
		base: Class. Base class to derive this class from
		init: Function. Initialisation function to call - a constructor if you will
	Returns:
		The class object
]]--
function class(base, init)
	local c = {}    -- a new class instance
	if not init and type(base) == 'function' then
		init = base
		base = nil
	elseif type(base) == 'table' then
		-- our new class is a shallow copy of the base class!
		for i,v in pairs(base) do
			c[i] = v
		end
		c._base = base
	end
	-- the class will be the metatable for all its objects,
	-- and they will look up their methods in it.
	c.__index = c

   -- expose a constructor which can be called by <classname>(<args>)
	local mt = {}
	mt.__call = function(class_tbl, ...)
		local obj = {}
		setmetatable(obj,c)
		
		if init then
			init(obj,...)
		else 
			-- make sure that any stuff from the base class is initialized!
			if base and base.init then
				base.init(obj, ...)
			end
		end
		return obj
	end
	
	c.init = init
	c.is_a = function(self, klass)
		local m = getmetatable(self)
		while m do 
			if m == klass then return true end
			m = m._base
		end
		return false
   end
   setmetatable(c, mt)
   return c
end