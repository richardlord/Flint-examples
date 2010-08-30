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
	import org.flintparticles.threeD.papervision3d.PV3DParticleRenderer;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.core.geom.Particles;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;

	import flash.display.Sprite;
	import flash.events.Event;

	[SWF(width='400', height='400', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var viewport:Viewport3D;
		private var emitter:Emitter3D;
		private var pv3dRenderer:BasicRenderEngine;
		private var flintRenderer:PV3DParticleRenderer;
		private var scene:Scene3D;
		private var camera:Camera3D;

		public function Main()
		{
			viewport = new Viewport3D( 400, 400 );
			addChild( viewport );
			
			pv3dRenderer = new BasicRenderEngine();
			scene = new Scene3D();
			camera = new Camera3D();
			camera.z = -400;
			
			var particles:Particles = new Particles();
			scene.addChild( particles );
			
			emitter = new BrownianMotion( stage );

			flintRenderer = new PV3DParticleRenderer( particles );
			flintRenderer.addEmitter( emitter );
			emitter.start();
			
			addEventListener( Event.ENTER_FRAME, render );
		}
		
		private function render( ev:Event ):void
		{
			// render the view
			pv3dRenderer.renderScene( scene, camera, viewport);
		}
	}
}