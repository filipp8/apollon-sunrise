package platforms;

class Block extends Platform {
    public function new(size: Int) {
        super();
        switch (size) {
            case 4:
                loadGraphic(AssetPaths.block_x4__png);
            case 3:
                loadGraphic(AssetPaths.block_x3__png);
            case 2:
                loadGraphic(AssetPaths.block_x2__png);
            default:
                loadGraphic(AssetPaths.block_x1__png);
        }
    }
}