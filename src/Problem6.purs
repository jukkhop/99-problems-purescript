module Problem6 where

import Prelude
import Data.Array (difference, length, reverse)

isPalindrome :: forall a. Eq a => Array a -> Boolean
isPalindrome x = length (difference (reverse x) x) == 0
