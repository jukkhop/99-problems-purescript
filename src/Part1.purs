module Part1 where

import Prelude

import Data.Maybe (fromMaybe)
import Data.String.CodeUnits as SU
import Data.String.NonEmpty.CodeUnits as SNEU
import Data.String.NonEmpty.Internal (NonEmptyString(..), toString)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Problem1 (myLast)
import Problem2 (myButLast)
import Problem3 (elementAt)
import Problem4 (myLength)
import Problem5 (myReverse)
import Problem6 (isPalindrome)
import Problem7 (flatten, NestedArray(..))
import Problem8 (compress)
import Problem9 (pack)
import Problem10 (encode)
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    stringLength = SU.toCharArray >>> myLength
    reverseString = SU.toCharArray >>> myReverse >>> SU.fromCharArray

    stringToNonEmptyArray = NonEmptyString >>> SNEU.toNonEmptyCharArray
    nonEmptyArrayToString = SNEU.fromNonEmptyCharArray >>> toString
    compressString = stringToNonEmptyArray >>> compress >>> nonEmptyArrayToString

    flattened =
      flatten
        ( NestedArray
            [ (Elem 1)
            , ( NestedArray
                  [ (Elem 2)
                  , ( NestedArray
                        [ (Elem 3)
                        , (Elem 4)
                        ]
                    )
                  , (Elem 5)
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
  log "flattened should equal to [1,2,3,4,5]"
  assert $ flattened == [ 1, 2, 3, 4, 5 ]
  --
  log "compress \"aaaabccaadeeee\" should equal to \"abcade\" "
  assert $ compressString "aaaabccaadeeee" == "abcade"
  --
  log "pack [1,1,3,2,2,3,1] should equal to [[1,1],[3],[2,2],[3],[1]]"
  assert $ pack [ 1, 1, 3, 2, 2, 3, 1 ] == [ [ 1, 1 ], [ 3 ], [ 2, 2 ], [ 3 ], [ 1 ] ]
  --
  log "encode \"aaaabccaadeeee\" should equal to [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]"
  assert $ encode (stringToNonEmptyArray "aaaabccaadeeee") == [ (Tuple 4 'a'), (Tuple 1 'b'), (Tuple 2 'c'), (Tuple 2 'a'), (Tuple 1 'd'), (Tuple 4 'e') ]

