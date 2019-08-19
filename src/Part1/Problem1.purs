module Problem1 where

import Data.Array (last)
import Data.Maybe (Maybe)

myLast :: ∀ a. Array a -> Maybe a
myLast = last
