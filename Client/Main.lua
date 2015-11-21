-- Multiplayer

-- Use this function to perform your initial setup
function setup()
    socket = require("socket")
    mh = MultiHandler(8000)
    mainText = TextBox(WIDTH/2,HEIGHT/10,3*WIDTH/4,HEIGHT/10)
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)
    -- Do your drawing here
    mainText:draw()
end

function touched(touch)
    mainText:touched(touch)
end

function keyboard(key)
    mainText:keyboard(key)
end

