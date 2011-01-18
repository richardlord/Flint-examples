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
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;

	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Rectangle;

	[SWF(width='400', height='400', frameRate='60', backgroundColor='#000000')]

	public class Main extends Sprite
	{
		private var emitter:Emitter2D;
		
		public function Main()
		{
			emitter = new GravityWells();

			var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 400, 400 ) );
			renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
			renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0 ] ) );
			renderer.addEmitter( emitter );
			addChild( renderer );
			
			emitter.start();
		}
	}
}