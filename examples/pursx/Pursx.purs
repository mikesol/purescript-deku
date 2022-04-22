module Deku.Example.Pursx where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Exists (mkExists)
import Data.Foldable (for_)
import Deku.Attribute (cb, (:=))
import Deku.Control (Bus(..), bus, deku2)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (subscribe)
import FRP.Event.Class (bang)
import Type.Proxy (Proxy(..))
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

px = Proxy :: Proxy """<div>
  <button ~btn~>i do nothing</button>
  ~somethingElse~
  ~aThirdThing~
  <div>hello world</div>
</div>
"""

pxInception :: forall t18 t19. (Boolean -> Effect Unit) -> Element t18 t19 -> Element t18 t19
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
  :: forall lock. Element lock (FFIDOMSnapshot -> Effect Unit)
scene = bus $ mkExists $ Bus \{ push, event } ->
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
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = deku2 b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
