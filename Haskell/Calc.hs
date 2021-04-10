{-# LANGUAGE ForeignFunctionInterface #-}

module Calc where

import Data.String
import Foreign.C

parseInput :: String -> [Int]
parseInput i = parts $ words i
    where parts [a, p, x] = [read a, read x]
          parts _ = []

process :: IO String
process = do
  putStrLn "Please enter a string in the format <a + b>"
  i <- getLine
  let res = parseInput i
  case res of 
    [a, b] -> return $ show $ a + b
    _ -> return "Invalid input"

cProcess = process >>= newCString

foreign export ccall cProcess :: IO CString -- export add as a C header so we can access it from JNI
