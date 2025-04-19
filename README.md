# Description
Due to copyright reasons I will provide the link of the puzzle
in the [references section](#references).

# Run the program
This program should be run
with [ghci](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html).

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

Let's differentiate different entries solely by different origins.
That means if we had two entries deriving from the same origin, they'd be equivalent.
This is a bit different to simply grouping names together.

Now my conclusions:
- To get from one name to another you need to do a certain number of iterations.
  These we will call "gaps".
- Firstly, we know the gap between names at the beginning is one,
  because you need exactly one step to get from one name to another.
- Secondly, we know after each traversal of the list, we increase the gap-size by itself,
  due to us duplicating each name.

Therefore, the gaps are growing in powers of two.

One can correlate this behaviour with a binary tree. Just like finding the parent node
of e.g. an array-encoded heap, we can simply use the  logarithm to find the origin of
the front element after a given number of iterations. Because the list of names at
the beginning is not 1, we can imagine having many binary trees encoded at once that
share the same array. We can account for that and receive our formula.

# References
https://codeforces.com/problemset/problem/82/A
