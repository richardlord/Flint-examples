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
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Resource;
	import alternativa.engine3d.core.View;

	import org.flintparticles.integration.alternativa3d.Alt3DRenderer;
	import org.flintparticles.threeD.emitters.Emitter3D;

	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.events.Event;

	[SWF(width='400', height='400', frameRate='61', backgroundColor='#000000')]
	
	public class Main extends Sprite
	{
		private var smoke:Emitter3D;
		private var fire:Emitter3D;
		private var particleContainer : Object3D;
		private var camera : Camera3D;
		private var stage3D : Stage3D;
		private var renderer : Alt3DRenderer;
		
		public function Main()
		{
			camera = new Camera3D( 0.1, 10000 );
			camera.view = new View( stage.stageWidth, stage.stageHeight );
			camera.view.backgroundColor = 0x000000;
			camera.view.hideLogo();
			addChild( camera.view );
			addChild( camera.diagram );
			
			camera.rotationX = 0;
			camera.y = -150;
			camera.z = -300;

			stage3D = stage.stage3Ds[0];
			stage3D.addEventListener( Event.CONTEXT3D_CREATE, onContextCreate );
			stage3D.requestContext3D();
		}

		private function onContextCreate( event : Event ) : void
		{
			particleContainer = new Object3D();
			particleContainer.addChild( camera );
			renderer = new Alt3DRenderer( particleContainer );
			
			smoke = new Smoke();
			renderer.addEmitter( smoke );
			smoke.start( );
			
			fire = new Fire();
			renderer.addEmitter( fire );
			fire.start( );
			
			addEventListener( Event.ENTER_FRAME, render, false, 0, true );
		}
		
		private function render( ev:Event ):void
		{
			// render the view
			camera.view.width = stage.stageWidth;
			camera.view.height = stage.stageHeight;
			camera.render( stage3D );
			for each ( var resource:Resource in particleContainer.getResources( true ) )
			{
				resource.upload( stage3D.context3D );
			}
		}
	}
}