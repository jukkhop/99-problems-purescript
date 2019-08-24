module Problem14 where

import Data.Array (concatMap, zip)
import Data.Tuple (fst, snd)

dupli :: ∀ a. Array a -> Array a
dupli x = concatMap (\y -> [ fst y, snd y ]) (zip x x)
