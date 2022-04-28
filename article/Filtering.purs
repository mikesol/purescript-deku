module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filter)
import Deku.Control (plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1, runInBody2)
import Effect (Effect)
import FRP.Event (bang, fold, memoize)
import FRP.Event.Time (interval)

example model = D.div_
  [ D.div_ [ text_ "Name: ", text (_.name <$> model) ]
  , D.div_ [ text_ "Age: ", text (_.age >>> show <$> model) ]
  , text
      (filter (_.age >>> (5 < _)) model $> "They sure do grow up fast!")
  ]

main :: Effect Unit
main = runInBody1
  ( memoize
      ( ( { name: "Jane", age: _ } <$>
            (fold (const (add 1)) (interval 400) 0 <|> bang 0)
        )
      )
      (plant <<< example)

  )