using System;
using System.Collections.Generic;

public class Program
{
    public static void Main()
    {
        var fibs = new List<int>();
        for (int i = 0; i < 10; ++i)
        {
            if (i < 2)
            {
                fibs.Add(1);
            }
            else
            {
                fibs.Add(fibs[i-1] + fibs[i-2]);
            }
        }

        for (int i = 0; i < fibs.Count; ++i)
        {
            Console.WriteLine(string.Format("Fib({0}) = {1}",i,fibs[i]));
        }
    }
}

