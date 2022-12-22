import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

class Scratch {
    public static void main(String[] args) throws IOException {
        File file = new File("D:\\fun\\adventOfCode2022_puzzle9.txt");
        BufferedReader br = new BufferedReader(new FileReader(file));
        String st;
        Set<Location> tailLocations = new HashSet<>();
        int x = 0;
        int y = 0;
        Location tailLocation = new Location(x, y);
        tailLocations.add(tailLocation);
        while((st = br.readLine()) != null) {
            String[] directions = st.split(" ");
            Integer steps = Integer.valueOf(directions[1]);
            for (int i = 0; i < steps; i++) {
                if (directions[0].equals("U")) {
                    y += 1;
                } else if (directions[0].equals("R")) {
                    x += 1;
                } else if (directions[0].equals("D")) {
                    y -= 1;
                } else if (directions[0].equals("L")) {
                    x -= 1;
                }
                if (tailMustMove(tailLocation, x, y)) {
                    if (tailLocation.y == y - 2) {
                        //move up
                        tailLocation = new Location(x, tailLocation.y + 1);
                        tailLocations.add(tailLocation);
                    } else if (tailLocation.y == y + 2) {
                        //move down
                        tailLocation = new Location(x, tailLocation.y - 1);
                        tailLocations.add(tailLocation);
                    } else if (tailLocation.x == x - 2) {
                        //move right
                        tailLocation = new Location(tailLocation.x + 1, y);
                        tailLocations.add(tailLocation);
                    } else if (tailLocation.x == x + 2) {
                        //move left
                        tailLocation = new Location(tailLocation.x - 1, y);
                        tailLocations.add(tailLocation);
                    }
                }
            }
        }
        System.out.println(tailLocations.size());
    }

    public static boolean tailMustMove(Location tailLocation, Integer x, Integer y) {
        if (x >= tailLocation.x + 2 || y >= tailLocation.y + 2) {
            return true;
        } else return x <= tailLocation.x - 2 || y <= tailLocation.y - 2;
    }

    public static class Location {
        int x;
        int y;

        public Location(int x, int y) {
            this.x = x;
            this.y = y;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Location location = (Location) o;
            return x == location.x && y == location.y;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y);
        }
    }
}