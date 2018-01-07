module BinarySearchTree where
-- A self-balancing integer binary search tree that doesn't allow duplicates.

data Tree a = Nil | Node (Tree a) a (Tree a) deriving Show

-- search :: Tree -> Int -> Bool
insert :: Tree Int -> Int -> Tree Int

insert Nil number = Node Nil number Nil
insert (Node lt val rt) number
  | number == val = Node lt val lt
  | number < val = Node (insert lt number) val rt
  | number > val = Node lt val (insert rt number)
