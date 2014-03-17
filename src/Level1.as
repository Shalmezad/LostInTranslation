package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	public class Level1 extends Level
	{
		[Embed(source = "../res/map1.csv", mimeType="application/octet-stream")]
		private const MAP_1:Class;
	
		public function Level1() 
		{
			super();
			
			alien = new Alien("Don't touch spine");
			
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
			FlxG.collide(goals, player);
			killIfOffscreen();
		}
		
		private function touchedSpikes(a:FlxObject, b:FlxObject):void
		{
			killPlayer();
		}
		

	}

}