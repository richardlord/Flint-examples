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
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.twoD.actions.LinearDrag;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.RandomDrift;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.DiscSectorZone;

	import flash.geom.Point;

	public class Smoke extends Emitter2D
	{
		public function Smoke()
		{
			counter = new Steady( 10 );
      
			addInitializer( new Lifetime( 11, 12 ) );
			addInitializer( new Velocity( new DiscSectorZone( new Point( 0, 0 ), 40, 30, -4 * Math.PI / 7, -3 * Math.PI / 7 ) ) );
			addInitializer( new SharedImage( new RadialDot( 6 ) ) );
      
			addAction( new Age( ) );
			addAction( new Move( ) );
			addAction( new LinearDrag( 0.01 ) );
			addAction( new ScaleImage( 1, 15 ) );
			addAction( new Fade( 0.15, 0 ) );
			addAction( new RandomDrift( 15, 15 ) );
		}
	}
}