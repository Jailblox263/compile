local bpmbased = false
local iconhp = 0
local iconhp2 = 0 
local speed = 0.1
local hpbased = true
local transition = 'quintOut'

function onBeatHit()
    if bpmbased then
        doTweenX('icon1', 'iconP1.scale', 1, crochet/1500, transition)
        doTweenX('icon2', 'iconP2.scale', 1, crochet/1500, transition)
    else
        doTweenX('icon1', 'iconP1.scale', 1, speed, transition)
        doTweenX('icon2', 'iconP2.scale', 1, speed, transition)
    end

    if hpbased then
        setProperty('iconP1.scale.x', iconhp)
        setProperty('iconP2.scale.x', iconhp2)
    end
end

function onUpdatePost(elapsed)
    -- Check for Losing State (Health < 20% for P1, > 80% for P2)
    local p1Losing = getProperty('healthBar.percent') < 20
    local p2Losing = getProperty('healthBar.percent') > 80

    -- Player 1 Logic
    if p1Losing then
        iconhp = getProperty('healthBar.percent') / 60 * 0 + 1
    else
        iconhp = getProperty('healthBar.percent') / 120 * 0.1 + 1.2
    end
    
    -- Player 2 Logic
    if p2Losing then
        iconhp2 = -getProperty('healthBar.percent') / 60 * 0 + 1
    else
        iconhp2 = -getProperty('healthBar.percent') / 120 * 0.4 + 1.4
    end

    -- Scale and Origin Application
    if hpbased then
        setProperty('iconP1.scale.y', (getProperty('iconP1.scale.y') - 1) / -iconhp + 1)
        setProperty('iconP2.scale.y', (getProperty('iconP2.scale.y') - 1) / -iconhp2 + 1)
    else
        setProperty('iconP1.scale.y', (getProperty('iconP1.scale.y') - 1) / -2.5 + 1)
        setProperty('iconP2.scale.y', (getProperty('iconP2.scale.y') - 1) / -2.5 + 1)
    end
    
    -- Set origins so they scale from the top/middle correctly
    setProperty('iconP1.origin.y', 0)
    setProperty('iconP2.origin.y', 0)
end