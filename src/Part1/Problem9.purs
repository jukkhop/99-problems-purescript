module Problem9 where

import Prelude

import Data.Array (group)
import Data.Array.NonEmpty (toArray)

pack :: ∀ a. Eq a => Array a -> Array (Array a)
pack x = map toArray (group x)
