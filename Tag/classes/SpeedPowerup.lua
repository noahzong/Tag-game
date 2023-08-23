SpeedPowerup = Class{}


function SpeedPowerup:init(x, y)
    self.x = x
    self.y = y
    self.width = 16
    self.extraSpeed = 100
end

function SpeedPowerup:isColliding(ball)
    if math.abs(self.y-ball.y)*math.abs(self.y-ball.y) +math.abs(self.x-ball.x)*math.abs(self.x-ball.x)
        < ((self.width*1.2)/2) * ((self.width*1.2)/2) *2 then
        return true
    end
end

function SpeedPowerup:affect(ball)
    ball:setSpeed(ball:getSpeed()+self.extraSpeed)
end

function SpeedPowerup:update(dt)
end


function SpeedPowerup:render()
    love.graphics.setColor(128/255, 255/255, 128/255)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.width)
end