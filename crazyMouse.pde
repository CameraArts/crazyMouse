import java.awt.*;
import java.awt.event.*;
Robot robot;

int speed = 2;
PVector orientation;
PVector cursorPosition;
int frame;
void setup() {
  delay(3000);
//  frameRate(15);

  cursorPosition = new PVector();
  orientation = new PVector();

  cursorPosition.x = int(random(0, displayWidth));
  cursorPosition.y = int(random(0, displayHeight));

  orientation.x = random(-10, 10);
  orientation.y = random(-10, 10);



  try {
    robot = new Robot();
  } 
  catch (AWTException e) {
  }

  cursorPosition = new PVector();
}

void draw() {
  if (frame%10 == 0) {
    orientation.x = random(-10, 10);
    orientation.y = random(-10, 10);
  }
  cursorPosition.x += speed * orientation.x;
  cursorPosition.y += speed * orientation.y;
  cursorPosition.x = constrain(cursorPosition.x, 0, displayWidth);
  cursorPosition.y = constrain(cursorPosition.y, 50, displayHeight-200);
  robot.mouseMove((int) cursorPosition.x, (int) cursorPosition.y);

  //random left clicking
  if (frame%60 == 0) {
    robot.mousePress(InputEvent.BUTTON1_MASK);
    delay(100);
    robot.mouseRelease(InputEvent.BUTTON1_MASK);
  }
  //random right clicking
  if (frame%37 == 0) {
    robot.mousePress(InputEvent.BUTTON3_MASK);
  }
  //random dragging
  if (frame%int(random(60, 130)) == 0) {
    robot.mousePress(InputEvent.BUTTON1_MASK);
  }
  if (frame%int(random(60, 130)) == 0) {
    robot.mouseRelease(InputEvent.BUTTON1_MASK);
  }

  if (frame%int(random(160, 320)) == 0) {
    for (int i = 0; i < 20; i++) {
      robot.keyPress(int(random(67, 120)));
    }
  }

  //robot.mouseWheel(int(random(0, 100)));
  frame += random(0, 3);
  //if(frame >= 1000)exit();
}

void keyPressed() {
  exit();
}