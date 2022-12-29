# frozen_string_literal: true

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000

def big_value
  fixnum_max = (2**(0.size * 8 - 2) - 1)
  Random.rand(fixnum_max).to_s(2)
end

def event_store
  Rails.configuration.event_store
end

def command_bus
  Rails.configuration.command_bus
end

def sepuku
  Process.kill('KILL', Process.pid)
end
