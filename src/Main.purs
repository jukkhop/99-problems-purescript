module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Part1 as Part1
import Part2 as Part2
import Part3 as Part3

main :: Effect Unit
main = do
  Part1.main
  Part2.main
  Part3.main
  log "✅ All tests passed!"
