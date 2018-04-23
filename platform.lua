--! file: platform.lua
Platform = Object:extend()

function Platform:new()

  self.width = love.graphics.getWidth()
  self.height = love.graphics.getHeight()
  self.x = 0
  self.y = self.height / 2

end

function Platform:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  player:draw()
end

function Platform:update(dt)
end
