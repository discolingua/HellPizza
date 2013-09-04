package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import entities.Player;
import entities.Background;

class GameScene extends Scene
{

    private var gameTimer:Float = 10;
    private var spawnTimer:Float = .5;
    private var bgMusic:Sfx;

    public function new()
    {
	bgMusic = new Sfx("sfx/tenseconds.mp3");
	super();
    }

    public override function begin()
    {
	add(Global.player = new Player(30, 50));
	add(new Background(0, 0));
	bgMusic.loop();
    }

    public override function update()
    {
	spawnTimer -= HXP.elapsed;
	if (spawnTimer < 0) { spawn(); }
	super.update();
    }

    private function spawn()
    {
	var y = Math.random() * HXP.height;
	add(new entities.Enemy(HXP.width, y));
	spawnTimer = .5;
    }

}