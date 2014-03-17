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
			From English: Avoid the spikes
			To Bulgarian: Избягвайте шпайкове
			Back to English: Avoid spikes
			To Catalan: Evitar els pics
			Back to English: Avoid spikes
			To Chinese Simplified: 避免尖峰
			Back to English: Avoid spikes
			To Chinese Traditional: 避免尖峰
			Back to English: Avoid spikes
			To Czech: Vyhnout se hřeby
			Back to English: Avoid spikes
			To Danish: Undgå pigge
			Back to English: Avoid spikes
			To Dutch: Pieken voorkomen
			Back to English: Peaks occur
		 */
		[Embed(source = "../res/map1.csv", mimeType="application/octet-stream")]
		private const MAP_1:Class;
	
		public function Level3() 
		{
			super();
			
			alien = new Alien("Peaks occur");
			
		}
		
		override public function loadMap():void
		{
			floor = new FlxTilemap();
			floor.loadMap(new MAP_1(), TILEMAP, 20, 20);
		}
		
		override public function create():void
		{
			super.create();
			add(alien);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(floor, player);
			FlxG.collide(spikes, player, touchedSpikes);
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