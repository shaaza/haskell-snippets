module RedBlackTree where
-- A self-balancing integer binary search tree (red-black tree) that doesn't allow duplicates (this only unique node values).

import Data.List.Split (linesBy)
import Data.List (intercalate)

-- Nil Tree is considered to be black
data Color = R | B deriving Show
data Tree a = Nil | Node Color (Tree a) a (Tree a) deriving Show

-- We force the root to be black, so we use a helper function: ins.
ins :: Tree Int -> Int -> Tree Int
ins Nil x = Node R Nil x Nil
ins (Node c lt n rt) x
  | x == n = Node c lt n lt
  | x < n = balance (Node c (ins lt x) n rt)
  | x > n = balance (Node c lt n (ins rt x))

blackenRoot :: Tree Int -> Tree Int
blackenRoot (Node _ l i r) = Node B l i r

insert x i = blackenRoot (ins x i)

-- search returns a boolean indicating whether the number exists in the BST.
search :: Tree Int -> Int -> Bool
search Nil _ = False
search (Node _ lt n rt) x
  | x == n = True
  | x < n = search lt x
  | x > n = search rt x

-- smallest returns the smallest value in the BST
smallest :: Tree Int -> Int
smallest Nil = 0
smallest (Node _ Nil n Nil) = n
smallest (Node _ Nil n _) = n
smallest (Node _ lt n rt) = smallest lt


-- balance
balance :: Tree Int -> Tree Int
balance (Node B (Node R (Node R ccl cci ccr) ci cr) i r) = Node R (Node B ccl cci ccr) ci (Node B cr i r)
balance (Node B (Node R cl ci (Node R ccl cci ccr)) i r) = Node R (Node B cl ci ccl) cci (Node B ccr i r)
balance (Node B l i (Node R cl ci (Node R ccl cci ccr))) = Node R (Node B l i cl) ci (Node B ccl cci ccr)
balance (Node B l i (Node R (Node R ccl cci ccr) ci cr)) = Node R (Node B l i ccl) cci (Node B ccr ci cr)
balance x = x

-- largest
largest :: Tree Int -> Int
largest Nil = 0
largest (Node _ Nil n Nil) = n
largest (Node _ _ n Nil) = n
largest (Node _ lt n rt) = largest rt

-- creates a new BST from a list of integers
bstFromList :: [Int] -> Tree Int
bstFromList lst = foldl insert Nil lst

-- depth of the BST
depth :: Tree Int -> Int
depth Nil = 0
depth (Node _ lt n rt) = 1 + max (depth lt) (depth rt)

-- delete a number x from the BST and return the tree. The delete is idempotent without checks.
delete :: Tree Int -> Int -> Tree Int
delete Nil _ = Nil
delete (Node c Nil n Nil) x
  | x == n = Nil
  | otherwise = Node c Nil n Nil

delete (Node c lt n rt) x
  | x < n = Node c (delete lt x) n rt
  | x > n = Node c lt n (delete rt x)
  | x == n = Node c lt (smallest rt) (delete rt (smallest rt))

pprint :: Tree Int -> String
pprint Nil = "Nil\n\n"
pprint (Node c l i r) = show i ++
                        "\n" ++
                        "|" ++
                        "\n" ++
                        "--" ++
                        intercalate "\n" (map ("| " ++) (linesBy (== '\n') ("--L " ++ (pprint l)))) ++
                        concat ((take $ (+) (depth l) 1) (repeat "|\n")) ++
                        "--" ++
                        intercalate "\n" (map ("| " ++) (linesBy (== '\n') ("--R " ++ (pprint r))))
