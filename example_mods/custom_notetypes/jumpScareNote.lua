function onCreate()
	precacheImage('memoryJump');
   precacheSound('jumpscare');
   makeAnimatedLuaSprite('mem', 'memoryJump', -120, -50);
   addAnimationByPrefix('mem', 'jumpscareAnim', 'jumpscare', 24, true);
   objectPlayAnimation('mem', 'jumpscareAnim', true);
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'jumpScareNote' then
			if string.lower(songName) == 'memories' or string.lower(songName) == 'memories' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'static_NOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'offsetY', 0)
			else
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'static_NOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'offsetX', 0)
			end
			
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end


function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'jumpScareNote' then
		setProperty('health',getProperty('health')-0.35)
		
		playSound('jumpscare', 1);
		scaleObject('mem', 0.60, 0.60)
		addLuaSprite('mem', true)
		setObjectCamera('mem', 'other')
		setProperty('mem.alpha', 1)

		cameraShake('game', 0.02, 0.5);
        cameraShake('hud', 0.02, 0.5);
        cameraShake('other', 0.02, 0.5);
		
			runTimer('scary', 0.5);

		function onTimerCompleted(tag, l, ll)
			if tag == 'scary' then
				doTweenAlpha('memtween', 'mem', 0, 0.5, 'linear');
			end
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'jumpScareNote' then
	end
end