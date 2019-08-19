module Problem16 where

import Prelude
import Data.Array (catMaybes, mapWithIndex)
import Data.Maybe (Maybe(..))

dropEvery :: ∀ a. Array a -> Int -> Array (a)
dropEvery x nth = catMaybes $ mapWithIndex mapper x
  where
    mapper :: Int -> a -> Maybe a
    mapper index elem | (index + 1) `mod` nth == 0 = Nothing
    mapper _ elem = Just elem
