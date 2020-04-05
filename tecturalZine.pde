PImage back;
float step = 10;
ArrayList<agent> hail = new ArrayList<agent>();

void settings() {
  back = loadImage("page1h.jpg");
  back.resize(back.width*2, back.height*2);
  size(back.width, back.height);
}

void setup() {
  
  //  image(back,0,0);
frameRate(16);
  background(0);
  eightBit();
}

void draw() {
  background(0);
  tint(255,40);
  
   image(back,0,0);
   tint(255);
  
  for (int i = hail.size()-1; i > -1; i--) {
    hail.get(i).update();
  }

  println(hail.size());
  //println(step/2-2);
}

void eightBit() {

  for (int i = 0; i < width; i+=step) {
    for (int j = 0; j < height; j+=step) {
      color temp = back.get(i, j);

      if ((red(temp)+green(temp)+blue(temp))/3 > 20) {
        hail.add(new agent(new PVector(i+random(-2,2), j+random(-2,2)), temp));
      }
    }
  }
}

color convert8(color c) {

  float cr = red(c);
  float cg = green(c);
  float cb = blue(c);

  cr = round(map(cr, 0, 255, 0, 7));
  cg = round(map(cg, 0, 255, 0, 7));
  cb = round(map(cb, 0, 255, 0, 3));

  cr = map(cr, 0, 7, 0, 255);
  cg = map(cg, 0, 7, 0, 255);
  cb = map(cb, 0, 3, 0, 255);

  c = color(cr, cg, cb);


  return c;
}




void circleJitter() {

  fill(0);
  noStroke();
  //rect(0, 0, width, height);
  stroke(255);
  strokeWeight(.11);
  step = 7;
  for (int i = 0; i < width; i+=step) {
    for (int j = 0; j < height; j+=step) {



      step = 7;

      step+=random(0, 3);
      color temp = back.get(i, j);
      if (red(temp)>20 && green(temp)>20&&blue(temp)>20) {
        fill(red(temp), green(temp), blue(temp), 180);
        ellipse(i, j, step/3, step/3);
      }
    }
  }
}

void mouseClicked(){
 saveFrame("backOut.png"); 
}
