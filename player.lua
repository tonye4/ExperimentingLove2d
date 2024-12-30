--! file: Player

local Player = Object:extend()

function Player:new()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage('purple.png')
    self.speed = 200
    self.stamina = 200
end

function Player:update(dt)
    -- top down movement.
    if love.keyboard.isDown('d') then
        self.x = self.x + (self.speed * dt)
    end

    if love.keyboard.isDown('a') then
        self.x = self.x - (self.speed * dt)
    end

    if love.keyboard.isDown('w') then
        self.y = self.y - (self.speed * dt)
    end

    if love.keyboard.isDown('s') then
        self.y = self.y + (self.speed * dt)
    end

    if love.keyboard.isDown('lshift') and self.stamina > 0 then -- fix infinite sprint bug
        self.speed = 400
        self.stamina = self.stamina - 1
    else
        self.speed = 200
        if self.stamina < 200 then
            self.stamina = self.stamina + 1
        end
    end
end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y, 0,1,1,0,32)
    love.graphics.print(self.stamina, 0,0)
end

return Player
