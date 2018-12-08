--[[ 
    code from CS50's Twitch stream, ep. 17,
    demonstrating a basic space invaders game 
    
    the game is written in lua, using the love2d 
    framework

    https://www.youtube.com/watch?v=jsNqs-QVRxg
]]

require "src/dependencies"

function love.load()
    math.randomseed(os.time()) -- initialize a random seed
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

    aliens = {}

    -- rows and columns of aliens
    for y = 1, ALIENS_TALL do
        for x = 1, ALIENS_WIDE do
            table.insert(aliens, Alien(x * ALIEN_WIDTH + x * ALIEN_PADDING, 
                y * ALIEN_HEIGHT + y * ALIEN_PADDING, math.random(256))) -- get random sprite
        end
    end
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
    for _, alien in pairs(aliens) do
        alien:render()
    end
    ship:render()
    push:finish()
end
