import com.google.common.collect.Sets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

class Scratch {
    public static void main(String[] args) throws IOException {
        String noopCommand = "noop";
        String addXCommand = "addx ";
        int x = 1;
        int cycle = 1;

        File file = new File("D:\\fun\\adventOfCode2022_puzzle10.txt");
        BufferedReader br = new BufferedReader(new FileReader(file));
        String st;
        while ((st = br.readLine()) != null) {
            if (st.equals(noopCommand)) {
                if (cycle == x || cycle == x - 1 || cycle == x + 1) {
                    System.out.print('#');
                } else {
                    System.out.print(' ');
                }
                cycle++;
                if (cycle > 40) {
                    System.out.println();
                    cycle = 1;
                }
            } else {
                if (cycle == x || cycle == x - 1 || cycle == x + 1) {
                    System.out.print('#');
                } else {
                    System.out.print(' ');
                }
                cycle++;
                if (cycle > 40) {
                    System.out.println();
                    cycle = 1;
                }
                st = st.replace(addXCommand, "");
                x += new Integer(st);
                if (cycle == x || cycle == x - 1 || cycle == x + 1) {
                    System.out.print('#');
                } else {
                    System.out.print(' ');
                }
                cycle++;
                if (cycle > 40) {
                    System.out.println();
                    cycle = 1;
                }
            }


        }
    }
}