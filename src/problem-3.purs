module Problem3 where

import Data.List (List, index)
import Data.Maybe (Maybe)

main :: forall a. List a -> Int -> Maybe a
main xs i = index xs i
