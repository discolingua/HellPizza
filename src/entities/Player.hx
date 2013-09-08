package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Player extends Entity
{

    private var xVel:Float;
    private var yVel:Float;
    private var xAcceleration:Float;
    private var yAcceleration:Float;
    private var xOffset:Float;
    private var yOffset:Float;

    private static inline var maxVelocity:Float = 8;
    private static inline var speed:Float = 3;
    private static inline var drag:Float = 0.6;

    public function new(x:Int, y:Int)
    {
	super(x, y);

	layer = 10;
	graphic = new Image ("gfx/playership.png");
	setHitbox(64,64);

	Input.define("up", [Key.UP, Key.W]);
	Input.define("down", [Key.DOWN, Key.S]);
	Input.define("left", [Key.LEFT, Key.A]);
	Input.define("right", [Key.RIGHT, Key.D]);

	xVel = 0;
	yVel = 0;

	type = "player";
    }

    public override function update()
    {
	handleInput();
	move();
	checkCollide();
	moveCamera();
	moveBy(xVel,yVel);
	super.update();
    }

    private function checkCollide()
    {
	if ( collide("walls", x + xVel, y) != null ) {
	    xVel = -xVel;
	}
	if ( collide("walls", x, y + yVel) != null) {
	    yVel = -yVel;
	}
	if (y <= 0) { 
	    yVel = -yVel;
	    y = 10;
	}
    }

    private function moveCamera()
    {
	xOffset = x - HXP.camera.x;
	yOffset = y - HXP.camera.y;

	// only manually scroll if no autoscroll

	if (Global.yScrollSpeed == 0) {
	    if (yOffset > 300 && yVel > 0) { 
		HXP.camera.y += yVel; 
	    }

	    if (yOffset < 150 && yVel < 0) {
		HXP.camera.y += yVel;
		if (HXP.camera.y <=0) { 
		    HXP.camera.y = 0; 
		}
	    }
	}

	if (Global.xScrollSpeed == 0) {
	    if (xOffset > 300 && xVel > 0) { 
		HXP.camera.x += xVel; 
	    }

	    if (xOffset < 150 && xVel < 0) {
		HXP.camera.x += xVel;
		if (HXP.camera.x <=0) { 
		    HXP.camera.x = 0; 
		}
	    }
	}

	
    }

    private function handleInput()
    {
	xAcceleration = 0;
	yAcceleration = 0;

	if (Input.check("left"))
	    {
		xAcceleration = -1;
	    }
	if (Input.check("right"))
	    {
		xAcceleration = 1;
	    }
	if (Input.check("up"))
	    {
		yAcceleration = -1;
	    }
	if (Input.check("down"))
	    {
		yAcceleration = 1;
	    }
    }

    private function move()
    {
	xVel += xAcceleration * speed;
	yVel += yAcceleration * speed;

	// keep velocity within maxVelocity

	if(Math.abs(xVel) > maxVelocity) {
	    xVel = maxVelocity * HXP.sign(xVel);
	}

	if(Math.abs(yVel) > maxVelocity) {
	    yVel = maxVelocity * HXP.sign(yVel);
	}

	// apply drag for deceleration

	if(xVel < 0) {
	    xVel = Math.min(xVel + drag, 0);
	}
	else if (xVel > 0) {
	    xVel = Math.max(xVel - drag, 0);
	}

	if(yVel < 0) {
	    yVel = Math.min(yVel + drag, 0);
	}
	else if (yVel > 0) {
	    yVel = Math.max(yVel - drag, 0);
	}
    }
}

