module Problem19 where

import Prelude
import Data.Array (length, slice)

rotate :: ∀ a. Array a -> Int -> Array a
rotate x n = end <> begin
  where
    begin = slice 0 n x
    end = slice n (length x) x
