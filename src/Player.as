package  
{
	import org.flixel.FlxSprite;
	
	public class Player extends FlxSprite
	{
		[Embed(source = "../res/player.png")] private const G_PLAYER:Class;
		public function Player() 
		{
			loadGraphic(G_PLAYER, false, true);
			acceleration.y = 300;
			maxVelocity.x = 200;
			drag.x = 80;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			if (Key.LEFT && !Key.RIGHT)
			{
				acceleration.x = -120;
			}
			else if (Key.RIGHT && !Key.LEFT)
			{
				acceleration.x = 120;
			}
			if (Key.JUMP && isTouching(FLOOR))
			{
				velocity.y = -170;
			}
		}
		
	}

}