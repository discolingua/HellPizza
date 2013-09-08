package entities;

// Traffic signals change the player scroll direction
// to newX and newY, properties defined in the editor

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.tmx.TmxObject;

class Traffic extends Entity
{

    private var newX:Float;
    private var newY:Float;

    public function new (obj:TmxObject)
    {
	super(obj.x, obj.y);

	type = "traffic";
	layer = 1;
	newX = Std.parseFloat(obj.custom.resolve("newX"));
	newY = Std.parseFloat(obj.custom.resolve("newY"));
	graphic = new Image("gfx/traffic.png");
	setHitboxTo(graphic);
    }

    public override function update()
    {
	checkCollide();
	super.update();
    }

    private function checkCollide()
    {
	if ( collide("player", x, y) != null ) {
	    scene.remove(this);
	    Global.xScrollSpeed = newX;
	    Global.yScrollSpeed = newY;
	}
    }
}