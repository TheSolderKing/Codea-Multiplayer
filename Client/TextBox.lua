TextBox = class()

function TextBox:init(x,y,dx,dy)
    -- you can accept and set parameters here
    self.x = x
    self.y = y
    self.dx = dx
    self.dy = dy
    self.textBuffer = ""
    self.move = 0
end

function TextBox:draw()
    -- Codea does not automatically call this method
    noStroke()
    if self.tapped == true then
        fill(255, 0, 0, 255)
    else 
        fill(162, 162, 162, 64) 
    end
    rect(self.x-self.dx/2,self.y-self.dy/2,self.dx,self.dy)
    fill(255, 255, 255, 255)
    text(self.textBuffer, self.x,self.y)
        self.y = self.y + self.move
    if self.y >= WIDTH/10 + 450 or self.y <= WIDTH/10 then
        self.move = 0
    end
end

function TextBox:touched(touch)
    -- Codea does not automatically call this method
    if touch.x > self.x - self.dx/2 and touch.x < self.x + self.dx/2 and touch.y < self.y + self.dy/2 and touch.y > self.y - self.dy/2 and self.tapped ~= true then
        self.tapped = true
        showKeyboard()
        self.move = 15
        print(self.tapped)
    elseif touch.state == BEGAN and self.tapped == true then
        print(self.tapped)
        self.tapped = false
        self.move = -15
        hideKeyboard()
    end
end

function TextBox:keyboard(key)
    if key == RETURN then
        --chat:submit(self.textBuffer)
        hideKeyboard()
        self.move = -15
        self.tapped = false
    elseif key == BACKSPACE then
        self.textBuffer = string.sub(self.textBuffer,1,-2)
    else
        self.textBuffer = self.textBuffer .. key 
    end
end