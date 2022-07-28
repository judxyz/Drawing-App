
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 





//Global Variables
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight, drawingDiameter;
float quitX, quitY, quitWidth, quitHeight, thingWidth;
float sidebutFill, penX, penY, penWidth, penHeight, eraseX, eraseY, eraseW, eraseH, stampY, colorY, imageY, strokeY, resetX;
float strokeW, thinX, thinY, thinWidth, thinHeight, medX, thickX;
float sqY, sqWidth, sqHeight, sqcirX, cirX, cirY, cirWidth, cirHeight, sqX, trX, trTopX, trLeftY, trRightX, trRightY, trTopY, trLeftX;
float pickerWidth, pickerHeight, leftX, topY, colWidth, colHeight, midX, rightX, cenY, botY, ranX, ranHeight;
int drawColor, fillPen, fillStamp, fillColor, fillImages, buttonFill, textFill, grey=0xffCCCCCC, white=0xffFFFFFF, red=0xffE00909, orange=0xffFFB700, yellow=0xffFEFF00, green=0xff14FF00, dgreen=#AFE600, brown=#761C1C, pink=0xffFC94D3, black=0xff000000, Lblue = #B4E7FF;
Boolean draw=false, stamp=false, colorr=false, image=false, drawmenu=true, stampmenu=true, imagemenu=true, colorrmenu=true, drawRESET=true, stampRESET=true, colorrRESET=true, imageRESET=true;
Boolean stampRec=false, stampCir=false, stampTri=false;
Boolean erase=false, reset=false, nightmodeOFF=false;
float butterflyX, igY, igW, igH, minionX, owlX, drawIgX, drawIgY, drawIgW, drawIgH, nmX, nmY, nmW, nmH;
PFont mainFont, font;
PImage butterfly, minion, owl, restart, eraser;
String thin="Thin", med="Medium", thick="Thick", nmtext="NightMode";
color sidemenucolor;
//
public void setup() {
  musicsetup();
  //Display Checker
  //Display Orientation Checker
  //Display and CANVAS Checker
  size(1300, 900); //Landscape
  background(pink);
  //
  //Population
  drawingSurfaceX = width*1/3;
  drawingSurfaceY = height*1/15;
  drawingSurfaceWidth = width*3/5;
  drawingSurfaceHeight = height*4/5;
  drawingDiameter = width*1/50;
  quitX = width*19/20;
  quitY = 0;
  quitWidth = width*1/20;
  quitHeight = height*1/20;
  penX = width*1/40;
  penWidth = width*1/15;
  penHeight = height*1/10;
  penY = height*1/10;
  stampY = height*2.3f/7;
  colorY = height*4/7;
  imageY = height*4/5;
  strokeY = height*4.5f/5;
  thingWidth = penWidth+(penX*2);
  //erase&reset
  eraseX = drawingSurfaceX;
  eraseY = height*1/100;
  eraseW = penWidth/1.5f;
  eraseH = penHeight/2.5f;
  resetX = drawingSurfaceX + eraseW*1.3f;

  pickerWidth = penWidth*3;
  pickerHeight = penHeight*2;

  //pen menu
  thinX = thingWidth+thingWidth*1/10;
  thinY = penY+penY*1/5;
  thinWidth = penWidth/1.5;
  thinHeight = penWidth/1.5;
  medX = thingWidth+thingWidth*1/1.5;
  thickX = thingWidth*2.2;



  //stamp menu
  sqX = thingWidth+thingWidth*1/10;
  sqY = stampY+stampY*1/20;
  sqWidth = penWidth/1.5;
  sqHeight = penWidth/1.5;
  sqcirX = thingWidth+pickerWidth*2/5;
  cirX = thingWidth+pickerWidth*1/2;
  cirY = stampY+pickerHeight/4;
  trX = thingWidth*2.2;
  trTopX = trX+sqWidth*1/2;
  trTopY = sqY;
  trLeftX = trX;
  trLeftY = sqHeight+sqY;
  trRightX = trLeftX+sqWidth;
  trRightY = trLeftY;

  //color menu

  leftX = thingWidth+pickerWidth*1/15;
  topY = colorY+pickerWidth*1/10;
  colWidth = pickerWidth*1/5;
  colHeight = pickerHeight*1/5;
  midX = thingWidth+pickerWidth*1/3.5;
  rightX = thingWidth+pickerWidth*1/2;
  cenY = colorY+pickerHeight*1/2.5;
  botY = colorY+pickerHeight*2/3;
  ranX = thingWidth+pickerWidth/1.35;
  ranHeight = colHeight*3.6;

  rect(thingWidth, imageY, pickerWidth, pickerHeight);

  //image menu
  butterflyX = thingWidth+thingWidth*1/20;
  igY = imageY+imageY*1/50;
  igW = penWidth/1.2;
  igH = penWidth/1.2;
  minionX = thingWidth+pickerWidth*1/3;
  owlX = thingWidth*2.2;
  drawIgX = width*1.3/3;
  drawIgY = height*1/7;
  drawIgW = width/2;
  drawIgH = height/2;
  //
  nmX = quitX-100;
  nmY = eraseY;
  nmW = eraseW*1.5;
  nmH = eraseH;
  //
  fill(white);
  rect( drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight );
  rect ( 0, 0, thingWidth, height);
  //
  rect( eraseX, eraseY, eraseW, eraseH );
  rect( resetX, eraseY, eraseW, eraseH );
  rect( nmX, nmY, nmW, nmH);


  //
  font = createFont("Arial", 5);
  mainFont = createFont ("Gabriola", 48);

  butterfly = loadImage("butterfly.jpg");
  minion = loadImage("minion.jpg");
  owl = loadImage("owl.jpg");
  eraser = loadImage("erase.png");
  restart = loadImage("restart.png");
  
}
//End setup
//
void draw() {
  fill(black);
  textAlign (CENTER, CENTER);
  textFont(mainFont, 20);
  text( nmtext, nmX, nmY, nmW, nmH);
  fill(sidemenucolor);
  rect ( 0, 0, thingWidth, height);
  fill(white);
  musicdraw();

  if (draw == true) {
    stroke(drawColor);
    strokeWeight(strokeW);
    if (mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight)
      line (mouseX, mouseY, pmouseX, pmouseY);
    stroke(black);
    strokeWeight(1);
  }
  if (drawmenu == true) {
    strokeWeight(1);
    stroke(black);
    rect( thingWidth, penY, pickerWidth, pickerHeight/2);
    rect ( thinX, thinY, thinWidth, thinHeight);
    rect( medX, thinY, thinWidth, thinHeight);
    rect( thickX, thinY, thinWidth, thinHeight);
    //
    fill(black);
    strokeWeight(2);
    textAlign (CENTER, CENTER);
    textFont(mainFont, 20);
    text ( thin, thinX, thinY, thinWidth, thinHeight);
    text( med, medX, thinY, thinWidth, thinHeight);
    text( thick, thickX, thinY, thinWidth, thinHeight);
  }

  if (drawRESET == true) {
    noStroke();
    fill(pink);
    rect(thingWidth+1, penY, pickerWidth, pickerHeight/2+1);
    fill(white);
    strokeWeight(1);
    stroke(black);
  }


  if (stamp == true && mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight && stampRec==true)
  {
    fill(drawColor);
    rect( mouseX, mouseY, drawingDiameter, drawingDiameter);
    stampCir=stampTri=false;
  }
  if (stamp == true && mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight && stampCir==true)
  {
    fill(drawColor);
    stampRec=stampTri=false;
    ellipse( mouseX, mouseY, drawingDiameter, drawingDiameter);
  }
  if (stamp == true && mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight && stampTri==true)
  {
    fill(drawColor);
    triangle(mouseX, mouseY, mouseX-20, mouseY+20, mouseX+20, mouseY+20);
    stampCir=stampRec=false;
    fill(white);
  }
  if (stampmenu == true) {
    stroke(black);
    strokeWeight(1);
    fill(white);
    rect( thingWidth, stampY, pickerWidth, pickerHeight/2);
    noStroke();
    rect( sqcirX, sqY, sqWidth, sqHeight);
    rect( trX, sqY, sqWidth, sqHeight);
    stroke(black);
    rect ( sqX, sqY, sqWidth, sqHeight);
    ellipse( cirX, cirY, sqWidth, sqHeight);
    triangle(trTopX, trTopY, trLeftX, trLeftY, trRightX, trRightY);
    strokeWeight(1);
  }

  if (stampRESET == true) {
    noStroke();
    fill(pink);
    rect(thingWidth+1, stampY-1, pickerWidth, pickerHeight);
    fill(white);
    strokeWeight(1);
  }

  if (colorrmenu == true) {
    stroke(black);
    strokeWeight(1);
    rect( thingWidth, colorY, pickerWidth, pickerHeight);
    fill(white); 
    rect ( leftX, topY, colWidth, colHeight);
    fill(red); 
    rect ( leftX, cenY, colWidth, colHeight);
    fill(orange); 
    rect ( leftX, botY, colWidth, colHeight);
    fill(yellow); 
    rect ( midX, topY, colWidth, colHeight);

    if (nightmodeOFF==true) {
      fill(green); 
      rect ( midX, cenY, colWidth, colHeight);
      fill(dgreen); 
      rect ( midX, botY, colWidth, colHeight);
      fill(brown); 
      rect ( rightX, topY, colWidth, colHeight);
    }


    fill(black); 
    rect ( rightX, cenY, colWidth, colHeight);
    fill(pink); 
    rect ( rightX, botY, colWidth, colHeight);
    fill(grey); 
    rect ( ranX, topY, colWidth, ranHeight);
    fill(black);
    strokeWeight(2);
    textAlign (CENTER, CENTER);
    textFont(mainFont, 15);
    text("Random", ranX, topY, colWidth, ranHeight);
  }

  if (colorrRESET == true) {
    noStroke();
    fill(pink);
    rect(thingWidth+1, colorY, pickerWidth, pickerHeight+1);
    fill(white);
    strokeWeight(1);
  }




  if (imagemenu == true) {
    strokeWeight(1);
    stroke(black);

    fill(white);
    rect(thingWidth, imageY, pickerWidth, pickerHeight);

    image(butterfly, butterflyX, igY, igW, igH);
    image(minion, minionX, igY, igW, igH);
    image(owl, owlX, igY, igW, igH);
  }

  if (imageRESET == true) {
    noStroke();
    fill(pink);
    rect(thingWidth+1, imageY, pickerWidth, pickerHeight);
    fill(white);
    strokeWeight(1);
  }


  if ( erase == true && mouseX>drawingSurfaceX && mouseX<drawingSurfaceX+drawingSurfaceWidth && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight)  
  { 
    strokeWeight(20);
    stroke(white);
    line (mouseX, mouseY, pmouseX, pmouseY);
    stroke(black);
    strokeWeight(1);
  }

  //imgs

  image(restart, resetX, eraseY, eraseW, eraseH);
  image(eraser, eraseX, eraseY, eraseW, eraseH);

  //texts

  if (mouseX<drawingSurfaceX && mouseX>drawingSurfaceX+drawingSurfaceWidth && mouseY<drawingSurfaceY && mouseY>drawingSurfaceY+drawingSurfaceHeight)
    stroke(pink);
  fill(pink);

  //Hoverover
  if (mouseX>penX && mouseX<penX+penWidth && mouseY>penY && mouseY<penY+penHeight)
  {
    fillPen = pink;
  } else {
    fillPen = grey;
  }

  stroke(black);
  strokeWeight(1);
  fill(fillPen);
  rect( penX, penY, penWidth, penHeight );

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>stampY && mouseY<stampY+penHeight)
  {
    fillStamp = pink;
  } else {
    fillStamp = grey;
  }
  fill(fillStamp);
  rect( penX, stampY, penWidth, penHeight);

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>colorY && mouseY<colorY+penHeight)
  {
    fillColor = pink;
  } else {
    fillColor = grey;
  }
  fill(fillColor);
  rect( penX, colorY, penWidth, penHeight);

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>imageY && mouseY<imageY+penHeight)
  {
    fillImages = pink;
  } else {
    fillImages = grey;
  }
  fill(fillImages);
  rect(penX, imageY, penWidth, penHeight);

  fill(black);
  strokeWeight(2);
  textAlign (CENTER, CENTER);
  textFont(mainFont, 35);
  text( "Pen", penX, penY, penWidth, penHeight );
  text( "Stamp", penX, stampY, penWidth, penHeight);
  text( "Color", penX, colorY, penWidth, penHeight);
  text("Images", penX, imageY, penWidth, penHeight);
  strokeWeight(1);

  //Quite button
  if ( mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitHeight ) 
  {
    buttonFill = red;
    textFill = white;
  } else {
    buttonFill = pink;
    textFill = black;
  }
  fill(buttonFill); 
  noStroke();
  rect( quitX, quitY, quitWidth, quitHeight );
  stroke(1);
  fill(textFill);
  textAlign( CENTER, CENTER );
  int titleSize = 25;
  textFont(font, titleSize);
  text( "X", quitX, quitY, quitWidth, quitHeight);
  fill(white);
}

