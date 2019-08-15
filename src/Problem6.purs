module Problem6 where

import Data.List (List, (\\), length, reverse)
import Prelude

main :: forall a. Eq a => List a -> Boolean
main arr = length (reverse arr \\ arr) == 0
