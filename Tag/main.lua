

Class = require '../classes/class'

require 'StateMachine'
require 'states/BaseState'
require 'states/TitleScreenState'
require 'states/PlayState'
require 'states/InstructionsState'
require 'states/EndState'

require '../classes/Ball'
require '../classes/PowerupHandler'
require '../classes/SpeedPowerup'
require '../classes/TeleportPowerup'
require '../classes/ObstacleHandler'
require '../classes/HazardObstacle'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



function love.load()

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    love.window.setTitle('Tag!')

    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function() return PlayState () end,
        ['instructions'] = function() return InstructionsState () end,
        ['end'] = function() return EndState () end
    }

    gStateMachine:change('title')

    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mouse.wasPressed(button)
    return love.mouse.buttonsPressed[button]
end


function love.update(dt)
    
    gStateMachine:update(dt);

    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end





function love.draw()

  gStateMachine:render()  
    
end
