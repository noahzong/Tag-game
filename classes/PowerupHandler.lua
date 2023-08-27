PowerupHandler = Class{}

function PowerupHandler:init()
    self.powerupTable = {}
    self.frequency = 600
end

function PowerupHandler:spawn()
    local random = math.random(1, self.frequency)
    if random == 1 then
        table.insert(self.powerupTable, #self.powerupTable+1, 
        SpeedPowerup(math.random(1,WINDOW_WIDTH),math.random(1, WINDOW_HEIGHT)))
    end 
    if random == 2 then
        table.insert(self.powerupTable, #self.powerupTable+1, 
        TeleportPowerup(math.random(1,WINDOW_WIDTH),math.random(1, WINDOW_HEIGHT)))
    end 
end

function PowerupHandler:clear()
    self.powerupTable = {}
end

function PowerupHandler:update(dt, player1, player2)  
    local toRemove = {}
    for i = 1, #self.powerupTable do
        if self.powerupTable[i]:isColliding(player1) then
            self.powerupTable[i]:affect(player1)
            table.insert(toRemove, i)
        elseif
            self.powerupTable[i]:isColliding(player2) then
            self.powerupTable[i]:affect(player2)
            table.insert(toRemove, i)
        end
    end

    for i = 1, #toRemove do
        table.remove(self.powerupTable, i)
    end

    if #self.powerupTable < 1 then
        self:spawn()
    end
end

function PowerupHandler:render()
    for i = 1, #self.powerupTable do
        self.powerupTable[i]:render()
    end
end

