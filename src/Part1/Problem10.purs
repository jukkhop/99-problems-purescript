module Problem10 where

import Prelude

import Data.Array (group)
import Data.Array.NonEmpty (NonEmptyArray, head, length, toArray)
import Data.Tuple (Tuple(..))

encode :: ∀ a. Eq a => NonEmptyArray a -> Array (Tuple Int a)
encode x = map (\e -> Tuple (length e) (head e)) (group $ toArray x)
