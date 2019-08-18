module Part2 where

import Prelude

import Data.Array.NonEmpty (toArray)
import Data.Either (Either(..))
import Data.String.CodeUnits as SU
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Part1 (stringToNonEmptyArray)
import Problem11 (encodeModified)
import Problem12 (decodeModified)
import Problem13 (encodeDirect)
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    expectedEncoded = [ (Left $ Tuple 4 'a'), (Right 'b'), (Left $ Tuple 2 'c'), (Left $ Tuple 2 'a'), (Right 'd'), (Left $ Tuple 4 'e') ]

  log "encodeModified \"aaaabccaadeeee\" should equal to [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')]"
  assert $ encodeModified (stringToNonEmptyArray "aaaabccaadeeee") == expectedEncoded
  --
  log "decodeModified [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')] should equal to \"aaaabccaadeeee\" "
  assert $ decodeModified expectedEncoded == SU.toCharArray "aaaabccaadeeee"
  --
  log "encodeDirect \"aaaabccaadeeee\" should equal to [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')]"
  assert $ toArray (encodeDirect (stringToNonEmptyArray "aaaabccaadeeee")) == expectedEncoded