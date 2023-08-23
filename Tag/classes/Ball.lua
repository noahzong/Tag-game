
Ball = Class{}

function Ball:init(x, y, width, height, speed, id, color)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
    self.dx = 0
    self.speed = 300
    self.id = id
    self.color = color;
end


function Ball:reset(xPos, yPos)
    self.x = xPos
    self.y = yPos
    self.dy = 0
    self.dx = 0
end

function Ball:isColliding(ball2)
    if math.abs(self.y-ball2.y)*math.abs(self.y-ball2.y) +math.abs(self.x-ball2.x)*math.abs(self.x-ball2.x)
        < ((self.width*1.2)/2) * ((self.width*1.2)/2) *2 then
        return true
    end
end

function Ball:setSpeed(amount)
    self.speed = amount
end

function Ball:getSpeed()
    return self.speed
end

function Ball:setPosition(x, y)
    self.x = x
    self.y = y
end

function Ball:setDxDy(dx, dy)
    self.dx = dx
    self.dy = dy
end

function Ball:getDx()
    return self.dx
end

function Ball:getDy()
    return self.dy
end

function Ball:getX()
    return self.x
end

function Ball:getY()
    return self.y
end


function Ball:update(dt)
    if self.id == 1 then
        if love.keyboard.isDown('w') then
            self.dy = -self.speed   
            self.dx = 0
        elseif love.keyboard.isDown('s') then
            self.dy = self.speed  
            self.dx = 0    
        elseif love.keyboard.isDown('a') then        
            self.dx = -self.speed  
            self.dy = 0  
        elseif love.keyboard.isDown('d') then        
            self.dx = self.speed    
            self.dy = 0
        else
            self.dx = 0
            self.dy = 0
        end
    end

    if self.id == 2 then
        if love.keyboard.isDown('up') then      
            self.dy = -self.speed    
            self.dx = 0
        elseif love.keyboard.isDown('down') then       
            self.dy = self.speed     
            self.dx = 0 
        elseif love.keyboard.isDown('left') then       
            self.dx = -self.speed  
            self.dy = 0
        elseif love.keyboard.isDown('right') then     
            self.dx = self.speed          
            self.dy = 0
        else
            self.dx = 0
            self.dy = 0
        end
    end
    
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    elseif self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min(WINDOW_WIDTH - self.width, self.x + self.dx * dt)
        self.y = math.min(WINDOW_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

function Ball:render()
    love.graphics.setColor(self.color[1]/255, self.color[2]/255, self.color[3]/255)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end