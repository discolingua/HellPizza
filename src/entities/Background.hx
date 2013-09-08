package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Backdrop;

class Background extends Entity
{

    private var xVel:Float = 0;
    private var yVel:Float = 0;
    private var xAcceleration:Float = 0;

    private static inline var maxVelocity:Float = 4;
    private static inline var speed:Float = 2;
    private static inline var drag:Float = 0.99;

    public function new(x:Float, y:Float)
    {
	super(x,y);

	layer = 1000;
	//	graphic = new Backdrop("gfx/bgPizzaShop.png");
	// graphic = new Image("gfx/bgPizzaShop.png");
	graphic = new Backdrop("gfx/wallpaper.png");

    }

    public override function update()
    {
	graphic.scrollX = Global.xScrollSpeed / 2;
	// graphic.scrollY = Global.yScrollSpeed / 2;
	// handleInput();
	// handleScrolling();
	// bcheckBounds();


	// moveBy(xVel, yVel);

	super.update();
    }

}