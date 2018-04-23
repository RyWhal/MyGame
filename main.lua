--! file: platform.lua
platform = {}

function love.load()
  Object = require "classic"
  require "player"
  require "platform"

  player = Player()
  platform = Platform()

end

function love.draw()
  player:draw()
  platform:draw()
end

function love.update(dt)
  player:update(dt)
end
