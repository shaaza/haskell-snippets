module BinarySearchTree where
-- A self-balancing integer binary search tree that doesn't allow duplicates (this only unique node values).

data Tree a = Nil | Node (Tree a) a (Tree a) deriving Show

insert :: Tree Int -> Int -> Tree Int
insert Nil number = Node Nil number Nil
insert (Node lt val rt) number
  | number == val = Node lt val lt
  | number < val = Node (insert lt number) val rt
  | number > val = Node lt val (insert rt number)

-- search returns a boolean indicating whether the number exists in the BST.
search :: Tree Int -> Int -> Bool
search Nil _ = False
search (Node lt val rt) number
  | number == val = True
  | number < val = search lt number
  | number > val = search rt number

-- creates a new BST from a list of integers
bstFromList :: [Int] -> Tree Int
bstFromList lst = foldl insert Nil lst

-- depth of the BST
depth :: Tree Int -> Int
depth Nil = 0
depth (Node lt val rt) = 1 + max (depth lt) (depth rt)
