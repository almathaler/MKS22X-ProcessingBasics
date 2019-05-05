int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    //draw the triangle
    //draw a center triangle that is white
    //call gasket on each of the three created triangles, created by the white triangle we j made
    //decreases levels in this new gasket call
    triangle(v1x, v1y, v2x, v2y, v3x, v3y); //draw the first triangle
    fill(255);
    if (levels > 0){
      float newv1x = (v1x+v2x)/2; //bottom point
      float newv1y = v1y;
      float newv2x = (v3x+v2x)/2; //right point
      float newv2y = (v3y+v2y)/2;
      float newv3x = (v3x+v1x)/2; //left point
      float newv3y = (v3y+v1y)/2;
     triangle(newv1x, newv1y, newv2x, newv2y, newv3x, newv3y);
     //gasket on the three triangles remaining
     gasket(levels-1, v1x, v1y, newv1x, newv1y, newv3x, newv3y); //left triangle (
     gasket(levels-1, newv1x, newv1y, v2x, v2y, newv2x, newv1y); //bottom right triangle
     gasket(levels-1, newv3x, newv3y, newv2x, newv2y, v3x, v3y); //top triangle
    }
}

void draw() { 
  background(255);  
  fill(255,0,0);
  text("Click the mouse to increase levels, press a key to decrease levels",10,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels++;  
}

void keyPressed(){
 levels--; 
}
