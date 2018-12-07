--[[
    Entity base class
    An entity has x- and y-coordinates and a sprite
]]

Entity = Class{}

function Entity:init(x, y, sprite)
    self.x = x
    self.y = y
    self.sprite = sprite
end
