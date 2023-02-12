package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y29:assets%2Fimages%2Fapollon.pngR2i2682R3y5:IMAGER5R7R6tgoR0y24:assets%2Fimages%2Fbg.pngR2i294336R3R8R5R9R6tgoR0y30:assets%2Fimages%2Fbg_small.pngR2i76364R3R8R5R10R6tgoR0y30:assets%2Fimages%2Fblock_x1.pngR2i6966R3R8R5R11R6tgoR0y30:assets%2Fimages%2Fblock_x2.pngR2i8941R3R8R5R12R6tgoR0y30:assets%2Fimages%2Fblock_x3.pngR2i10697R3R8R5R13R6tgoR0y30:assets%2Fimages%2Fblock_x4.pngR2i12052R3R8R5R14R6tgoR0y27:assets%2Fimages%2Fhorse.pngR2i4481R3R8R5R15R6tgoR0y31:assets%2Fimages%2Fhorse_big.pngR2i8952R3R8R5R16R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R17R6tgoR0y26:assets%2Fimages%2Flogo.pngR2i5896R3R8R5R18R6tgoR0y30:assets%2Fimages%2Fobject_1.pngR2i3431R3R8R5R19R6tgoR0y30:assets%2Fimages%2Fobject_2.pngR2i3448R3R8R5R20R6tgoR0y30:assets%2Fimages%2Fobject_3.pngR2i3193R3R8R5R21R6tgoR0y30:assets%2Fimages%2Fobject_4.pngR2i2145R3R8R5R22R6tgoR0y30:assets%2Fimages%2Fobject_5.pngR2i3169R3R8R5R23R6tgoR0y33:assets%2Fimages%2Fplatform_x1.pngR2i2740R3R8R5R24R6tgoR0y33:assets%2Fimages%2Fplatform_x2.pngR2i3177R3R8R5R25R6tgoR0y33:assets%2Fimages%2Fplatform_x3.pngR2i3311R3R8R5R26R6tgoR0y33:assets%2Fimages%2Fplatform_x4.pngR2i3438R3R8R5R27R6tgoR0y28:assets%2Fimages%2FskyImg.pngR2i247881R3R8R5R28R6tgoR0y25:assets%2Fimages%2Fsun.pngR2i2121R3R8R5R29R6tgoR0y28:assets%2Fimages%2Ftemple.pngR2i4030R3R8R5R30R6tgoR0y35:assets%2Fimages%2Ftext_gameover.pngR2i5253R3R8R5R31R6tgoR0y32:assets%2Fimages%2Ftext_start.pngR2i3446R3R8R5R32R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R33R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R34R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR36y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R35R5y28:flixel%2Fsounds%2Fflixel.mp3R37aR39y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R38R37aR36R38hgoR2i33629R3R41R5R40R37aR39R40hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R42R43y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R48R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R49R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_apollon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_block_x1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_block_x2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_block_x3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_block_x4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_horse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_horse_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_object_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_object_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_object_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_object_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_object_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_platform_x1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_platform_x2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_platform_x3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_platform_x4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_skyimg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_temple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_text_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_text_start_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/apollon.png") @:noCompletion #if display private #end class __ASSET__assets_images_apollon_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg_small.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_small_png extends lime.graphics.Image {}
@:keep @:image("assets/images/block_x1.png") @:noCompletion #if display private #end class __ASSET__assets_images_block_x1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/block_x2.png") @:noCompletion #if display private #end class __ASSET__assets_images_block_x2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/block_x3.png") @:noCompletion #if display private #end class __ASSET__assets_images_block_x3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/block_x4.png") @:noCompletion #if display private #end class __ASSET__assets_images_block_x4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/horse.png") @:noCompletion #if display private #end class __ASSET__assets_images_horse_png extends lime.graphics.Image {}
@:keep @:image("assets/images/horse_big.png") @:noCompletion #if display private #end class __ASSET__assets_images_horse_big_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/object_1.png") @:noCompletion #if display private #end class __ASSET__assets_images_object_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/object_2.png") @:noCompletion #if display private #end class __ASSET__assets_images_object_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/object_3.png") @:noCompletion #if display private #end class __ASSET__assets_images_object_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/object_4.png") @:noCompletion #if display private #end class __ASSET__assets_images_object_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/object_5.png") @:noCompletion #if display private #end class __ASSET__assets_images_object_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/platform_x1.png") @:noCompletion #if display private #end class __ASSET__assets_images_platform_x1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/platform_x2.png") @:noCompletion #if display private #end class __ASSET__assets_images_platform_x2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/platform_x3.png") @:noCompletion #if display private #end class __ASSET__assets_images_platform_x3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/platform_x4.png") @:noCompletion #if display private #end class __ASSET__assets_images_platform_x4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/skyImg.png") @:noCompletion #if display private #end class __ASSET__assets_images_skyimg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/sun.png") @:noCompletion #if display private #end class __ASSET__assets_images_sun_png extends lime.graphics.Image {}
@:keep @:image("assets/images/temple.png") @:noCompletion #if display private #end class __ASSET__assets_images_temple_png extends lime.graphics.Image {}
@:keep @:image("assets/images/text_gameover.png") @:noCompletion #if display private #end class __ASSET__assets_images_text_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/text_start.png") @:noCompletion #if display private #end class __ASSET__assets_images_text_start_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end

#end