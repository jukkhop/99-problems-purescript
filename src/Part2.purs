module Part2 where

import Prelude

import Data.Either (Either(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Console (log)
import Part1 (stringToNonEmptyArray)
import Problem11 (encodeModified)
import Test.Assert (assert)

main :: Effect Unit
main = do
  let
    expectedEncoded = [ (Left $ Tuple 4 'a'), (Right 'b'), (Left $ Tuple 2 'c'), (Left $ Tuple 2 'a'), (Right 'd'), (Left $ Tuple 4 'e') ]

  log "encodeModified \"aaaabccaadeeee\" should equal to [(4,'a'),'b',(2,'c'),(2,'a'),'d',(4,'e')]"
  assert $ encodeModified (stringToNonEmptyArray "aaaabccaadeeee") == expectedEncoded
