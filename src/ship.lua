--[[
    Ship class
    A Ship inherits from an Entity
]]

Ship = Class{__includes = Entity} 

function Ship:update(dt)
    if love.keyboard.isDown("left") then
        if ship.x > 0 then
            ship.x = ship.x - SHIP_SPEED * dt
        end
    elseif love.keyboard.isDown("right") then
        if ship.x < (VIRTUAL_WIDTH - ALIEN_WIDTH) then
            ship.x = ship.x + SHIP_SPEED * dt
        end
    end
end
