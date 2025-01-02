--! file: self

local self = Object:extend()

function self:new()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage('purple.png')
    self.speed = 200 -- should we have velocity?? instead of just self.x and self.y 
    self.stamina = 200
end

function self:update(dt)
    -- top down movement.
    local dx,dy = 0,0
    if love.keyboard.isDown('d') then
        -- self.x = self.x + (self.speed * dt)
        dx = 1
    end

    if love.keyboard.isDown('a') then
        --self.x = self.x - (self.speed * dt)
        dx = -1
    end

    if love.keyboard.isDown('w') then
        --self.y = self.y - (self.speed * dt)
        dy = -1
    end

    if love.keyboard.isDown('s') then
        --self.y = self.y + (self.speed * dt)
        dy = 1
    end

    -- normalize diagonal movement.
    if dx ~= 0 or dy ~= 0 then -- if dx = 0 then no movement has been made. If dx != 0 then button has been pressed.
		if dx ~= 0 and dy ~= 0 then -- if dx and dy are both changed, which indicates diagonal movement then you multiply that value by 0.7071.
			dx = dx * 0.7071 -- 0.7071 is the vector length of (dx, dy) divided by 2 which is == sqrt(dx^2 + dy^2). We do this because it's equivelent to dx/VectorLength, so less lines of code yaaay. 
			dy = dy * 0.7071 -- This gives us the coordinates of the unit vector of (dx,dy).
		end
		self.x = self.x + (dx * self.speed * dt) -- if dx == 1 or -1 then there's no need to scale the movement vector down. However diagonal movement needs to be scaled down.
		self.y = self.y + (dy * self.speed * dt)
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

function self:draw()
    love.graphics.draw(self.img, self.x, self.y, 0,1,1,0,32)
    love.graphics.print(self.stamina, 0,0)
end

return self
