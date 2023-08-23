HazardObstacle = Class{}


function HazardObstacle:init(x, y)
    self.x = x
    self.y = y
    self.width = 40
    self.extraSpeed = 100
end

function HazardObstacle:isColliding(ball)
    if math.abs(self.y-ball.y)*math.abs(self.y-ball.y) +math.abs(self.x-ball.x)*math.abs(self.x-ball.x)
        < ((self.width*1.2)/2) * ((self.width*1.2)/2) *2 then
        return true
    end
end

function HazardObstacle:affect(ball, playState) 
    playState:switchRound(playState:turn())
end

function HazardObstacle:update(dt)
end


function HazardObstacle:render()
    love.graphics.setColor(255/255, 125/255, 125/255)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.width)
end