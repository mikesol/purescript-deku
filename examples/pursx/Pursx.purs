module Main where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Foldable (for_)
import Deku.Attribute (cb, (:=))
import Deku.Control (deku1)
import Deku.Control as C
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (Event, subscribe, bang, bus)
import Type.Proxy (Proxy(..))
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

px =  Proxy    :: Proxy
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
  -> Domable Effect lock payload
  -> Domable Effect lock payload
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
  :: forall lock. Event (Domable Effect lock (FFIDOMSnapshot -> Effect Unit))
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
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = deku1 b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
