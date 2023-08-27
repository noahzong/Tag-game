ObstacleHandler = Class{}

function ObstacleHandler:init()
    self.ObstacleTable = {}
    self.frequency = 200
end

function ObstacleHandler:spawn()
    local random = math.random(1, self.frequency)
    if random == 1 then
        table.insert(self.ObstacleTable, #self.ObstacleTable+1, 
        HazardObstacle(math.random(1,WINDOW_WIDTH),math.random(1, WINDOW_HEIGHT)))
    end 
end

function ObstacleHandler:clear()
    self.ObstacleTable = {}
end

function ObstacleHandler:update(dt, player1, player2, playState)  
    local toRemove = {}
    for i = 1, #self.ObstacleTable do
        if self.ObstacleTable[i]:isColliding(player1) then
            self.ObstacleTable[i]:affect(player1, playState)
        elseif
            self.ObstacleTable[i]:isColliding(player2) then
            self.ObstacleTable[i]:affect(player2, playState)
        end
    end

    for i = 1, #toRemove do
        table.remove(self.ObstacleTable, i)
    end

    self:spawn()
end

function ObstacleHandler:render()
    for i = 1, #self.ObstacleTable do
        self.ObstacleTable[i]:render()
    end
end