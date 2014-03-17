package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	public class GameState extends FlxState
	{
		var player:Player;
		public function GameState() 
		{
			player = new Player();
		}
		override public function create():void
		{
			FlxG.bgColor = 0xFFCCCCCC;
			add(player);
		}
	}

}