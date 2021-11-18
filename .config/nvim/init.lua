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
  -- Do not source the default filetype.vim
  global.did_load_filetypes = 1
end

initialize()
