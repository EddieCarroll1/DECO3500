import processing.serial.*;
import ddf.minim.*;
 
Serial myPort;
Minim minim;
AudioPlayer player;
byte redCode = 97;
byte greenCode = 96;
byte res = 95;
byte junk = 94;
 
void setup()
{
  // In the next line, you'll need to change this based on your USB port name
  myPort = new Serial(this, "/dev/tty.usbserial-A601FUX6", 9600);
  minim = new Minim(this);
 
  // Put in the name of your sound file below, and make sure it is in the same directory
  player = minim.loadFile("soundfile.mp3");
}
 
void draw() {
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    if (inByte == redCode) {
      player = minim.loadFile("Red.m4a");
    } else if (inByte == greenCode){
      player = minim.loadFile("Green.m4a");
    } else if (inByte == res){
      player = minim.loadFile("Reccomend.m4a");
    } else if (inByte == junk){
      player = minim.loadFile("JunkFood.m4a");
    }
    
    player.rewind();
      player.play();
  }
}
