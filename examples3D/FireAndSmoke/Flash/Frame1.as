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
import org.flintparticles.common.displayObjects.RadialDot;
import org.flintparticles.common.initializers.*;
import org.flintparticles.threeD.actions.*;
import org.flintparticles.threeD.emitters.Emitter3D;
import org.flintparticles.threeD.geom.Point3D;
import org.flintparticles.threeD.geom.Vector3D;
import org.flintparticles.threeD.initializers.*;
import org.flintparticles.threeD.renderers.*;
import org.flintparticles.threeD.renderers.controllers.OrbitCamera;
import org.flintparticles.threeD.zones.*;

var txt:TextField = new TextField();
txt.text = "Use arrow keys to track in/out and orbit around the fire.";
txt.autoSize = "left";
txt.textColor = 0xFFFFFF;
addChild( txt );

var smoke:Emitter3D = new Emitter3D();
smoke.counter = new Steady( 10 );
  
smoke.addInitializer( new Lifetime( 11, 12 ) );
smoke.addInitializer( new Velocity( new ConeZone( new Point3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 0.5, 40, 30 ) ) );
smoke.addInitializer( new SharedImage( new RadialDot( 6 ) ) );
  
smoke.addAction( new Age( ) );
smoke.addAction( new Move( ) );
smoke.addAction( new LinearDrag( 0.01 ) );
smoke.addAction( new ScaleImage( 1, 15 ) );
smoke.addAction( new Fade( 0.15, 0 ) );
smoke.addAction( new RandomDrift( 15, 15, 15 ) );

smoke.start( );

var fire:Emitter3D = new Emitter3D();
fire.counter = new Steady( 60 );

fire.addInitializer( new Lifetime( 2, 3 ) );
fire.addInitializer( new Velocity( new DiscZone( new Point3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 20 ) ) );
fire.addInitializer( new Position( new DiscZone( new Point3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 3 ) ) );
fire.addInitializer( new SharedImage( new FireBlob() ) );

fire.addAction( new Age( ) );
fire.addAction( new Move( ) );
fire.addAction( new LinearDrag( 1 ) );
fire.addAction( new Accelerate( new Vector3D( 0, 40, 0 ) ) );
fire.addAction( new ColorChange( 0xFFFFCC00, 0x00CC0000 ) );
fire.addAction( new ScaleImage( 1, 1.5 ) );
fire.addAction( new RotateToDirection() );

fire.start( );

var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( -200, -200, 400, 400 ) );
renderer.x = 200;
renderer.y = 200;
renderer.addEmitter( smoke );
renderer.addEmitter( fire );
addChild( renderer );

renderer.camera.position = new Point3D( 0, 150, -400 );
renderer.camera.target = new Point3D( 0, 150, 0 );
renderer.camera.projectionDistance = 400;
var orbitter:OrbitCamera = new OrbitCamera( stage, renderer.camera );
orbitter.start();