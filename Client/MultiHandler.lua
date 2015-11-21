MultiHandler = class()

function MultiHandler:init(port)
    -- you can accept and set parameters here
    self.socket = socket.tcp()
    self.port = port
    self.connected = false
    self.socket:bind('*',self.port)
    self.ip = self:getIp()
end

function MultiHandler:connect(ip)
    self.socket:connect(ip,self.port)
    self.connected = true
    self.socket:settimeout(0)
end

function MultiHandler:getIp()
    return self.socket:getsockname()
end

function MultiHandler:receive()
    return self.socket:receive()
end

function MultiHandler:send(data)
    if self.connected then
        self.socket:send(data)
    else
        error("YOU DID A BAD")
    end
end
