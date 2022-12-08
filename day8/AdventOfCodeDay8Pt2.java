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

        int bestView = 0;
        for (int x = 0; x < grove.length; x++) {
            for (int y = 0; y < grove.length; y++) {

                    Integer myTreeHeight = grove[x][y];

                    int rightVal = 0;
                    int leftVal = 0;
                    int upVal = 0;
                    int downVal = 0;

                    for (int i = x + 1; i <= grove.length - 1; i++) {
                        if (grove[i][y] <=  myTreeHeight) {
                            rightVal++;
                        }
                        if (grove[i][y] >= myTreeHeight) {
                            break;
                        }
                    }
                    for (int i = x - 1; i >= 0; i--) {
                        if (grove[i][y] <= myTreeHeight) {
                            leftVal++;
                        }
                        if (grove[i][y] >= myTreeHeight) {
                            break;
                        }
                    }
                    for (int i = y - 1; i >= 0; i--) {
                        if (grove[x][i] <= myTreeHeight) {
                            upVal++;
                        }
                        if (grove[x][i] >= myTreeHeight) {
                            break;
                        }
                    }
                    for (int i = y + 1; i <= grove.length - 1; i++) {
                        if (grove[x][i] <= myTreeHeight) {
                            downVal++;
                        }
                        if (grove[x][i] >= myTreeHeight) {
                            break;
                        }
                    }

                int treeVal = rightVal * leftVal * upVal * downVal;
                if (treeVal > bestView)
                    bestView = treeVal;
            }
        }

        System.out.println(bestView);
    }
}