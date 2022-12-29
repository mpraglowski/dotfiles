function derail
  cat ./tmp/pids/server.pid | xargs kill -9
end
