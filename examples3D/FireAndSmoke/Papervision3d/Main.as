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
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.papervision3d.PV3DRenderer;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;

	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(width='400', height='400', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var viewport:Viewport3D;
		private var smoke:Emitter3D;
		private var fire:Emitter3D;
		private var renderer:BasicRenderEngine;
		private var flintRenderer:PV3DRenderer;
		private var scene:Scene3D;
		private var camera:Camera3D;

		public function Main()
		{
			smoke = new Smoke();
			smoke.start( );
			
			fire = new Fire();
			fire.start( );
			
			viewport = new Viewport3D( 400, 400 );
			addChild( viewport );
			
			renderer = new BasicRenderEngine();
			scene = new Scene3D();
			camera = new Camera3D();
			camera.z = -400;
			camera.y = 150;
			
			flintRenderer = new PV3DRenderer( scene );
			flintRenderer.addEmitter( smoke );
			flintRenderer.addEmitter( fire );
			
			addEventListener( Event.ENTER_FRAME, render, false, 0, true );
		}
		
		private function render( ev:Event ):void
		{
			// render the view
			renderer.renderScene( scene, camera, viewport);
		}
	}
}