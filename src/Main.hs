module Main where

import qualified Set1 as S1

main :: IO ()
main = do
  putStrLn $ "1.1: " ++ S1.chal1 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  putStrLn $ "1.2: " ++ S1.chal2 "1c0111001f010100061a024b53535009181c"
  putStrLn $ "1.3: " ++ S1.chal3 "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
  in14 <- readFile "1.4"
  putStr $ "1.4: " ++ S1.chal4 in14
