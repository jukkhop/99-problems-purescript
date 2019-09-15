module Problem13 where

import Prelude
import Data.Array.NonEmpty (NonEmptyArray, (:), fromArray, head, init, last, singleton, tail)
import Data.Either (Either(..))
import Data.Foldable (foldr)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..), fst, snd)

infix 4 notEq as !=

type Elem a = (Tuple Int a)
type SimpleElem a = Either (Tuple Int a) a

reduce :: ∀ a. Eq a => a -> NonEmptyArray (Elem a) -> NonEmptyArray (Elem a)
reduce cur acc | snd (head acc) != cur = (Tuple 1 cur) : acc
reduce cur acc = do
  let
    first = head acc
    elem = Tuple (fst first + 1) (snd first)
  case (fromArray $ tail acc) of
    Nothing -> singleton elem
    Just elems -> singleton elem <> elems

simplify :: ∀ a. Elem a -> SimpleElem a
simplify el | fst el > 1 = Left el
simplify el = Right (snd el)

encodeDirect :: ∀ a. Eq a => NonEmptyArray a -> NonEmptyArray (SimpleElem a)
encodeDirect x = map simplify $ foldr reduce (singleton $ Tuple 1 (last x)) (init x)
