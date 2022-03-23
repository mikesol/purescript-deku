module Deku.Example.Docs.Example.Events where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Deku.Change (change)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions ((@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM ((:=), root)
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.DOM.Element (fromEventTarget)
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.HTMLInputElement (fromElement, valueAsNumber)
import Web.HTML.Window (document)

data UIEvents = ButtonClicked | SliderMoved Number

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 UIEvents res
scene elt =
  ( \_ push ->
      root elt
        ( { div1: D.div []
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
          }
        )
        /\ 0
  ) @> \e nclicks -> case e of
    Left _ -> pure nclicks
    Right ButtonClicked ->
      let
        c = nclicks + 1
      in
        change
          { "root.div1.count.t": "Val: " <> show c
          , "root.div1.button.t":
              if mod c 2 == 0 then "Click" else "me"
          } $> c
    Right (SliderMoved n) ->
      change
        { "root.div2.val.t": "Val: " <> show n
        } $> nclicks

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          (scene elt)

      )
      (_.res >>> pure)
