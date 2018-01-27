module BinarySearchTree where
-- An integer binary search tree that doesn't allow duplicates (this only unique node values).

import Data.List.Split (linesBy)
import Data.List (intercalate)

data Tree a = Nil | Node (Tree a) a (Tree a) deriving Show

insert :: Tree Int -> Int -> Tree Int
insert Nil x = Node Nil x Nil
insert (Node lt n rt) x
  | x == n = Node lt n lt
  | x < n = Node (insert lt x) n rt
  | x > n = Node lt n (insert rt x)

-- search returns a boolean indicating whether the number exists in the BST.
search :: Tree Int -> Int -> Bool
search Nil _ = False
search (Node lt n rt) x
  | x == n = True
  | x < n = search lt x
  | x > n = search rt x

-- smallest returns the smallest value in the BST
smallest :: Tree Int -> Int
smallest Nil = 0
smallest (Node Nil n Nil) = n
smallest (Node Nil n _) = n
smallest (Node lt n rt) = smallest lt

-- largest
largest :: Tree Int -> Int
largest Nil = 0
largest (Node Nil n Nil) = n
largest (Node _ n Nil) = n
largest (Node lt n rt) = largest rt

-- creates a new BST from a list of integers
bstFromList :: [Int] -> Tree Int
bstFromList lst = foldl insert Nil lst

-- depth of the BST
depth :: Tree Int -> Int
depth Nil = 0
depth (Node lt n rt) = 1 + max (depth lt) (depth rt)

-- delete a number x from the BST and return the tree. The delete is idempotent without checks.
delete :: Tree Int -> Int -> Tree Int
delete Nil _ = Nil
delete (Node Nil n Nil) x
  | x == n = Nil
  | otherwise = Node Nil n Nil

delete (Node lt n rt) x
  | x < n = Node (delete lt x) n rt
  | x > n = Node lt n (delete rt x)
  | x == n = Node lt (smallest rt) (delete rt (smallest rt))

pprint :: Tree Int -> String
pprint Nil = "Nil\n\n"
pprint (Node l i r) = show i ++
                           "\n" ++
                           "|" ++
                           "\n" ++
                           "--" ++
                           intercalate "\n" (map ("| " ++) (linesBy (== '\n') ("--L " ++ (pprint l)))) ++
                           concat ((take . depth $ l) (repeat "|\n")) ++
                           "--" ++
                           intercalate "\n" (map ("| " ++) (linesBy (== '\n') ("--R " ++ (pprint r))))
