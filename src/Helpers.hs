module Helpers (freq, freqScore, maxWith) where

import Data.Char

engFreqs :: [Float]
engFreqs =
  [ 8.167,
    1.492,
    2.782,
    4.253,
    12.70,
    2.228,
    2.015,
    6.094,
    6.966,
    0.153,
    0.772,
    4.025,
    2.406,
    6.749,
    7.507,
    1.929,
    0.095,
    5.987,
    6.327,
    9.056,
    2.758,
    0.978,
    2.360,
    0.150,
    1.974,
    0.074,
    18.10
  ]

freq :: String -> [Float]
freq s = [fromIntegral cnt / (fromIntegral . length) s | c <- ['A' .. 'Z'] ++ [' '], let cnt = (length . filter (== c)) (map toUpper s)]

freqScore :: String -> Float
freqScore s = sum $ zipWith (*) engFreqs (freq s)

maxWith :: (Ord b) => (a -> b) -> a -> a -> a
maxWith p x y = if p x >= p y then x else y
