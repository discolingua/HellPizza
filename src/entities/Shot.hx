package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Shot extends Entity
{

    private var xVel:Float;
    private var yVel:Float;

    public function new(_xVel:Float, _yVel:Float)
    {
	super(Global.player.x + 32, Global.player.y + 32);

	graphic = Image.createCircle(5);
	type = "playerShot";

	xVel = _xVel;
	yVel = _yVel;
    }

    public override function update()
    {
	moveBy(xVel * 5, yVel * 5);

	super.update();
    }
}