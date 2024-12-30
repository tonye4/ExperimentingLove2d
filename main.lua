--! File: Main

function love.load()
    Object = require"classic" -- classic returns an Object

    require"player"
    Player1 = Player()
end

function love.update(dt)
    Player1:update(dt)
    end

function love.draw()
    Player1:draw()
end
