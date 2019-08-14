module Problem2 where

import Data.List (List, init, last)
import Data.Maybe (Maybe(Just, Nothing))

main :: forall a. List a -> Maybe a
main x = do
  let
    xs = init x
  case xs of
    Nothing -> Nothing
    Just a -> last a
