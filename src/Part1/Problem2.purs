module Problem2 where

import Data.Array (init, last)
import Data.Maybe (Maybe(Just, Nothing))

myButLast :: ∀ a. Array a -> Maybe a
myButLast x = case init x of
  Nothing -> Nothing
  Just a -> last a
