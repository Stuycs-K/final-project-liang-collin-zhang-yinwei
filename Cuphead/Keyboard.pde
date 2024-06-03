KeyboardBuffer keyboardInput;
void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  keyboardInput.press(keyCode,true);
}

void keyReleased() {
  //send the number of the key released to your KeyboardBuffer object
  keyboardInput.press(keyCode,false);
}

/**************KeyboardBuffer TAB************/
class KeyboardBuffer {
  //make a list of actions you want to have in your program
  //As a simple example this is just two instance varibles, but a list/array would work well for large quantities.
  boolean P_LEFT;
  boolean P_RIGHT;
  boolean P_SPACE;
  boolean P_UP;
  boolean P_DOWN;

  public KeyboardBuffer() {
    P_LEFT = false;
    P_RIGHT = false;
    P_SPACE = false;
    P_DOWN = false;
    P_UP = false;
  }

  //Map your keys here. You can bind any key presses to
  //different "actions" e.g. P1_LEFT suggests player1 goes left when this is held down.
  void press(int code, boolean pressed) {
    //println("Pressed: "+code);//Help you figure out codes that aren't working the way you want.

    if(code == 'A'){
      P_LEFT = pressed;
    }
    if(code == 'D'){
      P_RIGHT = pressed;
    }
    if(code == ' '){
      P_SPACE = pressed;
    }
    if (code == 'W') {
      P_UP = pressed;
    }
    if (code == 'S') {
      P_DOWN = pressed;
    }
  }

}
