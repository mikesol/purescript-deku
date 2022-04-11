module Deku.Example.Pursx where

import Prelude

import Control.Plus (empty)
import Data.Foldable (for_)
import Deku.Attribute (cb, (:=))
import Deku.Control (deku)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Pursx (PursxElement(..), (~~))
import Effect (Effect)
import FRP.Event (Event, create, subscribe)
import FRP.Event.Class (bang)
import Type.Proxy (Proxy(..))
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

px = Proxy :: Proxy """<div>
  <button ~btn~>i do nothing</button>
  ~somethingElse~
  <div>hello world</div>
</div>
"""

scene
  :: (Boolean -> Effect Unit)
  -> Event Boolean
  -> Element Event (FFIDOMSnapshot -> Effect Unit)
scene push event =
  D.div empty
      [ px ~~
          { btn: bang (D.Style := "background-color: rgb(133,151,217)")
          , somethingElse:
              PursxElement
                ( D.button
                    ( bang $ D.OnClick :=
                        (cb (const $ push false))
                    )
                    [ C.text_ "I was dynamically inserted " ]
                )
          }
      , C.text (event <#> if _ then "Oh hi" else "Oh bye")
      ]


main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push true
