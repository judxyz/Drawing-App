
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
int drawColor, fillPen, fillStamp, fillColor, fillImages, buttonFill, textFill, grey=0xffCCCCCC, white=0xffFFFFFF, red=0xffE00909, orange=0xffFFB700, yellow=0xffFEFF00, green=0xff14FF00, blue=0xff00A8FF, purple=0xff9800FF, pink=0xffFC94D3, black=0xff000000, Lblue=0xffAFE6FF;
Boolean draw=false, stamp=false, colorr=false, image=false, drawmenu=true, stampmenu=true, imagemenu=true, colorrmenu=true, drawRESET=true, stampRESET=true, colorrRESET=true, imageRESET=true;
Boolean stampRec=false, stampCir=false, stampTri=false;
Boolean erase=false, reset=false;
float butterflyX, igY, igW, igH, minionX, owlX, drawIgX, drawIgY, drawIgW, drawIgH;
PFont mainFont, font;
PImage butterfly, minion, owl, restart, eraser;
String thin="Thin", med="Medium", thick="Thick";
//
public void setup() {
  //Display Checker
  //Display Orientation Checker
  //Display and CANVAS Checker
  size(1300, 900); //Landscape
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
  thinWidth = penWidth/1.5f;
  thinHeight = penWidth/1.5f;
  medX = thingWidth+thingWidth*1/1.5f;
  thickX = thingWidth*2.2f;



  //stamp menu
  sqX = thingWidth+thingWidth*1/10;
  sqY = stampY+stampY*1/20;
  sqWidth = penWidth/1.5f;
  sqHeight = penWidth/1.5f;
  sqcirX = thingWidth+pickerWidth*2/5;
  cirX = thingWidth+pickerWidth*1/2;
  cirY = stampY+pickerHeight/4;
  trX = thingWidth*2.2f;
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
  midX = thingWidth+pickerWidth*1/3.5f;
  rightX = thingWidth+pickerWidth*1/2;
  cenY = colorY+pickerHeight*1/2.5f;
  botY = colorY+pickerHeight*2/3;
  ranX = thingWidth+pickerWidth/1.35f;
  ranHeight = colHeight*3.6f;

  rect(thingWidth, imageY, pickerWidth, pickerHeight);

  //image menu
  butterflyX = thingWidth+thingWidth*1/20;
  igY = imageY+imageY*1/50;
  igW = penWidth/1.2f;
  igH = penWidth/1.2f;
  minionX = thingWidth+pickerWidth*1/3;
  owlX = thingWidth*2.2f;
  drawIgX = width*1.3f/3;
  drawIgY = height*1/7;
  drawIgW = width/2;
  drawIgH = height/2;
  //
  //
  fill(white);
  rect( drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight );
  rect ( 0, 0, thingWidth, height);
  //
  rect( eraseX, eraseY, eraseW, eraseH );
  rect( resetX, eraseY, eraseW, eraseH );
  //
  font = createFont("Arial", 5);
  mainFont = createFont ("Gabriola", 48);

  butterfly = loadImage("butterfly.jpg");
  minion = loadImage("minion.jpg");
  owl = loadImage("owl.jpg");
  eraser = loadImage("erase.png");
  restart = loadImage("restart.png");

  musicsetup();
}//End setup
//
void draw() {
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
    fill(grey);
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
  }

  if (stampRESET == true) {
    noStroke();
    fill(grey);
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
    fill(green); 
    rect ( midX, cenY, colWidth, colHeight);
    fill(blue); 
    rect ( midX, botY, colWidth, colHeight);
    fill(purple); 
    rect ( rightX, topY, colWidth, colHeight);
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
    fill(grey);
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
    fill(grey);
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
    stroke(grey);
  fill(grey);

  //Hoverover
  if (mouseX>penX && mouseX<penX+penWidth && mouseY>penY && mouseY<penY+penHeight)
  {
    fillPen = Lblue;
  } else {
    fillPen = grey;
  }

  stroke(black);
  strokeWeight(1);
  fill(fillPen);
  rect( penX, penY, penWidth, penHeight );

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>stampY && mouseY<stampY+penHeight)
  {
    fillStamp = Lblue;
  } else {
    fillStamp = grey;
  }
  fill(fillStamp);
  rect( penX, stampY, penWidth, penHeight);

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>colorY && mouseY<colorY+penHeight)
  {
    fillColor = Lblue;
  } else {
    fillColor = grey;
  }
  fill(fillColor);
  rect( penX, colorY, penWidth, penHeight);

  if (mouseX>penX && mouseX<penX+penWidth && mouseY>imageY && mouseY<imageY+penHeight)
  {
    fillImages = Lblue;
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
    buttonFill = grey;
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
public void mousePressed()
{
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
      soundeff.play();
    } else {
      stamp = true;
      stampRESET = false;
      draw=erase=false;
      soundeff.play();
    }

  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>colorY && mouseY<colorY+penHeight ) 
    if ( colorr == true ) {
      colorr = false;
      colorrRESET = true;
      soundeff.play();
    } else {
      colorr = true;
      colorrRESET = false;
      soundeff.play();
    }
  if ( mouseX>penX && mouseX<penX+penWidth && mouseY>imageY && mouseY<imageY+penHeight ) 
    if ( image == true ) {
      image = false;
      imageRESET = true;
      imagemenu=false;
      soundeff.play();
    } else {
      image = true;
      imageRESET = false;
      imagemenu=true;
      soundeff.play();
    }

  if (draw==true && mouseX>thinX && mouseX<thinX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    strokeW=1;
    stamp=false;
    soundeff.play();
  }
  if (draw==true && mouseX>medX && mouseX<medX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    strokeW=3;
    stamp=false;
    soundeff.play();
  }
  if (draw==true && mouseX>thickX && mouseX<thickX+thinWidth && mouseY>thinY && mouseY<thinY+thinHeight) {
    strokeW=5;
    stamp=false;
    soundeff.play();
  }


  if (stamp==true && mouseX>sqX && mouseX<sqX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
    stampRec=true;
    draw=false;
    stampCir=stampTri=false;
  }
  if (stamp==true && mouseX>sqcirX && mouseX<sqcirX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
    stampCir=true;
    draw=false;
    stampRec=stampTri=false;
  }
  if (stamp==true && mouseX>trX && mouseX<trX+sqWidth && mouseY>sqY && mouseY<sqY+sqHeight) {
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

    drawColor=blue;
  }

  if (mouseX>rightX && mouseX<rightX+colWidth && mouseY>topY && mouseY<topY+colHeight) {

    drawColor=purple;
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
