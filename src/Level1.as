package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	
	public class Level1 extends FlxState
	{
		[Embed(source = "../res/map1.csv", mimeType="application/octet-stream")]
		private const MAP_1:Class;
		
		[Embed(source = "../res/tilemap.png")] private const TILEMAP:Class;
		
		private var player:Player;
		private var floor:FlxTilemap;
		private var alien:Alien;
		private var spikes:FlxGroup;
		
		public function Level1() 
		{
			player = new Player();
			floor = new FlxTilemap();
			floor.loadMap(new MAP_1(), TILEMAP, 20, 20);
			
			//load the spikes
			spikes = new FlxGroup();
			var spikeTiles:Array = floor.getTileInstances(4);
			for (var i:int = 0; i < spikeTiles.length; i++)
			{
				var spikeTile:int = spikeTiles[i];
				//it's an index. Figures...
				var spike:Spike = new Spike();
				spike.x = 20* (spikeTile%floor.widthInTiles);
				spike.y = 20* Math.floor(spikeTile/floor.widthInTiles);
				spikes.add(spike);
				floor.setTileByIndex(spikeTile, 0);
			}
			
			alien = new Alien("Don't touch spine");
			
		}
		override public function create():void
		{
			FlxG.bgColor = 0xFFCCCCCC;
			add(player);
			add(floor);
			add(alien);
			add(spikes);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(floor, player);
		}
	}

}