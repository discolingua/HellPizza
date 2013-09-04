package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.tmx.TmxEntity;
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
	add(Global.player = new Player(30,50));
    }

    public function createMap(mapData:String)
    {
	var e = new TmxEntity(mapData);
	e.loadGraphic(pngTileset, ["main"]);
	e.loadMask("collide", "walls");
	add(e);
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