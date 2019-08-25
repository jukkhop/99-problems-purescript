module Problem25 where

import Data.List (List, length)
import Effect (Effect)
import Problem24 (draw)

rndPermu :: ∀ a. List a -> Effect (List a)
rndPermu xs = draw xs (length xs)
