--[[
    Dependencies for ../main.lua
]]


Class = require "lib/class"   -- https://github.com/vrld/hump
push = require "lib/push"     -- all these dependencies still need to be 
require "src/constants"       -- defined with respect to ../main.lua as 
require "src/util"            -- the `love' app entry point
require "src/entity"
require "src/ship"
require "src/alien"

-- global texture and frames/sprites tables
-- sprites: http://img.uninhabitant.com/spritegen.html
gTextures = {
    ["aliens"] = love.graphics.newImage("graphics/aliens_12bit.png")
}

gFrames = {
    ["aliens"] = GenerateQuads(gTextures["aliens"], ALIEN_WIDTH, ALIEN_HEIGHT)
}
