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
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.renderers.DisplayObjectRenderer;
	import org.flintparticles.threeD.renderers.controllers.FirstPersonCamera;

	import flash.display.Sprite;
	import flash.geom.Vector3D;

	[SWF(width='700', height='500', frameRate='60', backgroundColor='#CCCCCC')]
	public class Main extends Sprite
	{
		private var emitter : Emitter3D;
		private var controller : FirstPersonCamera;

		public function Main()
		{
			emitter = new Flock();

			var renderer : DisplayObjectRenderer = new DisplayObjectRenderer( false );
			renderer.x = 350;
			renderer.y = 250;
			renderer.addEmitter( emitter );
			addChild( renderer );

			renderer.camera.position = new Vector3D( 0, 0, -400 );
			renderer.camera.target = new Vector3D( 0, 0, 0 );
			renderer.camera.projectionDistance = 400;
			controller = new FirstPersonCamera( stage, renderer.camera );
			controller.start();

			emitter.start();
		}
	}
}