description = [[
Detects new services or ports appearing on a host compared to a baseline file.
]]

author = "Risetrok"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

local stdnse = require "stdnse"
local io = require "io"
prerule = function()
  print([[
              .---.
             /  _  \
            |  (_)  |
             \  _  /
          .-'   |   '-.
    (.)  /   .-' '-.   \  (.)
        |   /       \   |
        |  |   [!]    |  |
        |   \       /   |
         \   '-. .-'   /
          '-.   |   .-'
             \  _  /
            |  (_)  |
             \  _  /
              '---'

      [ SHADOW IT DETECTOR ]
  ]])
end

local baseline_path = stdnse.get_script_args("baseline") or "baseline.txt"

-- Reagujemy na wszystkie porty, żeby móc raportować ich status
portrule = function(host, port)
  return true
end

action = function(host, port)
  local file = io.open(baseline_path, "r")
  
  if not file then
    return "Error: Could not open baseline file: " .. baseline_path
  end

  local current_entry = host.ip .. ":" .. port.number
  local found = false

  for line in file:lines() do
    if line:find(current_entry) then
      found = true
      break
    end
  end
  file:close()

  if not found then
    return stdnse.format_output(true, "ALERT: New service detected on port " .. port.number .. " (" .. port.state .. ") - NOT IN BASELINE!")
  else
    return "Status: Port " .. port.number .. " (" .. port.state .. ") matches baseline."
  end
enddescription = [[
Detects new services or ports appearing on a host compared to a baseline file.
]]

author = "Risetrok"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery", "safe"}

local stdnse = require "stdnse"
local io = require "io"

-- Symetryczny baner 3x3 z "kluczami"
prerule = function()
  print([[
              .---.
             /  _  \
            |  (_)  |
             \  _  /
          .-'   |   '-.
    (.)  /   .-' '-.   \  (.)
        |   /       \   |
        |  |   [!]    |  |
        |   \       /   |
         \   '-. .-'   /
          '-.   |   .-'
             \  _  /
            |  (_)  |
             \  _  /
              '---'

      [ SHADOW IT DETECTOR ]
  ]])
end

local baseline_path = stdnse.get_script_args("baseline") or "baseline.txt"

portrule = function(host, port)
  return port.state == "open"
end

action = function(host, port)
  local file = io.open(baseline_path, "r")
  
  if not file then
    return "Error: Could not open baseline file: " .. baseline_path
  end

  local current_entry = host.ip .. ":" .. port.number
  local found = false

  for line in file:lines() do
    if line:find(current_entry) then
      found = true
      break
    end
  end
  file:close()

  if not found then
    return stdnse.format_output(true, "ALERT: New service detected on port " .. port.number .. " (Not in baseline!)")
  else
    return "Status: Port " .. port.number .. " is authorized and matches baseline."
  end
end
