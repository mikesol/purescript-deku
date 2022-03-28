module Deku.Example.Docs.Example.Events where

import Prelude

import Data.Foldable (for_)
import Deku.Toplevel ((🚀))
import Deku.Change (change)
import Data.Tuple.Nested ((/\))
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Effect (Effect)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = ButtonClicked | SliderMoved Number

main :: Effect Unit
main =
  ( \push ->
      { div1: D.div []
          { button: D.button
              [ D.OnClick :=
                  cb (const $ push ButtonClicked)
              ]
              (S.text "Click")
          , count: D.div [] (S.text "Val: 0")
          }
      , div2: D.div []
          { slider: D.input
              [ D.Xtype := "range"
              , D.OnInput := cb \e -> for_
                  ( target e
                      >>= fromEventTarget
                      >>= fromElement
                  )
                  ( valueAsNumber
                      >=> push <<< SliderMoved
                  )
              ]
              {}
          , val: D.div [] (S.text "Val: 50")
          }
      } /\ 0
  ) 🚀 \e nclicks -> case e of
    ButtonClicked ->
      let
        c = nclicks + 1
      in
        change
          { "root.div1.count.t": "Val: " <> show c
          , "root.div1.button.t":
              if mod c 2 == 0 then "Click" else "me"
          } $> c
    SliderMoved n ->
      change
        { "root.div2.val.t": "Val: " <> show n
        } $> nclicks
