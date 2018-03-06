module Data.Semigroup.Last where

import Prelude

import Control.Alt (class Alt)
import Data.Newtype (class Newtype)

newtype Last a = Last a

derive instance newtypeLast :: Newtype (Last a) _

derive newtype instance eqLast :: Eq a => Eq (Last a)
derive newtype instance ordLast :: Ord a => Ord (Last a)

instance showLast :: Show a => Show (Last a) where
  show (Last x) = "(Last " <> show x <> ")"

instance semigroupLast :: Semigroup (Last a) where
  append _ x = x

instance functorLast :: Functor Last where
  map f (Last x) = Last (f x)

instance altLast :: Alt Last where
  alt _ x = x
