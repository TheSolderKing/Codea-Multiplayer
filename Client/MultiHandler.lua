MultiHandler = class()

function MultiHandler:init(port)
    -- you can accept and set parameters here
    self.socket = socket.udp()
    self.port = port
    self.connected = false
    self.socket:setsockname('*',self.port)
    self.ip = self:getIp()
    self.socket:settimeout(0)
end

function MultiHandler:connect(ip)
    self.socket:setpeername(ip,self.port)
    self.socket:send("connecting")
    self.connected = true
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