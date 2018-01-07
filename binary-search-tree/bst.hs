module BinarySearchTree where
-- A self-balancing integer binary search tree that doesn't allow duplicates (this only unique node values).

data Tree a = Nil | Node (Tree a) a (Tree a) deriving Show

insert :: Tree Int -> Int -> Tree Int
insert Nil number = Node Nil number Nil
insert (Node lt val rt) number
  | number == val = Node lt val lt
  | number < val = Node (insert lt number) val rt
  | number > val = Node lt val (insert rt number)

-- search returns a boolean indicating whether the number exists in the tree.
search :: Tree Int -> Int -> Bool
search Nil number = False
search (Node lt val rt) number
  | number == val = True
  | number < val = search lt number
  | number > val = search rt number

-- creates a new Btree from a list of integers
bstFromList :: [Int] -> Tree Int
bstFromList lst = foldl insert Nil lst
