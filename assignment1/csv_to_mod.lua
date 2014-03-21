#!/usr/local/bin/lua

--reads in .csv data and makes a .mod file from it, then either user or script can call GLPK on .mod --> .sol
--Kelly Kaoudis
--CSCI 5654 9/10/13

local os = require "os"
local io = require "io"

--functions
f = {}

--sort by risk category
categories = {}

categories.a = {}

categories.b = {}

categories.c = {}

categories.d = {}

--sort by market
markets = {}

markets.tech = {}
markets.finance = {}
markets.petro_chem = {}
markets.automobile = {}

--sort by environmentally friendly
ecofriendly = {}

ecofriendly.y = {}
ecofriendly.n = {}

-- [this function from lua-users-wiki] converts a single line of a CSV file to table 't'
f.from_csv = function(s)
  s = s .. ','        -- ending comma
  local t = {}        -- table to collect fields
  local fieldstart = 1
  repeat
    -- next field is quoted? (start with `"'?)
    if string.find(s, '^"', fieldstart) then
      local a, c
      local i  = fieldstart
      repeat
        -- find closing quote
        a, i, c = string.find(s, '"("?)', i+1)
      until c ~= '"'    -- quote not followed by quote?
      if not i then error('unmatched "') end
      local f = string.sub(s, fieldstart+1, i-1)
      table.insert(t, (string.gsub(f, '""', '"')))
      fieldstart = string.find(s, ',', i) + 1
    else                -- unquoted; find next comma
      local nexti = string.find(s, ',', fieldstart)
      table.insert(t, string.sub(s, fieldstart, nexti-1))
      fieldstart = nexti + 1
    end
  until fieldstart > string.len(s)
  return t
end

--write output variables to .mod file before printing to cmdline
f.output = function(csv)
	for i until string.len(csv) do 
		local this_line = f.from_csv(csv)
		if this_line.t[4] == 'A' then
		--add the table to the correct category etc
			
			categories.a[#categories.a + 1] = this_line.t[1] 
			for i in t print(i) end 
		end
	end
end

f.input = function(csv_in)
	local fp = assert(io.open(csv_in, "r"), "Error opening .csv")
	local data = fp:read('*a')
	fp:close()
	print ( f.output (data) )
end
	