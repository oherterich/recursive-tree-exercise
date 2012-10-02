// Recursive Tree Excercise
// Owen Herterich

void setup() {
  size(800,600);
  background(255);
  
  colorMode(HSB,360);
  
  strokeWeight(3);
}

void draw() {
  //Draw initial horizontal line for the tree
  stroke(100,270, 320);
  line(0,300,150,300);
  
  //Start drawing recursive tree at (150,300)
  pushMatrix();
  translate(150,300);
  branch(150, 30, 300);
  popMatrix();
}

void branch(int lineLength, int rotation, int shading) {
  //Before starting recursion, check to see if lines are at least 10 pixels long
  if (lineLength >= 10) {
    
  //Change variables every time the function is run
  lineLength=int(lineLength*.75);
  shading-=20;
  
  stroke(100, 270, shading);
  pushMatrix();
  rotate(radians(rotation)); //Rotate coordinate grid by specified amount (in positive direction)
  line(0,0,lineLength,0); //draw line that is (lineLength) units long.
  translate(lineLength,0); //translate the coordinate grid to the end of previously drawn line
  branch(lineLength, rotation, shading); //use recursion to keep drawing lines
  popMatrix();
  
  /*Same as above, except that the coordinate grid is rotated in negative direction to
  produce two different branches of the tree*/
  stroke(100, 270, shading);  
  pushMatrix();
  rotate(radians(-rotation)); //rotate grid in negative direction
  line(0,0,lineLength,0);
  translate(lineLength,0);
  branch(lineLength, rotation, shading);
  popMatrix();
  }
}
