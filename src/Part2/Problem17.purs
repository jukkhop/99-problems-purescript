module Problem17 where

import Data.Array (length, slice)
import Data.Tuple (Tuple(..))

split :: ∀ a. Array a -> Tuple (Array a) (Array a)
split x = Tuple begin rest
  where
    begin = slice 0 3 x
    rest = slice 3 (length x) x
