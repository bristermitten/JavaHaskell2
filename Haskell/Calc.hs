{-# LANGUAGE ForeignFunctionInterface #-}

module Calc where

import Control.Monad
import Data.String
import Foreign.C

parseInput :: String -> [Int]
parseInput i = parts $ words i
  where
    parts [fst, p, snd] = [read fst, read snd]
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

main = process >>= putStrLn