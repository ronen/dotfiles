function getHostname()
    local f = io.popen ("/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname =string.gsub(hostname, "\n$", "")
    return hostname
end

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if getHostname() == 'penguin' then
    config.enable_wayland = false
end

-- and finally, return the configuration to wezterm
return config
