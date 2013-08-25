package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Enemy extends Entity
{
    public function new(x:Float, y:Float)
    {
	super(x,y);

	layer = 10;
	graphic = Image.createRect(32,32);
	setHitbox(32, 32);
	type = "enemy";
    }

    public override function moveCollideX(e:Entity)
    {
	if(e.type == "player")
	    {
		//	scene.remove(e);
		// scene.remove(this);
	    }
	return true;
    }

    public override function update()
    {
	moveBy(-5, 0, "player");
	super.update();
    }
}