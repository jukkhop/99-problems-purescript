module Problem18 where

import Prelude
import Data.Array (slice)

slice' :: ∀ a. Array a -> Int → Int → Array a
slice' arr i k = slice (i - 1) k arr
