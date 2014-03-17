package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class Alien extends FlxGroup
	{
		[Embed(source = "../res/alien.png")] private static const G_ALIEN:Class;
		
		
		private var alienSprite:FlxSprite;
		private var alienText:FlxText;
		private var speakCounter:int;
		
		public function Alien(text:String) 
		{
			speakCounter = 0;
			alienSprite = new FlxSprite(30,4);
			alienSprite.loadGraphic(G_ALIEN, true, false, 8, 20);
			alienSprite.addAnimation("talk", [0, 1], 30);
			alienSprite.addAnimation("silent", [0], 5);
			alienSprite.play("talk");
			
			alienText = new FlxText(42, 8, 200, text);
			alienText.color = 0xFF000000;
			
			add(alienSprite);
			add(alienText);
		}
		
		
		override public function update():void
		{
			super.update();
			speakCounter++;
			if (speakCounter == alienText.text.length * 15)
			{
				alienSprite.play("silent");
			}
		}
		
	}

}