module Line where

-- Define a line segment as a sequence of points and its slope.

data Point = Point { pointX :: Double, pointY :: Double }
data Slope = Slope Double | Unknown deriving (Show, Eq)
data LineSegment = LineSegment Point Point

slope :: LineSegment -> Slope
slope (LineSegment p1 p2) = if ((pointX p2) - (pointX p1)) == 0
                            then Unknown
                            else (Slope (((pointY p2) - (pointY p1)) / ((pointX p2) - (pointX p1))))

-- data Line = { slope :: Double, constant :: Double }
-- newLine pointList = if pointList
-- Define a data type Point and a Line Segment
-- intersection :: Line ->
