module Deku.Example.Pursx where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Deku.Attribute (cb, (:=))
import Deku.Control as C
import Deku.Core (Domable, bus)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event)

import Type.Proxy (Proxy(..))

px =
  Proxy
    :: Proxy
         """<div>
  <button ~btn~>i do nothing</button>
  ~somethingElse~
  ~aThirdThing~
  <div>hello world</div>
</div>
"""

pxInception
  :: forall lock payload
   . (Boolean -> Effect Unit)
  -> Domable lock payload
  -> Domable lock payload
pxInception push aThirdThing = px ~~
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
  :: forall lock. Event (Domable lock (FFIDOMSnapshot -> Effect Unit))
scene = bus \push event ->
  D.div empty
    [ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push
        $ pxInception push (C.text_ "boo")
    , C.text ((event <|> pure true) <#> if _ then "Oh hi" else "Oh bye")
    ]

main :: Effect Unit
main = runInBody1 scene
