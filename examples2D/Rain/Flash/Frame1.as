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

import org.flintparticles.common.counters.Steady;
import org.flintparticles.common.initializers.AlphaInit;
import org.flintparticles.twoD.actions.Accelerate;
import org.flintparticles.twoD.actions.CollisionZone;
import org.flintparticles.twoD.actions.DeathZone;
import org.flintparticles.twoD.actions.Move;
import org.flintparticles.twoD.actions.RotateToDirection;
import org.flintparticles.twoD.actions.SpeedLimit;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.initializers.Position;
import org.flintparticles.twoD.initializers.Velocity;
import org.flintparticles.twoD.renderers.PixelRenderer;
import org.flintparticles.twoD.zones.DiscZone;
import org.flintparticles.twoD.zones.LineZone;
import org.flintparticles.twoD.zones.RectangleZone;

import flash.display.Sprite;
import flash.geom.Rectangle;

var emitter:Emitter2D = new Emitter2D();
emitter.counter = new Steady( 1000 );

emitter.addInitializer( new Position( new LineZone( new Point( -55, -5 ), new Point( 605, -5 ) ) ) );
emitter.addInitializer( new Velocity( new DiscZone( new Point( 60, 400 ), 20 ) ) );
emitter.addInitializer( new AlphaInit( 0.5 ) );

emitter.addAction( new Move() );
emitter.addAction( new CollisionZone( new DiscZone( new Point( 245, 275 ), 150 ), 0.3 ) );
emitter.addAction( new DeathZone( new RectangleZone( -60, -10, 610, 410 ), true ) );
emitter.addAction( new Accelerate( 0, 500 ) );
emitter.addAction( new SpeedLimit( 500 ) );

var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 600, 400 ) );
renderer.addEmitter( emitter );
addChild( renderer );

emitter.start();
emitter.runAhead( 4, 30 );
