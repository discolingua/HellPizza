package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class PizzaDeliv extends Entity
{
    private var xVel:Float;
    private var yVel:Float;
    private var xAcceleration:Float;
    private var yAcceleration:Float;
    private var facing:String;

    private static inline var maxVelocity:Float = 6;
    private static inline var speed:Float = 2;
    private static inline var drag:Float = 0.6;

    private var sprite:Spritemap;

    public function new(x:Int, y:Int)
    {
	super(x,y);

	layer = 10;
	sprite = new Spritemap("gfx/delivSpritesheet.png",64,128);
	sprite.add("idleRight", [0,1], 4);
	sprite.add("walkRight", [2,3,4,3], 4);
	sprite.add("idleLeft", [5,6], 4);
	sprite.add("walkLeft", [7,8,9,8], 4);
	sprite.play("idleRight");
	facing = "right";
	graphic = sprite;
	// setHitBox(32,64);

	Input.define("up", [Key.UP, Key.W]);
	Input.define("down", [Key.DOWN, Key.S]);
	Input.define("left", [Key.LEFT, Key.A]);
	Input.define("right", [Key.RIGHT, Key.D]);

	xVel = 0;
	yVel = 0;

	type = "pizzaDeliv";
    }

    public override function update()
    {
	handleInput();
	move();
	setSprites();
	moveBy(xVel, yVel);
	// setAnimations();
	
	super.update();
    }

    private function handleInput()
    {
	xAcceleration = 0;
	yAcceleration = 0;

	if (Input.check("left"))
	    {
		xAcceleration = -1;
		facing = "left";
	    }
	if (Input.check("right"))
	    {
		xAcceleration = 1;
		facing = "right";
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

	if(Math.abs(yVel) > maxVelocity)
	    {
		yVel = maxVelocity * HXP.sign(yVel);
	    }

	if(yVel < 0)
	    {
		yVel = Math.min(yVel + drag, 0);
	    }
	else if (yVel > 0)
	    {
		yVel = Math.max(yVel - drag, 0);
	    }
    }

    private function setSprites()
    {
	if ((Math.abs(xVel) > 0) || (Math.abs(yVel) > 0)) {
	    if (facing == "right") { sprite.play("walkRight"); }
	    if (facing == "left" ) { sprite.play("walkLeft"); }
	} else {
	    if (facing == "right") { sprite.play("idleRight"); }
	    if (facing == "left" ) { sprite.play("idleLeft"); }
	}
    }
}