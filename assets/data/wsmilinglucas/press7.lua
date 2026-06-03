function onCreate()
    setProperty("debugKeysChart", null) 
end

function onUpdate(elapsed)
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
        loadSong('opposition') 
    end
end
