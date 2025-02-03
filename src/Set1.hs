module Set1 (chal1, chal2) where
import Enc
import Data.Bits (xor)

chal1 :: String -> String
chal1 = toB64 . fromH

chal2 :: String -> String
chal2 = toH . (xor $ fromH "686974207468652062756c6c277320657965") . fromH

