function onCreate()
    addLuaScript('custom_events/MoveArrow')
    makeLuaSprite('sofunny', 'bloodvignette', 0, 0)
    addLuaSprite('sofunny')
    doTweenAlpha('sofunnytween', 'sofunny', 0, 0.1, linear)
    setObjectCamera('sofunny', 'other')
end

function onStepHit()
    if curStep == 256 then
        doTweenAlpha('funnytween2', 'sofunny', 1, 0.5, linear)
        --penny
        triggerEvent('MoveArrow', '0', '-900, 0, 360, 0, 5')
        triggerEvent('MoveArrow', '1', '-900, 0, 360, 0, 5')
        triggerEvent('MoveArrow', '2', '-900, 0, 360, 0, 5')
        triggerEvent('MoveArrow', '3', '-900, 0, 360, 0, 5')
        --bof
        triggerEvent('MoveArrow', '4', '0, 0, 360, 1, 5')
        triggerEvent('MoveArrow', '5', '0, 0, 360, 1, 5')
        triggerEvent('MoveArrow', '6', '0, 0, 360, 1, 5')
        triggerEvent('MoveArrow', '7', '0, 0, 360, 1, 5')
    end
    if curStep == 512 then
        doTweenAlpha('funnytween2', 'sofunny', 0, 1, linear)
    end
    if curStep == 768 then
        doTweenAlpha('funnytween2', 'sofunny', 1, 0.5, linear)
    end
    if curStep == 1280 then
        doTweenAlpha('funnytween2', 'sofunny', 0, 1, linear)
    end
    if curStep == 1536 then
       doTweenAlpha('funnytween2', 'sofunny', 1, 0.5, linear)
       if not getPropertyFromClass('ClientPrefs', 'middleScroll') then
        triggerEvent('MoveArrow', '4', '-325, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '5', '-325, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '6', '-325, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '7', '-325, 0, -360, 1, 5')
       end
       if getPropertyFromClass('ClientPrefs', 'middleScroll') then
        triggerEvent('MoveArrow', '4', '0, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '5', '0, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '6', '0, 0, -360, 1, 5')
        triggerEvent('MoveArrow', '7', '0, 0, -360, 1, 5')
       end
    end
    if curStep == 1792 then
        doTweenAlpha('funnytween2', 'sofunny', 0, 1, linear)
        triggerEvent('MoveArrow', '4', '0, 0, 0, 1, 1')
    end
    if curStep == 1793 then
        triggerEvent('MoveArrow', '5', '0, 0, 0, 1, 1')
    end
    if curStep == 1794 then
        triggerEvent('MoveArrow', '6', '0, 0, 0, 1, 1')
    end
    if curStep == 1795 then
        triggerEvent('MoveArrow', '7', '0, 0, 0, 1, 1')
    end
    if curStep == 2048 then
        triggerEvent('MoveArrow', '4', '0, 0, 360, 0, 1')
    end
    if curStep == 2049 then
        triggerEvent('MoveArrow', '5', '0, 0, 360, 0, 1')
    end
    if curStep == 2050 then
        triggerEvent('MoveArrow', '6', '0, 0, 360, 0, 1')
    end
    if curStep == 2051 then
        triggerEvent('MoveArrow', '7', '0, 0, 360, 0, 1')
    end
end