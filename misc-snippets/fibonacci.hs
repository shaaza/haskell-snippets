module Fibonacci where
-- Fibonacci Sequence

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

fibList :: Int -> [Int]
fibList 1 = [0,1]
fibList n = (fibList (n - 1)) ++ (fibonacci n : [])
