module Deku.Example.HelloWorld where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..), snd)
import Deku.Attribute (cb, (:=))
import Deku.Control (deku)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, filterMap, fix, keepLatest, sampleOn, subscribe, create)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: (Boolean -> Effect Unit)
  -> Event Boolean
  -> Array (Element FFIDOMSnapshot (Effect Unit))
scene push event =
  [ D.div empty [ C.text (pure "Stops after 3 clicks") ]
  , C.text (event <#> if _ then "click " else "kcilc ")
  , D.button
      ( fix
          ( \i ->
              let
                output = sampleOn (i <|> pure 0) (Tuple <$> event)
              in
                { input: map (add 1 <<< snd) output, output }
          )
          # filterMap
            (\(Tuple x y) -> if y < 4 then Just x else Nothing)
          # map
            ( \e ->
                oneOfMap pure
                  [ D.Style := "background-color: rgb(160,234,203);"
                  , D.OnClick := cb (const $ push (not e))
                  ]

            )
          # keepLatest
      )
      [ C.text_ "me" ]
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
