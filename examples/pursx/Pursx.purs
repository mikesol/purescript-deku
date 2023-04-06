module Deku.Example.Pursx where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Deku.Attribute (cb, (:=))
import Deku.Attributes (style_)
import Deku.Control (text_)
import Deku.Control as C
import Deku.Core (Nut, bus, envy)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Pursx ((~~))
import Deku.Pursx.Anonymous (px, xp)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)
import Type.Proxy (Proxy(..))

myPx =
  Proxy
    :: Proxy
         """<div>
  <button ~btn~>i do nothing</button>
  ~somethingElse~
  ~aThirdThing~
  <div>hello world</div>
</div>
"""

myPxInception
  :: (Boolean -> Effect Unit)
  -> Nut
  -> Nut
myPxInception push aThirdThing = myPx ~~
  { btn: pure (D.Style := "background-color: rgb(133,151,217)")
  , somethingElse:
      ( D.button
          ( pure $ D.OnClick :=
              (cb (const $ push false))
          )
          [ C.text_ "I was dynamically inserted " ]
      )
  , aThirdThing: aThirdThing
  }

scene
  :: Event Nut
scene = bus \push event ->
  D.div empty
    [ myPxInception push
        $ myPxInception push
        $ myPxInception push
        $ myPxInception push
        $ myPxInception push
        $ myPxInception push (C.text_ "boo")
    , C.text ((event <|> pure true) <#> if _ then "Oh hi" else "Oh bye")
    , px (Proxy :: _ "<h1>hi</h1>") xp
    , px (Proxy :: _ "<div><h1 ") (style_ "color:red;")
        (Proxy :: _ ">hello!</h1><h1 ")
        (style_ "color:red;")
        (Proxy :: _ ">hello!</h1></div>")
        xp
    , px (Proxy :: _ "<div>") ((D.h1_ [ text_ "more stuff" ]))
        (Proxy :: _ "</div>")
        xp
    , px (Proxy :: _ "<div>")
        ( ( px (Proxy :: _ "<h1 ") (style_ "color:red;")
              (Proxy :: _ ">hello!</h1>")
              xp
          )
        )
        (Proxy :: _ "</div>")
        xp
    ]

main :: Effect Unit
main = runInBody (envy scene)
