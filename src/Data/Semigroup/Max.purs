module Data.Semigroup.Max where
  
import Prelude

import Data.Newtype (class Newtype)
  
newtype Max a = Max a

derive instance newtypeMax :: Newtype (Max a) _

derive newtype instance eqMax :: Eq a => Eq (Max a)
derive newtype instance ordMax :: Ord a => Ord (Max a)

instance showMax :: Show a => Show (Max a) where
  show (Max x) = "(Max " <> show x <> ")"

instance semigroupMax :: Ord a => Semigroup (Max a) where
  append x y = max x y
