module Data.Semigroup.Min where
  
import Prelude

import Data.Newtype (class Newtype)
  
newtype Min a = Min a

derive instance newtypeMin :: Newtype (Min a) _

derive newtype instance eqMin :: Eq a => Eq (Min a)
derive newtype instance ordMin :: Ord a => Ord (Min a)

instance showMin :: Show a => Show (Min a) where
  show (Min x) = "(Min " <> show x <> ")"

instance semigroupMin :: Ord a => Semigroup (Min a) where
  append x y = min x y
