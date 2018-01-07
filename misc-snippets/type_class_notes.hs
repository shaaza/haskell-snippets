module TypeClasses where

data Color = Red | Green | Blue

class Show' a where
  show' :: a -> String

instance Show' Color where
  show' Red = "R"
  show' Green = "G"
  show' Blue = "B"

data Maybe' a = Just' a | Nothing'

instance (Show' a) => Show' (Maybe' a) where
  show' Nothing' = "Nothing'"
  show' (Just' a) = "Just [" ++ show' a ++ "]"

instance Show' Bool where
  show' True = "true"
  show' False = "false"


--data List a = Empty | Cons a (List a)

-- instance (Show a) => (Show (List a)) where
--  show = "sdasd" ++  show' ++ " "
--    where
--      show' = "Asdsa"
data Dir = N | S | W | E
instance Enum Dir where
  fromEnum N = 0
  fromEnum E = 1
  fromEnum S = 2
  fromEnum W = 3

  toEnum 0 = N
  toEnum 1 = E
  toEnum 2 = S
  toEnum 3 = W
  toEnum = toEnum (n `mod` 4)
