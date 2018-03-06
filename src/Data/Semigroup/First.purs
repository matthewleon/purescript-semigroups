module Data.Semigroup.First where

import Prelude

import Control.Alt (class Alt)
import Data.Newtype (class Newtype)

newtype First a = First a

derive instance newtypeFirst :: Newtype (First a) _

derive newtype instance eqFirst :: Eq a => Eq (First a)
derive newtype instance ordFirst :: Ord a => Ord (First a)

instance showFirst :: Show a => Show (First a) where
  show (First x) = "(First " <> show x <> ")"

instance semigroupFirst :: Semigroup (First a) where
  append x _ = x

instance functorFirst :: Functor First where
  map f (First x) = First (f x)

instance altFirst :: Alt First where
  alt x _ = x
