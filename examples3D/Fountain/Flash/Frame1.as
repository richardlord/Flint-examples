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

import org.flintparticles.common.actions.*;
import org.flintparticles.common.counters.*;
import org.flintparticles.common.initializers.*;
import org.flintparticles.threeD.actions.*;
import org.flintparticles.threeD.emitters.Emitter3D;
import org.flintparticles.threeD.geom.Point3D;
import org.flintparticles.threeD.geom.Vector3D;
import org.flintparticles.threeD.initializers.*;
import org.flintparticles.threeD.renderers.*;
import org.flintparticles.threeD.renderers.controllers.*;
import org.flintparticles.threeD.zones.*;	

var txt:TextField = new TextField();
txt.text = "Use arrow keys to track in/out and orbit around the fountain.";
txt.autoSize = "left";
txt.textColor = 0xFFFFFF;
addChild( txt );

var emitter:Emitter3D = new Emitter3D();
emitter.counter = new Steady( 500 );

emitter.addInitializer( new ColorInit( 0xFFCCCCFF, 0xFF6666FF ) );
emitter.addInitializer( new Velocity( new DiscZone( new Point3D( 0, 250, 0 ), new Vector3D( 0, 1, 0 ), 60 ) ) );
emitter.addInitializer( new Lifetime( 3.2 ) );

emitter.addAction( new Move() );
emitter.addAction( new Accelerate( new Vector3D( 0, -150, 0 ) ) );
emitter.addAction( new Age() );

var renderer:PixelRenderer = new PixelRenderer( new Rectangle( -250, -250, 500, 500 ), false );
renderer.camera.dolly( -300 );
renderer.camera.lift( 100 );
renderer.camera.target = new Point3D( 0, 100, 0 );
renderer.addFilter( new BlurFilter( 2, 2, 1 ) );
renderer.addFilter( new ColorMatrixFilter( [ 1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.99,0 ] ) );
renderer.addEmitter( emitter );
renderer.x = 250;
renderer.y = 250;
addChild( renderer );

emitter.start( );

var orbitter:OrbitCamera = new OrbitCamera( stage, renderer.camera );
orbitter.start();