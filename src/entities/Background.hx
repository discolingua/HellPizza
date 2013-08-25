package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;


class Background extends Entity
{

    private var xVel:Float = 0;
    private var xAcceleration:Float = 0;

    private static inline var maxVelocity:Float = 4;
    private static inline var speed:Float = 2;
    private static inline var drag:Float = 0.4;


    public function new(x:Float, y:Float)
    {
	super(x,y);

	layer = 1000;
	graphic = new Image("gfx/wallpaper.png");

	Input.define("left", [Key.LEFT, Key.A]);
	Input.define("right", [Key.RIGHT, Key.D]);

    }

    public override function update()
    {
	handleInput();
	//	move();
	moveBy(xVel, 0);

	super.update();
    }

    private function handleInput()
    {
	xAcceleration = 0;

	if (Input.check("left"))
	    {
		xVel = .5;
	    }
	if (Input.check("right"))
	    {
		xVel = -.5;
	    }
    }

    private function move()
    {
	xVel += xAcceleration * speed;

	if(Math.abs(xVel) > maxVelocity)
	    {
		xVel = maxVelocity * HXP.sign(xVel);
	    }
	if(xVel < 0)
	    {
		xVel = Math.min(xVel + drag, 0);
	    }
	else if (xVel > 0)
	    {
		xVel = Math.max(xVel - drag, 0);
	    }
    }


}