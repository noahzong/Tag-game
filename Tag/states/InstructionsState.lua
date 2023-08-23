InstructionsState = Class{__includes = BaseState}

function InstructionsState:init()

end

function InstructionsState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function InstructionsState:render()
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.printf('first to five points wins', 0, 160, WINDOW_WIDTH, 'center')
    love.graphics.printf('win by two', 0, 180, WINDOW_WIDTH, 'center')
    love.graphics.printf('the chaser has 30 seconds to tag the runner before the roles reverse', 0, 200, WINDOW_WIDTH, 'center')
    love.graphics.printf('press enter to start', 0, 80, WINDOW_WIDTH, 'center')
    love.graphics.rectangle('fill', WINDOW_WIDTH/3, WINDOW_HEIGHT/2, SIZE, SIZE)
    love.graphics.rectangle('fill', 2*WINDOW_WIDTH/3, WINDOW_HEIGHT/2, SIZE, SIZE)
    love.graphics.printf('Player 1 (Chaser)', WINDOW_WIDTH/3-20, WINDOW_HEIGHT/2-30, WINDOW_WIDTH)
    love.graphics.printf('Player 2 (Runner)', 2*WINDOW_WIDTH/3-20, WINDOW_HEIGHT/2-30, WINDOW_WIDTH)
end