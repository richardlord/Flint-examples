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
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.energyEasing.Quadratic;
	import org.flintparticles.common.events.EmitterEvent;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.LinearDrag;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.BitmapDataZone;
	import org.flintparticles.twoD.zones.DiscZone;

	import flash.display.Bitmap;
	import flash.geom.Point;

	public class LogoFirework extends Emitter2D
	{
		[Embed(source="assets/flint.png")]
		public var Logo:Class;

		public function LogoFirework()
		{
			counter = new Blast( 1500 );
			
			addInitializer( new ColorInit( 0xFFFF3300, 0xFFFFFF00 ) );
			addInitializer( new Lifetime( 6 ) );
			addInitializer( new Position( new DiscZone( new Point( 0, 0 ), 10 ) ) );
			var bitmap:Bitmap = new Logo();
			addInitializer( new Velocity( new BitmapDataZone( bitmap.bitmapData, -132, -300 ) ) );
			
			addAction( new Age( Quadratic.easeIn ) );
			addAction( new Fade( 1.0, 0 ) );
			addAction( new Move() );
			addAction( new LinearDrag( 0.5 ) );
			addAction( new Accelerate( 0, 70 ) );
			
			addEventListener( EmitterEvent.EMITTER_EMPTY, restart, false, 0, true );
		}
		
		public function restart( ev:EmitterEvent ):void
		{
			Emitter2D( ev.target ).start();
		}
	}
}