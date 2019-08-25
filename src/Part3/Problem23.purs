module Problem23 where

import Prelude

import Data.List (List(Nil), (:), catMaybes, foldl, length, (!!))
import Data.List.Lazy (replicateM)
import Effect (Effect)
import Effect.Random (randomInt)

rndSelect :: ∀ a. List a -> Int -> Effect (List a)
rndSelect xs n = do
  randoms <- replicateM n (randomInt 0 high)
  pure $ catMaybes (foldl (\acc cur -> (xs !! cur) : acc) Nil randoms)
  where
    high = (length xs) - 1
