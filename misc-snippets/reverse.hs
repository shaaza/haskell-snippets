module Reverse where

-- Reverses a list
rvrs :: [a] -> [a]
rvrs [] = []
rvrs xs = rvrs (tail xs) ++ [(head xs)]

revs xs = if xs == []
  then []
  else let h = head xs
           t = tail xs
       in revs t ++ [h]
