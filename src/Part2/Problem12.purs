module Problem12 where

import Data.Array (concatMap, replicate)
import Data.Either (Either(..))
import Data.Tuple (Tuple, fst, snd)

type Elem a = Either (Tuple Int a) a

decodeModified :: ∀ a. Array (Elem a) -> Array a
decodeModified = concatMap toArray
  where
    toArray :: Elem a -> Array a
    toArray (Left x) = replicate (fst x) (snd x)
    toArray (Right x) = [ x ]