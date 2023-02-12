package;

import flixel.effects.FlxFlicker;
import flixel.util.FlxSpriteUtil;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import platforms.Decoration;
import platforms.FlyingBlock;
import flixel.math.FlxRect;
import platforms.Block;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import sky.Clouds;
import flixel.FlxG;
import flixel.FlxState;

class TitleState extends FlxState
{
	var sky: Clouds;
	var horse: PlayerDemo;
	var apollon: FlxSprite;
	var sun: FlxSprite;
	var platforms: FlxTypedSpriteGroup<FlxTypedSpriteGroup<Platform>> = new FlxTypedSpriteGroup<FlxTypedSpriteGroup<Platform>>();
	var blocks: FlxTypedSpriteGroup<Platform> = new FlxTypedSpriteGroup<Platform>();
	var flyingBlocks: FlxTypedSpriteGroup<Platform> = new FlxTypedSpriteGroup<Platform>();
	var decorations: FlxTypedSpriteGroup<Platform> = new FlxTypedSpriteGroup<Platform>();
	var lastPlatform: Platform;
	var mainCamera: FlxCamera;
	var hudCamera: FlxCamera;
	// TEXT
    var title: FlxSprite;
    var textStart: FlxSprite;

	override public function create(): Void {
		super.create();

		sky = new Clouds();
		sky.y = FlxG.height - sky.height;
		add(sky);
		
		var startingPlatform = new Block(4);
		startingPlatform.x = 0;
		startingPlatform.y = FlxG.height -150;
		lastPlatform = startingPlatform;
		startingPlatform.revive();
		
		blocks.add(startingPlatform);
		blocks.add(new Block(4));
		blocks.add(new Block(3));
		blocks.add(new Block(3));
		blocks.add(new Block(3));
		blocks.add(new Block(2));
		blocks.add(new Block(2));
		blocks.add(new Block(2));
		blocks.add(new Block(2));
		blocks.add(new Block(2));
		blocks.add(new Block(1));
		blocks.add(new Block(1));
		blocks.add(new Block(1));

		platforms.add(blocks);

		// flyingBlocks.add(new FlyingBlock(4));
		// flyingBlocks.add(new FlyingBlock(3));
		// flyingBlocks.add(new FlyingBlock(3));
		flyingBlocks.add(new FlyingBlock(3));
		flyingBlocks.add(new FlyingBlock(2));
		flyingBlocks.add(new FlyingBlock(2));
		flyingBlocks.add(new FlyingBlock(2));
		flyingBlocks.add(new FlyingBlock(2));
		flyingBlocks.add(new FlyingBlock(2));
		flyingBlocks.add(new FlyingBlock(1));
		flyingBlocks.add(new FlyingBlock(1));
		flyingBlocks.add(new FlyingBlock(1));
		platforms.add(flyingBlocks);
		add(platforms);

		decorations.add(new Decoration(0));
		decorations.add(new Decoration(1));
		decorations.add(new Decoration(1));
		decorations.add(new Decoration(2));
		decorations.add(new Decoration(2));
		decorations.add(new Decoration(3));
		decorations.add(new Decoration(3));
		decorations.add(new Decoration(4));
		decorations.add(new Decoration(4));
		decorations.add(new Decoration(4));
		decorations.add(new Decoration(5));
		decorations.add(new Decoration(5));
		decorations.add(new Decoration(5));
		add(decorations);

		horse = new PlayerDemo();
		horse.x = FlxG.width/2;
		horse.y = 100;
		apollon = new FlxSprite(0, 0, AssetPaths.apollon__png);
		sun = new FlxSprite(0, 0, AssetPaths.sun__png);
		add(sun);
		add(apollon);
		add(horse);

		title = new FlxSprite(0, 0, AssetPaths.logo__png);
		title.screenCenter();
		title.scrollFactor.set(0, 0);
		add(title);

		textStart = new FlxSprite(0, 0, AssetPaths.text_start__png);
		textStart.screenCenter();
		textStart.y = FlxG.height - 100;
		textStart.scrollFactor.set(0, 0);
		add(textStart);
		FlxFlicker.flicker(textStart, 0, 0.5);

		setDecorations();
		setDecorations();

		FlxG.camera.follow(horse, PLATFORMER, 1);
		FlxG.camera.followLead.set(1, 0);
		FlxG.worldBounds.height = FlxG.height;
		FlxG.worldBounds.width = FlxG.width;
	}

	override public function update(elapsed: Float): Void {
		FlxG.worldBounds.x = horse.x - FlxG.width/2;
		FlxG.worldBounds.y = horse.y - FlxG.height/2;

		if (FlxG.keys.anyJustPressed([ANY]) || FlxG.mouse.justPressed) {
			FlxG.switchState(new PlayState());
		}

		handlePlatforms();
		handleTrail();
		super.update(elapsed);
	}

	private function handleOverlap(horse: Player, platform: Platform): Void {
		FlxObject.separate(horse, platform);
		if (horse.x + horse.width < platform.x) {
			horse.fall();
		} else if (horse.y + horse.height <= platform.y) {
			horse.run();
		}
	}

	private function getRandomPlatform(group: FlxTypedSpriteGroup<Platform>): Platform {
		var tmpPlatform = group.getRandom();
		return (tmpPlatform.alive == false && tmpPlatform != lastPlatform) ? tmpPlatform : getRandomPlatform(group);
	}

	private function getRandomDecoration(): Platform {
		var tmpDecoration = decorations.getRandom();
		return (tmpDecoration.alive == false && tmpDecoration.width < lastPlatform.width - 64) ? tmpDecoration : getRandomDecoration();
	}

	private function handlePlatforms(): Void {
		if (lastPlatform.x + lastPlatform.width < FlxG.camera.scroll.x + FlxG.width) {
			var randomY = lastPlatform.y + (Math.random() - 0.5) * 150;
			var tmpPlatform = getRandomPlatform(randomY > FlxG.height - 224 ? blocks : flyingBlocks);
			tmpPlatform.reset(FlxG.camera.scroll.x + FlxG.width + Math.random() * (horse.velocity.x * (3/5)), randomY);
			if (tmpPlatform.y > FlxG.height -100)
				tmpPlatform.y = FlxG.height -100;
			if (tmpPlatform.y < -FlxG.height + 100)
				tmpPlatform.y = -FlxG.height + 100;
			lastPlatform = tmpPlatform;
			setDecorations();
			setDecorations();
		}
	}

	private function handleTrail(): Void {
		apollon.setPosition(horse.x - 45, horse.last.y - 48);
		sun.setPosition(apollon.x - 33, apollon.last.y + 7);
	}

	private function setDecorations(): Void {
		var tmpDecoration = getRandomDecoration();
		tmpDecoration.reset(lastPlatform.x + 32 + Math.random() * (lastPlatform.width - tmpDecoration.width - 64), lastPlatform.y - tmpDecoration.height);
	}

}
