module LearnMonoids where

newtype Add = Add Int deriving (Show)
instance Monoid Add where
  mempty = Add 0
  (Add x) `mappend` (Add y) = Add (x + y)

newtype Prod = Prod Int deriving (Show)
instance Monoid Prod where
  mempty = Prod 1
  mappend (Prod x) (Prod y) = Prod (x * y)

data Mayb a = Something a | Nothin deriving (Show)

instance Monoid a => Monoid (Mayb a) where
  mempty = Nothin
  mappend Nothin Nothin = Nothin
  mappend (Something a) Nothin = Something a
  mappend Nothin (Something a) = Something a
  mappend (Something a) (Something b) = Something (mappend a b)
