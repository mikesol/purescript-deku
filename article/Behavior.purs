module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Tuple (Tuple(..))
import Deku.Control (plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import Effect.Random as Random
import FRP.Behavior (Behavior, behavior, sample_)
import FRP.Event (bang, fold, makeEvent, memoize, subscribe)
import FRP.Event.Time (interval)

random :: Behavior Number
random = behavior \e ->
  makeEvent \k -> subscribe e \f ->
    Random.random >>= k <<< f

example counter = D.div_
  [ text_ "Here are some random numbers: "
  , text (show <$> sample_ (Tuple <$> random <*> random) counter)
  ]

main :: Effect Unit
main = runInBody1
  (memoize (interval 400) (plant <<< example))