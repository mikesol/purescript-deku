module Deku.Example.Pursx where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Control as C
import Deku.Core (Domable, bus)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Pursx (nut, (~~))
import Deku.Pursx.Anonymous (px, xp)
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)
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
  :: forall lock payload
   . (Boolean -> Effect Unit)
  -> Domable lock payload
  -> Domable lock payload
myPxInception push aThirdThing = myPx ~~
  { btn: pure (D.Style := "background-color: rgb(133,151,217)")
  , somethingElse:
      nut
        ( D.button
            ( pure $ D.OnClick :=
                (cb (const $ push false))
            )
            [ C.text_ "I was dynamically inserted " ]
        )
  , aThirdThing: nut aThirdThing
  }

scene
  :: forall lock. AnEvent Zora (Domable lock (FFIDOMSnapshot -> Effect Unit))
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
    , px (Proxy :: _ "<h1 ") (pure $ D.Style := "color:red;") (Proxy :: _ ">hello!</h1>") xp
    , px (Proxy :: _ "<div>") (nut (D.h1_ [text_ "more stuff"])) (Proxy :: _ "</div>") xp
    , px (Proxy :: _ "<div>") (nut (px (Proxy :: _ "<h1 ") (pure $ D.Style := "color:red;") (Proxy :: _ ">hello!</h1>") xp)) (Proxy :: _ "</div>") xp
    ]

main :: Effect Unit
main = runInBody1 scene
