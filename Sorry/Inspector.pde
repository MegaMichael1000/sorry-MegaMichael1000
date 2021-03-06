public class Inspector extends BoardItem {
  
  protected int playerId;
  protected int spacesLeft;
  protected boolean safetyZone;
  protected int[][] redData = {
    {8  ,7  ,6  ,65 ,64 ,63 ,62 ,61 ,60 ,59 ,58 ,57 ,56 ,55 ,54 ,53},
    {9  ,0  ,5  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,52},
    {10 ,0  ,4  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,51},
    {11 ,0  ,3  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,50},
    {12 ,0  ,2  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,49},
    {13 ,0  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,48},
    {14 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,47},
    {15 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,46},
    {16 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,45},
    {17 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,44},
    {18 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,43},
    {19 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,42},
    {20 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,41},
    {21 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,40},
    {22 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,39},
    {23 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 ,32 ,33 ,34 ,35 ,36 ,37 ,38}
  };
  protected int[][] blueData = {
    {23 ,22 ,21 ,20 ,19 ,18 ,17 ,16 ,15 ,14 ,13 ,12 ,11 ,10 ,9  ,8},
    {24 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,7},
    {25 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,1  ,2  ,3  ,4  ,5  ,6},
    {26 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,65},
    {27 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,64},
    {28 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,63},
    {29 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,62},
    {30 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,61},
    {31 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,60},
    {32 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,59},
    {33 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,58},
    {34 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,57},
    {35 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,56},
    {36 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,55},
    {37 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,54},
    {38 ,39 ,40 ,41 ,42 ,43 ,44 ,45 ,46 ,47 ,48 ,49 ,50 ,51 ,52 ,53}
  };
  protected int[][] yellowData = {
    {38 ,37 ,36 ,35 ,34 ,33 ,32 ,31 ,30 ,29 ,28 ,27 ,26 ,25 ,24 ,23},
    {39 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,22},
    {40 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,21},
    {41 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,20},
    {42 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,19},
    {43 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,18},
    {44 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,17},
    {45 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,16},
    {46 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,15},
    {47 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,14},
    {48 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,1  ,0  ,13},
    {49 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,2  ,0  ,12},
    {50 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,3  ,0  ,11},
    {51 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,4  ,0  ,10},
    {52 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,5  ,0  ,9},
    {53 ,54 ,55 ,56 ,57 ,58 ,59 ,60 ,61 ,62 ,63 ,64 ,65 ,6  ,7  ,8}
  };
  protected int[][] greenData = {
    {53 ,52 ,51 ,50 ,49 ,48 ,47 ,46 ,45 ,44 ,43 ,42 ,41 ,40 ,39 ,38},
    {54 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,37},
    {55 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,36},
    {56 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,35},
    {57 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,34},
    {58 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,33},
    {59 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,32},
    {60 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,31},
    {61 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,30},
    {62 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,29},
    {63 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,28},
    {64 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,27},
    {65 ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,26},
    {6  ,5  ,4  ,3  ,2  ,1  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,25},
    {7  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,0  ,24},
    {8  ,9  ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21 ,22 ,23}
  };
  protected int[][] spaceMap;
  
  Inspector(int rowAt, int colAt, int playerId, boolean safetyZone) {
    super(rowAt,colAt);
    this.playerId = playerId;
    this.safetyZone = safetyZone;
    switch(playerId) {
      case 0:
        spaceMap = redData;
        spacesLeft = spaceMap[rowId][colId];
        break;
      case 1:
        spaceMap = blueData;
        spacesLeft = spaceMap[rowId][colId];
        break;
      case 2:
        spaceMap = yellowData;
        spacesLeft = spaceMap[rowId][colId];
        break;
      case 3:
        spaceMap = greenData;
        spacesLeft = spaceMap[rowId][colId];
        break;
    }
  }
  
  public void moveForward(int value) {
    for (int i=0; i<value; i++) {
      if (safetyZone) {
        switch (playerId) {
          case 0:
            moveRow(1);
            break;
          case 1:
            moveCol(-1);
            break;
          case 2:
            moveRow(-1);
            break;
          case 3:
            moveCol(1);
            break;
        }
      } else {
        if (rowId == 0 && colId != 15) {
          if (colId == 2 && playerId == 0) {
            moveRow(1);
            safetyZone = true;
          } else {
            moveCol(1);
          }
        } else if (colId == 15 && rowId != 15) {
          if (rowId == 2 && playerId == 1) {
            moveCol(-1);
            safetyZone = true;
          } else {
            moveRow(1);
          }
        } else if (rowId == 15 && colId != 0) {
          if (colId == 13 && playerId == 2) {
            moveRow(-1);
            safetyZone = true;
          } else {
            moveCol(-1);
          }
        } else if (colId == 0 && rowId != 0) {
          if (rowId == 13 && playerId == 3)  {
            moveCol(1);
            safetyZone = true;
          } else {
            moveRow(-1);
          }
        }
      }
    }
  }
  
  public void moveBackward(int value) {
    for (int i=0; i<value; i++) {
      if (safetyZone) {
        switch (playerId) {
          case 0:
            moveRow(-1);
            if (rowId == 0)
              safetyZone = false;
            break;
          case 1:
            moveCol(1);
            if (colId == 15)
              safetyZone = false;
            break;
          case 2:
            moveRow(1);
            if (rowId == 15)
              safetyZone = false;
            break;
          case 3:
            moveCol(-1);
            if (colId == 0)
              safetyZone = false;
            break;
        }
      } else {
        if (rowId == 0 && colId != 0) {
          moveCol(-1);
        } else if (colId == 0 && rowId != 15) {
          moveRow(1);
        } else if (rowId == 15 && colId != 15) {
          moveCol(1);
        } else if (colId == 15 && rowId != 0) {
          moveRow(-1);
        }
      }
    }
  }
  
  public int spacesRemaining() {return spaceMap[rowId][colId];}
  public int getId() {return playerId;}
  
  public void show(int xAt, int yAt, int cellSize) {
    pushMatrix();
    noStroke();
    fill(0);
    translate(xAt,yAt);
    rectMode(CORNER);
    ellipse(cellSize/1.92,cellSize/1.92,cellSize/2,cellSize/2);
    popMatrix();
  }
  
}
