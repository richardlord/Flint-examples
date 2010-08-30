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

import org.flintparticles.common.counters.*;
import org.flintparticles.common.displayObjects.Dot;
import org.flintparticles.common.initializers.*;
import org.flintparticles.twoD.actions.*;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.initializers.*;
import org.flintparticles.twoD.renderers.*;
import org.flintparticles.twoD.zones.*;	

var emitter:Emitter2D = new Emitter2D();

emitter.counter = new Blast( 30 );

emitter.addInitializer( new SharedImage( new Dot( 2 ) ) );
emitter.addInitializer( new ColorInit( 0xFFFF00FF, 0xFF00FFFF ) );
emitter.addInitializer( new Position( new RectangleZone( 10, 10, 380, 380 ) ) );

emitter.addAction( new MutualGravity( 10, 500, 3 ) );
emitter.addAction( new BoundingBox( 0, 0, 400, 400 ) );
emitter.addAction( new SpeedLimit( 150 ) );
emitter.addAction( new Move() );

var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 400, 400 ) );
renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
renderer.addEmitter( emitter );
addChild( renderer );

emitter.start( );