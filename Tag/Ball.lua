
Ball = Class{}

function Ball:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
    self.dx = 0
end


function Ball:reset()
    self.x = WINDOW_WIDTH / 2 - 2
    self.y = WINDOW_HEIGHT / 2 - 2
    self.dy = 0
    self.dx = 0
end

function Ball:update(dt)
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
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end