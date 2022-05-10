module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Attribute ((:=))
import Deku.Control (text, text_)
import Deku.Core (toDOM)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, bus, fold, memoize, sampleOn)
import FRP.Event.Time (interval)

example counter = toDOM $ bus \push event -> D.div_
  [ D.button (bang (D.OnClick := (push unit :: Effect Unit)))
      [ text_ "Show current counter" ]
  , text (sampleOn (show <$> counter) (event $> identity))
  ]

main :: Effect Unit
main = runInBody1
  ( memoize
      ( (fold (const (add 1)) (interval 400) 0 <|> bang 0)
      )
      (example)

  )