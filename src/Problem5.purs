module Problem5 where

import Data.Array (reverse)

myReverse :: forall a. Array a -> Array a
myReverse = reverse
