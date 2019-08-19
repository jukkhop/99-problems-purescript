module Problem6 where

import Prelude
import Data.Array (difference, length, reverse)

isPalindrome :: ∀ a. Eq a => Array a -> Boolean
isPalindrome x = length diff == 0
  where
    diff = difference (reverse x) x