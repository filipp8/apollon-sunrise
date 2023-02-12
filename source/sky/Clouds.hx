package sky;

import flixel.addons.display.FlxBackdrop;

class Clouds extends FlxBackdrop {

    public function new() {
        super(AssetPaths.bg__png, X);
        scrollFactor.x = 0.1;
        scrollFactor.y = 0.1;
    }
    
}