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

encodeDirect :: ∀ a. Eq a => NonEmptyArray a -> NonEmptyArray (SimpleElem a)
encodeDirect x = map simplify $ foldr f (singleton $ Tuple 1 (last x)) (init x)
  where
    f :: Eq a => a -> NonEmptyArray (Elem a) -> NonEmptyArray (Elem a)
    f cur acc | snd (head acc) != cur = (Tuple 1 cur) : acc
    f cur acc =
      case (fromArray $ tail acc) of
        Nothing -> singleton elem
        Just elems -> singleton elem <> elems
      where
        first = head acc
        elem = Tuple (fst first + 1) (snd first)

    simplify :: Elem a -> SimpleElem a
    simplify el | fst el > 1 = Left el
    simplify el = Right (snd el)
