import com.google.common.collect.Sets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Set;

class Scratch {
    public static void main(String[] args) throws IOException {
        String noopCommand = "noop";
        String addXCommand = "addx ";
        int x = 1;
        int cycle = 1;
        int solution = 0;

        Set<Integer> pertinentCycles = Sets.newHashSet(20, 60, 100, 140, 180, 220);

        File file = new File("D:\\fun\\adventOfCode2022_puzzle10.txt");
        BufferedReader br = new BufferedReader(new FileReader(file));
        String st;
        while ((st = br.readLine()) != null) {
            if (st.equals(noopCommand)) {
                cycle++;
                if (pertinentCycles.contains(cycle)) {
                    solution += cycle * x;
                }
            } else {
                cycle++;
                if (pertinentCycles.contains(cycle)) {
                    solution += cycle * x;
                }
                st = st.replace(addXCommand, "");
                cycle++;
                x += new Integer(st);
                if (pertinentCycles.contains(cycle)) {
                    solution += cycle * x;
                }
            }
        }
        System.out.println(solution);
    }
}