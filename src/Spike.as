package  
{
	import org.flixel.FlxSprite;
	public class Spike extends FlxSprite
	{
		
		[Embed(source = "../res/spike.png")] private const G_SPIKE:Class;
		public function Spike() 
		{
			loadGraphic(G_SPIKE);
			this.immovable = true;
		}
		
	}

}