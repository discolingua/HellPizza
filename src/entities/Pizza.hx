package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.tmx.TmxObject;

class Pizza extends Entity
{

    public function new (obj:TmxObject)
    {
	super(obj.x, obj.y);

	type = "pizza";
	layer = 1;
	graphic = new Image("gfx/pizza.png");
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
	}
    }
}