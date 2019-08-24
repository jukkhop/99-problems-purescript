module Problem24 where

import Prelude
import Data.List (List(Nil), (..), (:), deleteAt, index, length)
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Random (randomInt)

diffSelect :: Int -> Int -> Effect (List Int)
diffSelect n m = draw (1 .. m) n

draw :: List Int -> Int -> Effect (List Int)
draw Nil _ = pure Nil
draw _ 0 = pure Nil
draw xs n = do
  rand <- randomInt 0 ((length xs) - 1)
  let elem = fromMaybe 0 (index xs rand)
  rest <- draw (fromMaybe Nil $ deleteAt rand xs) (n - 1)
  pure (elem : rest)
