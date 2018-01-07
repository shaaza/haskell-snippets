module BinarySearchTree where
-- A self-balancing integer binary search tree that doesn't allow duplicates.

data Tree a = Nil | Node (Tree a) a (Tree a) deriving Show

insert :: Int -> Tree Int -> Tree Int
insert number Nil = Node Nil number Nil
insert number (Node lt val rt)
  | number == val = Node lt val lt
  | number < val = Node (insert number lt) val rt
  | number > val = Node lt val (insert number rt)

-- search returns a boolean indicating whether the number exists in the tree.
search :: Tree Int -> Int -> Bool
search Nil number = False
search (Node lt val rt) number
  | number == val = True
  | number < val = search lt number
  | number > val = search rt number

-- creates a new Btree from a list/Foldable
bstFromList :: [Int] -> Tree Int
bstFromList lst = foldr insert Nil lst
