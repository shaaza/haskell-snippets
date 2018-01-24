module Sudoku where

import Data.Char (digitToInt, isNumber)
import Data.List (intercalate, sort)

data Cell = Fixed Int | OneOf [Int] deriving (Show)
type Row = [Cell]
type Board = [Row]

emptyCell = OneOf [1..9]
emptyRow = replicate 9 emptyCell
emptyBoard = replicate 9 emptyRow

pp :: Board -> String
pp = intercalate "\n\n" . map prettyRow
  where
    prettyCell (Fixed v) = show v
    prettyCell _ = "."
    prettyRow = intercalate " " . map prettyCell


readCell :: Char -> Maybe Cell
readCell c
 | c == '.' = Just emptyCell
 | isNumber c && c /= '0' = Just . Fixed . digitToInt $ c
 | otherwise = Nothing

readRow :: String -> Maybe Row
readRow str = sequence $ map readCell $ str

chunksOf :: Int -> String -> [String]
chunksOf size str
 | (length str) == 0 = []
 | otherwise = [take size str] ++ chunksOf size (drop size str)


readBoard :: String -> Maybe Board
readBoard str
 | mod (length str) 9 == 0 = sequence $ map readRow $ chunksOf 9 str
 | otherwise = Nothing

board :: Maybe Board -> Board
board Nothing = []
board (Just x) = x

isRowValid :: Row -> Bool
isRowValid xs = [1..9] == sort (getNums xs)

getNums :: Row -> [Int]
getNums [] = []
getNums ((OneOf x):xs) = [0] ++ (getNums xs)
getNums ((Fixed i):xs) = [i] ++ (getNums xs)

-- pruneOneOf :: [Cell] -> [Cell]
-- pruneBoard ::
-- chooseOneOf
-- makeAGuess
-- isFinished :: Board -> Bool
-- isValid :: Board -> Bool
