--
-- Created by IntelliJ IDEA.
-- User: hanlei
-- Date: 2017/5/18
-- Time: 15:24
-- To change this template use File | Settings | File Templates.
--

local M = {}

function M.new()
    return function (message, context)
        --[[ngx.say(message, type(extra))
        ngx.exit(200)]]
        local _message = message or ""
        return {
            message   = _message,
            context   = context
        }
    end
end

return M

