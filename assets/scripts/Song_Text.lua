function onCreate()
    -- Create Watermark
    makeLuaText('watermark', songName .. " - VS SmilingLucas OS 1.5.1", 0, 4.4, 690.5);
    setTextSize('watermark', 17);
    addLuaText('watermark');

    -- Reposition if Downscroll is on
    if downscroll then
        setProperty('watermark.y', 145)
    end
end