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

import org.flintparticles.common.actions.Age;
import org.flintparticles.common.counters.Blast;
import org.flintparticles.common.energyEasing.Quadratic;
import org.flintparticles.common.events.ParticleEvent;
import org.flintparticles.common.initializers.ColorInit;
import org.flintparticles.common.initializers.Lifetime;
import org.flintparticles.twoD.actions.TweenToZone;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.initializers.Position;
import org.flintparticles.twoD.particles.Particle2D;
import org.flintparticles.twoD.renderers.PixelRenderer;	
import org.flintparticles.twoD.zones.BitmapDataZone;

var flintImage:BitmapData = new FlintImage( 320, 80 );
var particlesImage:BitmapData = new ParticlesImage( 320, 80 );

var startEmitter:Emitter2D = new Emitter2D();
startEmitter.counter = new Blast( 3000 );
startEmitter.addInitializer( new ColorInit( 0xFFFFFF00, 0xCC6600 ) );
startEmitter.addInitializer( new Lifetime( 6 ) );
startEmitter.addInitializer( new Position( new BitmapDataZone( flintImage, 40, 60 ) ) );
startEmitter.addAction( new Age( Quadratic.easeInOut ) );
startEmitter.addAction( new TweenToZone( new BitmapDataZone( particlesImage, 40, 60 ) ) );

var tween1Emitter:Emitter2D = new Emitter2D();
tween1Emitter.addInitializer( new Lifetime( 6 ) );
tween1Emitter.addAction( new Age( Quadratic.easeInOut ) );
tween1Emitter.addAction( new TweenToZone( new BitmapDataZone( flintImage, 40, 60 ) ) );

var tween2Emitter:Emitter2D = new Emitter2D();
tween2Emitter.addInitializer( new Lifetime( 6 ) );
tween2Emitter.addAction( new Age( Quadratic.easeInOut ) );
tween2Emitter.addAction( new TweenToZone( new BitmapDataZone( particlesImage, 40, 60 ) ) );

var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 400, 200 ) );
renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.95,0 ] ) );
renderer.addEmitter( startEmitter );
renderer.addEmitter( tween1Emitter );
renderer.addEmitter( tween2Emitter );
addChild( renderer );

startEmitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween1 );
tween1Emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween2 );
tween2Emitter.addEventListener( ParticleEvent.PARTICLE_DEAD, moveToTween1 );

startEmitter.start();
tween1Emitter.start();
tween2Emitter.start();

function moveToTween1( event:ParticleEvent ):void
{
	event.particle.revive();
	tween1Emitter.addExistingParticles( [ event.particle ], true );
}

function moveToTween2( event:ParticleEvent ):void
{
	event.particle.revive();
	tween2Emitter.addExistingParticles( [ event.particle ], true );
}
