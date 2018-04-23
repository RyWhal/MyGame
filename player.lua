--! file: player.lua
Player = Object:extend()

function Player:new()
  -- player attributes
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.img = love.graphics.newImage('hrse.png')
  self.speed = 200

  self.ground = self.y
  self.y_velocity = 0
  self.jump_height = -300
  self.gravity = -500
end

function Player:draw()
  --love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 0, 70)
  love.graphics.draw(self.img, self.x, self.y, 0, -1, 1, 0, 70)

end

function Player:update(dt)
  if love.keyboard.isDown('right') then
    self.img = love.graphics.draw(self.img, self.x, self.y, 0, 1, 1)
    if self.x < (love.graphics.getWidth() - self.img:getWidth()) then
      self.x = self.x + (self.speed * dt)
    end
  elseif love.keyboard.isDown('left') then
    if self.x > 0 then
      self.x = self.x - (self.speed * dt)
    end
  end
  -- This is in charge of player jumping.
  if love.keyboard.isDown('space') then                     -- Whenever the player presses or holds down the Spacebar:
    -- The game checks if the player is on the ground. Remember that when the player is on the ground, Y-Axis Velocity = 0.
    if self.y_velocity == 0 then
      self.y_velocity = self.jump_height    -- The player's Y-Axis Velocity is set to it's Jump Height.
    end
  end

  -- jump physics
  if self.y_velocity ~= 0 then
    self.y = self.y + self.y_velocity * dt
    self.y_velocity = self.y_velocity - self.gravity * dt -- apply gravity to the character
  end

  if self.y > self.ground then
    self.y_velocity = 0
    self.y = self.ground
  end

end
