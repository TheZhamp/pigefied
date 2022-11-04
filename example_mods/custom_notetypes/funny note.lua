random = 0
sustain = 0

images = {
    'derp funny memes/back for a sex',
    'derp funny memes/bro',
    'derp funny memes/expKing',
    'derp funny memes/isYourMomReady',
    'derp funny memes/lol_boyfriend',
    'derp funny memes/gimmeasex-popup',
    'derp funny memes/peggy-popup',
}

function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'funny note' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'derp funny memes/note assets');
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    random = getRandomInt(0, #images - 1)
		if noteType == 'funny note' then
            makeLuaSprite('the image', images[random], 0, 0)
            setScrollFactor('the image', 0, 0);
            setObjectCamera('the image', 'other')
            scaleObject('the image', 1.15, 1.15);
            screenCenter('the image')
            doTweenAlpha('image opacity', 'the image', 0, 0, 'linear')
            addLuaSprite('the image')
            runTimer('image stuffs', 0.1, 1)
            playSound('vineboom', 1)
        end
	end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'image stuffs' then
        doTweenAlpha('image tweens', 'the image', 1, 0.3, 'linear')
        runTimer('image stuff', 0.4, 1)
    end 
    if tag == 'image stuff' then
        doTweenAlpha('image tweens', 'the image', 0, 1, 'linear')
    end
end