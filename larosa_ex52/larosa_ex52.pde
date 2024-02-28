final int SIZE_X = 10, SIZE_Y = 10;
final int WEIGHT_MIN = 1, WEIGHT_MAX = 25;

enum StrokeMode {
  MOUSE, AUTO
}

int[][] lineMatrix;
int colorA, colorB;
float weightA, weightB;
StrokeMode strokeMode;

void setup() {
  size(800, 800);

  lineMatrix = generateMatrix(SIZE_X, SIZE_Y);
  colorA = color(0);
  colorB = color(0);
  strokeMode = StrokeMode.MOUSE;
}

void draw() {
  if (strokeMode == StrokeMode.MOUSE) {
    weightA = map(mouseY, 0, height, WEIGHT_MIN, WEIGHT_MAX);
    weightB = map(mouseX, 0, width, WEIGHT_MIN, WEIGHT_MAX);
  } else {
    float value = sin(map(frameCount, 0, 60, 0, 360));
    weightA = map(value, -1, 1, WEIGHT_MIN, WEIGHT_MAX);
    weightB = map(value, -1, 1, WEIGHT_MAX, WEIGHT_MIN);
  }

  background(255);
  drawMatrix(lineMatrix);
}

void mousePressed() {
  lineMatrix = generateMatrix(SIZE_X, SIZE_Y);
}

void keyTyped() {
  char letter = Character.toLowerCase(key);

  switch (letter) {
  case 'a':
    colorA = generateRandomColor();
    break;
  case 'b':
    colorB = generateRandomColor();
    break;
  case '0':
    colorA = color(0);
    colorB = color(0);
    break;
  case '1':
    strokeMode = StrokeMode.MOUSE;
    break;
  case '2':
    strokeMode = StrokeMode.AUTO;
    break;
  }
}
