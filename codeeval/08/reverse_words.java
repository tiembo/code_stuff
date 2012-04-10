import java.io.*;

public class reverse_words {
  public static void main(String[] args) throws IOException {
    File file = new File(args[0]);
    BufferedReader in = new BufferedReader(new FileReader(file));
    String line;
    while ((line = in.readLine()) != null) {
      String[] lineArray = line.split(" ");
      if (lineArray.length > 0) {
        System.out.println(reverseWords(lineArray));
      }
    }
  }

  private static String reverseWords(String[] words) {
    String str = "";

    for (int i = words.length - 1; i > 0; i--) {
      str += words[i] + " ";
    }

    return str + words[0];
  }
}