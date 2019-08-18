module Problem8 where

import Prelude

import Data.Array (foldl)
import Data.Array.NonEmpty (NonEmptyArray, head, last, singleton, snoc, tail)

infix 4 notEq as !=

reduce :: forall a. Eq a => NonEmptyArray a -> a -> NonEmptyArray a
reduce a b | last a != b = snoc a b
reduce a b = a

compress :: forall a. Eq a => NonEmptyArray a -> NonEmptyArray a
compress x = foldl reduce (singleton $ head x) (tail x)
