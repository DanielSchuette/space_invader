--[[
    Ship class
    A Ship inherits from an Entity
]]

Ship = Class{__includes = Entity} 

function Ship:update(dt, projectiles)
    -- ship movement
    if love.keyboard.isDown("left") then
        if self.x > 0 then
            self.x = self.x - SHIP_SPEED * dt
        end
    elseif love.keyboard.isDown("right") then
        if self.x < (VIRTUAL_WIDTH - ALIEN_WIDTH) then
            self.x = self.x + SHIP_SPEED * dt
        end
    end

    -- projectile movement
    if love.keyboard.wasPressed("space") then
        table.insert(projectiles, Projectile(self.x, self.y, "up"))
    end
end
