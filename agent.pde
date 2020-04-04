class agent{
  PVector pos;
  int tail = 10;
 color col;
 float space;
  
  agent(PVector _pos, color temp){
    pos = _pos;
    col = convert8(temp);
    space = 10;
    
    
    
    
    
    
  }
  
  void update(){
    //background(0);
    pos.x+=random(-.1,.1);
    pos.y+=random(-.1,.1);
    //tail+=random(-1,1);
    //space+=random(-.1,.1);
    degrade();
  }
  
  void degrade(){
    //space = map(sin(frameCount/30),-1,1,10,15);
    space = 10;
    for(int i = 0; i < tail; i++){
      color deg = color(red(col)+((255/32)*i),green(col)+((255/32)*i),blue(col)-((255/32)*i),240/(i+1));
      fill(deg);
      noStroke();
      rectMode(CENTER);
      
      //rect(pos.x+(space*i),pos.y+random(-.5,.5),6-i/2,6-i/2);
      rect(pos.x+(space*i),pos.y,5,5);
    }  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
