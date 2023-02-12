package platforms;

class Decoration extends Platform {
    public function new(type: Int) {
        super();
        switch (type) {
            case 5:
                loadGraphic(AssetPaths.object_5__png);
            case 4:
                loadGraphic(AssetPaths.object_4__png);
            case 3:
                loadGraphic(AssetPaths.object_3__png);
            case 2:
                loadGraphic(AssetPaths.object_2__png);
            case 1:
                loadGraphic(AssetPaths.object_1__png);
            case 0:
                loadGraphic(AssetPaths.temple__png);
            default:
                loadGraphic(AssetPaths.platform_x1__png);
        }
    }
}