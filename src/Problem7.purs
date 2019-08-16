module Problem7 where

import Data.Array (concatMap)

data NestedArray a
  = Elem a
  | NestedArray (Array (NestedArray a))

flatten :: forall a. NestedArray a -> Array a
flatten (Elem x) = [ x ]
flatten (NestedArray x) = concatMap flatten x

