function onCreate()
    makeLuaSprite('funny', 'batnessold', 0, 250)
    addLuaSprite('funny')
    doTweenAlpha('funnytween', 'funny', 0, 0.1, linear)
    setObjectCamera('funny', 'other')
end

function onStepHit()
    if curStep == 3 then
        doTweenAlpha('funnytween2', 'funny', 1, 0.5, linear)
    end
    if curStep == 24 then
        doTweenAlpha('funnytween2', 'funny', 0, 1, linear)
	doTweenY('funnytween3', 'funny', 500, 2, backInOut)
    end
end