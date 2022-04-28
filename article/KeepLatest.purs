module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Deku.Attribute ((:=))
import Deku.Control (blank, plant)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, fold, keepLatest, memoize)
import FRP.Event.Time (interval)

bgColor :: Int -> String
bgColor i =
   "background-color:rgb(255,255," <> show (mod i 256) <> ")"

example counter = D.div_
  [ D.input
      ( keepLatest $
          ( \i -> oneOfMap bang
              [ D.Style := bgColor i
              , D.Xtype := "checkbox"
              , D.Checked := show (if mod i 2 == 0 then true else false)
              ]
          ) <$> counter
      )
      blank
  ]

main :: Effect Unit
main = runInBody1
  ( memoize
      ( (fold (const (add 1)) (interval 400) 0 <|> bang 0)
      )
      (plant <<< example)

  )