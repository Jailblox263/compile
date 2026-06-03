function onCreatePost()
    -- 1. Create the text
    makeLuaText('startMessage', "Do not press the hurt notes, if you do, your health will be minus.", 1280, 0, 0)
    
    -- 2. Styling
    setTextSize('startMessage', 42)
    setTextAlignment('startMessage', 'center')
    setObjectCamera('startMessage', 'hud')
    screenCenter('startMessage', 'xy') -- Centers it in the middle of the screen
    
    -- 3. Add to screen
    addLuaText('startMessage')

    -- 4. Start a 1-second timer
    runTimer('hideMessage', 5.0)
end

function onTimerCompleted(tag)
    -- Check if the timer that finished is 'hideMessage'
    if tag == 'hideMessage' then
        removeLuaText('startMessage', true) -- 'true' destroys the object to save memory
    end
end