module Problem11 where

import Prelude
import Data.Array (group)
import Data.Array.NonEmpty (NonEmptyArray, head, length, toArray)
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))

type Elem a = Either (Tuple Int a) a

toElem :: ∀ a. Eq a => NonEmptyArray a -> Elem a
toElem x | length x > 1 = Left (Tuple (length x) (head x))
toElem x = Right (head x)

encodeModified :: ∀ a. Eq a => NonEmptyArray a -> Array (Elem a)
encodeModified x = map toElem (group $ toArray x)
