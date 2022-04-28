module Deku.Example.HelloWorld where

import Prelude

import Control.Alt (alt)
import Control.Plus (empty)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple (Tuple(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (deku, plant)
import Deku.Control as C
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, filterMap, keepLatest, mapAccum, subscribe, bang, bus)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)
scene :: forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit)
scene = plant $ bus $ \push -> lcmap (alt (bang true)) \event -> do
  plant
    [ D.div empty (C.text (bang "Stops after 4 clicks"))
    , C.text (event <#> if _ then "click " else "kcilc ")
    , D.button
        ( counter event
            # filterMap
              (\(Tuple x y) -> if y < 4 then Just x else Nothing)
            # map
              ( \e ->
                  oneOfMap bang
                    [ D.Style := "background-color: rgb(160,234,203);"
                    , D.OnClick := cb (const $ push (not e))
                    ]

              )
            # keepLatest
        )
        (C.text_ "me")
    ]

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = deku b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
