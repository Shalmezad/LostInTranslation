package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	public class Level3 extends Level
	{
		/*
			http://ackuna.com/badtranslator
			From English: Spikes are fake
			To Bulgarian: Шиповете са фалшиви
			Back to English: The spikes are false
			To Catalan: Les pues són falses
			Back to English: The spikes are false
			To Chinese Simplified: 在峰值都是假
			Back to English: Peak is fake
			To Chinese Traditional: 高峰是假
			Back to English: Peak is a fake
			To Czech: Vrchol je podvod
			Back to English: The top is a scam
			To Danish: Toppen er et fupnummer
			Back to English: The top is a scam
			To Dutch: De top is een scam
			Back to English: The top is a scam
		 */
		[Embed(source = "../res/map3.csv", mimeType="application/octet-stream")]
		private const MAP_3:Class;
	
		public function Level3() 
		{
			super();
			
			alien = new Alien("The top is a scam");
			
		}
		
		override public function loadMap():void
		{
			floor = new FlxTilemap();
			floor.loadMap(new MAP_3(), TILEMAP, 20, 20);
		}
		
		override public function create():void
		{
			super.create();
			makeGoalsInvisible();
			add(alien);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(floor, player);
			//FlxG.collide(spikes, player, touchedSpikes);
			FlxG.collide(goals, player, nextLevel);
			killIfOffscreen();
		}
		
		private function nextLevel(a:FlxObject, b:FlxObject):void
		{
			FlxG.switchState(new Level2());
		}
		
		private function touchedSpikes(a:FlxObject, b:FlxObject):void
		{
			killPlayer();
		}
		

	}

}