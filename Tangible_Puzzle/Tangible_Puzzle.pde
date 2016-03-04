  
import processing.net.*; 
import TUIO.*;
PImage piece;
TuioProcessing tuioClient;
boolean callback = true;
//TUIO Object linking to Pics
void setup(){
  size(1100,800);
  tuioClient = new TuioProcessing(this);
}

void draw(){
  background(255);
  piece = loadImage("1.jpg");
}
// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  switch(tobj.getSymbolID()){
    case 0:
    println("000000");
    image(piece, 0, 0, width, height);
    break;
  }
  
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  piece.
}
void refresh(TuioTime frameTime) {
   println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
}