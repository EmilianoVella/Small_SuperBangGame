local rampino = {}

local utils = require("utils")
local player = require("player")
local utils = require("utils")


rampino.w = 1
rampino.h = 1
rampino.x = 0
rampino.y = 0

rampinoScaleY = rampino.h

isPressed = false

rampino.body = love.physics.newBody(world,rampino.x +rampino.w  * 0.5, rampino.y + rampino.h *0.5, "static")
rampino.shape = love.physics.newRectangleShape(rampino.w,rampino.h)
rampino.fixture = love.physics.newFixture(rampino.body,rampino.shape,1)
rampino.fixture:setRestitution(0.9)

function rampino.Tick(dt)
    
    if love.keyboard.isDown("up") then
        if not isPressed then
        --rampino = utils.createStaticBox(world,rampino.x,rampino.y,rampino.w,rampino.h)
        rampino.body = love.physics.newBody(world,rampino.x, rampino.y, "static")
        rampino.shape = love.physics.newRectangleShape(rampino.w,rampino.h)
        rampino.fixture = love.physics.newFixture(rampino.body,rampino.shape,1)
        rampino.fixture:setRestitution(0.9)
        rampino.body:setX(player.body:getX() + player.w *0.5)
        rampino.body:setY(player.body:getY() + player.h *0.5 + 40)
        isPressed = true
        end
        rampino.body:setY(rampino.body:getY() - 400 *dt)
    else
        isPressed = false
    end
    rampinoScaleY = rampinoScaleY + 5
end

function rampino.draw()
    if love.keyboard.isDown("up") then
    love.graphics.rectangle("line",rampino.body:getX(),rampino.body:getY(),rampino.w,rampinoScaleY)
    end
end

return rampino