module YourOwnTypes where

data Boolean = Truee | Falsee
data RGB = Red | Green | Blue

-- If you do :t RGB, you'll get an error because there's no value called RGB. RGB is a type.
-- Set theoertically, the set itself can be thought of a as a type while the values in set are values.
-- Values and types have their own namespace.


-- Parametrized data types

data Age = Lunar Int | Solar Int
-- Lunar and Solar are both type constructors. Lunar and Solar have been defined it

let a = Lunar 2
-- :t a


data Animal = Cat String Int | Dog String Int String
-- "t Cat
-- from OO: kinda like Animal being an abstract class and the Cat & Dog are concrete subclasses.
-- Cat and Dog are not types, they are type constructors.
-- Cat is essentially just a function. You can give it partial arguments.


data Crow = Crow String Int
-- you can do this

-- undefined will give you a runtime exception. undefined is a value which can be of any type. void is a type with no value

data Vois
-- used to represent things which are impossible.
