package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.tmx.*;
import entities.Player;
import entities.Background;
import entities.HUD;
import entities.Traffic;
import entities.Pizza;

class FlyingLevel extends Scene
{

    private var tmxLevelName:String;
    private var pngTileset:String;
    private var bgLevelName:String;
    private var bgMusic:Sfx;

    private var spawnTimer:Float = .5;

    public function new(levelName:String)
    {
	super();

	tmxLevelName = "maps/" + levelName + ".tmx";
	pngTileset = "gfx/bloodrocktiles.png";
    }

    public override function begin()
    {
	loadMap(tmxLevelName);
	// bgMusic.loop();
	add(new Background(0,0));
	add(new HUD());
    }

    public function loadMap(mapData:String)
    {
	removeAll();

	var map:TmxMap = new TmxMap(openfl.Assets.getText(mapData));

	var map_e = new TmxEntity(mapData);
	map_e.loadGraphic(pngTileset, ["main"]);
	map_e.loadMask("collide", "walls");
	add(map_e);

	// read objects from .tmx map file

	for(object in map.getObjectGroup("objects").objects) {
	    switch (object.type) {
	    case "playerStart":
		add(Global.player = new Player(object.x, object.y));
	    case "traffic":
		add(new Traffic(object));
	    case "pizza":
		add(new Pizza(object));
	    }
	}

	// read properties from .tmx map file

	bgMusic = new Sfx("sfx/" + map.properties.resolve("bgMusic") + ".mp3");
	Global.xScrollSpeed = Std.parseFloat( map.properties.resolve("xScrollStart"));
	Global.yScrollSpeed = Std.parseFloat( map.properties.resolve("yScrollStart"));
	
    }

    public override function update()
    {
	HXP.camera.x += Global.xScrollSpeed;
	HXP.camera.y += Global.yScrollSpeed;
	spawnTimer -= HXP.elapsed;
	if (spawnTimer < 0) { spawn(); }
	if (Global.resetScene) {
	    Global.resetScene = false;
	   HXP.scene = new FlyingLevel("testflight");
	}
	super.update();
    }

    private function spawn()
    {
	var y = Math.random() * HXP.height;
	add(new entities.Enemy(HXP.width + HXP.camera.x, y));
	spawnTimer = .5;
    }
}