module Main where

import Prelude

import Data.Maybe (fromMaybe)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (log)
import Problem1 (myLast)
import Problem2 (myButLast)
import Problem3 (elementAt)
import Problem4 (myLength)
import Problem5 (myReverse)
import Problem6 (isPalindrome)
import Problem7 (flatten, NestedArray(..))
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    stringLength = myLength <<< toCharArray
    reverseString = fromCharArray <<< myReverse <<< toCharArray

    flattened =
      flatten
        ( NestedArray
            [ (Elem 1)
            , (Elem 2)
            , (Elem 3)
            , ( NestedArray
                  [ (Elem 4)
                  , (Elem 5)
                  , ( NestedArray
                        [ (Elem 6)
                        , (Elem 7)
                        ]
                    )
                  ]
              )
            ]
        )
  --
  log "myLast [1, 2, 3, 4] should equal to 4"
  assert $ fromMaybe 0 (myLast [ 1, 2, 3, 4 ]) == 4
  --
  log "myButLast [1, 2, 3, 4] should equal to 3"
  assert $ fromMaybe 0 (myButLast [ 1, 2, 3, 4 ]) == 3
  --
  log "elementAt [1, 2, 3, 4] 1 should equal to 2"
  assert $ fromMaybe 0 (elementAt [ 1, 2, 3, 4 ] 1) == 2
  --
  log "myLength [123, 456, 789] should equal to 3"
  assert $ myLength [ 123, 456, 789 ] == 3
  --
  log "stringLength \"Hello, world!\" should equal to 13"
  assert $ stringLength "Hello, world!" == 13
  --
  log "myReverse [1,2,3,4] should equal to [4,3,2,1] "
  assert $ myReverse [ 1, 2, 3, 4 ] == [ 4, 3, 2, 1 ]
  --
  log "reverseString \"hello\" should equal to \"olleh\" "
  assert $ reverseString "hello" == "olleh"
  --
  log "isPalindrome [1,2,4,8,16,8,4,2,1] should be true"
  assert $ isPalindrome [ 1, 2, 4, 8, 16, 8, 4, 2, 1 ] == true
  --
  log "flattened should be [1,2,3,4,5,6,7]"
  assert $ flattened == [ 1, 2, 3, 4, 5, 6, 7 ]
  --
  log "✅ All tests passed!"
