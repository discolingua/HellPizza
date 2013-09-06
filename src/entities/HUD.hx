package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
// import com.haxepunk.graphics.Graphiclist;

class HUD extends Entity
{
    public static var timerImage:Image = Image.createRect(500, 10, 0xFFFF00);

    // private var display:Graphiclist;

    public function new()
    {

	super(x,y);

	layer = 0;

	timerImage.x = 10;
	timerImage.y = 450;

	// display.add(timerImage);

	graphic = timerImage;
	graphic.scrollX = graphic.scrollY = 0;
    }

    public override function update()
    {
	super.update();
    }
}