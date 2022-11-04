local curColor = 'blue'

function onCreate()
    cameraFlash('hud', '000000', 7, false);
    scaleObject('gf', 0.85, 0.85)
    setProperty('gf.y', getProperty('gf.y') + 5)
end

function onCreatePost()
    makeLuaSprite('blue', 'disco/blue', 0, 0);
    setScrollFactor('blue', 0, 0);
    scaleObject('blue', 0.80605, 0.7776)
    setProperty('blue.alpha', 0)
    addLuaSprite('blue', true)
    setObjectCamera('blue', 'other')

    makeLuaSprite('purple', 'disco/purple', 0, 0);
    setScrollFactor('purple', 0, 0);
    scaleObject('purple', 0.80605, 0.7776)
    setProperty('purple.alpha', 0)
    addLuaSprite('purple', true)
    setObjectCamera('purple', 'other')

    makeLuaSprite('red', 'disco/red', 0, 0);
    setScrollFactor('red', 0, 0);
    scaleObject('red', 0.80605, 0.7776)
    setProperty('red.alpha', 0)
    addLuaSprite('red', true)
    setObjectCamera('red', 'other')

    makeLuaSprite('yellow', 'disco/yellow', 0, 0);
    setScrollFactor('yellow', 0, 0);
    scaleObject('yellow', 0.80605, 0.7776)
    setProperty('yellow.alpha', 0)
    addLuaSprite('yellow', true)
    setObjectCamera('yellow', 'other')
end

function onStepHit()
    if curStep == 896 then
        cameraFlash('hud', '000000', 3, false);
    end
    if curStep == 1183 then
        disco = true
    end
    if curStep == 1439 then
        disco = false
    end
end

function onBeatHit()
    if disco == true then
        if curColor == 'blue' then
            setProperty('purple.alpha', 1)
            doTweenAlpha('purpleTween', 'purple', 0, 0.5, 'linear')
            curColor = 'purple'
            return curColor
        end
        if curColor == 'purple' then
            setProperty('red.alpha', 1)
            doTweenAlpha('redTween', 'red', 0, 0.5, 'linear')
            curColor = 'red'
            return curColor
        end
        if curColor == 'red' then
            setProperty('yellow.alpha', 1)
            doTweenAlpha('yellowTween', 'yellow', 0, 0.5, 'linear')
            curColor = 'yellow'
            return curColor
        end
        if curColor == 'yellow' then
            setProperty('blue.alpha', 1)
            doTweenAlpha('blueTween', 'blue', 0, 0.5, 'linear')
            curColor = 'blue'
            return curColor
        end
    end
end