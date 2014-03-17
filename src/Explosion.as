package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Explosion extends FlxEmitter
	{
		
		public function Explosion(x:Number=0, y:Number=0) 
		{
			super(x, y, 30);	
			var particle:FlxParticle;
			for (var i:int = 0; i < maxSize/2; i++) 
			{
				particle = new FlxParticle();
				particle.makeGraphic(2, 2, 0xFFFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle = new FlxParticle();
				particle.makeGraphic(1, 1, 0xFFFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
			}
			start(true, 3, .01);
		}
		
	}

}