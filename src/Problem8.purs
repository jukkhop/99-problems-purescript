module Problem8 where

import Prelude
import Data.Array (nub)

compress :: forall a. Ord a => Array a -> Array a
compress = nub
