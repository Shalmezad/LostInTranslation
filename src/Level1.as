package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	
	public class Level1 extends FlxState
	{
		[Embed(source = "../res/map1.csv", mimeType="application/octet-stream")]
		private const MAP_1:Class;
		
		[Embed(source = "../res/tilemap.png")] private const TILEMAP:Class;
		
		private var player:Player;
		private var floor:FlxTilemap;
		private var alien:Alien;
		
		public function Level1() 
		{
			player = new Player();
			floor = new FlxTilemap();
			floor.loadMap(new MAP_1(), TILEMAP, 20, 20);
			alien = new Alien("Don't touch spine");
			
		}
		override public function create():void
		{
			FlxG.bgColor = 0xFFCCCCCC;
			add(player);
			add(floor);
			add(alien);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(floor, player);
		}
	}

}