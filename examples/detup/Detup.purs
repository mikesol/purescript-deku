module Deku.Example.Detup where

import Prelude

import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Deku.Control.Functions (freeze, u, (@>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Graph.DOM (root, text)
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Util ((@@))
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Unit Unit
scene elt =
  ( \_ _ ->
      u $
        root elt
          (text "a" @@ text "b" /\ text "c" /\ text "d" /\ unit)

  ) @> freeze

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
