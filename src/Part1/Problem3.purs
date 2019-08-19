module Problem3 where

import Data.Array (index)
import Data.Maybe (Maybe)

elementAt :: ∀ a. Array a -> Int -> Maybe a
elementAt = index
