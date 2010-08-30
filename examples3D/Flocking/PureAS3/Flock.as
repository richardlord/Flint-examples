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
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.threeD.actions.ApproachNeighbours;
	import org.flintparticles.threeD.actions.BoundingBox;
	import org.flintparticles.threeD.actions.MatchVelocity;
	import org.flintparticles.threeD.actions.MinimumDistance;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.RotateToDirection;
	import org.flintparticles.threeD.actions.SpeedLimit;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.geom.Point3D;
	import org.flintparticles.threeD.geom.Vector3D;
	import org.flintparticles.threeD.initializers.Position;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.BoxZone;
	import org.flintparticles.threeD.zones.SphereZone;

	public class Flock extends Emitter3D
	{
		[Embed(source='assets/bird.swf', symbol='Bird')]
		public var Bird:Class;
		
		public function Flock()
		{
			counter = new Blast( 150 );
			
			addInitializer( new ImageClass( Bird ) );
			addInitializer( new Position( new BoxZone( 580, 380, 580, new Point3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), new Vector3D( 0, 0, 1 ) ) ) );
			addInitializer( new Velocity( new SphereZone( new Point3D( 0, 0, 0 ), 150, 100 ) ) );

			addAction( new ApproachNeighbours( 200, 100 ) );
			addAction( new MatchVelocity( 40, 200 ) );
			addAction( new MinimumDistance( 20, 600 ) );
			addAction( new RotateToDirection() );
			addAction( new BoundingBox( -300, 300, -200, 200, -300, 300 ) );
			addAction( new SpeedLimit( 100, true ) );
			addAction( new SpeedLimit( 200 ) );
			addAction( new Move() );
		}
	}
}