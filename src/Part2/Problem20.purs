module Problem20 where

import Prelude
import Data.Array (deleteAt)
import Data.Maybe (Maybe)

removeAt :: ∀ a. Int -> Array a -> Maybe (Array a)
removeAt k = deleteAt (k - 1)
