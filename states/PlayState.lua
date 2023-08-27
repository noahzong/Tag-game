

PlayState = Class{__includes = BaseState}

SIZE = 16
SPEED = 300
CHASER_EXTRA_SPEED = 350
COLLISION_COOLDOWN = 1
ROUND_LENGTH = 30
TARGET_SCORE = 5
function PlayState:init()
    self.collisions = 0
    self.player1 = Ball(WINDOW_WIDTH/3, WINDOW_HEIGHT/2, SIZE, SIZE, SPEED, 1, {171, 39, 79})
    self.player2 = Ball(2*WINDOW_WIDTH/3, WINDOW_HEIGHT/2, SIZE, SIZE, SPEED, 2, {124, 185, 232})
    self.lastCollisionTime = 0
    self.score1 = 0
    self.score2 = 0
    self.turn1 = true
    self.timer = ROUND_LENGTH
    self.endTime = love.timer.getTime()+self.timer
    self.player1:setSpeed(CHASER_EXTRA_SPEED)
    self.powerupHandler = PowerupHandler()
    self.obstacleHandler = ObstacleHandler()
    math.randomseed(os.time())
end

function PlayState:switchRound()
    self.player1:setSpeed(SPEED)
    self.player2:setSpeed(CHASER_EXTRA_SPEED)
    self.player1:reset(WINDOW_WIDTH/3, WINDOW_HEIGHT/2)
    self.player2:reset(2*WINDOW_WIDTH/3, WINDOW_HEIGHT/2)
    self.endTime = love.timer.getTime()+ROUND_LENGTH
    self.powerupHandler:clear()
    self.obstacleHandler:clear()
    self.turn1 = not self.turn1
end

function PlayState:turn()
    return self.turn1
end

function PlayState:update(dt)
    
    
    self.player1:update(dt)
    self.player2:update(dt)
    
    self.powerupHandler:update(dt, self.player1, self.player2)
    self.obstacleHandler:update(dt, self.player1, self.player2, self)

    self.timer = self.endTime-love.timer.getTime()

    if self.player1:isColliding(self.player2) then
        if self.turn1 then
            self.score1 = self.score1+1
        else
            self.score2 = self.score2+1
        end
        self:switchRound(self.turn1)
    end

    if self.timer < -0.7 then
        self:switchRound(self.turn1)
    end
    
    if self.score1 >= TARGET_SCORE and self.score1 >= self.score2 + 2 then
        gStateMachine:change('end', 1)
    end
    if self.score2 >= TARGET_SCORE and self.score2 >= self.score1 + 2 then
        gStateMachine:change('end', 2)
    end

end

function PlayState:render()
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    self.player1:render()
    self.player2:render()
    self.powerupHandler:render()
    self.obstacleHandler:render()

    love.graphics.setFont(love.graphics.newFont(20))

    love.graphics.setColor(1,1,1)
    love.graphics.printf(self.score1, 0, 40, 2*WINDOW_WIDTH/3, 'center')
    love.graphics.printf(self.score2, 0, 40, 2*WINDOW_WIDTH/3, 'right')
    if self.turn1 then
        love.graphics.printf("Chaser", 0, 70, 2*WINDOW_WIDTH/3, 'center')
    else
        love.graphics.printf("Chaser", 0, 70, 2*WINDOW_WIDTH/3+10, 'right')
    end
    love.graphics.printf(math.abs(math.ceil(self.timer)), 0, 70, WINDOW_WIDTH, 'center') 
end