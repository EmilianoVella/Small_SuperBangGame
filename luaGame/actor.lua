local actor = {}

function actor.createActor(x,y)
    return {
        x = x,
        y = y,
        addStaticBox = actor.addStaticBox,
        position = actor.position
    }
end

function actor:addStaticBox(w,h)
    self.body = love.physics.newBody(world,self.x + w/2,self.y + h/2,"static")
    self.shape = love.physics.newRectangleShape(w,h)
    self.fixture = love.physics.newFixture(self.body,self.shape,1)
    self.w = w
    self.h = h

    self.draw = function()
        local x,y = self:position()
        love.graphics.rectangle("line",x - w/2,y-h/2,w,h)
    end
end

function actor:position()
    return self.body:getX(),self.body:getY()
end

return actor