module Problem13 where

import Prelude

import Data.Array.NonEmpty (NonEmptyArray, cons, fromArray, head, init, last, singleton, tail)
import Data.Either (Either(..))
import Data.Foldable (foldr)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..), fst, snd)

infix 4 notEq as !=

type Elem a = (Tuple Int a)
type SimpleElem a = Either (Tuple Int a) a

reduce :: forall a. Eq a => a -> NonEmptyArray (Elem a) -> NonEmptyArray (Elem a)
reduce cur acc | snd (head acc) != cur = cons (Tuple 1 cur) acc
reduce cur acc = do
  let
    withoutFirst = fromArray (tail acc)
    newElem = Tuple (fst (head acc) + 1) (snd (head acc))

  case withoutFirst of
    Nothing -> singleton newElem
    Just elems -> (singleton newElem) <> elems

simplify :: forall a. Elem a -> SimpleElem a
simplify el | fst el == 1 = (Right (snd el))
simplify el = (Left el)

encodeDirect :: forall a. Eq a => NonEmptyArray a -> NonEmptyArray (SimpleElem a)
encodeDirect x = map simplify $ foldr reduce (singleton $ Tuple 1 (last x)) (init x)
