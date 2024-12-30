--! File: Main

local player1
function love.load()
    Object = require"classic" -- classic returns an Object

    local Player = require"player"
    player1 = Player()

end

function love.update(dt)
    player1:update(dt)
    end

function love.draw()
    player1:draw()
end
