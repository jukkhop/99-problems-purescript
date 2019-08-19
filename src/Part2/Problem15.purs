module Problem15 where

import Prelude
import Data.Array (concat, replicate)

repli :: ∀ a. Array a -> Int -> Array a
repli x n = concat $ map (replicate n) x
