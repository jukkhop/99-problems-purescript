module Problem3 where

import Data.Array (index)
import Data.Maybe (Maybe)

elementAt :: forall a. Array a -> Int -> Maybe a
elementAt xs i = index xs i
