package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.tmx.*;
import entities.Player;
import entities.Background;

class FlyingLevel extends Scene
{

    private var tmxLevelName:String;
    private var pngTileset:String;
    private var bgLevelName:String;

    private var spawnTimer:Float = .5;

    public function new(levelName:String)
    {
	super();

	tmxLevelName = "maps/" + levelName + ".tmx";
	pngTileset = "gfx/bloodrocktiles.png";
    }

    public override function begin()
    {
	createMap(tmxLevelName);
	// add(Global.player = new Player(30,50));
	add(new Background(0,0));
    }

    public function createMap(mapData:String)
    {
	removeAll();

	var map:TmxMap = new TmxMap(openfl.Assets.getText(mapData));

	var map_e = new TmxEntity(mapData);
	map_e.loadGraphic(pngTileset, ["main"]);
	map_e.loadMask("collide", "walls");
	add(map_e);

	for(object in map.getObjectGroup("objects").objects) {
	    switch (object.type) {
	    case "playerStart":
		add(Global.player = new Player(object.x, object.y));
	    }
	}
    }

    public override function update()
    {
	HXP.camera.x += Global.scrollSpeed;
	spawnTimer -= HXP.elapsed;
	if (spawnTimer < 0) { spawn(); }
	super.update();
    }

    private function spawn()
    {
	var y = Math.random() * HXP.height;
	add(new entities.Enemy(HXP.width + HXP.camera.x, y));
	spawnTimer = .5;
    }
}