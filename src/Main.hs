module Main where
import qualified Set1 as S1

main :: IO ()
main = do
  putStrLn $ "1.1: " ++ S1.chal1 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  putStrLn $ "1.2: " ++ S1.chal2 "1c0111001f010100061a024b53535009181c"
