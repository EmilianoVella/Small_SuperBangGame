
world = love.physics.newWorld(0, 9.81 * 64, true)

local palla = require("palla")
local utils = require("utils")
local rampino = require("rampino")
local player = require("player")
local ballOne = require("palla")
local ballTwo = require("palla")

balls = {palla}
ballsTwo = {palla}
counter = 10
GetXAttualPos = palla.body:getX()
GetYAttualPos = palla.body:getY()
isCollision = false

function love.load(dt)
    love.physics.setMeter(64)
    ground = utils.createStaticBox(world, 0, 650, 1500, 100)
end

function love.update(dt)
    
    palla.Tick(dt)
    world:update(dt)
    player.Tick(dt)
    rampino.Tick(dt)
    
    isCreate = false
    GetXAttualPos = palla.body:getX()
    GetYAttualPos = palla.body:getY()
    
    if checkCollision() then
        for i in pairs(balls) do
            if not isCollision then
               -- newball = utils.createShpere(world,palla.body:getX(),palla.body:getY(),palla.shape:getRadius() * 0.5,"dynamic")
                balls[i].body = love.physics.newBody(world, GetXAttualPos, GetYAttualPos, "dynamic")
                balls[i].shape = love.physics.newCircleShape(palla.shape:getRadius() * 0.5)
                balls[i].fixture = love.physics.newFixture(palla.body, palla.shape, 1)
                balls[i].fixture:setRestitution(0.9)
                isCollision = true
            end
        end
        
        if isCollision then
            counter = counter -1
            print(counter)
            if counter <= 0 then
               isCollision = false
            end
        end
    end
end

function love.draw()
    --love.graphics.circle("line",100,100,40)
    palla.draw()
    player.draw()
    love.graphics.rectangle("line", ground:getX(), ground:getY() - 25, 1500, 50)
    rampino.draw()

end

function checkCollision()
    return rampino.body:getX() < palla.body:getX() + palla.shape:getRadius()  and
    palla.body:getX() < rampino.body:getX() + rampino.w and
       rampino.body:getY() < palla.body:getY() + palla.shape:getRadius() and
       palla.body:getY() < rampino.body:getY() + rampino.h + 3000
   
end

