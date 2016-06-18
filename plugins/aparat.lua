--[[

#
#     @SezarBT
#   @RezaBl4CK
#      

]]

local function run(msg, matches)
	if matches[1]:lower() == 'aparat' then
		local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
		local jdat = json:decode(url)

		local items = jdat.videobysearch
		text = 'Search Result in Aparat : \n'
		for i = 1, #items do
		text = text..'\n'..i..'- '..items[i].title..'  -  Tedade Bazdid : '..items[i].visit_cnt..'\n    Link : aparat.com/v/'..items[i].uid
		end
		text = text..'\n\n@SezarBT'
		return text
	end
end

return {
   patterns = {
"^[/!](aparat) (.*)$",
   },
   run = run
}
