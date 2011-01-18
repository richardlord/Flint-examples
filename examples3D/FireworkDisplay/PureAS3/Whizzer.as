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
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.Dot;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.threeD.actions.Accelerate;
	import org.flintparticles.threeD.actions.LinearDrag;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.RandomDrift;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Position;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.ConeZone;
	import org.flintparticles.threeD.zones.Zone3D;

	import flash.geom.Vector3D;

	public class Whizzer extends Emitter3D
	{
		public function Whizzer( zone:Zone3D )
		{
			counter = new Steady( 0.5 );
			
			addInitializer( new SharedImage( new Dot( 4 ) ) );
			addInitializer( new ColorInit( 0xFFFFFF00, 0xFFFF6600 ) );
			addInitializer( new Position( zone ) );
			addInitializer( new Velocity( new ConeZone( new Vector3D(), new Vector3D( 0, -1, 0 ), 0.1, 350, 330 ) ) );
			addInitializer( new Lifetime( 3.3 ) );
			
			addAction( new Age() );
			addAction( new Move() );
			addAction( new Accelerate( new Vector3D( 0, 50, 0 ) ) );
			addAction( new LinearDrag( 0.5 ) );
			addAction( new RandomDrift( 10, 10, 10 ) );
		}
	}
}