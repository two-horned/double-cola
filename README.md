# Description
Due to copyright reasons I will provide the link of the puzzle in the [references section](#references).

# Run the program
This program should be run with [ghci](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html).

If you're on a Unix-like just run
```
$ ghci solution.hs
ghci> getColaa arg1 arg2
```

The parameter `arg1` should be an integer value, `arg2` can be every list of strings,
you want to apply the problem on. I have predefined `names` as the list mentioned above,
so you can use that as `arg2` value.

# Solution
As far as I am concerned my solution is the first of it's kind, that has O(1) runtime,
due to me using my mathematical formula to determine each exact position with one calculation.

## Formula
Let $m := length_{startList}$.

Let $n := iterations$.

list-index $= \frac{n+m}{2^{\log_2 \lfloor (n+m) \div m \rfloor}} - m$

### How do we derive to my formula?

Let's differentiate different entries solely, if the point to another original value from our list at the beginning.
That means if we had two entries deriving from one, they'd be equivalent. This is different to grouping names together.

Now my conclusions:
- First we know the gap between names at the beginning is one, because you needed exactly one step to get from one name to another.
- Then, after we traversed the whole list, we increase the gap by itself, because we double each value.
- Therefore the gaps are growing in powers of two.

With this information I could recursively apply
these steps to derive the index from the length
of the list after computed procedure (which is iterations+list-length):

- step 1) if value is smaller than list length proceed. otherwise we (integer) divide by two and return to step 1).
- step 2) calculate value mod original list length. return value.

As you can see, because we repeatetly half the value till coniditions are met,
we can just search for a simple way to calculate a number close to one of base 2,
divide it and apply the modulo operator.

We can find the next best value, by dividing our total list length
by our original length. That way we get the average "gaps". Now we
calculate it's floor-logarithm and that's the log of the number we looked for.

Since the last modulo operation is always a value between m and 2m, we can just substract m.

# References
https://codeforces.com/problemset/problem/82/A
