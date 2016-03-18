import processing.net.*; 
import TUIO.*;

final int PIECE_NUMBER = 5;
ArrayList<PImage> pieces = new ArrayList();
PImage piece0, piece1;
TuioProcessing tuioClient1, tuioClient2;
boolean callback = true;
boolean showpic []= new boolean[PIECE_NUMBER];
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;

//TUIO Object linking to Pics
void setup() {
  size(1100, 800);
  frameRate(30);
  println(width);
  println(height);
  System.setProperty("java.net.preferIPv4Stack", "true");
  tuioClient1 = new TuioProcessing(this, 8888);
  tuioClient2 = new TuioProcessing(this, 8889);
  for (int i=0; i<PIECE_NUMBER; i++) {
    PImage piece = loadImage(Integer.toString(i)+".png");
    pieces.add(piece);
    showpic[i]=false;
  }
  println("There are "+pieces.size()+" pieces");
}

void draw() {
  background(255);
  //float obj_size = object_size*scale_factor; 
  //float cur_size = cursor_size*scale_factor; 
  ArrayList<TuioObject> tuioObjectList1 = tuioClient1.getTuioObjectList();
  ArrayList<TuioObject> tuioObjectList2 = tuioClient2.getTuioObjectList();
  tuioObjectList1.addAll(tuioObjectList2);
  if (tuioObjectList1.size()>0) {
    for (int i=0; i<tuioObjectList1.size() && i<PIECE_NUMBER; i++) {
      TuioObject tobj = tuioObjectList1.get(i);
      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));  
      rotate(0-tobj.getAngle());
      image(pieces.get(tobj.getSymbolID()), 0, 0, 200, 200);
      popMatrix();
      //    println("Position: "+tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
      //println(tobj.getSymbolID());
      //println(tobj.getAngle());
      //println(tobj.getScreenX(width));
      //println(tobj.getScreenY(height));
    }
  }
}

// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame
// called when an object is added to the scene
//void addTuioObject(TuioObject tobj) {
//  // println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
//  if (tobj.getSymbolID()<PIECE_NUMBER) {
//    //println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
//    showpic[tobj.getSymbolID()]=true;
//    println(tobj.getSymbolID()+"=true");
//  }
//}

//// called when an object is moved
//void updateTuioObject (TuioObject tobj) {
//  //println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
//  //        +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
//}

//// called when an object is removed from the scene
//void removeTuioObject(TuioObject tobj) {
//  if (tobj.getSymbolID()<PIECE_NUMBER) {
//    println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
//    showpic[tobj.getSymbolID()]=false;
//  }
//}
void refresh(TuioTime frameTime) {
  //println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
}