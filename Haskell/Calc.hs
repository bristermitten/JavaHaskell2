{-# LANGUAGE ForeignFunctionInterface #-}
module Calc where
    
add x y = x + y -- Very simple function to add 2 numbers


foreign export ccall add :: Int -> Int -> Int -- export add as a C header so we can access it from JNI
