package platforms;

class FlyingBlock extends Platform {
    public function new(size: Int) {
        super();
        switch (size) {
            case 4:
                loadGraphic(AssetPaths.platform_x4__png);
            case 3:
                loadGraphic(AssetPaths.platform_x3__png);
            case 2:
                loadGraphic(AssetPaths.platform_x2__png);
            default:
                loadGraphic(AssetPaths.platform_x1__png);
        }
    }
}