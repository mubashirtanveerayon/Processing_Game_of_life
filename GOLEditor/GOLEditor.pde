int cols, rows, resolution=20;

int[][] cellGrid;

void setup() {
  size(400, 400);

  cols = width/resolution;
  rows = height/resolution;

  cellGrid = new int[cols][rows];
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  strokeWeight(1);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      fill(cellGrid[i][j]*255);
      rect(i * resolution, j*resolution, resolution-1, resolution-1);
    }
  }
}

void mousePressed() {

  int x = mouseX/cols;
  int y = mouseY/rows;

  if (cellGrid[x][y] == 1) {
    cellGrid[x][y] = 0;
  } else {
    cellGrid[x][y] = 1;
  }
}

void keyPressed(){
 if(key == 's'){
  saveToFile(cellGrid); 
 }
}
