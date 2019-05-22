local palla = {}

palla.x = 20
palla.y = 50
palla.radius = 30
palla.speed = 30


palla.body = love.physics.newBody(world, palla.x+ palla.radius, palla.y + palla.radius, "dynamic")
palla.shape = love.physics.newCircleShape(palla.radius)
palla.fixture = love.physics.newFixture(palla.body, palla.shape, 1)
palla.fixture:setRestitution(0.9)

function palla.Tick(dt)

    if palla.body:getX() < palla.shape:getRadius() then
        palla.body:setX(palla.shape:getRadius())
    end
    
    if palla.body:getX()  > love.graphics.getWidth()- palla.shape:getRadius() then
        palla.body:setX(love.graphics.getWidth() - palla.shape:getRadius())
    end
end

function palla.draw()
    love.graphics.circle("line", palla.body:getX(), palla.body:getY(), palla.shape:getRadius())
end

return palla
