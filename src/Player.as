package  
{
	import org.flixel.FlxSprite;
	
	public class Player extends FlxSprite
	{
		[Embed(source = "../res/player.png")] const G_PLAYER:Class;
		public function Player() 
		{
			loadGraphic(G_PLAYER, false, true);
			
		}
		
	}

}