function onCreate()
    makeLuaText('subtitle', 'I turned myself into a pickle morty...', 400, 445, 500)
    addLuaText('subtitle')
    setTextSize('subtitle', 45)
    setTextColor('subtitle', '07BE00')
    doTweenAlpha('funnitweening', 'subtitle', 0, 0.1, linear)
    makeLuaText('subtitle2', 'IM PICKLE RIIIIIIIIICK!!', 400, 445, 500)
    addLuaText('subtitle2')
    setTextSize('subtitle2', 45)
    setTextColor('subtitle2', '07BE00')
    doTweenAlpha('funnitweenzing', 'subtitle2', 0, 0.1, linear)
end

function onStepHit()
    if curStep == 896 then
        doTweenAlpha('funnitweening', 'subtitle', 1, 0.3, linear)
    end
    if curStep == 918 then
        doTweenAlpha('funnitweening', 'subtitle', 0, 0.3, linear)
    end
    if curStep == 921 then
        doTweenAlpha('funnitweenzing', 'subtitle2', 1, 0.3, linear)
    end
    if curStep == 944 then
        doTweenAlpha('funnitweenzing', 'subtitle2', 0, 0.3, linear)
    end
end