-- creates a table to store the ball's properties

Ball = {}


function Ball:load()
    -- balls starting positionq
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    -- ball's size
    self.width = 20
    self.height = 20
    -- ball's speed
    self.speed = 200
    -- ball's velocity
    self.xVel = -self.speed
    self.yVel = 0

end



function Ball:update(dt)
    self:move(dt)
    self:collide()

end



function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


function Ball:move(dt)
    --  moving the ball
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt

end


function Ball:collide()
-- checks collision with the player
    if checkCollision(self, Player) then
        self.xVel = self.speed
        --  local variable is scoped to the function it is declared in
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end

    

--  checks collision with the ai
    if checkCollision(self, Ai) then
        self.xVel = -self.speed
        --  local variable is scoped to the function it is declared in
        local middleBall = self.y + self.height / 2
        local middleAi = Player.y + Ai.height / 2
        local collisionPosition = middleBall - middleAi
        self.yVel = collisionPosition * 5
    end


    -- checking if the ball is going off the screen
    -- if it reaches the border, then it will change the velocity direction
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end


    -- to see if the ball has made it past the player paddle 
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = self.speed
    end

    -- to see if the ball has made it past the ai paddle
    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = -self.speed
    end
end