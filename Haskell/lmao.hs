-- This is a random clash of code solution lmao, i just want this to be a haskell project PLEASE github

import System.IO
import Control.Monad
import Data.Char (ord)

readLine = do
    input_line <- getLine
    return (input_line :: String)

asciiSum str = sum (map ord str)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    let control = (asciiSum "Contribution Revenge Sockpuppet") `div` 128

    title <- getLine
    input_line <- getLine
    let author = input_line :: String
    input_line <- getLine
    let input = words input_line
    let friends = read (input!!0) :: Int
    let foes = read (input!!1) :: Int
    
    friendNames <- replicateM friends readLine
    
    foeNames <- replicateM foes readLine
    let output = if (author `elem` friendNames) 
        then "ACCEPT"
        else if (author `elem` foeNames)
        then "REJECT"
        else if (asciiSum title == control)
        then "ACCEPT"
        else "REJECT"
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- Write answer to stdout
    putStrLn output
    return ()