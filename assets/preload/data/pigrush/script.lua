function onCreate()
    addLuaScript('custom_events/MoveArrow')
    makeLuaSprite('sofunny', 'vignette', 0, 0)
    addLuaSprite('sofunny')
    doTweenAlpha('sofunnytween', 'sofunny', 0, 0.1, linear)
    setObjectCamera('sofunny', 'other')
end

function onStepHit()
    if curStep == 512 then
        doTweenAlpha('funnytween2', 'sofunny', 1, 0.5, linear)
    end
    if curStep == 960 then
        doTweenAlpha('funnytween2', 'sofunny', 0, 1, linear)
    end
    if curStep == 511 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, -100, 360, 1, 1')
            triggerEvent('MoveArrow', '5', '0, -100, 360, 1, 1')
            triggerEvent('MoveArrow', '6', '0, -100, 360, 1, 1')
            triggerEvent('MoveArrow', '7', '0, -100, 360, 1, 1')
        end
        if not getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, 100, 360, 1, 1')
            triggerEvent('MoveArrow', '5', '0, 100, 360, 1, 1')
            triggerEvent('MoveArrow', '6', '0, 100, 360, 1, 1')
            triggerEvent('MoveArrow', '7', '0, 100, 360, 1, 1')
        end
    end
    if curStep == 512 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '0', '0, 500, 360, 0, 5')
            triggerEvent('MoveArrow', '1', '0, 500, 360, 0, 5')
            triggerEvent('MoveArrow', '2', '0, 500, 360, 0, 5')
            triggerEvent('MoveArrow', '3', '0, 500, 360, 0, 5')
        end
        if not getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '0', '0, -500, 360, 0, 5')
            triggerEvent('MoveArrow', '1', '0, -500, 360, 0, 5')
            triggerEvent('MoveArrow', '2', '0, -500, 360, 0, 5')
            triggerEvent('MoveArrow', '3', '0, -500, 360, 0, 5')
        end
    end
    if curStep == 704 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, 100, 360, 0.5, 1')
            triggerEvent('MoveArrow', '5', '0, 90, 360, 0.5, 1')
            triggerEvent('MoveArrow', '6', '0, 90, 360, 0.5, 1')
            triggerEvent('MoveArrow', '7', '0, 100, 360, 0.5, 1')
        end
        if not getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, -100, 360, 0.5, 1')
            triggerEvent('MoveArrow', '5', '0, -90, 360, 0.5, 1')
            triggerEvent('MoveArrow', '6', '0, -90, 360, 0.5, 1')
            triggerEvent('MoveArrow', '7', '0, -100, 360, 0.5, 1')
        end
    end
    if curStep == 960 then
        if getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '5', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '6', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '7', '0, 0, 0, 1, 1')
        end
        if not getPropertyFromClass('ClientPrefs', 'downScroll') then
            triggerEvent('MoveArrow', '4', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '5', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '6', '0, 0, 0, 1, 1')
            triggerEvent('MoveArrow', '7', '0, 0, 0, 1, 1')
        end
    end
end