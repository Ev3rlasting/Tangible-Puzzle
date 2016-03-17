import processing.net.*; 
import TUIO.*;

final int PIECE_NUMBER = 5;
final int PORT = 2333;
ArrayList<PImage> pieces = new ArrayList();
PImage piece0, piece1;
TuioProcessing tuioClient;
boolean callback = true;
boolean showpic []= new boolean[PIECE_NUMBER];
Client myClient;
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
  System.setProperty("java.net.preferIPv4Stack","true");
  tuioClient = new TuioProcessing(this,8888);
  myClient = new Client(this, "127.0.0.1", PORT);
  for (int i=0; i<PIECE_NUMBER; i++) {
    PImage piece = loadImage(Integer.toString(i)+".png");
    pieces.add(piece);
    showpic[i]=false;
  }
  println("There are "+pieces.size()+" pieces");
  //  myClient.write("There are "+pieces.size()+" pieces");

  //piece0 = loadImage("0.png");
  //piece1 = loadImage("1.png");
  //pieces.add(piece0);
  //pieces.add(piece1);
}

void draw() {
  background(255);
  //float obj_size = object_size*scale_factor; 
  //float cur_size = cursor_size*scale_factor; 
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size() && i<PIECE_NUMBER; i++) {
    TuioObject tobj = tuioObjectList.get(i);
    if (showpic[tobj.getSymbolID()]) {
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
      myClient.write(tobj.getSymbolID()+" "+tobj.getAngle()+" "+tobj.getX()+" "+tobj.getY());
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
  if (tobj.getSymbolID()<PIECE_NUMBER) {
    //println("add obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
    showpic[tobj.getSymbolID()]=true;
    println(tobj.getSymbolID()+"=true");
  }
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  //println("set obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
  //        +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  if (tobj.getSymbolID()<PIECE_NUMBER) {
    println("del obj "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
    showpic[tobj.getSymbolID()]=false;
  }
}
void refresh(TuioTime frameTime) {
  //println("frame #"+frameTime.getFrameID()+" ("+frameTime.getTotalMilliseconds()+")");
}