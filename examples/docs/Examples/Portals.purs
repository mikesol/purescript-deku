module Deku.Examples.Docs.Examples.Portals where

import Prelude

import Control.Alt ((<|>))
import Deku.Attribute (Attribute, cb, (:=))
import Deku.Control (flatten, text_)
import Deku.DOM as D
import Deku.Portal (portal)
import Deku.Toplevel ((🚀))
import Effect (Effect)

img0' :: forall event. Applicative event => event (Attribute D.Img_)
img0' = pure $ D.Src := "https://picsum.photos/200"
img1' :: forall event. Applicative event => event (Attribute D.Img_)
img1' = pure $ D.Src := "https://picsum.photos/300"

main :: Effect Unit
main = false 🚀 \push event ->
  portal (D.img img0' []) \img0 ->
    portal (D.img img1' []) \img1 ->
      let
        eventBool = event <|> pure false
        eventNotBool = map not eventBool
      in
        flatten
          [ D.div_ [img0 eventBool, img1 eventNotBool]
          , D.div_ [img1 eventBool, img0 eventNotBool]
          , D.button
              ( map
                  ( \e -> D.OnClick :=
                      cb (const (push $ not e))
                  )
                  eventBool
              )
              [ text_ "Shift images between portals" ]
          ]