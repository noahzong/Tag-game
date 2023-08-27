TeleportPowerup = Class{}


function TeleportPowerup:init(x, y)
    self.x = x
    self.y = y
    self.width = 16
end

function TeleportPowerup:isColliding(ball)
    if math.abs(self.y-ball.y)*math.abs(self.y-ball.y) +math.abs(self.x-ball.x)*math.abs(self.x-ball.x)
        < ((self.width*1.2)/2) * ((self.width*1.2)/2) *2 then
        return true
    end
end

function TeleportPowerup:affect(ball)
    ball:setPosition(math.random(1, WINDOW_WIDTH), math.random(1, WINDOW_HEIGHT))
end

function TeleportPowerup:update(dt)
end


function TeleportPowerup:render()
    love.graphics.setColor(208/255, 154/255, 222/255)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.width)
end