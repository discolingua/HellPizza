package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.tmx.TmxEntity;
import entities.PizzaDeliv;
import entities.Background;

class PizzaShop extends Scene
{

    public function new()
    {
	super();
    }

    public override function begin()
    {
	add(Global.pizzaDeliv = new PizzaDeliv(30,400));
	createMap("maps/testmap.tmx");
	// Global.bgName = "gfx/bgPizzaShop.png";
	// add(new Background(0,0));
    }
 
    public function createMap(mapData:String)
    {
	var e = new TmxEntity("maps/testmap.tmx");

	e.loadGraphic("gfx/testmap.png", ["main"]);

	//	e.loadMask("collision", "walls");

	add(e);
    }

    public override function update()
    {
	super.update();
    }
}