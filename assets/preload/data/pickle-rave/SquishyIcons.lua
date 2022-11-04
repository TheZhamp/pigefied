-- do the icon squash like in the og d&b

widthP1 = 0
widthP2 = 0
t = 0
delta = 0

-- https://lunarlabs.pt/blog/post/the_art_of_lerp
function lerp(a, b, x) return a + (b - a) * x end

function onUpdatePost(elapsed)
	updateIcons();

	t = t + elapsed;
	delta = t / 0.4;
	
	if (delta > 1) then
		delta = 1;
	end
	
	widthP1 = lerp(widthP1, 0, delta);
	widthP2 = lerp(widthP2, 0, delta);

end

function onBeatHit()

	-- calculates how much each icon should bounce
	-- the more health you have, the more your icon bounces,
	-- and vice versa.
	bounceStr = (getProperty('healthBar.percent') * 0.01) - 0.5;
	
	widthP1 = 0.3 * (1 + bounceStr);
	widthP2 = 0.3 * (1 - bounceStr);

	t = 0;

	updateIcons();
	
end

function updateIcons()

	setProperty('iconP1.scale.x', 1 + widthP1);
	setProperty('iconP2.scale.x', 1 + widthP2);
	
	setProperty('iconP1.scale.y', 1 + (widthP1 * -0.4));
	setProperty('iconP2.scale.y', 1 + (widthP2 * -0.4));
	
end