package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxTilemap;
	import org.flixel.system.FlxTile;
	public class Level extends FlxState
	{
		[Embed(source = "../res/tilemap.png")] public const TILEMAP:Class;
		
		public var player:Player;
		public var floor:FlxTilemap;
		public var alien:Alien;
		public var spikes:FlxGroup;
		public var goals:FlxGroup;
		public var explosion:Explosion;
		
		public function Level() 
		{
			player = new Player();
			loadMap();
			loadSpikes();
			loadGoals();
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFCCCCCC;
			add(spikes);
			add(goals);
			add(player);
			add(floor);
		}
		
		override public function update():void
		{
			super.update();
			if (!player.alive && explosion != null && explosion.countLiving() == 0)
			{
				FlxG.resetState();
			}
		}
		
		public function loadMap():void
		{
			floor = new FlxTilemap();
		}
		
		public function loadSpikes():void
		{			
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
		}
		
		private function loadGoals():void
		{			
			//load the goal
			goals = new FlxGroup();
			var goalTiles:Array = floor.getTileInstances(5);
			for (var j:int = 0; j < goalTiles.length; j++)
			{
				var goalTile:int = goalTiles[j];
				var goal:GoalBlock = new GoalBlock();
				goal.x = 20* (goalTile%floor.widthInTiles);
				goal.y = 20* Math.floor(goalTile/floor.widthInTiles);
				goals.add(goal);
				floor.setTileByIndex(goalTile, 0);
			}
		}
		
		public function killPlayer():void
		{
			if (player.alive)
			{
				player.kill();
				explosion = new Explosion(player.x + player.width / 2, player.y + player.height / 2);
				add(explosion);
			}
		}
		
		public function killIfOffscreen():void
		{
			if (player.alive && !player.onScreen())
			{
				killPlayer();
			}
		}
		
		public function reachedGoal():void
		{
			
		}
	}

}