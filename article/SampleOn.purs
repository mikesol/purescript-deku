module Main where

import Prelude

import Bolson.Core (envy)
import Control.Alt ((<|>))
import Deku.Attribute ((:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bus, fold, memoize, sampleOn)
import FRP.Event.Time (interval)

example counter = envy $ bus \push event -> D.div_
  [ D.button (pure (D.OnClick := (push unit :: Effect Unit)))
      [ text_ "Show current counter" ]
  , text (sampleOn (show <$> counter) (event $> identity))
  ]

main :: Effect Unit
main = runInBody1
  ( memoize
      ( (fold (const (add 1)) (interval 400) 0 <|> pure 0)
      )
      (example)

  )