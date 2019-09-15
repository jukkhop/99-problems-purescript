module Problem11 where

import Prelude
import Data.Array (group)
import Data.Array.NonEmpty (NonEmptyArray, head, length, toArray)
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))

type Elem a = Either (Tuple Int a) a

encodeModified :: ∀ a. Eq a => NonEmptyArray a -> Array (Elem a)
encodeModified xs = (group $ toArray xs) <#> toElem
  where
    toElem :: Eq a => NonEmptyArray a -> Elem a
    toElem x | length x > 1 = Left $ Tuple (length x) (head x)
    toElem x = Right $ head x