-- THIS SCRIPT WAS MADE BY THE ONE AND ONLY ARM4GEDON!!!1!!

local songData = {
    ["batness"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'Ryann2005',
        ["coder"] = 'Arm4Gedon & ExpKing',
        ["art"] = 'J U A N & Corrupted',
        ["color"] = 'ff8cc2',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    },
    ["pigrush"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'ExpKing',
        ["coder"] = 'Arm4Gedon & ExpKing',
        ["art"] = 'J U A N & Corrupted',
        ["color"] = 'ff8cc2',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    },
    ["bloodbath"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'Arm4GeDon',
        ["coder"] = 'Arm4Gedon & ExpKing',
        ["art"] = 'J U A N & Corrupted',
        ["color"] = 'ff757c',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf',
        ["shakeIntensity"] = 2,
        ["angleIntensity"] = 1
    },
    ["memories"] = {
        ["artist"] = 'BunnyDoodles',
        ["charter"] = 'JustSpidex',
        ["coder"] = 'Arm4Gedon & Zhamp',
        ["art"] = 'J U A N',
        ["color"] = 'b3ffe5',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf',
        ["shakeIntensity"] = 0.2,
        ["angleIntensity"] = 0.2
    },
    ["peggy"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'Zhamp & Arm4GeDon',
        ["coder"] = 'Arm4Gedon & Zhamp',
        ["art"] = 'Arm4GeDon',
        ["color"] = nil,
        ["customText"] = true,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    },
    ["vile"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'Xarion',
        ["coder"] = 'Arm4Gedon & Zhamp',
        ["art"] = 'Arm4GeDon',
        ["color"] = 'cccccc',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    },
    ["pickle-rave"] = {
        ["artist"] = 'Arm4GeDon',
        ["charter"] = 'ExpKing & BunnyDoodles',
        ["coder"] = 'Arm4Gedon & ExpKing',
        ["art"] = 'J U A N & Corrupted',
        ["color"] = '1aff00',
        ["customText"] = false,
        ["specialName"] = "PICKLE RAVE",
        ["step"] = 128,
        ["font"] = 'ms-mincho.ttf'
    },
    ["tutorial"] = {
        ["artist"] = 'Kawaisprite',
        ["charter"] = 'Ninjamuffin99',
        ["coder"] = 'Ninjamuffin99',
        ["art"] = 'PhantomArcade & Evilk8r',
        ["color"] = 'ffffff',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    },
    ["test"] = {
        ["artist"] = 'Kawaisprite',
        ["charter"] = 'Ninjamuffin99',
        ["coder"] = 'Ninjamuffin99',
        ["art"] = 'PhantomArcade & Evilk8r',
        ["color"] = 'ffffff',
        ["customText"] = false,
        ["step"] = 3,
        ["font"] = 'ms-mincho.ttf'
    }
}

-- NO TOUCHY (unless you really know what u doin')

CanShake = true

function onCreate()
    local function addText(tag, text, width, x, y, alpha, color, borderSize, borderColor, size, font)
        makeLuaText(tag, text, width, x, y)
        setProperty(tag..'.alpha', alpha)
        setTextBorder(tag, borderSize, borderColor)
        setTextSize(tag, size)
        setTextFont(tag, font)
        setTextColor(tag, color)
        if color == nil then
            setTextColor(tag, 'ffffff')
        else
            setTextColor(tag, color)
        end
        addLuaText(tag)
        setObjectCamera(tag, 'other')
    end

    makeLuaSprite('grad', 'grad', -115, 0)
    addLuaSprite('grad')
    setObjectCamera('grad', 'other')
    setProperty('grad.alpha', 0)

    if songData[songPath].customText == true then
        makeLuaSprite('name', 'songnames/' .. songPath, 20, 190)
        addLuaSprite('name', true)
        setObjectCamera('name', 'other')
    else
        if songData[songPath].specialName then
            addText('name', songData[songPath].specialName, 0, 20, 200, 1, songData[songPath].color, 0, 0, 65, songData[songPath].font)
        else
            addText('name', songPath:upper(), 0, 20, 200, 1, songData[songPath].color, 0, 0, 65, songData[songPath].font)
        end
    end
    setProperty('name.alpha', 0)
    addText('line', '_', 0, 120, 200, 1, nil, 0, 0, 80, songData[songPath].font)
    setProperty('line.scale.x', 0)
    addText('artist', 'By ' .. songData[songPath].artist, 0, 20, 280, 1, nil, 0, 0, 50, songData[songPath].font)
    setProperty('artist.alpha', 0)
    addText('charted', 'Charted by ' .. songData[songPath].charter, 0, 20, 340, 1, nil, 0, 0, 30, songData[songPath].font)
    setProperty('charted.alpha', 0)
    addText('coded', 'Code by ' .. songData[songPath].coder, 0, 20, 400, 1, nil, 0, 0, 23.5, songData[songPath].font)
    setProperty('coded.alpha', 0)
    addText('art', 'Art by ' .. songData[songPath].art, 0, 20, 440, 1, nil, 0, 0, 23.5, songData[songPath].font)
    setProperty('art.alpha', 0)
    OgCoor = {
        ["X"] = getProperty('name.x'),
        ["Y"] = getProperty('name.y'),
        ["angle"] = getProperty('name.angle')
    }
    return OgCoor
end

function onStepHit()
	if curStep == songData[songPath].step then
        doTweenX('line', 'line.scale', getProperty('line.scale.x') + 1 * 7, 1, 'quadInOut')
        doTweenAlpha('grad', 'grad', 1, 1, 'quadInOut')
        runTimer('awesomeTimer', 0.8, 0)    
        runTimer('chartTimer', 1.2, 0)    
        

        runTimer('begone', 4, 0)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'awesomeTimer' then
        doTweenAlpha('artist', 'artist', 1, 1, 'quadInOut')
        doTweenAlpha('name', 'name', 1, 1, 'quadInOut')
    end
    if tag == 'chartTimer' then
        doTweenAlpha('charter', 'charted', 1, 1, 'quadInOut')
        doTweenAlpha('coded', 'coded', 1, 1, 'quadInOut')
        doTweenAlpha('art', 'art', 1, 1, 'quadInOut')
    end

    if tag == 'begone' then
        CanShake = false
        doTweenX('charter666', 'charted', getProperty('charted.x') - 600, 1, 'backInOut')
        doTweenX('name666', 'name', getProperty('name.x') - 600, 1, 'backInOut')
        doTweenX('artist666', 'artist', getProperty('artist.x') - 600, 1, 'backInOut')
        doTweenX('coded666', 'coded', getProperty('coded.x') - 600, 1, 'backInOut')
        doTweenX('art666', 'art', getProperty('art.x') - 600, 1, 'backInOut')
        doTweenX('line666', 'line', getProperty('line.x') - 600, 1, 'backInOut')
        doTweenX('grad666', 'grad', getProperty('grad.x') - 600, 1, 'backInOut')
        doTweenAlpha('grad777', 'grad', 0, 1, 'backInOut')
    end
end

function onUpdate()
    if CanShake == true and songData[songPath].shakeIntensity  then
        setProperty('name.x', math.random(OgCoor.X + -songData[songPath].shakeIntensity, OgCoor.X + songData[songPath].shakeIntensity))
        setProperty('name.y', math.random(OgCoor.Y + -songData[songPath].shakeIntensity, OgCoor.Y + songData[songPath].shakeIntensity))
    end

    if songData[songPath].angleIntensity then
        setProperty('name.angle', math.random(OgCoor.angle + -songData[songPath].angleIntensity, OgCoor.angle + songData[songPath].angleIntensity))
    end
end