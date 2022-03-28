module Test.Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Filterable (filter)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Deku.Attribute (prop')
import Deku.Attribute ((:=))
import Deku.DOM as D
import Deku.Control (text, (@@), (~~))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Ref (Ref, modify, new, read, write)
import FRP.Behavior (Behavior, behavior)
import FRP.Event (create, fix, fold, makeEvent, subscribe)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

data Color = Red | Green | Blue

c2s :: Color -> String
c2s Red = "red"
c2s Green = "green"
c2s Blue = "blue"

idTrain :: Ref Int -> Behavior Int
idTrain r = behavior \f -> makeEvent \k -> do
  r' <- modify (add 1) r
  subscribe f \x -> k (x r')

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  describe "Tests" do
    it "Does nothing" $ liftEffect do
      pure unit