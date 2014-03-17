package  
{
	import org.flixel.FlxSprite;

	public class GoalBlock extends FlxSprite
	{
		[Embed(source = "../res/goal_block.png")] private static const G_BLOCK:Class;
		public function GoalBlock() 
		{
			loadGraphic(G_BLOCK);
			this.immovable = true;
		}
		
	}

}