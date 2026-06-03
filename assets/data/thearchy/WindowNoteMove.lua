-- Modified by Gemini: Window movement/shake ONLY for Opponent
-- BF turn forced to middle position (300, 200)

local defaultX, defaultY = 300, 200; -- Screen Center
local curX, curY = 300, 200;        -- Base Window Position
local camX, camY = 630, 505;        -- Opponent Camera
local ofs = 5;                     -- Distance moved per note
local shakeIntense = 15;            -- Shake intensity

function onUpdate()
    -- IF it is BF's turn OR GF's turn, force window to middle
    if mustHitSection == true or gfSection == true then
        curX, curY = defaultX, defaultY
        moveWindow(defaultX, defaultY)
    else
        -- IF it is Opponent's turn and they are IDLE, return to middle
        local anim = getProperty('dad.animation.curAnim.name')
        if anim == 'idle' or anim == 'idle-alt' then
            curX, curY = defaultX, defaultY
            moveWindow(defaultX, defaultY)
            triggerEvent('Camera Follow Pos', camX, camY)
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    -- This ONLY triggers when the Opponent hits a note
    if not isSustainNote then
        -- 1. Accumulate movement (No middle reset on repeats)
        if direction == 0 then curX = curX - ofs      -- Left
        elseif direction == 1 then curY = curY + ofs  -- Down
        elseif direction == 2 then curY = curY - ofs  -- Up
        elseif direction == 3 then curX = curX + ofs  -- Right
        end
        
        -- 2. Add Shake on impact
        local shakeX = curX + math.random(-shakeIntense, shakeIntense)
        local shakeY = curY + math.random(-shakeIntense, shakeIntense)
        
        moveWindow(shakeX, shakeY)
        
        -- 3. Move in-game camera to follow
        triggerEvent('Camera Follow Pos', camX + (curX - defaultX), camY + (curY - defaultY))
    end
end

-- BF Note Hit function left empty to ensure NO window movement happens
function goodNoteHit(id, direction, noteType, isSustainNote)
    -- Do nothing to the window here
end

function moveWindow(x, y)
    setPropertyFromClass('openfl.Lib', 'application.window.x', x)
    setPropertyFromClass('openfl.Lib', 'application.window.y', y)
end