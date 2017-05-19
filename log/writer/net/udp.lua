local socket = require("socket")

local function create_socket(host, port, timeout)
  --[[local skt = assert(socket.udp())
  assert(skt:settimeout(timeout or 0.1))
  assert(skt:setpeername(host, port))
  return skt]]
end

local M = {}

function M.new(config)
  if not config["sock_type"] then
    config["sock_type"] =  "udp"
  end
  if not config["flush_limit"] then
    config["flush_limit"] =  100
  end
  if not config["drop_limit"] then
    config["drop_limit"] =  9999
  end

  if not socket.initted() then
    local ok, err = socket.init(config)
    if not ok then
      ngx.log(ngx.ERR, "failed to initialize the logger: ", err)
      return nil
    end
  end

  return function(fmt, ...)
    socket.log(fmt( ... ))
--    skt:send((fmt( ... )))
  end
  --[[local skt = create_socket(host, port, timeout)
  return function(fmt, ...)
    print(fmt( ... ))
    skt:send((fmt( ... ))) end]]
end

return M