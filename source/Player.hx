package;

import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {

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
        // loadGraphic(AssetPaths.horse__png, true, 44, 30);
        animation.add("run", [0,1,2,3,4,5,6], 10);
        animation.add("jump", [7,8], 10, false);
        animation.add("fall", [9,10,11,12,13], 10, false);
        animation.play("run");
        offset.set(width/2 - 5, height - 10);
        setSize(10, 10);

        velocity.x = MEDIUM;
        acceleration.y = GRAVITY;
    }

    override public function update(elapsed: Float) {
        handleControls();
        handleAnimations();
        handleTimer();
        accelerate();
        // animation.getByName("run").frameRate = 50 + 20 * (MAX_VELOCITY/velocity.x);
        animation.getByName("run").frameRate = 10 + 10 * (velocity.x/MAX_VELOCITY);
        // trace(animation.getByName("run").frameRate);
        if (velocity.x > MAX_VELOCITY) {
            velocity.x = MAX_VELOCITY;
        }
        super.update(elapsed);
    }

    public function run() {
        animation.play("run");
        canJump = true;
    }

    public function fall() {
        acceleration.y = 0;
        velocity.y = 0;
        animation.play("fall");
        canJump = false;
        falling = true;
    }

    private function accelerate(): Void {
        if (falling) return;
        if (velocity.x < SLOW) {
            acceleration.x = 50;
        } else if (velocity.x < MEDIUM) {
            acceleration.x = 30;
        } else if (velocity.x < FAST) {
            acceleration.x = 20;
        } else if (velocity.x < FASTEST) {
            acceleration.x = 10;
        }
    }

    private function handleTimer(): Void {
        if (jumpTimer.active) {
            velocity.y = JUMP_VELOCITY;
        }
    }

    private function handleControls(): Void {
        if ((FlxG.keys.anyPressed([SPACE, Z, X, C]) || FlxG.mouse.pressed)  && canJump == true && jumpTimer.active == false) {
            jumpTimer.start(getTimerTime(), (t: FlxTimer) -> {
                canJump = false;
                t.cancel();
            });
        }
        if (FlxG.keys.anyJustReleased([SPACE, Z, X, C]) || FlxG.mouse.justReleased) {
            if (jumpTimer.time - jumpTimer.timeLeft <= 0.1 && jumpTimer.active == true) {
                velocity.y = SMALL_JUMP_VELOCITY;
            }
            jumpTimer.cancel();
            canJump = false;
        }
    }

    private function handleAnimations(): Void {
        if (velocity.y < 0 && animation.curAnim.name != "jump") {
            animation.play("jump");
        } else if (velocity.y > 0 && animation.curAnim.name != "fall") {
            animation.play("fall");
            canJump = false;
        }/*  else if (velocity.y == 0 && y == last.y) {
            animation.play("run");
            canJump = true;
        } */
    }

    private function getTimerTime(): Float {
        if (velocity.x < SLOW) {
            return 0.15;
        } else if (velocity.x < MEDIUM) {
            return 0.2;
        } else if (velocity.x < FAST) {
            return 0.25;
        }
        return 0.3;
    }
}