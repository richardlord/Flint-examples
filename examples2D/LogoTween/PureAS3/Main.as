/*
 * FLINT PARTICLE SYSTEM
 * .....................
 * 
 * Author: Richard Lord
 * Copyright (c) Richard Lord 2008-2010
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
	import org.flintparticles.common.events.ParticleEvent;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;

	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	[SWF(width='400', height='200', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var startEmitter:Emitter2D;
		private var tween1Emitter:Emitter2D;
		private var tween2Emitter:Emitter2D;
		
		public function Main()
		{
			startEmitter = new FirstEmitter();
			tween1Emitter = new TweenToFlint();
			tween2Emitter = new TweenToParticles();

			var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 400, 200 ) );
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.95,0 ] ) );
			renderer.addEmitter( startEmitter );
			renderer.addEmitter( tween1Emitter );
			renderer.addEmitter( tween2Emitter );
			addChild( renderer );
			
			startEmitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween1 );
			tween1Emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween2 );
			tween2Emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween1 );
			
			startEmitter.start();
			tween1Emitter.start();
			tween2Emitter.start();
		}

		private function moveToTween1( event:ParticleEvent ):void
		{
			event.particle.revive();
			tween1Emitter.addExistingParticles( [ event.particle ], true );
		}
		
		private function moveToTween2( event:ParticleEvent ):void
		{
			event.particle.revive();
			tween2Emitter.addExistingParticles( [ event.particle ], true );
		}
	}
}