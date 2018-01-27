## Binary Search Tree
There are two binary searhc tree (BST) implemenations, one is a self-balancing one (Red Black Tree) and the other is a normal one.
`bst.hs` contains the normal one, and `red_black_tree.hs` contaisn the self-balancing one. The details of each are mentioned in the corresponding docs below.

They are immutable and functional, and I'm not sure if it would be possible to implement them any other way in the Haskell programming language.

### Usage
For both of the implementations, you can create a BST from a list of integers with:

```lhs
bstFromList [1..10]
```

To print a representation of the list, use:
```lhs
putStr $ pprint $ bstFromList [1..20]
```

To see what a printed example looks like, see the [examples](#examples) section.

### API

For both BSTs, the following operations have been implemented:

*(all functions take a BST as their first argument)*
1. **insert**: given an integer, and returns the BST with the integer entered as a node in the BST.
2. **search**: checks if a number exists in the BST. O(log n).
3. **smallest**: returns the smallest number in the BST.
4. **largest**: returns the largest number in the BST.
5. **depth**: returns the maximum depth of the BST (no of nodes between the deepest leaf and the root node).
6. **delete**: deletes an element from the BST and returns the BST, maintaing the constrainst of the BST.

## Normal BST
This is the usual BST. However, the depth of the BST can be n if you create a tree using an ordered list of integers, and hence the lookup times can be `O(n)`. To get much better performance, use a self-balancing one.

## Red Black Tree
The Red Black BST is a self-balancing BST. Each node has a color, either Red or Black. This coloring is an aid to maintain the invariants:
1. No red node has a child node of red color.
2. The number of black nodes from the root to any leaf node is the same.

It can be proved that these two invariants, if enforced, can lead to a balanced BST, providing lookup and insert characteristics of `O(log n)` (due to the depth of the tree being `log n`).

Note that we have only 4 cases for the rotations instead of the 8 usual cases, since the tree is immutable and no extra performance benefit can be oozed out using the strategy with 8 cases. We also enforce the roots to be black, and all new nodes to be red.


## Examples

The balanced nature of the red black tree is evident from comparing how far to the right a pretty-printed representation of the normal BST and the red black tree extend.
### Red Black Tree

```
4
|
--| --L 2
| |
| --| --L 1
| | |
| | --| --L Nil
| | | |
| | --| --R Nil
| | | |
| |
| --| --R 3
| | |
| | --| --L Nil
| | | |
| | --| --R Nil
| | | |
|
|
|
|
--| --R 6
| |
| --| --L 5
| | |
| | --| --L Nil
| | | |
| | --| --R Nil
| | | |
| |
| |
| |
| --| --R 8
| | |
| | --| --L 7
| | | |
| | | --| --L Nil
| | | | |
| | | --| --R Nil
| | | | |
| | |
| | |
| | --| --R 9
| | | |
| | | --| --L Nil
| | | | |
| | | |
| | | --| --R 10
| | | | |
| | | | --| --L Nil
| | | | | |
| | | | --| --R Nil
| | | | |
```
### Normal BST

```
1
|
--| --L Nil
| |
|
|
|
|
|
|
|
|
|
--| --R 2
| |
| --| --L Nil
| | |
| |
| |
| |
| |
| |
| |
| |
| |
| --| --R 3
| | |
| | --| --L Nil
| | | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | --| --R 4
| | | |
| | | --| --L Nil
| | | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | --| --R 5
| | | | |
| | | | --| --L Nil
| | | | | |
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |
| | | | --| --R 6
| | | | | |
| | | | | --| --L Nil
| | | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | --| --R 7
| | | | | | |
| | | | | | --| --L Nil
| | | | | | | |
| | | | | | |
| | | | | | |
| | | | | | |
| | | | | | --| --R 8
| | | | | | | |
| | | | | | | --| --L Nil
| | | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | --| --R 9
| | | | | | | | |
| | | | | | | | --| --L Nil
| | | | | | | | | |
| | | | | | | | |
| | | | | | | | --| --R 10
| | | | | | | | | |
| | | | | | | | | --| --L Nil
| | | | | | | | | | |
| | | | | | | | | --| --R Nil
| | | | | | | | | |
```
