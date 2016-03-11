
import processing.net.*; 
import TUIO.*;
PImage piece1,piece2;
TuioProcessing tuioClient;
boolean callback = true;
boolean showPic = false;
boolean newShowPic = false;
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;

//TUIO Object linking to Pics
void setup() {
  size(1100, 800);
  tuioClient = new TuioProcessing(this);
  piece1 = loadImage("1.png");
  piece2 = loadImage("2.png");
}

void draw() {
  background(255);
  float obj_size = object_size*scale_factor; 
  float cur_size = cursor_size*scale_factor; 
  if (showPic) {
    ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0;i<tuioObjectList.size();i++) {
     TuioObject tobj = tuioObjectList.get(i);
     pushMatrix();
     translate(tobj.getScreenX(width),tobj.getScreenY(height));
     rotate(0-tobj.getAngle());
     image(piece1, 0, 0, 100, 100);
     popMatrix();
     //text(""+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
   }
  }
}
// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  // println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  switch(tobj.getSymbolID()) {
  case 157:    
    println("157 Detected! Show Image!");
    showPic = true;
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
  //println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  switch(tobj.getSymbolID()) {
  case 157:    
    println("157 Gone! Kill Image!");
    showPic = false;
    break;
  }
}
void refresh(TuioTime frameTime) {
  //println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
}