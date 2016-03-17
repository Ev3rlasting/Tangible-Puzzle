/**
 * oscP5multicast by andreas schlegel
 * example shows how to send osc via a multicast socket.
 * what is a multicast? http://en.wikipedia.org/wiki/Multicast
 * ip multicast ranges and uses:
 * 224.0.0.0 - 224.0.0.255 Reserved for special �well-known� multicast addresses.
 * 224.0.1.0 - 238.255.255.255 Globally-scoped (Internet-wide) multicast addresses.
 * 239.0.0.0 - 239.255.255.255 Administratively-scoped (local) multicast addresses.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
OscP5 osc;
NetAddress remote;

void setup() {
  size(400,400);
  frameRate(25);
  /* create a new instance of oscP5 using a multicast socket. */
  System.setProperty("java.net.preferIPv4Stack", "true");     // disable ipv6
  oscP5 = new OscP5(this, "239.0.0.1", 7777);
  osc = new OscP5(this, 8889);
  remote = new NetAddress("192.168.0.109", 8888);
}


void draw() {
  background(0);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  OscMessage m = theOscMessage;
  osc.send(m, remote);
  
  
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}