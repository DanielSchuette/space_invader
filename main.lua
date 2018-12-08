--[[ 
    code from CS50's Twitch stream, ep. 17,
    demonstrating a basic space invaders game 
    
    the game is written in lua, using the love2d 
    framework

    https://www.youtube.com/watch?v=jsNqs-QVRxg
]]

require "src/dependencies"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("Space Invaders")
    gFont = love.graphics.newFont("fonts/PressStart2P.ttf", 8) -- 8px font; comes from dafont.com/de/bitmap.php
    love.graphics.setFont(gFont) -- gFont is meant to be `global'

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, 
    {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    local shipIndex = 5 * 16 + 6

    ship = Ship(VIRTUAL_WIDTH/2 - ALIEN_WIDTH/2,
        VIRTUAL_HEIGHT - 72, shipIndex) 
end

function love.update(dt)
    ship:update(dt)
end

function love.keypressed(key)
    if key == "escape" then -- all keys have the logical, corresponding string values
        love.event.quit()
    end
end

function love.draw()
    push:start()
    ship:render()
    push:finish()
end
