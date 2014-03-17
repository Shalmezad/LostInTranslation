package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	public class Level2 extends Level
	{
		/*
			http://ackuna.com/badtranslator
			From English: Some blocks aren't real
			To Bulgarian: Някои блокове не са реални
			Back to English: Some blocks are not real
			To Catalan: Alguns blocs no són reals
			Back to English: Some blogs are not real
			To Chinese Simplified: 一些博客不是真的
			Back to English: Some blogs are not really
			To Chinese Traditional: 一些博客不是是真的
			Back to English: Some blogs are not really
			To Czech: Některé blogy nejsou ve skutečnosti
			Back to English: Some blogs are in fact
			To Danish: Nogle blogs er faktisk
			Back to English: Some blogs are actually
			To Dutch: Sommige blogs zijn eigenlijk
			Back to English: Some blogs are actually
		 */
		[Embed(source = "../res/map2.csv", mimeType="application/octet-stream")]
		private const MAP_2:Class;
	
		public function Level2() 
		{
			super();
			
			alien = new Alien("Some blogs are actually");
			
		}
		
		override public function loadMap():void
		{
			floor = new FlxTilemap();
			floor.loadMap(new MAP_2(), TILEMAP, 20, 20,FlxTilemap.OFF,0,1,3);
		}
		
		override public function create():void
		{
			super.create();
			goals.visible = false;
			add(alien);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(floor, player);
			FlxG.collide(spikes, player, touchedSpikes);
			FlxG.collide(goals, player);
			killIfOffscreen();
		}
		
		private function touchedSpikes(a:FlxObject, b:FlxObject):void
		{
			killPlayer();
		}
		

	}

}