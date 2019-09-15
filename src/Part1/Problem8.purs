module Problem8 where

import Prelude

import Data.Array (foldl)
import Data.Array.NonEmpty (NonEmptyArray, head, last, singleton, snoc, tail)

infix 4 notEq as !=

compress :: ∀ a. Eq a => NonEmptyArray a -> NonEmptyArray a
compress x = foldl f (singleton $ head x) (tail x)
  where
    f :: Eq a => NonEmptyArray a -> a -> NonEmptyArray a
    f a b | last a != b = snoc a b
    f a b = a
