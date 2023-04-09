/*
6,113,046 Prime Numbers found and checked so far:

Binary Primes v0.02 - by Moose OMalley

java.version : 1.8.0_345
32/64 bit:     x64

Prime Numbers that contain only binary (0, 1) digits (I call these 'Binary Primes'):
1, 11, 101, 10111, 101111, 1011001, 1100101, 10010101, 10011101, 10100011, 10101101, 10110011, 10111001, 11000111, 11100101, 11110111, 11111101, 100100111, 100111001, 101001001, 101001011, 101100011, 101101111, 101111011, 101111111, 110010101, 110101001, 110111011, 111000101, 111001001, 111010111,
-> 31 values listed.

Convert these 'Binary Primes' from Binary -> Decimal:
1, 3, 5, 23, 47, 89, 101, 149, 157, 163, 173, 179, 185, 199, 229, 247, 253, 295, 313, 329, 331, 355, 367, 379, 383, 405, 425, 443, 453, 457, 471,
-> 31 values listed.

Interesting points:

(1). the 7th "Binary Primes" in the sequence (101) is also a Binary Prime.

(2). the first 12 "Binary Primes" in the sequence are also prime numbers.  The 13th number, 185, is not prime.

(3). These "Binary Primes" are not primes: 185, 247, 253, 295, 329, 355,

(4). 6 of the 25 "Binary Primes" in the sequence (so far) are NOT prime (19 are prime, approx 75%).

I wish I had more primes to search further.  My existing primes data file is a file I generated (using my own Java program), and it contains only the first 6,113,046 Prime Numbers found and checked so far.  This file is 58 MB.  Need more data.  Need to download a big primes data file from the internet.

*/

import java.io.File;
import java.util.Scanner;
import java.util.ArrayList;

public class BinaryPrimes
{
   static ArrayList<String> binaryPrimesArrayList        = new ArrayList<>();
   static ArrayList<String> binaryPrimesDecimalArrayList = new ArrayList<>();


   public static boolean isBinaryString (String inStr)
   {
      boolean result = true; // And try and prove otherwise

      inStr = inStr.trim();

      for (int k = 0; k < inStr.length(); k++)
      {
         if ((inStr.charAt (k) != '0') && (inStr.charAt (k) != '1') )
         {
            result = false;    // Char is not a 1 or a 0
            k =inStr.length(); // Exit loop
         }
      }

      return result;
   }

   public static void listBinaryPrimes ()
   {
      binaryPrimesArrayList.clear();
      binaryPrimesDecimalArrayList.clear();

      try (Scanner inFile = new Scanner (new File ("PrimeNumber__found.txt") ) )
      {
         while (inFile.hasNext() == true)
         {
            String inNumberStr = inFile.nextLine().trim();

            if (isBinaryString (inNumberStr) == true)
            {
               int decValue = Integer.parseUnsignedInt (inNumberStr, 2);
               //System.out.print (decValue + ", ");
               //System.out.print (inNumberStr + ", ");

               binaryPrimesArrayList.add        (inNumberStr);
               binaryPrimesDecimalArrayList.add ("" + decValue);
            }
         }
      }
      catch (Exception err)
      {
         err.printStackTrace();
      }
   }

   public static void listArrayList (ArrayList<String> arrayList, String delimiterStr)
   {
      for (int k = 0; k < arrayList.size(); k++)
      {
         System.out.print (arrayList.get(k) + delimiterStr);
      }

      if (arrayList.size() > 0)
         System.out.println ();

      System.out.println ("-> " + arrayList.size() + " values listed.");
   }

   public static void main(String[] args)
   {
      System.out.println("Binary Primes v0.02 - by Moose OMalley");
      System.out.println();
      System.out.println("java.version : "  + System.getProperty ("java.version"));
      System.out.println("32/64 bit:     x" + System.getProperty ("sun.arch.data.model") );

      listBinaryPrimes ();

      System.out.println ();
      System.out.println ("Prime Numbers that contain only binary (0, 1) digits (I call these 'Binary Primes'):");
      listArrayList (binaryPrimesArrayList, ", ");

      System.out.println ();
      System.out.println ("Convert these 'Binary Primes' from Binary -> Decimal:");
      listArrayList (binaryPrimesDecimalArrayList, ", ");

      System.out.println ();
   }
}