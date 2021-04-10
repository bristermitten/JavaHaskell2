{-# LANGUAGE ForeignFunctionInterface #-}

module Calc where

import Data.String
import Foreign.C
import Control.Monad

parseInput :: String -> [Int]
parseInput i = parts $ words i
  where
    parts [a, p, x] = [read a, read x]
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

-- These functions are totally useless and unused, but i want this to be marked as a haskell repo on github :D

main = do
  quantity <- readLn :: IO Int
  let out = map (* 2) $ filter even [1..quantity]
  let res = take quantity out -- lol
  print $ replicateM quantity res