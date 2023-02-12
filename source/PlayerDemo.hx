package;

import flixel.util.FlxTimer;
import flixel.FlxSprite;

class PlayerDemo extends FlxSprite {

    private static inline var SLOW = 100;
    private static inline var MEDIUM = 250;
    private static inline var FAST = 400;
    private static inline var FASTEST = 800;
    private static inline var SMALL_JUMP_VELOCITY = -200;
    private static inline var JUMP_VELOCITY = -300;
    private static inline var INITIAL_VELOCITY = SLOW;
    private static inline var MAX_VELOCITY = FASTEST;
    private static inline var GRAVITY = 1200;

    private var canJump = false;
    private var falling = false;
    private var jumpTimer = new FlxTimer();

    public function new() {
        super();
        loadGraphic(AssetPaths.horse_big__png, true, 88, 60);
        animation.add("run", [0,1,2,3,4,5,6], 10);
        animation.play("run");
        offset.set(width/2 - 5, height - 10);
        setSize(10, 10);

        velocity.x = MEDIUM;
    }

    override public function update(elapsed: Float) {
        animation.getByName("run").frameRate = 10 + 10 * (velocity.x/MAX_VELOCITY);
        super.update(elapsed);
    }

}