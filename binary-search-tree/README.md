## Binary Search Tree
In `bst.hs`, a binary search tree (BST) with the following operations has been implemented:

*(all functions take a BST as their first argument)*
1. **insert**: given an integer, and returns the BST with the integer entered as a node in the BST.
2. **search**: checks if a number exists in the BST. O(log n).
3. **smallest**: returns the smallest number in the BST.
4. **largest**: returns the largest number in the BST.
5. **depth**: returns the maximum depth of the BST (no of nodes between the deepest leaf and the root node).
6. **delete**: deletes an element from the BST and returns the BST, maintaing the constrainst of the BST.
The BST is immutable and functional, and I'm not sure if it would be possible to implement it any other way in the Haskell programming language.
