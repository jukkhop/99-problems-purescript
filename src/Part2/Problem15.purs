module Problem15 where

import Data.Array (concatMap, replicate)

repli :: ∀ a. Array a -> Int -> Array a
repli x n = concatMap (replicate n) x
