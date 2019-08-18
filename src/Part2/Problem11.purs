module Problem11 where

import Prelude

import Data.Array (group)
import Data.Array.NonEmpty (NonEmptyArray, head, length, toArray)
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))

type Elem a = Either (Tuple Int a) a

toElem :: forall a. Eq a => NonEmptyArray a -> Elem a
toElem a | length a > 1 = (Left $ Tuple (length a) (head a))
toElem a = (Right $ head a)

encodeModified :: forall a. Eq a => NonEmptyArray a -> Array (Elem a)
encodeModified x = map toElem (group $ toArray x)
