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
	import flare.core.Texture3D;
	import flare.materials.Shader3D;
	import flare.materials.filters.TextureFilter;
	import flare.primitives.Sphere;

	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.integration.flare3d.initializers.F3DCloneObject;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.Rotate;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Position;
	import org.flintparticles.threeD.initializers.RotateVelocity;
	import org.flintparticles.threeD.initializers.Rotation;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.ParallelogramZone;
	import org.flintparticles.threeD.zones.PointZone;

	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.BlendMode;
	import flash.geom.Vector3D;

	public class Planets extends Emitter3D
	{
		public function Planets()
		{
			counter = new Steady( 100 );
			
			var bdata:BitmapData = new BitmapData( 128, 128 );
			bdata.perlinNoise( 128, 128, 12, Math.floor( Math.random() * int.MAX_VALUE ), true, true, BitmapDataChannel.BLUE | BitmapDataChannel.GREEN );
			var texture:Texture3D = new Texture3D( bdata );
			var shader : Shader3D = new Shader3D( "particleFilter", [ new TextureFilter( texture, 0, BlendMode.ADD ) ], false );
			shader.build();
			var sphere:Sphere = new Sphere( 'sphere', 10, 24, shader );
			addInitializer( new F3DCloneObject( sphere, true, 400 ) );
			
			addInitializer( new Position( new ParallelogramZone( new Vector3D( -500, -500, 1500 ), new Vector3D( 1000, 0, 0 ), new Vector3D( 0, 1000, 0 ) ) ) );
			addInitializer( new Velocity( new PointZone( new Vector3D( 0, 0, -400 ) ) ) );
			addInitializer( new Rotation( new Vector3D(1, 1, 1), 0, 2 * Math.PI ) );
		    addInitializer( new RotateVelocity( new Vector3D( 1, 0, 0 ), 0.1, 2 ) );
			addInitializer( new Lifetime( 4 ) );
			
			addAction( new Move() );
			addAction( new Age() );
			addAction( new Rotate() );
		}
	}
}