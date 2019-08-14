module Problem1 where

import Data.List (List, last)
import Data.Maybe (Maybe)

main :: forall a. List a -> Maybe a
main = last
