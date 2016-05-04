import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class server extends PApplet {

/**
 * oscP5multicast by andreas schlegel
 * example shows how to send osc via a multicast socket.
 * what is a multicast? http://en.wikipedia.org/wiki/Multicast
 * ip multicast ranges and uses:
 * 224.0.0.0 - 224.0.0.255 Reserved for special \ufffdwell-known\ufffd multicast addresses.
 * 224.0.1.0 - 238.255.255.255 Globally-scoped (Internet-wide) multicast addresses.
 * 239.0.0.0 - 239.255.255.255 Administratively-scoped (local) multicast addresses.
 * oscP5 website at http://www.sojamo.de/oscP5
 */




OscP5 oscP5;
OscP5 temp;
OscP5 server;
//OscP5 client1, client2;
NetAddress client1Address, client2Address;

public void setup() {
  
  
  /* create a new instance of oscP5 using a multicast socket. */
  System.setProperty("java.net.preferIPv4Stack", "true");     // disable ipv6
  server = new OscP5(this, "224.0.0.1",7777);
  temp = new OscP5(this, 9999);
  client1Address = new NetAddress("127.0.0.1", 63000);
  client2Address = new NetAddress("142.58.211.5", 62000);
}


public void draw() {
  background(0);
}


/* incoming osc message are forwarded to the oscEvent method. */
public void oscEvent(OscMessage theOscMessage) {
  OscMessage m = theOscMessage;
  temp.send(m, client1Address);
  temp.send(m, client2Address);
  
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "server" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
