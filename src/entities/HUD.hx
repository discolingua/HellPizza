package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Graphiclist;

class HUD extends Entity
{

    public static var textUpperLeft:Text;
    public static var timerImage:Image = Image.createRect(500, 10, 0xFFFF00);

    private var display:Graphiclist;

    public function new()
    {

	super(x,y);

	layer = 0;

	display = new Graphiclist([]);

	textUpperLeft = new Text("1234567890", 50, 50, 200, 0);
	textUpperLeft.color = 0xFFFFFF;
	textUpperLeft.size = 18;
	display.add(textUpperLeft);

	timerImage.x = 10;
	timerImage.y = 450;

	display.add(timerImage);

	graphic = display;
	graphic.scrollX = graphic.scrollY = 0;
    }

    public override function update()
    {
	textUpperLeft.text = Global.text1;
	super.update();
    }
}