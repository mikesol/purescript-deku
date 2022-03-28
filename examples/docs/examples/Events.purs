module Deku.Example.Docs.Example.Events where

import Prelude

import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((@~), (:=))
import Deku.Graph.DOM as D
import Deku.Toplevel ((🚀))
import Deku.Util ((/|\), p, (@@))
import Effect (Effect)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)

data UIEvents = ButtonClicked | SliderMoved Number

main :: Effect Unit
main =
  ( \push ->
      0 /|\  D.div []
          ( D.button
              [ D.OnClick :=
                  cb (const $ push ButtonClicked)
              ]
              (p :: _ "clickText" @~ D.text "Click")
              @@ D.div
                []
                (p :: _ "val1Text" @~ D.text "Val: 0")
              /\ unit
          )
          @@ D.div []
            ( D.input
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
                @@ D.div []
                  (p :: _ "val2Text" @~ D.text "Val: 50")
                /\ unit
            )
          /\ unit
  ) 🚀 \e nclicks -> case e of
    ButtonClicked ->
      let
        c = nclicks + 1
      in
        change
          { "val1Text": "Val: " <> show c
          , "clickText":
              if mod c 2 == 0 then "Click" else "me"
          } $> c
    SliderMoved n ->
      change
        { "val2Text": "Val: " <> show n
        } $> nclicks
