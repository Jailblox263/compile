-- Script for Intro Song Credits with Box + Cover (Psych Engine 0.6.2)

function onCreate()
    -- Configuration: Change these names!
    local songName = songName:gsub('-', ' ')
    local authorName = "???"
    local coverName = "SmilingLucas"
    
    local boxWidth = 450
    local boxHeight = 150 -- Made taller for 3 lines
    local startX = -500 
    local targetX = 0   
    local bottomY = 450 -- Adjusted up slightly to fit the taller box

    -- 1. Create the Background Box
    makeLuaSprite('creditBox', '', startX, bottomY)
    makeGraphic('creditBox', boxWidth, boxHeight, '000000')
    setObjectCamera('creditBox', 'other')
    setProperty('creditBox.alpha', 0.6)
    addLuaSprite('creditBox', true)

    -- 2. Create the Song Title
    makeLuaText('creditTitle', 'Song: ' .. songName, boxWidth, startX, bottomY + 15)
    setTextSize('creditTitle', 28)
    setTextAlignment('creditTitle', 'left')
    setObjectCamera('creditTitle', 'other')
    addLuaText('creditTitle')

    -- 3. Create the Original Author Text
    makeLuaText('creditAuthor', 'By: ' .. authorName, boxWidth, startX, bottomY + 55)
    setTextSize('creditAuthor', 22)
    setTextAlignment('creditAuthor', 'left')
    setObjectCamera('creditAuthor', 'other')
    addLuaText('creditAuthor')

    -- 4. Create the Cover Artist Text
    makeLuaText('creditCover', 'Cover by: ' .. coverName, boxWidth, startX, bottomY + 95)
    setTextSize('creditCover', 22)
    setTextColor('creditCover', '31B0D1') -- A light blue to make it pop
    setTextAlignment('creditCover', 'left')
    setObjectCamera('creditCover', 'other')
    addLuaText('creditCover')
end

function onSongStart()
    -- Slide everything in together
    doTweenX('boxIn', 'creditBox', 0, 1, 'circOut')
    doTweenX('titleIn', 'creditTitle', 20, 1, 'circOut')
    doTweenX('authorIn', 'creditAuthor', 20, 1, 'circOut')
    doTweenX('coverIn', 'creditCover', 20, 1, 'circOut')

    -- Wait 3.5 seconds (slightly longer since there is more to read)
    runTimer('creditWait', 3.5)
end

function onTimerCompleted(tag)
    if tag == 'creditWait' then
        doTweenX('boxOut', 'creditBox', -500, 1, 'circIn')
        doTweenX('titleOut', 'creditTitle', -500, 1, 'circIn')
        doTweenX('authorOut', 'creditAuthor', -500, 1, 'circIn')
        doTweenX('coverOut', 'creditCover', -500, 1, 'circIn')
    end
end