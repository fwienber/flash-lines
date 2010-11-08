package
{
	import flash.display.Sprite;
	
	[SWF( backgroundColor='0x212121', frameRate='30', width='384', height='384')]

	public class Main extends Sprite
	{
		private var app: ParticleApplication;
		
		public function Main()
		{
			stage.frameRate = 44.444;
			
			app = new ParticleApplication();
			addChild( app );
		}
	}
}
