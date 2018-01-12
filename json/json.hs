module PrintJSON where


data Object = NewObject String Value Object | EmptyObject deriving (Show)
data Array = ArrayElem Value Array | EmptyArray deriving (Show)

data Value = JObject Object
           | JArray Array
           | JString String
           | JInt Int
           | JTrue
           | JFalse
           | JNull deriving (Show)

class Serializable a where
  toString :: a -> String

instance Serializable Object where
  toString (NewObject str val EmptyObject) = (show str) ++ ": " ++ (toString val)
  toString (NewObject str val obj) = (show str) ++ ": " ++ (toString val) ++ ", \n    " ++ (toString obj)

instance Serializable Array where
  toString (ArrayElem x EmptyArray) = toString x
  toString (ArrayElem x arr) = toString x ++ ", \n  " ++ toString arr

instance Serializable Value where
  toString JTrue = "true"
  toString JFalse = "false"
  toString JNull = "null"
  toString (JInt x) = show x
  toString (JString x) = "" ++ show x ++ "\""
  toString (JObject EmptyObject) = ""
  toString (JObject obj) = "{ " ++ toString obj ++ " }"
  toString (JArray arr) = "[ " ++ toString arr ++ " ]"


serialize = putStr (toString
                    (JArray
                     (ArrayElem (JObject
                                 (NewObject "asd" JTrue
                                  (NewObject "bsd" JNull
                                   EmptyObject)))
                       (ArrayElem JTrue
                        (ArrayElem (JInt 3)
                         EmptyArray)))))
