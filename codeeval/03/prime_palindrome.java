public class prime_palindrome {
  public static void main(String[] args) {
    for (int i = 1000; i > 0; i--) {
      if (isPalindrome(String.valueOf(i)) && isPrime(i)) {
        System.out.println(i);
        break;
      }
    }
  }

  // borrowed from the Internet.  Why doesn't Java have this?
  private static boolean isPrime(long n) {
    if(n < 2) return false;
    if(n == 2 || n == 3) return true;
    if(n%2 == 0 || n%3 == 0) return false;
    long sqrtN = (long)Math.sqrt(n)+1;
    for(long i = 6L; i <= sqrtN; i += 6) {
      if(n%(i-1) == 0 || n%(i+1) == 0) return false;
    }
    return true;
  }

  private static boolean isPalindrome(String str) {
    return str.equals(reverseString(str));
  }

  private static String reverseString(String str) {
    StringBuilder sb = new StringBuilder();
    for(int i = str.length() - 1; i >= 0; i--) {
      sb.append(str.charAt(i));
    }
    return sb.toString();
  }
}