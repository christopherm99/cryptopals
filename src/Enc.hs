module Enc (toH, fromH, toB64, fromB64, fromS, toS) where

import Data.Bits
import Data.Char
import Data.List (foldl')
import GHC.Base (unsafeChr)
import GHC.Num (integerFromInt, integerToInt)

fromH :: [Char] -> Integer
fromH = foldl' (\acc c -> (integerFromInt . digitToInt) c .|. acc .<<. 4) 0

iToH :: Integer -> Char
iToH i
  | 0 <= i && i <= 9 = unsafeChr (ord '0' + int)
  | 10 <= i && i <= 15 = unsafeChr (ord 'a' + int - 10)
  where
    int = integerToInt i

toH :: Integer -> String
toH x
  | 0 <= x && x <= 15 = [iToH x]
  | otherwise = toH (x .>>. 4) ++ toH (x .&. 0xf)

b64ToI :: Char -> Integer
b64ToI c
  | c == '+' = 62
  | c == '/' = 63
  | (fromIntegral d :: Word) <= 9 = d + 50
  | (fromIntegral u :: Word) <= 25 = u
  | (fromIntegral l :: Word) <= 25 = l + 25
  where
    u = integerFromInt $ ord c - ord 'A'
    l = integerFromInt $ ord c - ord 'a'
    d = integerFromInt $ ord c - ord '0'

fromB64 :: String -> Integer
fromB64 = foldl' (\acc c -> b64ToI c .|. acc .<<. 6) 0

iToB64 :: Integer -> Char
iToB64 i
  | 0 <= i && i <= 25 = unsafeChr (ord 'A' + int)
  | 26 <= i && i <= 51 = unsafeChr (ord 'a' + int - 26)
  | 52 <= i && i <= 61 = unsafeChr (ord '0' + int - 52)
  | i == 62 = '+'
  | i == 63 = '/'
  where
    int = integerToInt i

toB64 :: Integer -> String
toB64 x
  | 0 <= x && x <= 63 = [iToB64 x]
  | otherwise = toB64 (x .>>. 6) ++ toB64 (x .&. 0x3f)

cToI :: Char -> Integer
cToI = integerFromInt . ord

fromS :: String -> Integer
fromS = foldl' (\acc c -> cToI c .|. acc .<<. 8) 0

toS :: Integer -> String
toS x
  | 0 <= x && x <= 255 = [(unsafeChr . integerToInt) x]
  | otherwise = toS (x .>>. 8) ++ toS (x .&. 0xff)