//End draw
//
public void keyPressed() {
}//End keyPressed
//
public void mousePressed() {

  if (nightmodeOFF==true && mouseX>nmX && mouseX<nmX+nmW && mouseY>nmY && mouseY<nmY+nmH) {
    nightmodeOFF=false;//nightmode on
    sidemenucolor = white;
  } else {
    nightmodeOFF=true;
    sidemenucolor = Lblue;
  }
  fill(sidemenucolor);
  rect ( 0, 0, thingWidth, height);






  soundeff.play();
  if ( soundeff.position() >= soundeff.length()-soundeff.length()*4/5 ) {
    soundeff.rewind();
    soundeff.play();
  }


  musicplay();

  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>penY && mouseY<penY+penHeight ) 
    if ( draw == true ) {
      draw = false;
      drawRESET = true;
      soundeff.play();
    } else {
      draw  = true;
      drawRESET = false;
      stamp=erase=false;
      soundeff.play();
    }

  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>stampY && mouseY<stampY+penHeight ) 
    if ( stamp == true ) {
      stamp = false;
      stampRESET = true;
    } else {
      stamp = true;
      stampRESET = false;
      draw=erase=false;
    }

  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>colorY && mouseY<colorY+penHeight ) 
    if ( colorr == true ) {
      colorr = false;
      colorrRESET = true;
    } else {
      colorr = true;
      colorrRESET = false;
    }
  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>imageY && mouseY<imageY+penHeight ) 
    if ( image == true ) {
      image = false;
      imageRESET = true;
      imagemenu=false;
    } else {
      image = true;
      imageRESET = false;
      imagemenu=true;
    }

  if (mouseX>thinX && mouseX<thinX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    draw= true;
    strokeW=1;
    stamp=false;
  }
  if (mouseX>medX && mouseX<medX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    draw= true;
    strokeW=3;
    stamp=false;
  }
  if ( mouseX>thickX && mouseX<thickX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    draw= true;
    strokeW=5;
    stamp=false;
  }


  if (mouseX>sqX && mouseX<sqX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
    stamp=true;
    stampRec=true;
    draw=false;
    stampCir=stampTri=false;
  }
  if (mouseX>sqcirX && mouseX<sqcirX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
    stamp=true;
    stampCir=true;
    draw=false;
    stampRec=stampTri=false;
  }
  if (mouseX>trX && mouseX<trX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
    stamp=true;
    stampTri=true;
    draw=false;
    stampRec=stampCir=false;
  }  

  if (mouseX>leftX && mouseX<leftX+colWidth && mouseY>topY && mouseY<topY+colHeight) {
    drawColor = white;
  }

  if (mouseX>leftX && mouseX<leftX+colWidth && mouseY>cenY && mouseY<cenY+colHeight) {
    drawColor=red;
  }

  if (mouseX>leftX && mouseX<leftX+colWidth && mouseY>botY && mouseY<botY+colHeight) {

    drawColor=orange;
  }

  if (mouseX>midX && mouseX<midX+colWidth && mouseY>topY && mouseY<topY+colHeight) {
    drawColor=yellow;
  }


  if (mouseX>midX && mouseX<midX+colWidth && mouseY>cenY && mouseY<cenY+colHeight) {

    drawColor=green;
  }

  if (mouseX>midX && mouseX<midX+colWidth && mouseY>botY && mouseY<botY+colHeight) {

    drawColor=dgreen;
  }

  if (mouseX>rightX && mouseX<rightX+colWidth && mouseY>topY && mouseY<topY+colHeight) {

    drawColor=brown;
  }

  if (mouseX>rightX && mouseX<rightX+colWidth && mouseY>cenY && mouseY<cenY+colHeight) {

    drawColor = black;
  }

  if (mouseX>rightX && mouseX<rightX+colWidth && mouseY>botY && mouseY<botY+colHeight) {

    drawColor= pink;
  }
  if (mouseX>ranX && mouseX<ranX+colWidth && mouseY>topY && mouseY<topY+ranHeight) {
    drawColor=color( random(255), random(255), random(255));
  }


  if (imagemenu == true && mouseX>butterflyX && mouseX<butterflyX+igW && mouseY>igY && mouseY<igY+igH) {
    image(butterfly, drawIgX, drawIgY, drawIgW, drawIgH);
  }


  if (imagemenu == true && mouseX>minionX && mouseX<minionX+igW && mouseY>igY && mouseY<igY+igH) {
    image(minion, drawIgX, drawIgY, drawIgW, drawIgH);
  }


  if (imagemenu == true && mouseX>owlX && mouseX<owlX+igW && mouseY>igY && mouseY<igY+igH) {
    image(owl, drawIgX, drawIgY, drawIgW, drawIgH);
  }

  //erase&resetart
  if ( mouseX>eraseX && mouseX<eraseX+eraseW && mouseY>eraseY && mouseY<eraseY+eraseH ) 
    if ( erase == true ) {
      erase = false;
    } else {
      erase = true;
      draw  = false;
      stamp = false;
    }
  if ( mouseX>resetX && mouseX<resetX+eraseW && mouseY>eraseY && mouseY<eraseY+eraseH ) 
    if ( reset == true ) {
      rect( drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight );
    } else {
      rect( drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight );   
      draw  = false;
      stamp = false;
      erase=false;
    }

  //exit
  if ( mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitHeight ) 
  {
    exit();
  }
}//End mousePressed
//
//End MAIN Program
