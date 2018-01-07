module List where
-- Defining a list type
data List = Null | Cons Int List deriving (Show)
length' :: List -> Int
length' Null = 0
length' (Cons _ b) = 1 + (length' b)

sum' :: List -> Int
sum' Null = 0
sum' (Cons a b) = a + (sum' b)

-- defining Generic List
data GenList a = GenNull | GList a (GenList a) deriving (Show)


-- digression
data FancyList = NullList | Int :+: FancyList deriving (Show)
length'' :: FancyList -> Int
length'' NullList = 0
length'' (_ :+: b) = 1 + (length'' b)

--length' (Cons _ l) = if length' l == 0 then
