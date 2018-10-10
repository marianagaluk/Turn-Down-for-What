//Created by Mariana Galuk

//Face recognition 'Turn Down for What'

//import libraries video display and facial recognition
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencv;
Capture video;

//load turn down for what glasses image
PImage img;

void setup() {
  size(640, 480);
  img = loadImage("turndownforwhat.png");
  
  //start capturing
  video = new Capture(this, 320, 240);
  
  opencv = new OpenCV(this, 320, 240);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  video.start();
}

void draw() {
  scale(2);
  
  //load the camera
  opencv.loadImage(video);
  
  //draw the video
  image(video, 0, 0 );
  
  //array of faces
  Rectangle[] faces = opencv.detect();
 
 //for each recognised face, draw the image
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img, faces[i].x+7, faces[i].y, faces[i].width, faces[i].height);   
  }
}

void captureEvent(Capture c) {
  c.read();
}