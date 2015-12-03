
import processing.serial.*;

Serial myPort;       // serial port haberleşme için
int xPos = 1;         
float inByte = 0;

void setup () {
  size(600, 600);
  println(Serial.list());
  //Arduino serial seciyoruz
  myPort = new Serial(this, Serial.list()[2], 9600); // bende 3. oldugundan dolayı bu sekilde bu kısma dikkat
  myPort.bufferUntil('\n');
  background(0);
}
void draw () {
  stroke(135, 30, 255);
  line(xPos, height, xPos, height - inByte);
  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    xPos++;
  }
}
// gelen datalar stringten byte cevirme 
void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);
    inByte = float(inString);
    println(inByte);
    inByte = map(inByte, 0, 1023, 0, height);
  }
}
