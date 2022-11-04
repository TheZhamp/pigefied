function onUpdatePost()
    setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.75 + 1)
    setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.55 + 1)
   end
   
   function onBeatHit()
   
    setProperty('iconP1.scale.x', 1.05 );
    setProperty('iconP1.scale.y', 0.95 );
    setProperty('iconP2.scale.x', 1.05 );
    setProperty('iconP2.scale.y', 0.95 );
   
   end