import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

class Scratch {
    public static void main(String[] args) throws IOException {
        File inputFile = new File("D:/fun/adventOfCode2022_puzzle8.txt");
        BufferedReader br = new BufferedReader(new FileReader(inputFile));

        String line;
        Integer[][] grove = null;

        int lineNumber = 0;
        while ((line = br.readLine()) != null) {
            if (grove == null) {
                grove = new Integer[line.length()][line.length()];
            }
            for (int i = 0; i < line.length(); i++) {
                grove[lineNumber][i] = new Integer(line.charAt(i) + "");
            }
            lineNumber++;
        }

        int visibleTrees = 0;
        int edges = 0;

        for (int x = 0; x < grove.length; x++) {
            for (int y = 0; y < grove.length; y++) {
                if (x == 0 || y == 0 || x == grove.length - 1 || y == grove.length - 1) {
                    visibleTrees++;
                    edges++;
                } else {
                    boolean isVisible = true;

                    Integer myTreeHeight = grove[x][y];
                    boolean visibleRight = true;
                    boolean visibleLeft = true;
                    boolean visibleUp = true;
                    boolean visibleDown = true;

                    for (int i = x + 1; i <= grove.length - 1; i++) {
                        if (grove[i][y] >=  myTreeHeight) {
                            visibleRight = false;
                            break;
                        }
                    }
                    for (int i = x - 1; i >= 0; i--) {
                        if (grove[i][y] >= myTreeHeight) {
                            visibleLeft = false;
                            break;
                        }
                    }
                    for (int i = y - 1; i >= 0; i--) {
                        if (grove[x][i] >= myTreeHeight) {
                            visibleUp = false;
                            break;
                        }
                    }
                    for (int i = y + 1; i <= grove.length - 1; i++) {
                        if (grove[x][i] >= myTreeHeight) {
                            visibleDown = false;
                            break;
                        }
                    }
                    isVisible = visibleUp || visibleDown || visibleLeft || visibleRight;
                    if (isVisible) {
                        visibleTrees++;
                    }
                }
            }
        }

        System.out.println(visibleTrees);
    }
}