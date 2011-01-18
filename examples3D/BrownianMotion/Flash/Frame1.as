
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
 
import org.flintparticles.common.counters.*;
import org.flintparticles.common.displayObjects.Dot;
import org.flintparticles.common.initializers.*;
import org.flintparticles.threeD.actions.*;
import org.flintparticles.threeD.emitters.Emitter3D;
import org.flintparticles.threeD.initializers.*;
import org.flintparticles.threeD.renderers.*;
import org.flintparticles.threeD.renderers.controllers.OrbitCamera;
import org.flintparticles.threeD.zones.*;	

var emitter:Emitter3D = new Emitter3D();
emitter.counter = new Blast( 400 );

var air:InitializerGroup = new InitializerGroup();
air.addInitializer( new ImageClass( Dot, 2 ) );
air.addInitializer( new ColorInit( 0xFF666666, 0xFF666666 ) );
air.addInitializer( new MassInit( 1 ) );
air.addInitializer( new CollisionRadiusInit( 2 ) );

var smoke:InitializerGroup = new InitializerGroup();
smoke.addInitializer( new ImageClass( Dot, 10 ) );
smoke.addInitializer( new ColorInit( 0xFFFFFFFF, 0xFFFFFFFF ) );
smoke.addInitializer( new MassInit( 5 ) );
smoke.addInitializer( new CollisionRadiusInit( 10 ) );

emitter.addInitializer( new Position( new BoxZone( 280, 280, 280, new Vector3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), new Vector3D( 0, 0, 1 ) ) ) );
emitter.addInitializer( new Velocity( new SphereZone( new Vector3D( 0, 0, 0 ), 150, 100 ) ) );
emitter.addInitializer( new ChooseInitializer( [ air, smoke ], [ 30, 1 ] ) );

emitter.addAction( new Move() );
emitter.addAction( new Collide( 1 ) );
emitter.addAction( new BoundingBox( -150, 150, -150, 150, -150, 150, 1 ) );
emitter.addAction( new ShowAirAction( stage ) );

var renderer:DisplayObjectRenderer = new DisplayObjectRenderer();
renderer.x = 200;
renderer.y = 200;
renderer.addEmitter( emitter );
addChild( renderer );

renderer.camera.position = new Vector3D( 0, 0, -400 );
renderer.camera.target = new Vector3D( 0, 0, 0 );
renderer.camera.projectionDistance = 400;
var orbitter:OrbitCamera = new OrbitCamera( stage, renderer.camera );
orbitter.start();

emitter.start();