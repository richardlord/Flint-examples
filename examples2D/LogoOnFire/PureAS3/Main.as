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
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.BitmapRenderer;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	[SWF(width='500', height='200', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		[Embed(source="assets/flint.png")]
		public var Logo:Class;

		private var emitter:Emitter2D;
		
		public function Main()
		{
			var bitmap:Bitmap = new Logo();
			addChild( bitmap );
			bitmap.x = 118;
			bitmap.y = 70;

			emitter = new LogoFire();

			var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 500, 200 ) );
			renderer.addEmitter( emitter );
			addChild( renderer );
			
			emitter.x = 118;
			emitter.y = 70;
			emitter.start( );
		}
	}
}