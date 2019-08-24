module Problem21 where

import Data.Array (insertAt)
import Data.Maybe (Maybe)

insertAt' :: ∀ a. a -> Array a -> Int → Maybe (Array a)
insertAt' elem array index = insertAt index elem array
