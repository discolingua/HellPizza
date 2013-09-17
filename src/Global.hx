package;

import entities.Player;
import entities.PizzaDeliv;

// class for globally accessible variables/objects

class Global
{

    // references to walking/flying player objects
    public static var player:Player;
    public static var pizzaDeliv:PizzaDeliv;
    
    public static var xScrollSpeed:Float = .6;
    public static var yScrollSpeed:Float;
    public static var checkpoint:String;

    // timer to next pizza checkpoint
    public static var countdownTimer:Float = 10;
    public static var bgName:String;

    public static var text1:String = "12345678";
    

    //flag during death etc. to have scene reset
    public static var resetScene:Bool = false;
}
