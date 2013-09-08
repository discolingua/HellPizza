package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
// import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Backdrop;

class Background extends Entity
{

    public function new(x:Float, y:Float)
    {
	super(x,y);

	layer = 1000;
	// graphic = new Image("gfx/bgPizzaShop.png");
	graphic = new Backdrop("gfx/wallpaper.png");

    }

    public override function update()
    {
	x = HXP.camera.x * 2;
	y = HXP.camera.y * 2;
	super.update();
    }

}