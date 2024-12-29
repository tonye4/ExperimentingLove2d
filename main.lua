platform = {}
player = {}

function love.load()
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight() -- makes platform height as big as window. 

	platform.x = 0 
	platform.y = platform.height/2 -- this is to draw the platform. 

	player.x = love.graphics.getWidth() / 2 
	player.y = love.graphics.getHeight() / 2 -- positions player in the middle fo the screen 

	player.img = love.graphics.newImage('purple.png')

	player.speed = 300 

	-- jumping mechanics 
	player.ground = player.y 
	player.y_velocity = 0 -- speed in a direction 

	player.jump_height = -400 -- for some reason negative 
	player.gravity = -2000 -- character descends at this rate. Gravity should generally be greater than jump_height. 
end 

function love.update(dt)
	-- Movement along the x-axis
	if love.keyboard.isDown('d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then  -- 
			player.x = player.x + (player.speed * dt) -- multiplying by delta time, makes sure that the movement across frame rates is consistent. 
		end 
	elseif love.keyboard.isDown('a') then
		if player.x > 0 then -- pixels in love2d are rooted at 0, so the xth position at 0, would be the left most bound.
			player.x = player.x - (player.speed * dt)
		end 
	end 
	-- jumping logic 
	if love.keyboard.isDown('space') then 
		if player.y_velocity == 0 then -- players velocity is == 0 when they're on the ground.  
			player.y_velocity = player.jump_height -- if they're on the ground, their position can change to the jump_height. 
		end
	end 

	if player.y ~= 0 then -- If player has already left the ground.  
		player.y = player.y + player.y_velocity * dt -- this is the actual jumping. 
		player.y_velocity = player.y_velocity - player.gravity * dt -- gravity applied to player
	end 

	if player.y > player.ground then -- While the player is in the air  
		player.y_velocity = 0 -- if they jumped the velocity is set to 0, which means they're back on the ground. 
		player.y = player.ground 
	end

end 

function love.draw()
	love.graphics.setColor(1,1,1)

	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

	love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32) -- using draw because we're loading an image. 
end 	