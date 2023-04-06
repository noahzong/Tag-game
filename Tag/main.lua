

Class = require 'class'


require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

BALL_SPEED = 300;

function love.load()

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    ballSize = 16;
    ball1 = Ball(WINDOW_WIDTH / 3, WINDOW_HEIGHT / 2 - 2, ballSize, ballSize)
    ball2 = Ball(WINDOW_WIDTH *2/3, WINDOW_HEIGHT / 2 - 2, ballSize, ballSize)

    gameState = 'start'
    collisions = 0
    cd = 100
end


function love.update(dt)
   
    if love.keyboard.isDown('w') then
            ball1.dy = -BALL_SPEED   
            ball1.dx = 0
    elseif love.keyboard.isDown('s') then
        ball1.dy = BALL_SPEED  
        ball1.dx = 0    
    elseif love.keyboard.isDown('a') then        
        ball1.dx = -BALL_SPEED  
        ball1.dy = 0  
    elseif love.keyboard.isDown('d') then        
        ball1.dx = BALL_SPEED    
        ball1.dy = 0
    else
        ball1.dx = 0
        ball1.dy = 0
    end


    if love.keyboard.isDown('up') then      
        ball2.dy = -BALL_SPEED    
        ball2.dx = 0
    elseif love.keyboard.isDown('down') then       
        ball2.dy = BALL_SPEED     
        ball2.dx = 0 
    elseif love.keyboard.isDown('left') then       
        ball2.dx = -BALL_SPEED  
        ball2.dy = 0
    elseif love.keyboard.isDown('right') then     
        ball2.dx = BALL_SPEED          
        ball2.dy = 0
    else
        ball2.dx = 0
        ball2.dy = 0
    end


    if gameState == 'play' then
        ball1:update(dt)
        ball2:update(dt)
    end

    if cd >= 0 then
    cd = cd-1
    else
        if math.abs(ball1.y-ball2.y)*math.abs(ball1.y-ball2.y) +math.abs(ball1.x-ball2.x)*math.abs(ball1.x-ball2.x)
        < ((ballSize*1.2)/2) * ((ballSize*1.2)/2) *2 then
        collisions = collisions + 1
        cd = 30
        end
    end

    

end


function love.keypressed(key)
   
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ball1:reset()
            ball2:reset()
        end
    end
end


function love.draw()

  love.graphics.clear(40/255, 45/255, 52/255, 255/255)


    if gameState == 'start' then
        love.graphics.printf('press enter to start', 0, 20, WINDOW_WIDTH, 'center')
    end
    if gameState == 'play' then
        love.graphics.printf(collisions, 0, 20, WINDOW_WIDTH, 'center')
    end
    
   
    ball1:render()
    ball2:render()
    
end
