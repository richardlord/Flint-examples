
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
 
import flash.geom.Rectangle;

import org.flintparticles.common.actions.*;
import org.flintparticles.common.counters.*;
import org.flintparticles.common.initializers.*;
import org.flintparticles.twoD.actions.*;
import org.flintparticles.twoD.emitters.Emitter2D;
import org.flintparticles.twoD.initializers.*;
import org.flintparticles.twoD.renderers.*;
import org.flintparticles.twoD.zones.*;	

var emitter:Emitter2D = new Emitter2D();
emitter.x = 250;
emitter.y = 400;
emitter.counter = new Blast( 100 );

emitter.addInitializer( new Position( new DiscZone( new Point( 0, 0 ), 40 ) ) );
emitter.addInitializer( new Velocity( new DiscSectorZone( new Point( 0, 0 ), 80, 40, -5 * Math.PI / 8, -3 * Math.PI / 8 ) ) );
emitter.addInitializer( new ColorInit( 0xFF006600, 0xFF009900 ) );
emitter.addInitializer( new Lifetime( 7 ) );

emitter.addAction( new Move() );
emitter.addAction( new Age() );
emitter.addAction( new ScaleImage( 4, 1 ) );
emitter.addAction( new Accelerate( 0, 10 ) );

var renderer:BitmapLineRenderer = new BitmapLineRenderer( new Rectangle( 0, 0, 500, 500 ) );
renderer.addEmitter( emitter );
addChild( renderer );

emitter.start();