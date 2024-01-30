require("player")
require("ball")
require("ai")
require("background")

function love.load()
    Player:load()
    Ball:load()
    Ai:load()
    Background:load()
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    Ball:update(dt)
    Ai:update(dt, Ball)
end

function love.draw()
    Player:draw()
    Ball:draw()
    Ai:draw()
    Background:draw()
end


function checkCollision(a, b)
    --  checking if the objects are colliding
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end