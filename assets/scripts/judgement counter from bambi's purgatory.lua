function onCreate()
    createCounter('sick', 'Sicks: 0', 320)
    createCounter('good', 'Goods: 0', 345)
    createCounter('bad', 'Bads: 0', 370)
    createCounter('shit', 'Shits: 0', 395)
end

function createCounter(tag, text, y)
    makeLuaText(tag, text, 0, 10, y) 
    setTextSize(tag, 20)
    setTextAlignment(tag, 'left')
    addLuaText(tag)
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote and not botPlay then
        setTextString('sick', 'Sicks: '..getProperty('sicks'))
        setTextString('good', 'Goods: '..getProperty('goods'))
        setTextString('bad', 'Bads: '..getProperty('bads'))
        setTextString('shit', 'Shits: '..getProperty('shits'))
    end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if not botPlay then
        setTextString('bad', 'Bads: '..getProperty('bads'))
        setTextString('shit', 'Shits: '..getProperty('shits'))
    end
end