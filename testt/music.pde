
//Global Variables
Minim  minim; //creates object to access all functions
AudioPlayer song1; //creates a playlist
AudioMetaData songMetaData1;
AudioPlayer soundeff;
//
float musicX, musicY, musicW, musicH, playX, playY, playW, playH, nextX, nextY, nextW, nextH, prevX, prevY, loopX, loopY, muteX, muteY, powerX, stopX;
float titleX, titleY, titleWidth, titleHeight, bmX, bmY, bmW, bmH;
PImage play, pause, prev, next, mute, loop, power, stop;
Boolean pauseON=false, playON=false, powerOFF=true;

void musicsetup() {
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("e.mp3"); //able to pass absolute path, file name & extension, and URL
  songMetaData1 = song1.getMetaData();
  soundeff = minim.loadFile("soundeff.mp3");


  //population
  musicX = width*2/5;
  musicY = height*8/9;
  musicW = width*1/3;
  musicH = height*1/10;
  playW = musicH/1.5;
  playH = musicH/1.5;
  playX = musicX+musicW/2-playW/2;
  playY = musicY+musicH/2-playH/2;

  nextX = playX+70;
  nextY = playY+playY/70;
  nextW = playH/1.7;
  nextH = playH/1.7;
  prevX = playX-50;
  prevY = playY+playY/70;
  loopX = prevX-50;
  loopY = prevY;
  muteX = playX+120;
  muteY = prevY;
  bmX = musicX+musicW+musicW*1/20;
  bmY = musicY;
  bmW = width*1/5;
  bmH = musicH;
  powerX = musicX+30;
  stopX = muteX+50;

  //
  rect(musicX, musicY, musicW, musicH);
  power = loadImage("power.png");
  image(power, powerX, muteY, nextW, nextH);
}

void musicdraw() {

  //draw buttons


  if (powerOFF ==true) {
    rect(musicX, musicY, musicW, musicH);
    image(power, powerX, muteY, nextW, nextH);
    pauseON=false;
    playON=false;
    fill(pink);
    stroke(pink);
    rect(bmX, bmY, bmW, bmH);
    fill(white);
    stroke(white);
  }

  if (powerOFF == false) {
    play = loadImage("play.png");
    image(play, playX, playY, playW, playH);
    pause = loadImage("pause.png");
    next = loadImage("next.png");
    image(next, nextX, nextY, nextW, nextH);
    prev = loadImage("prev.png");
    image(prev, prevX, prevY, nextW, nextH);
    loop = loadImage("loop.png");
    image(loop, loopX, loopY, nextW, nextH);
    mute = loadImage("mute.png");
    image(mute, muteX, muteY, nextW, nextH);

    stop = loadImage("stop.png");
    image(stop, stopX, muteY, nextW, nextH);
    rect(bmX, bmY, bmW, bmH);

    textAlign( CENTER, TOP); 
    fill(black);
    textFont(font, 30);
    text( songMetaData1.title(), bmX, bmY, bmW, bmH );
    textAlign( CENTER, CENTER); 
    textFont(font, 20);
    text( songMetaData1.date(), bmX, bmY, bmW, bmH );
    textAlign( CENTER, BOTTOM); 
    text( songMetaData1.author(), bmX, bmY, bmW, bmH );

    fill(white);
    println("Song position", song1.position(), "Song Length", song1.length() ); //Amount of time left is a calculation
  }

  if (pauseON == true) {
    fill(white);
    noStroke();
    rect(playX, playY, playW, playH);
    image(pause, playX, playY, playW, playH);
  }

  if (playON == true) {
    noStroke();
    rect(playX, playY, playW, playH);
    image(play, playX, playY, playW, playH);
    stroke(1);
  }
 
   
}


void musicplay() {

  if (mouseX>powerX && mouseX<powerX+nextW && mouseY>muteY && mouseY<muteY+nextH) {
    if (powerOFF == false) {
      powerOFF = true;
    } else {
      powerOFF=false;
    }
  }

  if (mouseX>playX && mouseX<playX+playW && mouseY>playY && mouseY<playY+playH) {
    if (pauseON == false) {
      pauseON = true;
      playON = false;
    } else {
      pauseON = false;
      playON = true;
    }
  }

  if (playON == true) {
    song1.pause();
  }


  if ( pauseON == true && mouseX>playX && mouseX<playX+playW && mouseY>playY && mouseY<playY+playH) {
    song1.loop(0);
  } else if ( song1.position() >= song1.length()-song1.length()*1/5) {
    song1.rewind();
    song1.loop(0);
  }




  if (mouseX>nextX && mouseX<nextX+nextW && mouseY>nextY && mouseY<nextY+nextH) {
    if ( song1.isPlaying() ) {
      song1.skip(3000);
    }
  }


  if (mouseX>prevX && mouseX<prevX+nextW && mouseY>prevY && mouseY<prevY+nextH) {
    if ( song1.isPlaying() ) {
      song1.skip(-3000);
    }
  }


  if (mouseX>loopX && mouseX<loopX+nextW && mouseY>loopY && mouseY<loopY+nextH) {
    song1.loop();
  }

  if (mouseX>muteX && mouseX<muteX+nextW && mouseY>muteY && mouseY<muteY+nextH) {
    if ( song1.isMuted()) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }

  if (mouseX>stopX && mouseX<stopX+nextW && mouseY>muteY && mouseY<muteY+nextH) {
    if ( song1.isPlaying()) {
      song1.pause();
      song1.rewind();
      playON=true;
    } else {
      song1.rewind();
      song1.play();
      pauseON=true;
    }
  }

}//End Music
