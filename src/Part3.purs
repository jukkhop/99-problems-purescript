module Part3 where

import Prelude

import Data.List (all, fromFoldable, length, nub)
import Data.Maybe (fromMaybe)
import Data.String.CodeUnits (toCharArray)
import Effect (Effect)
import Effect.Console (log)
import Problem21 (insertAt')
import Problem22 (range)
import Problem23 (rndSelect)
import Problem24 (diffSelect)
import Test.Assert (assert)

main :: Effect Unit
main = do

  log "(insertAt 'X' 'abcd' 1) should equal to 'aXbcd' "
  assert $ fromMaybe [] (insertAt' 'X' (toCharArray "abcd") 1) == toCharArray "aXbcd"
  --
  log "(range 4 9) should equal to [4,5,6,7,8,9]"
  assert $ range 4 9 == [4, 5, 6, 7, 8, 9]
  --
  log "(rndSelect [...] 3) should return three elements"
  randoms <- rndSelect (fromFoldable ['a', 'b', 'c', 'd', 'e', 'f', 'g']) 3
  assert $ length randoms == 3
  --
  log "(diffSelect 5 10) should return 5 different numbers from range 1..10"
  diffs <- diffSelect 5 10
  assert $ (length diffs == 5) && (nub diffs == diffs) && (all (\x -> x > 0 && x < 11) diffs)
