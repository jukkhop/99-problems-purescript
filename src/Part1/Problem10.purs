module Problem10 where

import Prelude

import Data.Array (group)
import Data.Array.NonEmpty (NonEmptyArray, head, length, toArray)
import Data.Tuple (Tuple(..))

toTuple :: forall a. Ord a => NonEmptyArray a -> Tuple Int a
toTuple a = Tuple (length a) (head a)

encode :: forall a. Ord a => NonEmptyArray a -> Array (Tuple Int a)
encode x = map toTuple (group $ toArray x)
