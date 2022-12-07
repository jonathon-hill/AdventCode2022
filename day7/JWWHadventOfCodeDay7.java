
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

class Scratch {

    public static void main(String[] args) throws IOException {

        File inputFile = new File("D:/fun/adventOfCode2022_puzzle7.txt");
        BufferedReader br = new BufferedReader(new FileReader(inputFile));

        String changeDirCommand = "$ cd ";
        Pattern fileNamePattern = Pattern.compile("(\\d+) ([\\w\\\\.]+)");
        Pattern fileSizePattern = Pattern.compile("\\d+");
        String upLevel = "..";
        String topLevel = "/";

        String line;

        List<Directory> dirs = new ArrayList<>();
        Directory rootDirectory = null;

        Directory currentDirectory = null;
        while ((line = br.readLine()) != null) {
            try {
                if (line.startsWith(changeDirCommand)) {
                    String directoryName = line.replace(changeDirCommand, "");
                    if (currentDirectory == null) {
                        currentDirectory = new Directory(directoryName, null, 0);
                        rootDirectory = currentDirectory;
                        dirs.add(currentDirectory);
                    } else if (directoryName.equals(upLevel)) {
                        currentDirectory = currentDirectory.getPrevious() != null ? currentDirectory.getPrevious() : currentDirectory;
                    } else if (directoryName.equals(topLevel)) {
                        currentDirectory = rootDirectory;
                    } else {
                        currentDirectory = new Directory(directoryName, currentDirectory, 0);
                        dirs.add(currentDirectory);
                    }
                } else if (fileNamePattern.matcher(line).matches() && currentDirectory != null) {
                    Matcher matcher = fileSizePattern.matcher(line);
                    if (matcher.find()) {
                        String fileSize = matcher.group();
                        Integer numericFileSize = new Integer(fileSize);
                        currentDirectory.addSize(numericFileSize);
                        Directory previousDir = currentDirectory.getPrevious();
                        while (previousDir != null) {
                            previousDir.addSize(numericFileSize);
                            previousDir = previousDir.getPrevious();
                        }
                    }
                }
            } catch (IllegalStateException ise) {
                System.out.println(line);
            }
        }

        Integer totalSizeOfDisk = 70000000;
        Integer spaceINeed = 30000000;
        Integer availableSpaceOnDisk = totalSizeOfDisk - rootDirectory.getSize();

        Integer smallestImpact = totalSizeOfDisk;

        for (Directory dir : dirs) {
            if (availableSpaceOnDisk + dir.getSize() > spaceINeed) {
                if (dir.getSize() < smallestImpact) {
                    smallestImpact = dir.getSize();
                }
            }
        }
        System.out.println(smallestImpact);

    }

    static class Directory {
        private String directoryName;
        private Directory previous;
        private Integer size;

        public Directory(String directoryName, Directory previous, Integer size) {
            this.directoryName = directoryName;
            this.previous = previous;
            this.size = size;
        }

        public String getDirectoryName() {
            return directoryName;
        }

        public Directory getPrevious() {
            return previous;
        }

        public Integer getSize() {
            return size;
        }

        public void addSize(Integer sizeToAdd) {
            this.size += sizeToAdd;
        }

        public String toString() {
            return String.format("%s - %d", directoryName, size);
        }
    }
}