package;

import openfl.display.StageQuality;
import openfl.Lib;
import flixel.FlxG;
import openfl.events.Event;
import flixel.FlxState;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	var gameWidth:Int = 960; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var narrowGameWidth:Int = 960;
	var tabletGameWidth:Int = 960;
    var gameHeight:Int = 480; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
    var initialState:Class<FlxState> = TitleState; // The FlxState the game starts with.
    var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
    var updateFramerate:Int = 60; // How many frames per second the game should run at.
    var drawFramerate:Int = 60; // How many frames per second the game should run at.
    var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
    var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets
	var pixelPerfect:Bool = true;

	public function new() {
		super();
        addEventListener(Event.ADDED_TO_STAGE, delay, false, 0, true);	
	}

	public function delay(e:Event) {
		removeEventListener(Event.ADDED_TO_STAGE, delay);
		haxe.Timer.delay(onInit, 100);
	}

    public function onInit():Void {
        var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		// fix narrow screens\
		if (Math.round(stageWidth / gameWidth) <= stageWidth / gameWidth) gameWidth = narrowGameWidth;
		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			// pixel perfect or max zoom
			zoom = pixelPerfect ? Math.floor(Math.min(ratioX, ratioY)) : Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
		addChild(new FlxGame(gameWidth, gameHeight, initialState, updateFramerate, drawFramerate, skipSplash, startFullscreen));
		FlxG.game.stage.quality = StageQuality.LOW;
		// FlxG.scaleMode = new RatioScaleMode(true);
		FlxG.scaleMode = new flixel.system.scaleModes.PixelPerfectScaleMode();
	}
	
	public function onResize(event:Event)
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		// fix narrow screens\
		if (Math.round(stageWidth / gameWidth) <= stageWidth / gameWidth) gameWidth = narrowGameWidth;
		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			// pixel perfect or max zoom
			zoom = pixelPerfect ? Math.floor(Math.min(ratioX, ratioY)) : Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
	}

}
