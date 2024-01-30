-- creates a table to store the ai's properties

Ai = {}


function Ai:load()
    self.img = love.graphics.newImage("assets/1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    -- self.width = 20
    -- self.height = 100
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2  --  centering the ai
    self.yVel = 0
    self.speed = 700
end




function Ai:update(dt )
    self:move(dt)
    self:aquireTarget()
end



function Ai:draw()
    love.graphics.draw(self.img, self.x, self.y)
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


function Ai:move(dt)
    --  moving the ai
    self.y = self.y + self.yVel * dt
    
end


function Ai:aquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end 

end
