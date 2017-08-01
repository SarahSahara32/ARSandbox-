import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect;

//threshold water1 
float maxTreshW1 = 830;
float minThreshW1 = 810;

//threshold water2 
float maxTreshW2 = 810+1;
float minThreshW2 = 790;

//threshold water3 
float maxTreshW3 = 790+1;
float minThreshW3 = 780;

//threshold water4 
float maxTreshW4 = 780+1;
float minThreshW4 = 770;

//threshold green1
float maxTreshG1 = 770+1;
float minThreshG1 = 760;

//threshold green2
float maxTreshG2 = 760+1;
float minThreshG2 = 755;

//threshold green3
float maxTreshG3 = 755+1;
float minThreshG3 = 750;

//threshold sand1
float maxTreshS1 = 750+1;
float minThreshS1 = 740;

//threshold sand2
float maxTreshS2 = 740+1;
float minThreshS2 = 730;

//threshold sand3
float maxTreshS3 = 730+1;
float minThreshS3 = 725;

//threshold brown1
float maxTreshB1 = 725+1;
float minThreshB1 = 715;

//threshold brown2
float maxTreshB2 = 715+1;
float minThreshB2 = 705;

//threshold brown3
float maxTreshB3 = 705+1;
float minThreshB3 = 695;

//threshold light
float maxTreshL = 695+1;
float minThreshL = 685;

//threshold white
float maxTreshP = 685+1;
float minThreshP = 650;

PImage img;

void setup() {
  size(640, 480);              //size of Kinect v1
  frameRate(30);                
  kinect = new Kinect(this);
  kinect.initDepth();
  //kinect.initDevice();
  img = createImage(kinect.width, kinect.height, RGB);
  smooth();
  
}

void draw() {
  background(0);
  
  img.loadPixels();
  
  int[] depth = kinect.getRawDepth();
  
  for (int x = 0; x < kinect.width; x++){
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * kinect.width;
      int d = depth[offset];
    
      if (d > minThreshW1 && d < maxTreshW1) {
        img.pixels[offset] = color(0,0,255); //color blue1
      } else if (d > minThreshW2 && d < maxTreshW2) {
        img.pixels[offset] = color(0,100,255); //color blue2
      } else if (d > minThreshW3 && d < maxTreshW3) {
        img.pixels[offset] = color(0,150,255); //color blue3 
      } else if (d > minThreshW4 && d < maxTreshW4) {
        img.pixels[offset] = color(0,200,255); //color blue3
       
      } else if (d > minThreshG1 && d < maxTreshG1) {
        img.pixels[offset] = color(0,150,0); //color green1
      } else if (d > minThreshG2 && d < maxTreshG2) {
        img.pixels[offset] = color(0,200,0); //color green2       
      } else if (d > minThreshG3 && d < maxTreshG3) {
        img.pixels[offset] = color(0,255,0); //color green3        
        
      } else if (d > minThreshS1 && d < maxTreshS1) {
        img.pixels[offset] = color(255,255,100); //color sand1
      } else if (d > minThreshS2 && d < maxTreshS2) {
        img.pixels[offset] = color(255,255,50); //color sand2
      } else if (d > minThreshS3 && d < maxTreshS3) {
        img.pixels[offset] = color(255,255,0); //color sand3
        
      } else if (d > minThreshB1 && d < maxTreshB1) {
        img.pixels[offset] = color(255,200,0); //color brown1
      } else if (d > minThreshB2 && d < maxTreshB2) {
        img.pixels[offset] = color(255,170,0); //color brown2
      } else if (d > minThreshB3 && d < maxTreshB3) {
        img.pixels[offset] = color(255,140,0); //color brown3
        
      } else if (d > minThreshL && d < maxTreshL) {
        img.pixels[offset] = color(255,235,215); //color light
      } else if (d > minThreshP && d < maxTreshP) {
        img.pixels[offset] = color(255); //color white       
      } else {
        img.pixels[offset] = color (0);
      }
      
    }
  }
  img.updatePixels();
  image (img, 0, 0);
}