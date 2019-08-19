module Problem5 where

import Data.Array (reverse)

myReverse :: ∀ a. Array a -> Array a
myReverse = reverse
