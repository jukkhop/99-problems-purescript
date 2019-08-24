module Part2 where

import Prelude

import Data.Array.NonEmpty (toArray)
import Data.Either (Either(..))
import Data.Maybe (fromMaybe)
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Part1 (stringToNonEmptyArray)
import Problem11 (encodeModified)
import Problem12 (decodeModified)
import Problem13 (encodeDirect)
import Problem14 (dupli)
import Problem15 (repli)
import Problem16 (dropEvery)
import Problem17 (split)
import Problem18 (slice')
import Problem19 (rotate)
import Problem20 (removeAt)
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    expectedEncoded =
      [ (Left $ Tuple 4 'a')
      , (Right 'b')
      , (Left $ Tuple 2 'c')
      , (Left $ Tuple 2 'a')
      , (Right 'd')
      , (Left $ Tuple 4 'e')
      ]
      
  log "encodeModified \"aaaabccaadeeee\" should equal to [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')]"
  assert $ encodeModified (stringToNonEmptyArray "aaaabccaadeeee") == expectedEncoded
  --
  log "decodeModified [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')] should equal to \"aaaabccaadeeee\" "
  assert $ decodeModified expectedEncoded == toCharArray "aaaabccaadeeee"
  --
  log "encodeDirect \"aaaabccaadeeee\" should equal to [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')]"
  assert $ toArray (encodeDirect $ stringToNonEmptyArray "aaaabccaadeeee") == expectedEncoded
  --
  log "dupli [1,2,3] should equal to [1,1,2,2,3,3]"
  assert $ dupli [ 1, 2, 3 ] == [ 1, 1, 2, 2, 3, 3 ]
  --
  log "repli (\"abc\" 3) should equal to \"aaabbbccc\" "
  assert $ repli (toCharArray "abc") 3 == toCharArray "aaabbbccc"
  --
  log "dropEvery (\"abcdefghik\" 3) should equal to \"abdeghk\" "
  assert $ dropEvery (toCharArray "abcdefghik") 3 == toCharArray "abdeghk"
  --
  log "split ('abcdefghik' 3) should equal to ('abc', 'defghik')"
  assert $ split (toCharArray "abcdefghik") == Tuple (toCharArray "abc") (toCharArray "defghik")
  --
  log "slice (['a','b','c','d','e','f','g','h','i','k'] 3 7) should equal to 'cdefg' "
  assert $ slice' [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k' ] 3 7 == toCharArray "cdefg"
  --
  log "rotate (['a','b','c','d','e','f','g','h'] 3) should equal to 'defghabc' "
  assert $ rotate [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' ] 3 == toCharArray "defghabc"
  --
  log "rotate (['a','b','c','d','e','f','g','h'] -2) should equal to 'ghabcdef' "
  assert $ rotate [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' ] (-2) == toCharArray "ghabcdef"
  --
  log "removeAt (2 ['a','b','c','d']) should equal to ['a', 'c', 'd']"
  assert $ fromMaybe [] (removeAt 2 [ 'a', 'b', 'c', 'd' ]) == [ 'a', 'c', 'd' ]
