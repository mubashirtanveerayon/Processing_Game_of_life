String aliveState="#";
String deadState=".";

final String outputFile="data/output.txt";
final String inputFile="data/input.txt";

int[][] readFile() {
  String lines[] = loadStrings(inputFile);
  int cols = lines[0].length();
  int rows = lines.length;
  int[][] cells = new int[cols][rows];
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      try {
        if (lines[j].charAt(i) == aliveState.charAt(0)) {
          cells[i][j] = 1;
        }
      }
      catch(Exception ex) {
        println(i, j);
      }
    }
  }
  return cells;
}

void saveToFile(int[][] cells) {
  PrintWriter output = createWriter(outputFile);

  int cols = cells.length;
  int rows = cells[0].length;
  for (int j=0; j<rows; j++) {
    int[] col = new int[cols];
    for (int i=0; i<cols; i++) {
      col[i] = cells[i][j];
    }
    output.println(toStringLine(col));
  }

  output.flush();
  output.close();
}

String toStringLine(int[] row) {
  String line="";
  for (int cell : row) {
    line+=cell==1?aliveState:deadState;
  }
  return line;
}
