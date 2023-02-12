import flixel.FlxG;
import flixel.FlxSprite;

class Platform extends FlxSprite {
    public function new() {
        super();
        immovable = true;

        kill();
    }

    override public function update(elapsed: Float): Void {
        if (x < FlxG.camera.scroll.x - width) {
            kill();
        }
        super.update(elapsed);
    }
}