package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.tmx.TmxEntity;
import entities.PizzaDeliv;
import entities.Background;

class WalkingLevel extends Scene
{

    private var tmxLevelName:String;
    private var pngTileset:String;
    private var bgLevelName:String;

    public function new(levelName:String)
    {
	super();

	tmxLevelName = "maps/" + levelName + ".tmx";
	pngTileset = "gfx/testmap.png";


    }

    public override function begin()
    {
	createMap(tmxLevelName);
	add(Global.pizzaDeliv = new PizzaDeliv(30,400));
	// createMap("maps/testmap.tmx");
	// add(new Background(0,0));
    }
 
    public function createMap(mapData:String)
    {
	var e = new TmxEntity(mapData);

	e.loadGraphic(pngTileset, ["main"]);

	//	e.loadMask("collision", "walls");

	add(e);
    }

    public override function update()
    {
	super.update();
    }
}