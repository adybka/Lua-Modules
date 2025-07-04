---
-- @Liquipedia
-- page=Module:ChessOpenings
--
-- Please see https://github.com/Liquipedia/Lua-Modules to contribute
--

local Lua = require('Module:Lua')

local Logic = Lua.import('Module:Logic')

local ChessOpening = Lua.import('Module:ChessOpenings/Data', {loadData = true})

local ChessOpeningsSetup = {}

function ChessOpeningsSetup.sanitise(eco)
	if Logic.isEmpty(eco) then
		return
	end
	eco = mw.text.trim(eco):upper()
	if ChessOpening[eco] then
		return eco
	end
end

function ChessOpeningsSetup.getName(eco, withPrefix)
	eco = ChessOpeningsSetup.sanitise(eco)
	if ChessOpening[eco] then
		return withPrefix and (eco .. ': ' .. ChessOpening[eco]) or ChessOpening[eco]
	end
end

return ChessOpeningsSetup
