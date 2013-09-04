import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		//		HXP.screen.scale = 1;
		HXP.scene = new scenes.FlyingLevel("testflight");
	}

	public static function main() { new Main(); }

}