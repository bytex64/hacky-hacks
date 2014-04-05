-- statusd_irc.lua
-- Copyright (c) Chip Black 2007.
-- Snatch the last IRC message from a file and display it.

if not statusd_lastirc then
	statusd_lastirc = { interval = 2 * 1000 }
end

local function getlastline()
	local f = io.open('/tmp/last_message', 'r')
	if not f then
		return ""
	end
	local s = f:read('*l')
	f:close()
	local channel, user, text = string.match(s, '^([^ ]*) ([^ ]*) (.*)$')
	if #text > 72 then
		text = string.sub(text, 0, 72) .. "..."
	end
	if channel == '/msg' then
		return "[<<" .. user .. "<<] " .. text
	else
		return channel .. " <" .. user .. "> " .. text
	end
end

local irc_timer

local function update_irc()
	statusd.inform("lastirc", getlastline())
	irc_timer:set(statusd_lastirc.interval, update_irc)
end

irc_timer = statusd.create_timer()
update_irc()
