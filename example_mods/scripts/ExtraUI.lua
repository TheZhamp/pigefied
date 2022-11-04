local firstCounterPos = 100
local upScrollPosCounterPos = 540
local universalStroke = 1

function onCreate()

    makeLuaText('sickCounter', "0", 0, 1000, 0)
    --setProperty('sickCounter.alpha', 1)
    setTextFont('sickCounter', 'ms-mincho.ttf')
    setTextSize('sickCounter', 20)
    setTextBorder('sickCounter', universalStroke, '000000')
    addLuaText('sickCounter')
    setObjectCamera('sickCounter', 'hud')

    makeLuaText('goodCounter', "0", 0, 1000, 0)
    --setProperty('sickCounter.alpha', 1)
    setTextFont('goodCounter', 'ms-mincho.ttf')
    setTextSize('goodCounter', 20)
    setTextBorder('goodCounter', universalStroke, '000000')
    addLuaText('goodCounter')
    setObjectCamera('goodCounter', 'hud')

    makeLuaText('badCounter', "0", 0, 1000, 0)
    --setProperty('badCounter.alpha', 1)
    setTextFont('badCounter', 'ms-mincho.ttf')
    setTextSize('badCounter', 20)
    setTextBorder('badCounter', universalStroke, '000000')
    addLuaText('badCounter')
    setObjectCamera('badCounter', 'hud')

    makeLuaText('shitCounter', "0", 0, 1000, 0)
    --setProperty('shitCounter.alpha', 1)
    setTextFont('shitCounter', 'ms-mincho.ttf')
    setTextSize('shitCounter', 20)
    setTextBorder('shitCounter', universalStroke, '000000')
    addLuaText('shitCounter')
    setObjectCamera('shitCounter', 'hud')

    makeLuaText('songName', songName .. ' (' .. difficultyName:upper() .. ')', 0, 1000, 0)
    --setProperty('songName.alpha', 1)
    setTextFont('songName', 'ms-mincho.ttf')
    setTextSize('songName', 23)
    setTextBorder('songName', universalStroke, '000000')
    addLuaText('songName')
    setObjectCamera('songName', 'hud')

    if getPropertyFromClass('ClientPrefs', 'downScroll') then
        setProperty('songName.y', 60)
        setProperty('sickCounter.y', firstCounterPos)
        setProperty('goodCounter.y', firstCounterPos + 20)
        setProperty('badCounter.y', firstCounterPos + 40)
        setProperty('shitCounter.y', firstCounterPos + 60)
    else
        setProperty('songName.y', 640)
        setProperty('sickCounter.y', upScrollPosCounterPos)
        setProperty('goodCounter.y', upScrollPosCounterPos + 20)
        setProperty('badCounter.y', upScrollPosCounterPos + 40)
        setProperty('shitCounter.y', upScrollPosCounterPos + 60)
    end

end

function onUpdate(elapsed)

    local counters = {
        ["Sicks"] = getProperty('sicks'),
        ["Goods"] = getProperty('goods'),
        ["Bads"] = getProperty('bads'),
        ["Shits"] = getProperty('shits')
    }

    sicks = counters.Sicks
    goods = counters.Goods
    bads = counters.Bads
    shits = counters.Shits

    setTextString('sickCounter', 'Sicks: ' .. sicks)   
    setTextString('goodCounter', 'Goods: ' .. goods)    
    setTextString('badCounter', 'Bads: ' .. bads)    
    setTextString('shitCounter', 'Shits: ' .. shits)

end