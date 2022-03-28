module Deku.Example.HelloWorld where

import Prelude

import Data.Foldable (for_)
import Deku.Attribute (cb, (:=))
import Deku.Control (deku, firstThen)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, create, subscribe)
import FRP.Event (create)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: (Boolean -> Effect Unit)
  -> Event Boolean
  -> Array (Element FFIDOMSnapshot (Effect Unit))
scene push event =
  [ C.text (event <#> if _ then "click" else "kcilc")
  , D.a
      ( firstThen event
          ( \e ->
              [  D.Style := "background-color: blue;", D.Href := "#"

              ] <> thn e
          )
          thn
      )
      [ C.text_ "me" ]
  ]
  where
  thn = \e ->
    [ D.OnClick := cb (const $ push (not e))
    , D.Style := "background-color: red;"
    ]
{-
=
  elt
    { start: \e ->
        d @@
          (@"txt" (D.text "click"))
          (@"click" (D.a $ [ D.Href := "#" ] <> thn e))
          (D.text "me")
      loop: \e -> change
        { txt: if _ then "click" else "kcilc"
        , click: thn e
        }
    }
-}

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push true
