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
	import org.flintparticles.threeD.papervision3d.PV3DPixelRenderer;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.core.effects.BitmapLayerEffect;
	import org.papervision3d.core.geom.Pixels;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	import org.papervision3d.view.layer.BitmapEffectLayer;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;

	[SWF(width='500', height='500', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var viewport:Viewport3D;
		private var emitter:Emitter3D;
		private var pv3dRenderer:BasicRenderEngine;
		private var flintRenderer:PV3DPixelRenderer;
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var bfx:BitmapEffectLayer;
		private var pixels:Pixels;
		
		public function Main()
		{
			viewport = new Viewport3D( 500, 500 );
			addChild( viewport );
			
			pv3dRenderer = new BasicRenderEngine();
			scene = new Scene3D();
			camera = new Camera3D();
			camera.z = -300;
			
			bfx = new BitmapEffectLayer( viewport, 500, 500 );
			viewport.containerSprite.addLayer( bfx );
			pixels = new Pixels( bfx );
			bfx.addDisplayObject3D( pixels );
			scene.addChild( pixels );
			bfx.addEffect( new BitmapLayerEffect( new BlurFilter( 2, 2, 1 ) ) );
			bfx.addEffect( new BitmapLayerEffect( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0 ] ) ) );
			
			emitter = new Fountain();
			emitter.position.y = -100;

			flintRenderer = new PV3DPixelRenderer( pixels );
			flintRenderer.addEmitter( emitter );
			emitter.start();
			
			addEventListener( Event.ENTER_FRAME, render, false, 0, true );
		}
		
		private function render( ev:Event ):void
		{
			// render the view
			pv3dRenderer.renderScene( scene, camera, viewport);
		}
	}
}