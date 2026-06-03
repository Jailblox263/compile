-- Script for Intro Song Credits with Box (Psych Engine 0.6.2)

function onCreate()
    -- Configuration
    local songName = songName:gsub('-', ' ')
    local authorName = "SmilingLucas"
    local boxWidth = 400
    local boxHeight = 120
    local startX = -450 -- Starting position (off-screen left)
    local targetX = 0   -- Final position (on-screen left)
    local bottomY = 480 -- Position near the bottom

    -- 1. Create the Background Box
    makeLuaSprite('creditBox', '', startX, bottomY)
    makeGraphic('creditBox', boxWidth, boxHeight, '000000')
    setObjectCamera('creditBox', 'other')
    setProperty('creditBox.alpha', 0.6) -- Semi-transparent
    addLuaSprite('creditBox', true)

    -- 2. Create the Song Title
    makeLuaText('creditTitle', 'Song: ' .. songName, boxWidth, startX, bottomY + 15)
    setTextSize('creditTitle', 32)
    setTextAlignment('creditTitle', 'left')
    setObjectCamera('creditTitle', 'other')
    addLuaText('creditTitle')

    -- 3. Create the Author Text
    makeLuaText('creditAuthor', 'By: ' .. authorName, boxWidth, startX, bottomY + 65)
    setTextSize('creditAuthor', 24)
    setTextAlignment('creditAuthor', 'left')
    setObjectCamera('creditAuthor', 'other')
    addLuaText('creditAuthor')
end

function onSongStart()
    -- Slide everything in
    doTweenX('boxIn', 'creditBox', 0, 1, 'circOut')
    doTweenX('titleIn', 'creditTitle', 20, 1, 'circOut')
    doTweenX('authorIn', 'creditAuthor', 20, 1, 'circOut')

    -- Wait 3 seconds, then slide out
    runTimer('creditWait', 3)
end

function onTimerCompleted(tag)
    if tag == 'creditWait' then
        doTweenX('boxOut', 'creditBox', -450, 1, 'circIn')
        doTweenX('titleOut', 'creditTitle', -450, 1, 'circIn')
        doTweenX('authorOut', 'creditAuthor', -450, 1, 'circIn')
    end
end