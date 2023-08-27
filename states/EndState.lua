EndState = Class{__includes = BaseState}

function EndState:init()

end

function EndState:enter(winner)
    self.message = string.format("Player %d is the winner!", winner)
end

function EndState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('title')
    end
end

function EndState:render()
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.setColor(1,1,1)
    love.graphics.printf(self.message, 0, 40, WINDOW_WIDTH, 'center')
end