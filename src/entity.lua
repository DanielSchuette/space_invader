--[[
    Entity base class
    An entity has x- and y-coordinates and a sprite
]]

Entity = Class{}

function Entity:init(x, y, sprite)
    self.x = x
    self.y = y
    self.sprite = sprite -- int that is used to index into quads/sprites table
end

function Entity:render()
    love.graphics.draw(gTextures["aliens"], gFrames["aliens"][self.sprite],
        self.x, self.y)
end
