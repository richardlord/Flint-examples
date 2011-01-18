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
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.displayObjects.Dot;
	import org.flintparticles.common.initializers.ChooseInitializer;
	import org.flintparticles.common.initializers.CollisionRadiusInit;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.common.initializers.InitializerGroup;
	import org.flintparticles.common.initializers.MassInit;
	import org.flintparticles.twoD.actions.BoundingBox;
	import org.flintparticles.twoD.actions.Collide;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.DiscZone;
	import org.flintparticles.twoD.zones.RectangleZone;

	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class BrownianMotion extends Emitter2D
	{
		public function BrownianMotion( stage:DisplayObject )
		{
			counter = new Blast( 500 );
			
			var air:InitializerGroup = new InitializerGroup();
			air.addInitializer( new ImageClass( Dot, 2 ) );
			air.addInitializer( new ColorInit( 0xFF666666, 0xFF666666 ) );
			air.addInitializer( new MassInit( 1 ) );
			air.addInitializer( new CollisionRadiusInit( 2 ) );
			
			var smoke:InitializerGroup = new InitializerGroup();
			smoke.addInitializer( new ImageClass( Dot, 10 ) );
			smoke.addInitializer( new ColorInit( 0xFFFFFFFF, 0xFFFFFFFF ) );
			smoke.addInitializer( new MassInit( 10 ) );
			smoke.addInitializer( new CollisionRadiusInit( 10 ) );
			
			addInitializer( new Position( new RectangleZone( 0, 0, 500, 500 ) ) );
			addInitializer( new Velocity( new DiscZone( new Point( 0, 0 ), 150, 100 ) ) );
			addInitializer( new ChooseInitializer( [ air, smoke ], [ 30, 1 ] ) );
			
			addAction( new Move() );
			addAction( new Collide( 1 ) );
			addAction( new BoundingBox( 0, 0, 500, 500, 1 ) );
			addAction( new ShowAirAction( stage ) );
		}
	}
}