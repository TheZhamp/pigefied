package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var colorTween:FlxTween;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'donate',
		'options',
		'awards',
		'credits'
	];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{

		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		FlxG.mouse.visible = true; //omg guys i finally coded a menu with mouse im so epic!1!1!!

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);

		//var piggylogo:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('piglogo'));
		//piggylogo.scrollFactor.set(0, 0);
		//piggylogo.setGraphicSize(Std.int(piggylogo.width * 0.3));
		//piggylogo.updateHitbox();
		//piggylogo.screenCenter();
		//piggylogo.y += 0;
		//piggylogo.x += 300;
		//piggylogo.visible = true;
		//piggylogo.antialiasing = ClientPrefs.globalAntialiasing;
		//add(piggylogo);

		var piggy:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuPenny'));
		piggy.scrollFactor.set(0, 0);
		piggy.setGraphicSize(Std.int(piggy.width * 0.9));
		piggy.updateHitbox();
		piggy.screenCenter();
		piggy.y += 0;
		piggy.x += -350;
		piggy.flipX = true;
		piggy.visible = true;
		piggy.antialiasing = ClientPrefs.globalAntialiasing;
		add(piggy);

		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.65;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 0);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.ID = i;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();
			//menuItem.screenCenter(X);
			menuItem.scrollFactor.set();
			var storyX;
			var storyY;
			var freeplayX;
			var freeplayY;
			var creditsX;
			var creditsY;
			var awardsX;
			var awardsY;
			var discordX;
			var discordY;
			var optionsX;
			var optionsY;

			//Button Positions

			//Story Mode
			storyX = 300;
			storyY = 400;
			//Freeplay
			freeplayX = 300;
			freeplayY = 500;
			//Credits
			creditsX = 463;
			creditsY = 500;
			//Awards
			awardsX = 626;
			awardsY = 500;
			//Discord
			discordX = 789;
			discordY = 500;
			//Options
			optionsX = 20;
			optionsY = 590;

			switch(i)
			{
				case 0: //Story Mode
					menuItem.scale.set(1.05, 1.05);
					menuItem.x = storyX;
					menuItem.y = storyY;
				case 1: //Freeplay
					menuItem.scale.set(1.05, 1.05);
					menuItem.x = freeplayX;
					menuItem.y = freeplayY;
				case 2: //Discord
					menuItem.scale.set(1.05, 1.05);
					menuItem.y = discordY;
					menuItem.x = discordX;
				case 3: //Options
					menuItem.scale.set(1.05, 1.05);
					menuItem.x = optionsX;
					menuItem.y = optionsY;
				case 4: // Awards
					menuItem.scale.set(1.05, 1.05);
					menuItem.y = awardsY;
					menuItem.x = awardsX;
				case 5: //Credits
					menuItem.scale.set(1.05, 1.05);
					menuItem.y = creditsY;
					menuItem.x = creditsX;
			}
			menuItems.add(menuItem);
		}

		add(menuItems);

		//FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(800, 700, FlxG.height - 44, "Psych Engine v" + psychEngineVersion + " - Piggyfied Demo v2", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Gotham-Bold", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	var canClick:Bool = true;
	var usingMouse:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		/*var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));*/

		if (!selectedSomethin)
		{
			if (controls.BACK)
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('cancelMenu'));
					MusicBeatState.switchState(new TitleState());
				}

			#if desktop
			if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			if(usingMouse)
			{
				if(!FlxG.mouse.overlaps(spr))
					spr.animation.play('idle');
			}

			if (FlxG.mouse.overlaps(spr))
			{
				if(canClick)
				{
					curSelected = spr.ID;
					usingMouse = true;
					spr.animation.play('selected');
					
				}

				if(FlxG.mouse.justReleased && canClick)
				{
					if (optionShit[curSelected] == 'donate')
					{
						//arm4gedon moment
						CoolUtil.browserLoad('https://discord.gg/YydyHa27W7');
					}
					else
					{
						selectedSomethin = true;
						FlxG.sound.play(Paths.sound('confirmMenu'));
						FlxG.sound.play(Paths.sound('piggyClick'));

						if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);
						canClick = false;

						FlxG.camera.zoom = 1;
		FlxTween.tween(FlxG.camera, {zoom: 1.6}, 0.8, {
			ease: FlxEase.expoIn,
		});
						FlxG.camera.fade(FlxColor.BLACK, 0.7, false);

						menuItems.forEach(function(spr:FlxSprite)
						{
							
							if (curSelected != spr.ID)
							{
								FlxTween.tween(spr, {alpha: 0}, 0.4, {
									ease: FlxEase.quadOut,
									onComplete: function(twn:FlxTween)
									{
										spr.kill();
									}
								});

								//new FlxTimer().start(0.1, function(tmr:FlxTimer)
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										
										persistentUpdate = false;
										//FlxG.sound.play(Paths.sound('confirmMenu'));
										if(colorTween != null) {
											colorTween.cancel();
										}
										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												FlxG.switchState(new StoryMenuState());
											});
										
										
										trace("Story Menu Selected");
									case 'freeplay':
										
										persistentUpdate = false;
										//FlxG.sound.play(Paths.sound('confirmMenu'));
										if(colorTween != null) {
											colorTween.cancel();
										}
								
										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												FlxG.switchState(new FreeplayState());
											});

										trace("Freeplay Menu Selected");

									case 'options':
										
										persistentUpdate = false;
										//FlxG.sound.play(Paths.sound('confirmMenu'));
										if(colorTween != null) {
											colorTween.cancel();
										}
										
										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												FlxG.switchState(new options.OptionsState());
											});
												
										trace("Options Menu Selected");
									case 'awards':
										
										persistentUpdate = false;
										//FlxG.sound.play(Paths.sound('confirmMenu'));
										
										if(colorTween != null) {
											colorTween.cancel();
										}
										
										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												FlxG.switchState(new AchievementsMenuState());
											});

										trace("Award Menu Selected yipee");
									case "credits":
										persistentUpdate = false;
										//FlxG.sound.play(Paths.sound('confirmMenu'));
										if(colorTween != null) {
											colorTween.cancel();
										}
										
										new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												FlxG.switchState(new CreditsState());
											});
								}		
							}
						});
					}
				}
			}
		});

		super.update(elapsed);


	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				/*var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);*/
				spr.centerOffsets();
			}
		});
	}
}
