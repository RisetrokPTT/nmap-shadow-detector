description = [[
Detects new services or ports appearing on a host compared to a baseline file.
]]

author = "Risetrok"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

local stdnse = require "stdnse"
local io = require "io"

portrule = function(host, port)
  return port.state == "open"
end

action = function(host, port)
  -- Tu w przyszłości dodasz logikę porównywania z plikiem baseline.txt
  return "Detected service on port " .. port.number .. " - POSSIBLE SHADOW IT!"
end
