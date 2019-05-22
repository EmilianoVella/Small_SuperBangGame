local player = {}

player.x = 50
player.y = 258
player.w = 50
player.h = 50

player.body = love.physics.newBody(world, player.x, player.y, "static")
player.shape = love.physics.newRectangleShape(player.w /2 ,player.h /2)


function player.Tick(dt)
      
    if love.keyboard.isDown("d") then
        player.body:setX(player.body:getX() + 400 *dt) 
    end

    if love.keyboard.isDown("a") then
        player.body:setX(player.body:getX() - 400 *dt) 
    end

    if player.body:getX() < 0 then
        player.body:setX(0)
    end

    if player.body:getX()  > love.graphics.getWidth() - player.w  then
        player.body:setX(love.graphics.getWidth() -player.w)
    end
end

function player.draw()
    love.graphics.rectangle("line", player.body:getX(), player.body:getY(),player.w,player.h)
end

return player