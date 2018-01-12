module PrintJSON where


data KeyValuePair = KeyVal String Value KeyValuePair | EmptyKeyVal deriving (Show)
data ArrayList = Element Value ArrayList | EmptyArrayList deriving (Show)

data Value = Object KeyValuePair
           | Array ArrayList
           | S String
           | I Int
           | B Bool
           | Null deriving (Show)

class Serializable a where
  toString :: a -> String

instance Serializable KeyValuePair where
  toString (KeyVal str val EmptyKeyVal) = (show str) ++ ": " ++ (toString val)
  toString (KeyVal str val obj) = (show str) ++ ": " ++ (toString val) ++ ", \n    " ++ (toString obj)

instance Serializable ArrayList where
  toString (Element x EmptyArrayList) = toString x
  toString (Element x arr) = toString x ++ ", \n  " ++ toString arr

instance Serializable Value where
  toString (B True) = "true"
  toString (B False) = "false"
  toString Null = "null"
  toString (I int) = show int
  toString (S string) = "" ++ show string ++ "\""
  toString (Object EmptyKeyVal) = ""
  toString (Object obj) = "{ " ++ toString obj ++ " }"
  toString (Array arr) = "[ " ++ toString arr ++ " ]"


serialize = putStr (toString
                    (Array
                     (Element (Object
                                 (KeyVal "young?" (B True)
                                 (KeyVal "name" (S "Willy Wonka")
                                  EmptyKeyVal)))
                     (Element (B False)
                     (Element (I 3)
                     (Element (Object
                                 (KeyVal "young?" (B False)
                                 (KeyVal "name" Null
                                  EmptyKeyVal)))
                               EmptyArrayList))))))
