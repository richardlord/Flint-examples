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
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.activities.RotateEmitter;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.ConeZone;

	import flash.geom.Vector3D;

	public class CatherineWheel extends Emitter3D
	{
		public function CatherineWheel( position:Vector3D )
		{
			counter = new Steady( 80 );
			
			this.position = position;
			
			addActivity( new RotateEmitter( new Vector3D( 0, 0, 1 ), 10 ) );
			
			addInitializer( new SharedImage( new Dot( 1 ) ) );
			addInitializer( new ColorInit( 0xFFFFFF00, 0xFFFF6600 ) );
			addInitializer( new Velocity( new ConeZone( new Vector3D(), new Vector3D( 1, 0, 0 ), 0.5, 100, 80 ) ) );
			addInitializer( new Lifetime( 0.5 ) );
			
			addAction( new Move() );
			addAction( new Accelerate( new Vector3D( 0, 50, 0 ) ) );
			addAction( new Age() );
		}
	}
}