-- Said Kadrioski <said@kadrioski.de>

names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

-- Solution works with double entries as well.
-- names = ["Rajesh", "Howard", "Sheldon", "Sheldon", "Leonhard", "Penny", "Penny"]
labeledNames = map (, 1) names

-- The Problem at hand.
doubleCola :: Int -> [String] -> [String]
doubleCola n [] = []
doubleCola 0 (x:xs) = x:xs
doubleCola n (x:xs) = doubleCola (n-1) $ xs ++ [x, x]

-- How to get name after nth iteration?
--
-- Using BruteForce 
getCola :: Int -> [String] -> String
getCola n l = head $ doubleCola n l

-- Using my mathematical formula.
getColaa :: Int -> [String] -> String
getColaa n l = l !! formi n (length l)

--
-- This is my important formula
formi :: Int -> Int -> Int
formi n m = mod d2 m 
  where g = n+m
        d0 = div g m
        d1 = floor $ logBase 2 (fromIntegral d0)
        d2 = div g (2^d1)

-- Test. Is not a proof, just visual "confirmation" that my formula works.
test = and $ zipWith (==) listA listB
  where longList = [1..2222]
        listA = map (`getCola` names) longList
        listB = map (`getColaa` names) longList
