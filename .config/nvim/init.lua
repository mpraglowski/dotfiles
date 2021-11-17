local global = vim.g

local mapLeader = function ()
  global.mapleader = ","
end

local loadModules = function ()
  require('plugins')
  require('settings')
  require('maps')
end

local initialize = function ()
  mapLeader()
  loadModules()
end

initialize()
