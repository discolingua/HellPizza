package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;


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
	graphic = new Backdrop("gfx/wallpaper.png");

	Input.define("left", [Key.LEFT, Key.A]);
	Input.define("right", [Key.RIGHT, Key.D]);

    }

    public override function update()
    {
	handleInput();
	checkBounds();

	
	moveBy(xVel, yVel);

	super.update();
    }

    private function checkBounds()
    {
	// bounds checking for vertical scrolling
	if (y > 0) { 
	    yVel = 0;
	    y = 0;
	}
	if (y < -960) {
	    yVel = 0;
	    y = -960;
	}
	
    }

    private function handleInput()
    {
	xAcceleration = 0;

	if (Input.check("left"))  {
	    xVel = .5;
	} 
	else if (Input.check("right")) {
	    xVel = -.5;
	} else {
	    xVel = -.2;
	}

	if (Input.check("up")) {
	    yVel = 4.5;
	}
	if (Input.check("down")) {
	    yVel = -4.5;
	}
    }

}