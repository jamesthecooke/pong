-- creates a table to store the player's properties

Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2 --  centering the player
    self.width = 20
    self.height = 100
    self.speed = 500
end


function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()

end


function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end




function Player: move(dt)
    --  moving the player
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player: checkBoundaries()
    --  stopping the player from going off the screen
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end