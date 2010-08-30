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
	import org.flintparticles.common.actions.ColorChange;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.energyEasing.TwoWay;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.LinearDrag;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.RotateToDirection;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.BitmapDataZone;
	import org.flintparticles.twoD.zones.DiscSectorZone;

	import flash.display.Bitmap;
	import flash.geom.Point;

	public class LogoFire extends Emitter2D
	{
		[Embed(source="assets/flint.png")]
		public var Logo:Class;
		[Embed(source='assets/fireblob.swf', symbol='FireBlob')]
		public var FireBlob:Class;

		public function LogoFire()
		{
			counter = new Steady( 600 );
			
			addInitializer( new Lifetime( 0.8 ) );
			addInitializer( new Velocity( new DiscSectorZone( new Point( 0, 0 ), 10, 5, -Math.PI * 0.75, -Math.PI * 0.25 ) ) );
			var bitmap:Bitmap = new Logo();
			addInitializer( new Position( new BitmapDataZone( bitmap.bitmapData ) ) );
			addInitializer( new ImageClass( FireBlob ) );
			
			addAction( new Age( TwoWay.quadratic ) );
			addAction( new Move() );
			addAction( new LinearDrag( 1 ) );
			addAction( new Accelerate( 0, -20 ) );
			addAction( new ColorChange( 0xFFFF9900, 0x00FFDD66 ) );
			addAction( new ScaleImage( 1.4, 2 ) );
			addAction( new RotateToDirection() );
		}
	}
}