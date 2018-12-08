--[[ 
    code from CS50's Twitch stream, ep. 17,
    demonstrating a basic space invaders game 
    
    the game is written in lua, using the love2d 
    framework

    https://www.youtube.com/watch?v=jsNqs-QVRxg
]]

require "src/dependencies"

--[[ keep tables and objects local to avoid variable shadowing ]]
local projectiles = {} -- empty projectiles table
local aliens = {}      -- empty aliens table
local ship             -- gets instantiated later on

function love.load()
    math.randomseed(os.time()) -- initialize a random seed
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("Space Invaders")
    gFont = love.graphics.newFont("fonts/PressStart2P.ttf", 8) -- 8px font from dafont.com/de/bitmap.php
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

    -- rows and columns of aliens
    for y = 1, ALIENS_TALL do
        for x = 1, ALIENS_WIDE do
            table.insert(aliens, Alien(x * ALIEN_WIDTH + x * ALIEN_PADDING, 
                y * ALIEN_HEIGHT + y * ALIEN_PADDING, math.random(256))) -- get random sprite
        end
    end

    love.keyboard.keysPressed = {} -- will be used to communicate key presses to entities
end

function love.update(dt)
    ship:update(dt, projectiles)

    for _, projectile in pairs(projectiles) do
        projectile:update(dt)
    end

    love.keyboard.keysPressed = {} -- revert back to empty table every frame
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.keypressed(key)
    if key == "escape" then -- all keys have the logical, corresponding string values
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true -- communicate one key press
end

function love.draw()
    push:start()

    love.graphics.clear(20/255, 10/255, 30/255) -- adjust background color

    --[[ render projectiles, all aliens and the ship ]]
    for _, projectile in pairs(projectiles) do
        projectile:render()
    end


    for _, alien in pairs(aliens) do
        alien:render()
    end

    ship:render()

    push:finish()

end
