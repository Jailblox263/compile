function onCreate()
    -- Create Watermark
    makeLuaText('watermark', songName .. " - VS SmilingLucas OS 1.5.1", 0, 4.4, 670.5);
    setTextSize('watermark', 17);
    addLuaText('watermark');

    -- Create Credits Message
    makeLuaText('message', "dave and bambi in bambi", 0, 4.4, 690.5);
    setTextSize('message', 17);
    addLuaText('message');

    -- Reposition if Downscroll is on
    if downscroll then
        setProperty('watermark.y', 125)
        setProperty('message.y', 145)
    end
end