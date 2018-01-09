module Main where

import HTML.Dump (dump)

main :: IO ()
main = dump "http://www.google.com" >>= print
