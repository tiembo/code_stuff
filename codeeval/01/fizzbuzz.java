import java.io.*;

public class fizzbuzz {
  public static void main (String[] args) throws IOException {
    File file = new File(args[0]);
    BufferedReader in = new BufferedReader(new FileReader(file));
    String line;
    while ((line = in.readLine()) != null) {
      String[] lineArray = line.split(" ");
      if (lineArray.length > 0) {
        System.out.println(getFizzBuzzString(lineArray));
      }
    }
  }

  private static String getFizzBuzzString(String[] lineAry) {
    Integer fizz = Integer.valueOf(lineAry[0]);
    Integer buzz = Integer.valueOf(lineAry[1]);
    Integer limit = Integer.valueOf(lineAry[2]);

    String str = "";
    for (int i = 1; i <= limit; i++) {
      if (i % (fizz * buzz) == 0) {
        str += "FB ";
      } else if (i % fizz == 0) {
        str += "F ";
      } else if (i % buzz == 0) {
        str += "B ";
      } else {
        str += i + " ";
      }
    }
    return str;
  }
}