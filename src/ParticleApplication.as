package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.PixelSnapping;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class ParticleApplication extends Sprite
	{
		static public const WIDTH: int = 384;
		static public const HEIGHT: int = 384;
		
		static private const PARTICLE_NUM: int = 100;
		
		private var bitmap: Bitmap;
		
		private var particles: Array;
		
		private var forceXPhase: Number;
		private var forceYPhase: Number;
		
		public function ParticleApplication()
		{
			init();
		}
		
		private function init(): void
		{
			var m: Matrix = new Matrix();
			m.createGradientBox( WIDTH, HEIGHT, Math.PI/2 );
			
			graphics.beginGradientFill( GradientType.LINEAR, [ 0x212121, 0x404040, 0x0 ], [ 1, 1, 1 ], [ 0, 0x84, 0xff ], m );
			graphics.drawRect( 0, 0, WIDTH, HEIGHT );
			graphics.endFill();
			
			forceXPhase = Math.random() * Math.PI;
			forceYPhase = Math.random() * Math.PI;
			
			particles = new Array();
			
			var particle: Particle;
			
			var a: Number;
			var r: Number;
			
			for( var i: int = 0 ; i < PARTICLE_NUM ; i++ )
			{
				a = Math.PI * 2 / PARTICLE_NUM * i;
				r = ( 1 + i / PARTICLE_NUM * 4 ) * 1;
				
				particle = new Particle( Math.cos( a ) * 32, Math.sin( a ) * 32 );
				particle.vx = Math.sin( -a ) * r;
				particle.vy = -Math.cos( a ) * r;
				particles.push( particle );
			}
			
			bitmap = new Bitmap( new BitmapData ( WIDTH, HEIGHT, true, 0 ), PixelSnapping.AUTO, false );
			addChild( bitmap );
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
			
			addChild( new FPS() );
		}
		
		private function onEnterFrame( event: Event ): void
		{
			render();
		}
		
		private function render(): void
		{
			var bitmapData: BitmapData = bitmap.bitmapData;
			
			bitmapData.colorTransform( bitmapData.rect, new ColorTransform( 1, 1, 1, 1, 0, 0, 0, -1 ) );
			
			var p0: Particle;
			var p1: Particle;
			
			var dx: Number;
			var dy: Number;
			var dd: Number;
			
			var shape: Shape = new Shape();
			
			shape.graphics.clear();
			shape.graphics.lineStyle( 0, 0xffffff, 1 );
			
			forceXPhase += .0025261;
			forceYPhase += .000621;
			
			var forceX: Number = 1000 + Math.sin( forceXPhase ) * 500;
			var forceY: Number = 1000 + Math.sin( forceYPhase ) * 500;
			
			for each( p0 in particles )
			{
				shape.graphics.moveTo( p0.sx, p0.sy );
				
				p0.vx -= p0.sx / forceX;
				p0.vy -= p0.sy / forceY;
				
				p0.sx += p0.vx;
				p0.sy += p0.vy;
				
				shape.graphics.lineTo( p0.sx, p0.sy );
			}
			
			bitmapData.draw( shape, new Matrix( 1, 0, 0, 1, WIDTH >> 1, HEIGHT >> 1 ) );
		}
	}
}