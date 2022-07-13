module Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Deku.Attribute (cb, (:=))
import Deku.Control (envy)
import Deku.Control as C
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (EffectfulDomable)
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, bang, bus)
import Type.Proxy (Proxy(..))

px =
  Proxy    :: Proxy         """<div>
  <button ~btn~>i do nothing</button>
  ~somethingElse~
  ~aThirdThing~
  <div>hello world</div>
</div>
"""

pxInception
  :: forall e lock payload
   . (Boolean -> Effect Unit)
  -> Domable e Effect lock payload
  -> Domable e Effect lock payload
pxInception push aThirdThing = px ~~
  { btn: bang (D.Style := "background-color: rgb(133,151,217)")
  , somethingElse:
      nut
        ( D.button
            ( bang $ D.OnClick :=
                (cb (const $ push false))
            )
            [ C.text_ "I was dynamically inserted " ]
        )
  , aThirdThing: nut aThirdThing
  }

scene
  :: forall lock. Event (EffectfulDomable lock)
scene = bus \push event ->
  D.div empty
    [ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push (C.text_ "boo")
    , C.text ((event <|> bang true) <#> if _ then "Oh hi" else "Oh bye")
    ]

main :: Effect Unit
main = runInBody (envy scene)