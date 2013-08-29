package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Enemy extends Entity
{

    private var xVel:Float;

    public function new(x:Float, y:Float)
    {
	super(x,y);

	layer = 10;
	xVel = (Math.random() * 5) + 1;
	graphic = new Image("gfx/skull.png");
	setHitbox(32, 32);
	type = "enemy";
    }

    public override function moveCollideX(e:Entity)
    {
	if(e.type == "player") {
	    //	scene.remove(e);
	    // scene.remove(this);
	}
	return true;
    }

    public override function update()
    {
	moveBy(-xVel, 0, "player");

	// destroy entities offstage
	if (x < -100) {
	    scene.remove(this);
	}

	super.update();
    }
}