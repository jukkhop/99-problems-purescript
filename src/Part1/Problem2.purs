module Problem2 where

import Data.Array (init, last)
import Data.Maybe (Maybe(Just, Nothing))

myButLast :: forall a. Array a -> Maybe a
myButLast x = do
  let
    xs = init x
  case xs of
    Nothing -> Nothing
    Just a -> last a
