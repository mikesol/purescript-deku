module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filter)
import Deku.Control (plant, text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody2)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.Time (interval)

example model = D.div_
  [ D.div_ [ text_ "Name: ", text (_.name <$> model) ]
  , D.div_ [ text_ "Age: ", text (_.age >>> show <$> model) ]
  , D.div_
      ( filter (_.age >>> (5 < _)) model
          $> (plant $ text_ "They sure do grow up fast!")
      )
  ]

main :: Effect Unit
main = runInBody2
  ( example
      ( { name: "Jane", age: _ } <$>
          (fold (const (add 1)) (interval 400) 0 <|> bang 0)
      )
  )