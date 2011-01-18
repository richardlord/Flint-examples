
/*
 * FLINT PARTICLE SYSTEM
 * .....................
 * 
 * Author: Richard Lord
 * Copyright (c) Richard Lord 2008-2011
 * http://flintparticles.org/
 * 
 * Licence Agreement
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package
{
	import org.flintparticles.common.events.EmitterEvent;
	import org.flintparticles.common.particles.Particle;
	import org.flintparticles.threeD.actions.DeathZone;
	import org.flintparticles.threeD.actions.Explosion;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.particles.Particle3DUtils;
	import org.flintparticles.threeD.renderers.DisplayObjectRenderer;
	import org.flintparticles.threeD.zones.FrustrumZone;

	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;

	[SWF(width='500', height='350', frameRate='60', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var emitter:Emitter3D;
		private var bitmap:BitmapData;
		private var renderer:DisplayObjectRenderer;
		private var explosion:Explosion;
		
		public function Main()
		{
			bitmap = new Image1( 384, 255 );
			
			renderer = new DisplayObjectRenderer();
			renderer.camera.dolly( -400 );
			renderer.camera.projectionDistance = 400;
			renderer.y = 175;
			renderer.x = 250;
			addChild( renderer );
			
			emitter = new Emitter3D();
			emitter.addAction( new Move() );
			emitter.addAction( new DeathZone( new FrustrumZone( renderer.camera, new Rectangle( -290, -215, 580, 430 ) ), true ) );
			prepare();
			
			renderer.addEmitter( emitter );
			emitter.start();
			stage.addEventListener( MouseEvent.CLICK, explode, false, 0, true );
			emitter.addEventListener( EmitterEvent.EMITTER_EMPTY, prepare );
		}
		
		private function prepare( event:EmitterEvent = null ):void
		{
			if( explosion )
			{
				emitter.removeAction( explosion );
				explosion = null;
			}
			var particles:Vector.<Particle> = Particle3DUtils.createRectangleParticlesFromBitmapData( bitmap, 12, emitter.particleFactory, new Vector3D( -192, -127, 0 ) );
			emitter.addParticles( particles, false );
		}
		
		private function explode( ev:MouseEvent ):void
		{
			if( !explosion )
			{
				var p:Point = renderer.globalToLocal( new Point( ev.stageX, ev.stageY ) );
				explosion = new Explosion( 8, new Vector3D( p.x, p.y, 50 ), 500 );
				emitter.addAction( explosion );
			}
		}
	}
}