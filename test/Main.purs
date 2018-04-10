module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..), fromJust)
import Data.Newtype (unwrap)
import Data.Semigroup.First (First(..))
import Data.Semigroup.Foldable (foldMap1)
import Partial.Unsafe (unsafePartial)
import Test.Assert (ASSERT, assert)

main :: forall eff. Eff ( console ∷ CONSOLE, assert :: ASSERT | eff ) Unit
main = do
  assert $ (unwrap $ First (\_ -> "string") <> First explodingFunction) unit
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
  explodingFunction u = explodingFunction u
