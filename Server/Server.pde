import processing.net.*;
Server myServer;

void setup() {
  myServer = new Server(this, 2333); 
}

void draw()
{
  // Get the next available client
  Client myClient = myServer.available();
  // If the client is not null, and says something, display what it said
  if (myClient !=null) {
    String whatClientSaid = myClient.readString();
    if (whatClientSaid != null) {
      //println(whatClientSaid);
      myClient.write(whatClientSaid);
    } 
  } 
}