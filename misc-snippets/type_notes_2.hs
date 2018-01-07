module Shapes where

data Point = Point { pointX :: Int, pointY :: Int } -- This is the record syntax
-- pointX is now a fn :: Point -> Int
-- Now you create a Point with (Point 1 2) or Poitn { pointX = 1, pointY = 2 }
data Shape = Circle Point Double
           | Square Point Double
           | Rectangle Point Double Double

type Point' = (Int, Int) -- type alias.
type Z      = (Int, Int) -- another type alias.
newtype Point'' = Point'' (Int, Int) -- not interchangeable with other type aliases. Now it has a constructor. just an optimization of data.

newtype Age = Age Int
newtype TeamId = { unTeamId :: Int } -- conventional to call unTeamId

area :: Shape -> Double
area (Circle _ radius) = 3.14 * radius * radius
area (Square _ side)   = side * side
area (Rectangle _ l b) = l * b
area _othershape = error "Not knows shape"

area' shape = case shape of
  Circle _ radius -> 3.14 * radius * radius
  Square _ size   -> size * size
  Rectangle _ l b -> l * b
  _               -> error "I not knows shape"


origin (Circle o _) = (pointX o, pointY o)

-- fromIntegral Int -> something like fractional
-- fromFractional fract -> Int

data Person = Person { pName :: String, pAge :: Int, pLocation :: Point }
