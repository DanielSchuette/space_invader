--[[
    Dependencies for ../main.lua
]]

push = require "lib/push" -- still need to be defined with respect to 
require "src/constants"   -- ../main.lua as the `love' app entry point
require "src/util"

-- global texture table
-- sprites: http://img.uninhabitant.com/spritegen.html
gTextures = {
    ["aliens"] = love.graphics.newImage("graphics/aliens_12bit.png")
}

gFrames = {
    ["aliens"] = GenerateQuads(gTextures["aliens"], 12, 12)
}
