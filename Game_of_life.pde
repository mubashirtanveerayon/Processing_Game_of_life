int cols,rows,resolution=20;

int[][] cells;

void setup(){
  size(400,400);
  
  
  
  //cols=width/resolution;
  //rows=height/resolution;
  //cells = new int[cols][rows];
  
  
  //for(int i=0;i<cols;i++){
  //  for(int j=0;j<rows;j++){
  //    cells[i][j] = floor(random(2));   
  //  }
  //}
  
  
  
  cells = readFile();
  cols = cells.length;
  rows = cells[0].length;
  
  
  frameRate(6);
  saveToFile(cells);
  //println(cols,rows);
}

void draw(){
  background(0);
  stroke(0,0,0);
  strokeWeight(1);
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      fill(cells[i][j]*255);
       rect(i * resolution,j*resolution,resolution-1,resolution-1);   
    }
  }
  
  saveFrame("data/images/####.png");
    
  int[][] newCells=new int[cols][rows];
  for(int i=0;i<cols;i++){
   for(int j=0;j<rows;j++){
     int aliveNeighbours = countAliveNeighbours(i,j);
     if(cells[i][j]==1){
        if(aliveNeighbours==2 || aliveNeighbours==3){
           newCells[i][j] = 1; 
        }
     }else{
        if(aliveNeighbours==3){
          newCells[i][j] = 1; 
        }
     }
   }
  }
  
  cells = copyCells(newCells);
  
}

int[][] copyCells(int[][] cells_){
 int[][] newCells = new int[cols][rows];
 for(int i=0;i<cols;i++){
   for(int j=0;j<rows;j++){
     newCells[i][j] = cells_[i][j];
   }
 }
 return newCells;
}

int countDeadNeighbours(int c,int r){
  int[] neighbours = getNeighbours(c,r);
  int dead=0;
  for(int n:neighbours){
   if(n==0){
    dead++; 
   }
  }
  return dead;
}

int countAliveNeighbours(int c,int r){
  int[] neighbours = getNeighbours(c,r);
  int alive=0;
  for(int n:neighbours){
   if(n==1){
    alive++; 
   }
  }
  return alive;
}

int[] getNeighbours(int c,int r){
    int[] neighbours = new int[8];
    neighbours[0] = cells[wrapCol(c-1)][wrapRow(r-1)];
    neighbours[1] = cells[c][wrapRow(r-1)];
    neighbours[2] = cells[wrapCol(c+1)][wrapRow(r-1)];
    neighbours[3] = cells[wrapCol(c-1)][r];
    neighbours[4] = cells[wrapCol(c+1)][r];
    neighbours[5] = cells[wrapCol(c-1)][wrapRow(r+1)];
    neighbours[6] = cells[c][wrapRow(r+1)];
    neighbours[7] = cells[wrapCol(c+1)][wrapRow(r+1)];
    return neighbours;
}

int wrapRow(int r){
  if(r<0){
    return rows-1;
  }else if(r>=rows){
   return 0; 
  }
  return r;
}

int wrapCol(int c){
  if(c<0){
    return cols-1;
  }else if(c>=cols){
   return 0; 
  }
  return c;
}
