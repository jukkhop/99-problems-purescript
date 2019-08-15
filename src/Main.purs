module Main where

import Data.List (fromFoldable)
import Data.Maybe (fromMaybe)
import Data.String.CodeUnits as String
import Effect (Effect)
import Effect.Console (log)
import Prelude
import Problem1 as Problem1
import Problem2 as Problem2
import Problem3 as Problem3
import Problem4 as Problem4
import Problem5 as Problem5
import Problem6 as Problem6
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    l = fromFoldable

    myLast = Problem1.main $ l [ 'x', 'y', 'z' ]

    myButLast = Problem2.main $ l [ 1, 2, 3, 4 ]

    elementAt = Problem3.main (l [ 1, 2, 3 ]) 1

    myLength = Problem4.main $ l $ String.toCharArray "Hello, world!"

    myReverse = String.fromCharArray $ Problem5.main $ String.toCharArray "A man, a plan, a canal, panama!"

    isPalindrome = Problem6.main $ l [ 1, 2, 4, 8, 16, 8, 4, 2, 1 ]
  --
  log "myLast should equal to 'z' "
  assert $ fromMaybe 'a' myLast == 'z'
  --
  log "myButLast should equal to 3"
  assert $ fromMaybe 0 myButLast == 3
  --
  log "elementAt should equal to 2"
  assert $ fromMaybe 0 elementAt == 2
  --
  log "myLength should equal to 13"
  assert $ myLength == 13
  --
  log "myReverse should equal to \"!amanap ,lanac a ,nalp a ,nam A\" "
  assert $ myReverse == "!amanap ,lanac a ,nalp a ,nam A"
  --
  log "isPalindrome should be true "
  assert $ isPalindrome == true
