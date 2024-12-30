item = {}
player = {}
inventory = {}

function love.load()
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    player.img = love.graphics.newImage('purple.png')
    player.speed = 200
    player.stamina = 200
    -- player.recovery = true
end

function love.update(dt)
    -- top down movement.
    if love.keyboard.isDown('d') then
        player.x = player.x + (player.speed * dt)
    end

    if love.keyboard.isDown('a') then
        player.x = player.x - (player.speed * dt)
    end

    if love.keyboard.isDown('w') then
        player.y = player.y - (player.speed * dt)
    end

    if love.keyboard.isDown('s') then
        player.y = player.y + (player.speed * dt)
    end

    if love.keyboard.isDown('lshift') and player.stamina > 0 then -- fix infinite sprint bug
        player.speed = 400
        player.stamina = player.stamina - 1
    else
        player.speed = 200
        if player.stamina < 200 then
            player.stamina = player.stamina + 1
        end
        end
    end

function love.draw()
    love.graphics.draw(player.img, player.x, player.y, 0,1,1,0,32)
    love.graphics.print(player.stamina, 0,0)
end
