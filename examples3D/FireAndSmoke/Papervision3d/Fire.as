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
	import org.flintparticles.common.actions.ColorChange;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.threeD.actions.Accelerate;
	import org.flintparticles.threeD.actions.LinearDrag;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.RotateToDirection;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Position;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.papervision3d.initializers.PV3DDisplayObjectClass;
	import org.flintparticles.threeD.zones.DiscZone;

	import flash.geom.Vector3D;

	public class Fire extends Emitter3D
	{
		public function Fire()
		{
			counter = new Steady( 60 );

			addInitializer( new Lifetime( 2, 3 ) );
			addInitializer( new Velocity( new DiscZone( new Vector3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 20 ) ) );
			addInitializer( new Position( new DiscZone( new Vector3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 3 ) ) );
			addInitializer( new PV3DDisplayObjectClass( FireBlob ) );

			addAction( new Age( ) );
			addAction( new Move( ) );
			addAction( new LinearDrag( 1 ) );
			addAction( new Accelerate( new Vector3D( 0, 40, 0 ) ) );
			addAction( new ColorChange( 0xFFFFCC00, 0x00CC0000 ) );
			addAction( new ScaleImage( 1, 1.5 ) );
			addAction( new RotateToDirection() );
		}
	}
}