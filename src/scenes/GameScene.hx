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
	//	bgMusic = new Sfx("audio/tenseconds.wav");
	super();
    }

    public override function begin()
    {
	add(new Player(30, 50));
	add(new Background(0, 0));

    }

    public override function update()
    {
	spawnTimer -= HXP.elapsed;
	if (spawnTimer < 0)
	    {
		spawn();
	    }
	super.update();
    }

    private function spawn()
    {
	var y = Math.random() * HXP.height;
	add(new entities.Enemy(HXP.width, y));
	spawnTimer = .5;
    }

}