Background = {}

function Background: load()
    self.planets = love.graphics.newImage("assets/planets.png")
end

function Background: update(dt)
end

function Background: draw()
    love.graphics.draw(self.planets, 0, 0)
end