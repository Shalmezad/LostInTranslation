package  
{
	import org.flixel.FlxSprite;

	public class GoalBlock extends FlxSprite
	{
		[Embed(source = "../res/goal_block.png")] private static const G_BLOCK:Class;
		[Embed(source = "../res/block.png")] private static const G_BLOCK2:Class;
		public function GoalBlock() 
		{
			loadGraphic(G_BLOCK);
			this.immovable = true;
		}
		public function hide():void
		{
			loadGraphic(G_BLOCK2);
		}
	}

}