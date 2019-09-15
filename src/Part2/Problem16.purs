module Problem16 where

import Prelude
import Data.Array (catMaybes, mapWithIndex)
import Data.Maybe (Maybe(..))

dropEvery :: ∀ a. Array a -> Int -> Array (a)
dropEvery x nth = catMaybes $ mapWithIndex mapElem x
  where
    mapElem :: Int -> a -> Maybe a
    mapElem i elem | (i + 1) `mod` nth == 0 = Nothing
    mapElem _ elem = Just elem
