module Problem14 where

import Prelude
import Data.Array (concat, zip)
import Data.Tuple (fst, snd)

dupli :: ∀ a. Array a -> Array a
dupli x = concat $ map (\y -> [ fst y, snd y ]) (zip x x)
