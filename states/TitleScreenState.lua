TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('instructions')
    end
end

function TitleScreenState:render()
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    love.graphics.printf('press enter to start', 0, 80, WINDOW_WIDTH, 'center')
end