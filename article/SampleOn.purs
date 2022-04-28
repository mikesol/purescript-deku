module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Attribute ((:=))
import Deku.Control (plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, bus, fold, memoize, sampleOn)
import FRP.Event.Time (interval)

example counter = bus \push event -> plant $ D.div_
  [ D.button (bang (D.OnClick := push unit))
      [ text_ "Show current counter" ]
  , text (sampleOn (show <$> counter) (event $> identity))
  ]

main :: Effect Unit
main = runInBody1
  ( memoize
      ( (fold (const (add 1)) (interval 400) 0 <|> bang 0)
      )
      (plant <<< example)

  )