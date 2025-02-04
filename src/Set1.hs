module Set1 (chal1, chal2, chal3, chal4, chal5) where

import Data.Bits (xor)
import Data.Char (chr)
import Enc
import Helpers

chal1 :: String -> String
chal1 = toB64 . fromH

chal2 :: String -> String
chal2 = toH . xor (fromH "686974207468652062756c6c277320657965") . fromH

chal3 :: String -> String
chal3 s = foldr1 (maxWith freqScore) [toS (xor (fromH s) (fromS $ replicate (length s `div` 2) (chr c))) | c <- [0 .. 255]]

chal4 :: String -> String
chal4 s = foldr1 (maxWith freqScore) (map chal3 (lines s))

chal5 :: String -> String
chal5 s = toH $ xor (fromS (take (length s) (cycle "ICE"))) (fromS s)
