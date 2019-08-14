module Main where

import Data.List (fromFoldable)
import Data.Maybe (fromMaybe)
import Effect (Effect)
import Effect.Console (log)
import Prelude
import Problem1 as Problem1
import Problem2 as Problem2
import Problem3 as Problem3
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    l = fromFoldable

    myLast = Problem1.main (l [ 'x', 'y', 'z' ])

    myButLast = Problem2.main (l [ 1, 2, 3, 4 ])

    elementAt = Problem3.main (l [ 1, 2, 3 ]) 1
  --
  log "myLast should equal to 'z' "
  assert $ fromMaybe 'a' myLast == 'z'
  --
  log "myButLast should equal to 3"
  assert $ fromMaybe 0 myButLast == 3
  --
  log "elementAt should equal to 2"
  assert $ fromMaybe 0 elementAt == 2
