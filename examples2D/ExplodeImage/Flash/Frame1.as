
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

import org.flintparticles.common.events.EmitterEvent;
import org.flintparticles.common.particles.Particle;
import org.flintparticles.twoD.actions.DeathZone;
import org.flintparticles.twoD.actions.Explosion;
import org.flintparticles.twoD.actions.Move;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.particles.Particle2DUtils;
import org.flintparticles.twoD.renderers.DisplayObjectRenderer;
import org.flintparticles.twoD.zones.RectangleZone;

var explosion:Explosion;
var bitmap:BitmapData = new Image1( 384, 255 );

var emitter:Emitter2D = new Emitter2D();
emitter.addAction( new Move() );
emitter.addAction( new DeathZone( new RectangleZone( -10, -10, 510, 360 ), true ) );
prepare();

var renderer:DisplayObjectRenderer = new DisplayObjectRenderer();
addChild( renderer );
renderer.addEmitter( emitter );
emitter.start();

stage.addEventListener( MouseEvent.CLICK, explode, false, 0, true );
emitter.addEventListener( EmitterEvent.EMITTER_EMPTY, prepare );

function prepare( event:EmitterEvent = null ):void
{
	if( explosion )
	{
		emitter.removeAction( explosion );
		explosion = null;
	}
	var particles:Vector.<Particle> = Particle2DUtils.createRectangleParticlesFromBitmapData( bitmap, 8, emitter.particleFactory, 56, 47 );
	emitter.addParticles( particles, false );
}
		
function explode( ev:MouseEvent ):void
{
	if( !explosion )
	{
		var p:Point = renderer.globalToLocal( new Point( ev.stageX, ev.stageY ) );
		explosion = new Explosion( 8, p.x, p.y, 500 );
		emitter.addAction( explosion );
	}
}
