module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Array.NonEmpty as NEA
import Data.Lazy (defer, force)
import Data.Maybe (Maybe(..), fromJust)
import Data.Newtype (unwrap)
import Data.Semigroup.First (First(..))
import Data.Semigroup.Foldable (foldMap1)
import Partial.Unsafe (unsafePartial)
import Test.Assert (ASSERT, assert)

main :: forall eff. Eff ( console ∷ CONSOLE, assert :: ASSERT | eff ) Unit
main = do
  assert $ force
    (unwrap $ (First $ defer \_ -> "string")
              <> (First $ defer explodingFunction))
    == "string"

  assert
    $ map unwrap
        (foldMap1 (map First) $ unsafePartial $ fromJust $ NEA.fromArray [
          Nothing
        , Just "foo"
        , Just "bar"
        ])
      == Just "foo"

  where
  explodingFunction :: Unit -> String
  explodingFunction u = explodingFunction u

